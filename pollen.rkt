#lang racket/base

(require racket/list
         pollen/template
	 pollen/decode
	 txexpr)

(provide ->html (all-defined-out))

(define (highlight lang . xs)
  `(pre (code ((class ,(format "~a" lang))) ,@xs)))

(define (link url . elements)
  `(a [[href ,url]] ,@elements))

(define (root . elements)
  (txexpr 'root empty (decode-elements elements
				       #:txexpr-elements-proc decode-paragraphs)))

(define (h1 . elements)
  `(h1 ,@elements))
