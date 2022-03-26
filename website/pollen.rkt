#lang racket/base

(require racket/list
	 racket/base
	 racket/file
	 racket/date
	 racket/match
         pollen/template
	 pollen/tag
	 pollen/decode
	 pollen/core
	 pollen/cache
	 pollen/file
	 pollen/pagetree
	 pollen/unstable/pygments
	 txexpr
	 )

(provide ->html (all-defined-out))
(provide (all-defined-out) highlight)

; Site Variables ;
(define atom-path "/feed.atom")
(define site-name "~acn")
(define site-author "Alex Norman")
(define site-email "alex@alexnorman.xyz")
(define site-url "alexnorman.xyz")
(define site-description "Recent(ish) stuff from Alex Norman")
(define footnote-list empty)
(define note-mode "sidenotes")

; Main Functions ;

(define (root . elements)
  (txexpr 'root empty (decode-elements elements
    #:txexpr-elements-proc decode-paragraphs
    #:string-proc (compose1 smart-quotes smart-dashes))))

; codeblock
;(define (highlight lang . xs)
;  `(pre (code [[class ,(format "language-~a" lang)]] ,@xs)))

; in-line code
(define (in-line . text)
  `(code ,@text))

; external links
(define (link url . elements)
  `(a [[href ,url]] ,@elements))

; cross-references (stolen from Butterick)
(define (xref url . elements)
  `(a ((href ,url) (class "xref")) ,@elements))

; image link
(define (img #:src src . caption)
  `(figure
    (img ([src ,src]))
    (figcaption ,@caption)
    ))

;; heading styles ;;
;;----------------;;

; Page Title and H1 for the page
(define (topic . text)
  `(topic ,@text))

; A subhead
(define (subhead . text)
  `(div [(class "subhead")] ,@text))

(define (h1 . elements)
  `(h1 ,@elements))

(define (section name level)
  `(section [[id ,name]] [[class ,level]]))

(define line
  `(hr))

; emphatic text
(define (em . text)
  `(em ,@text))

; print today's date
(define (date-string)
  (parameterize [(date-display-format 'rfc2822)]
    (date->string (current-date))))

; make a signature class object
(define (sig . text)
  `(div [(class "sig")] ,@text))

(define (blockquote . text)
  `(blockquote ,@text))

; Make a list of posts from sublist in the index.ptree file
(define (notes-list post)
  ; map over each note in the section and make a hyperlink
  ; to it and the publication date
  (define note-link
    (map (λ (p) `(p (a [[href ,(format "/~a" p) ] [class "notes"]] ,(get-note-topic p)) " - " ,(get-note-date p)))
	 (rest (children post "index.ptree"))))
  ; print it out in the doc
  `(p ,@note-link))

(define (notes-archive post)
  ; map over each note and make a hyperlink
  ; to it and the publication date
  (define note-link
    (map (λ (p) `(p (a [[href ,(format "/~a" p) ] [class "notes"]] ,(get-note-topic p)) " - " ,(get-note-date p)))
	 (children post "index.ptree")))
  ; print it out in the doc
  `(p ,@note-link))

; latest post has the first few sentences as a teaser ;
(define (test-link post)
  `(p (a [[href ,(format "/~a" post) ] [class "notes"]] ,(get-note-topic post)) " - " ,(get-note-date post)
  (blockquote ,(note-incipit post) "… " (a [[href ,(format "/~a" post) ] [class "notes"]] "read more"))
  ))

(define (first-note post)
  ; print the incipit as a blurb
  `(p ,(test-link (first (children post "index.ptree"))))
      ;,@note-blurb
)

; get the note incipit of the note
(define (note-incipit p)
  (match (get-source p)
    [(? path? src) (car (select-from-doc 'incipit src))]
    [_ `(symbol->string p)]))

(define (get-note-topic p)
  (match (get-source p)
    [(? path? src) (car (select-from-doc 'topic src))]
    [_ `(symbol->string p)]))

  ; get the date of the note
(define (get-note-date p)
  (match (get-source p)
    [(? path? src) (car (select-from-doc 'post-date src))]
    [_ `(symbol->string p)]))


; Iterated from code borrowed from Sancho McCann - https://github.com/sanchom/sanchom.github.io/blob/master-source/pollen.rkt
; Defines a little sidenote or footnote (depending on the mode), numbered, and by default collapsed
; to a small height. In print, these are all footnotes.
(define (note #:expanded [expanded #f] . content)
  (define footnote-number (+ 1 (length footnote-list)))

  (set! footnote-list
        (append footnote-list (list `(p ([class "footnote"] [id ,(format "fn-~a" footnote-number)])
                                        ,(format "~a. " footnote-number) (a [[href ,(format "#fn-source-~a" footnote-number)] [class "backlink undecorated"]] " ↑ ") ,@content))))
  (define refid (format "fn-~a" footnote-number))
  (define subrefid (format "fn-~a-expand" footnote-number))
  (if (equal? note-mode "sidenotes")
      `(span [[class "sidenote-wrapper"]]
             (span (label [[for ,refid] [class "margin-toggle sidenote-number"]])
                   (input [[type "checkbox"] [id ,refid] [class "margin-toggle"]])
                   (input [[type "checkbox"] [id ,subrefid] [class "margin-expand"]])
                   (label [[for ,subrefid] [class ,(if expanded "sidenote expanded" "sidenote")] [hyphens "none"]] ,@content)))
      `(span [[class "sidenote-wrapper"]]
             (a [[href ,(format "#fn-~a" footnote-number)] [class "undecorated"]] (span [[class "sidenote-number"] [id ,(format "fn-source-~a" footnote-number)]])))))

