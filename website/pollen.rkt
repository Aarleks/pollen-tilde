#lang racket/base

(require racket/list
	 racket/base
	 racket/file
	 racket/date
         pollen/template
	 pollen/tag
	 pollen/decode
	 pollen/core
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

;(define (blog-list)
  ;pull a list of the 11 latest blog posts
  ;  with title, published date, blurb, and link
;  )

;(define (latest-post single-meta)
  ;print link with title as text - print published date
  ;print blurb paragraph as blockquote - end with elipsis and link to post with 'read more'
  ;print blank line
;  )

;(define (post-list metas-list)
  ; print link with title as text - print published date
  ; print blank line
;)
