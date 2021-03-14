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
	 txexpr)

(provide ->html (all-defined-out))

(define (root . elements)
  (txexpr 'root empty (decode-elements elements
    #:txexpr-elements-proc decode-paragraphs
    #:string-proc (compose1 smart-quotes smart-dashes))))

; codeblock
(define (highlight lang . xs)
  `(pre (code ((class ,(format "~a" lang))) ,@xs)))

; in-line code
(define (in-line . text)
  `(code ,@text))

; external links
(define (link url . elements)
  `(a [[href ,url]] ,@elements))

; cross-references (stolen from Butterick)
(define (xref url . elements)
  `(a ((href ,url) (class "xref")) ,@elements))

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


(define (notes-list post)
  ; get the title of the note
  (define (note-title p)
    (match (get-source p)
      [(? path? src) (car (select-from-doc 'topic src))]
      [_ `(symbol->string p)]))
  ; get the date of the note
  (define (note-date p)
    (match (get-source p)
      [(? path? src) (car (select-from-doc 'post-date src))]
      [_ `(sybmol->string p)]))
  ; map over each note in the section and make a hyperlink
  ; to it and the publication date
  (define note-link
    (map (λ (p) `(p (a [[href ,(format "/~a" p) ] [class "xref"]] ,(note-title p)) " - " ,(note-date p)))
	 (children post "index.ptree")))

  `(p ,@note-link))

