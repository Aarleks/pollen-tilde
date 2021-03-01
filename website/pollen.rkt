#lang racket/base

(require racket/list
	 racket/base
	 racket/file
	 racket/date
         pollen/template
	 pollen/tag
	 pollen/decode
	 txexpr)

(provide ->html (all-defined-out))

(define (root . elements)
  (txexpr 'root empty (decode-elements elements
			#:txexpr-elements-proc decode-paragraphs
			#:string-proc (compose1 smart-quotes smart-dashes))))

(define (highlight lang . xs)
  `(pre (code ((class ,(format "~a" lang))) ,@xs)))

(define (link url . elements)
  `(a [[href ,url]] ,@elements))

(define (h1 . elements)
  `(h1 ,@elements))

(define (section name level)
  `(section [[id ,name]] [[class ,level]]))

(define line
  `(hr))

(define (em . text)
  `(em ,@text))

(define (date-string)
  (parameterize [(date-display-format 'rfc2822)]
    (date->string (current-date))))

(define (sig . xs)
  `(div [(class "sig")] ,@xs))

;(define (blog-list)
  ;get the titles
  ;get the dates
  ;print as
  ;Title - Date
;  )
