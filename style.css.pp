#lang pollen/pre

◊(define LINEHEIGHT 1.4)

◊(define lineheight (string-append (number->string LINEHEIGHT) "rem"))

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
	/*vfont-family: 'IBM Plex Mono';, menlo, monospace;*/
	font-size: ◊lineheight;
	height: 100%;
	background: #fffff8;
	color: #333;
	padding: 10px;
}

