#lang pollen/pre

◊(define (x-lineheight multiple)
	(string-append (real->decimal-string (* LINEHEIGHT multiple) 2) "rem"))

    @import url('https://use.fontawesome.com/releases/v5.6.0/css/all.css');
    @import url('https://cdn.rawgit.com/jpswalsh/academicons/master/css/academicons.min.css');

    @font-face {
	font-family: 'IBM Plex Mono';
src: local("IBM Plex Mono"), url("fonts/IBMPlexMono-Regular.woff2") format('woff2'),
	 url("fonts/IBMPlexMono-Regular.woff") format("woff");
     font-weight: 400;
     font-style: normal;
    }

@font-face {
    font-family: 'IBM Plex Mono';
src: local("IBM Plex Mono"), url("fonts/IBMPlexMono-Italic.woff2") format('woff2'),
	 url("fonts/IBMPlexMono-Italic.woff") format("woff");
     font-weight: 400;
     font-style: italic;
}

@font-face {
    font-family: 'IBM Plex Mono';
src: local("IBM Plex Mono"), url("fonts/IBMPlexMono-Bold.woff2") format('woff2'),
	 url("fonts/IBMPlexMono-Bold.woff") format("woff");
     font-weight: 700;
     font-style: normal;
}

@font-face {
    font-family: 'IBM Plex Sans Condensed';
src: local("IBM Plex Sans Condensed"), url("fonts/IBMPlexSansCondensed-Medium.woff2") format('woff2'),
	 url("fonts/IBMPlexSansCondensed-Medium.woff") format("woff");
     font-weight: 500;
     font-style: normal;
}

@font-face {
    font-family: 'IBM Plex Sans Condensed';
src: local("IBM Plex Sans Condensed"), url("fonts/IBMPlexSansCondensed-SemiBold.woff2") format('woff2'),
	 url("fonts/IBMPlexSansCondensed-SemiBold.woff") format("woff");
     font-weight: 600;
     font-style: normal;
}

@font-face {
    font-family: concourse-t3-index;
src: local("contourse-t3-index"), url("fonts/Concourse-T3-Index.otf") format('otf'),
	 url("fonts/Concourse-T3-Index.ttf") format('ttf');
     font-weight: normal;
     font-style: normal;
     font-stretch: normal;
}

@font-face {
    font-family: 'Charter Regular';
src: local("Charter Regular"), url("fonts/charter_regular.woff2") format('woff2');
     font-weight: normal;
     font-style: normal;
}

html, body {
    max-width: 1000px;
margin: auto;
	text-align: left;
	line-height: 1.4;
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

topic {
display: block;
	 font-family: "IBM Plex Sans Condensed";
	 font-size: 2.3rem;
	 /*text-transform: uppercase;*/
	 font-style: normal;
	 font-variant: small-caps;
	 line-height: 1.1;
	 margin-top: 1rem;
	 margin-bottom: 2rem;
	 border-bottom: 1px solid #333;
	 padding-top: 0.02em;
hyphens: none;
}

.subhead {
    font-family: "IBM Plex Sans Condensed";
    text-transform: lowercase;
    font-variant: small-caps;
display: block;
	 font-weight: 600;
	 font-size: 1.4rem;
	 margin-bottom: 0.4rem;
	 margin-top: 1.4rem;
	 line-height: 1.3;
}

h1 {
    font-size: 3rem;
    line-height: 1;
    text-decoration: underline;
}

h1.title {
    font-size: 4rem;
    font-family: ;
    line-height: 1;

}

h2 {
    line-height: 1;
    text-decoration: underline;
}

a {
color: #333;
       text-decoration: none;
}

a.notes {
    text-decoration: underline;
color: #333;
}

a.xref {
    text-transform: lowercase;
    font-variant: small-caps;
hyphens: none;
	 font-style: normal;
}

a:after {
content: "°";
color: #933;
  }

div > a:after, a.notes:after, a.title:after, a.xref:after, a.index:after, a.socials:after {
content: none;
}

#socials {
    padding-left: 20px;
}

a:hover {
background: #fbf3f3;
	    border-radius: 6px;
	    transition-duration: 0.3s;
  }

ol {
    counter-reset: foobar;
}

ol li {
    margin-left: 2.5rem;
    list-style: none;
}

ol.alpha {
    list-style-type: lower-roman;
}

ol li:before {
    counter-increment: foobar;
content: counter(foobar);
	 font-family: "IBM Plex Sans Condensed";
	 font-size: 1.10rem;
position: absolute;
	  margin-left: -2.5rem;
}

h1.title:hover {
background: #fffff8;
}

img {
    max-width: 100%;
    margin-left: auto;
    margin-right: auto;
}

figcaption {
    font-size:0.8rem;
    margin-top: 0.25rem;
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
    font-size: 85%;
    line-height: 1.4;
padding: 0.1em;
background: #f8f8ff;
	    border-radius: 6px;
}

/* Code blocks
   pre {
padding: 0.5em; /* Since we have a background color
border-radius: 5px; /* Softens it
background-color: #F4F4F4;
border: 1px solid #aaa;
margin-left:  0.5em;
margin-right: 0.5em;
line-height: 1.1;
} */

header {
    font-size: 1.5rem;
    line-height: 1.4;
    margin-top: 1rem;
    margin-bottom: 1rem;
    padding-left: 0.5rem;
}

.title, .author {
    text-align: left;
}

.footer {
    text-align: center;
}

#TOC {
width: 250px;
       min-height: 100%;
height: 100%;
float: left;
}

#icon {
    text-decoration:none;
    font-size: 1.5rem;
}

#icon:hover {
background: #fffff8;
}

.index {
padding: 6px 8px 6px 20px;
	 text-decoration: none;
	 font-size: 1.5rem;
color: #818181;
display: block;
}

div.sig {
display: block;
	 font-family: 'IBM Plex Mono';
	 font-size: 85%;
	 text-align: right;
	 font-variant: small-caps;
	 line-height: 1.1;
	 margin-bottom: 5em;
	 margin-right: 0.5rem;
	 ◊; letter-spacing: 0.1pt;
}

div:not(#TOC) {
	/*text-align: left;*/
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
.sidenote { display: none; }

.margin-toggle:checked ~ .sidenote {
    color: #111;
    font-size: 0.8rem;
    display: block;
    float: left;
    left: 0rem;
    clear: both;
    width: 85%;
    margin: 1rem 7.5%;
    vertical-align: baseline;
    position: relative;
}
}

.sidenote {
  text-align: left;
  color: #555;
  float: right;
  clear: right;
  margin-right: -40%;
  width: 30%;
  margin-top: 0;
  margin-bottom: 0.5rem;
  font-size: 0.7rem;
  line-height: 1.3;
  vertical-align: baseline;
  position: relative;
  text-overflow: ellipsis;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}

.sidenote.expanded { -webkit-line-clamp: 300; }

.sidenote-number { counter-increment: sidenote-counter; }

.sidenote-number:after, .sidenote:before {
  font-family: et-book-roman-old-style;
  position: relative;
  vertical-align: baseline;
}

.sidenote-number:after {
  content: counter(sidenote-counter);
  font-size: 0.7rem;
  top: -0.5rem;
  left: 0.1rem;
}

.sidenote:before { content: counter(sidenote-counter) ". "; top: 0rem; }

input.margin-toggle { display: none; }
input.margin-expand { display: none; }
label.sidenote-number { display: inline; }

.margin-expand:checked + .sidenote {
  text-overflow: ellipsis;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 300;
  -webkit-box-orient: vertical;
}
