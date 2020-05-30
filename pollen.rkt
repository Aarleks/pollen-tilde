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

(define (highlight lang . xs)
  `(pre (code ((class ,(format "~a" lang))) ,@xs)))

(define (link url . elements)
  `(a [[href ,url]] ,@elements))

(define (root . elements)
  (txexpr 'root empty (decode-elements elements
			#:txexpr-elements-proc decode-paragraphs
			#:string-proc (compose1 smart-quotes smart-dashes))))

(define (h1 . elements)
  `(h1 ,@elements))

(define section '(hr))

(define (date-string
  (parameterize [(date-display-format 'iso-8601)]
    (date->string (current-date)))))
