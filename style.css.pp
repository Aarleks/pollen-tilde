#lang pollen/pre

◊(define LINEHEIGHT 1.4)

◊(define lineheight (string-append (number->string LINEHEIGHT) "rem"))

◊(define (x-lineheight multiple) 
    (string-append (real->decimal-string (* LINEHEIGHT multiple) 2) "rem"))

@font-face {
      font-family: 'IBM Plex Mono';
      src: url("fonts/IBMPlexMono-Regular.woff2") format('woff2'),
      url("fonts/IBMPlexMono-Regular.woff") format("woff");
      font-weight: normal;
      font-style: normal;
}

html, body {
	max-width: 1000px;
	margin: auto;
	text-align: left;
	line-height: ◊lineheight;
	font-family: 'IBM Plex Mono';, menlo, monospace;
	font-size: ◊x-lineheight[0.88];
	height: 100%;
	background: #fffff8;
	color: #333;
	padding: 10px;
}

