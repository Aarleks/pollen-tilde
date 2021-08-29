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
	 txexpr)

(provide ->html (all-defined-out))
(provide (all-defined-out) highlight)

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

; heading styles
(define (topic . text)
  `(topic ,@text))

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
	 (children post "index.ptree")))
  ; print it out in the doc
  `(p ,@note-link))

(define (first-note post)
  ; print the incipit as a blurb
  (define note-blurb
    (map (λ (p) `(blockquote ,(note-incipit p) "… " (a [[href ,(format "/~a" p) ] [class "notes"]] "read more")))
	 (children post "index.ptree")))
  ; print it out in the doc
  `(p ,(notes-list post)
      ,@note-blurb)
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

; Get the meta 'publish-date' from a post
(define (rss-date p)
  (select-from-metas 'publish-date p))

; Make an rss feed from sublist in the index.ptree file
(define (post-list post)
  ; map over each note in the section and make a hyperlink
  ; to it and the publication date
  ; get title = get-note-topic
  ; get link =
  ; get date = get-note-date
  ; get description
  (define rss-list
    (map (λ (p) `(item
		    "\n"(title ,(get-note-topic p))
		    "\n"(link ,(format "https://alexnorman.xyz/~a" p))
		    "\n"(pubDate ,(rss-date p))
		    "\n"(guid ,(format "https://alexnorman.xyz/~a" p))
		    "\n"(description ,(format "<![CDATA[~a]]>" (note-incipit p)))
		    "\n"))
	   ;(a [[href ,(format "/~a" p) ] [class "notes"]] ,(get-note-topic p)) " - " ,(get-note-date p)))
	 (children post "index.ptree")))
  ; print it out in the doc
  `(,@rss-list))

