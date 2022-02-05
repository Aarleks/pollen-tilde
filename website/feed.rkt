#lang racket/base

;; --------------------- ;;
;; from The Pollen Cookbook ;;

(require (prefix-in ptree: "index.ptree")
	 "pollen.rkt"
         pollen/core
         racket/file
         racket/list
         racket/string
         splitflap
         txexpr)

(define my-id
  (mint-tag-uri site-url "2021-01-20" site-name))

(define full-url
  (format "https://~a/" site-url))

;; Get the list of blog posts
(define (get-paths)
  (flatten
   (for/list ([node (in-list ptree:doc)]
              #:when (list? node))
     (cdr node))))

;; page needs to be the html filename
(define (post->feed-item page)
  (define doc (get-doc page))
  (define metas (get-metas page))
  (define post-id (car (string-split (symbol->string page) ".")))
  (define published (hash-ref metas 'publish-date))
  (define title (hash-ref metas 'topic))
  (feed-item (append-specific my-id post-id)
             (format "~a~a" full-url page)
	     title
             (person site-author site-email full-url)
             (infer-moment published)
             (infer-moment published)
             doc))

; For some reason this automatically sorts by date!
(define post-items
  (map post->feed-item (get-paths)))

(define my-feed
    (feed
     my-id
     full-url
     "Alex Norman's Blog"
     post-items))

(display-to-file
  (express-xml my-feed
	     'atom
	     "https://alexnorman.xyz/feed.atom")
  "../public/feed.atom"
  #:exists 'truncate)

