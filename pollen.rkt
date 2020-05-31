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
  '(section [[id ,name]] [[class ,level]]))

(define line
  '(hr))

(define (date-string)
  (parameterize [(date-display-format 'iso-8601)]
    (date->string (current-date))))

;(define (blog-list)
  ;get the titles
  ;get the dates
  ;get the tags
  ;print as
  ;Title - Date
  ;#Tags
;  )