#lang pollen/pre

◊(define LINEHEIGHT 1.4)

◊(define lineheight (string-append (number->string LINEHEIGHT) "rem"))

◊(define (x-lineheight multiple) 
    (string-append (real->decimal-string (* LINEHEIGHT multiple) 2) "rem"))

@import url('https://use.fontawesome.com/releases/v5.6.0/css/all.css');
@import url('https://cdn.rawgit.com/jpswalsh/academicons/master/css/academicons.min.css');

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
	line-height: 1.4em;
	font-family: 'IBM Plex Mono';/*, menlo, monospace;*/
	font-size: 1.15rem;
	height: 100%;
	background: #fffff8;
	color: #333;
	padding: 10px;
}

ul {
	padding-left: 20px;
	padding-right: 30px;
	list-style-type: none;
}

h1 {
	font-size: 2.5em;
	line-height: 1em;
	text-decoration: underline;
}

h1.title {
	font-size: 3.7em;
	line-height: 1em;

}

h2 {
	line-height: 1em;
	text-decoration: underline;
}

a {
	color: #333;
}

a:hover {
	background: #fbf3f3;
	border-radius: 6px;
	transition-duration: 0.3s;
}

h1.title:hover {
	background: #fffff8;
}

img {
	max-width: 500px;
	max-width: 100%;
	max-height: auto;
}

blockquote {
	border-left: 3px solid #333;
	margin: 0.7em 10px;
	padding: 0.7em 20px;
}

blockquote p {
	display: inline;
}

code {
	/*border:solid 1px #41403E;*/
	font-size: 89%;
	line-height: 1.4;
	padding: 0.1em;
}

/* Code blocks */
pre {
    padding: 0.5em; /* Since we have a background color */
    border-radius: 5px; /* Softens it */
    background-color: #F4F4F4;
    border: 1px solid #aaa;
    margin-left:  0.5em;
    margin-right: 0.5em;
    line-height: 1.1;
    }

header {
	font-size: 1.5em;
	line-height: 1.4em;
	margin-top: 1rem;
	margin-bottom: 1rem;
	padding-left: 0.5rem;
}

.title, .author {
		text-align: left;
}

#TOC {
  width: 250px;
  min-height: 100%;
  height: 100%;
  float: left;
}

#icon {
    text-decoration:none;
    font-size: 25px;
}

#icon:hover {
    background: #fffff8;
}

.index {
    padding: 6px 8px 6px 20px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
}

div:not(#TOC) {
  text-align: left;
}

.main {
	margin-left: 270px;
}

@media all and (max-width:840px){

		#TOC {
		display: none;
		width: 0px;
		max-width: 0px;
		}

		.level1, .title, .author {
		margin-left: 10%;
		padding: 0;
		}
}
