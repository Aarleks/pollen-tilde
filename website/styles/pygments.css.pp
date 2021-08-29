#lang pollen

◊; the 'highlight' class name is hard-coded into Pygments, I’m afraid
.highlight {
    ◊;|default-horiz-block-metrics|
    background: #f8f8f8;
    border-top: 1px solid #ebebeb;
    border-bottom: 1px solid #ebebeb;
    margin-bottom: 1.2rem;
    margin-left: ~arem;
    width: ~arem;
    margin-right: ~arem;
}

.highlight .linenos {
    display: none;
}

.highlight pre {
    font-size: 0.75rem;
    line-height: 1.35;
    margin-right: -2.1rem;
    white-space: pre-wrap;
}

◊; styling classes for Pygments
.c { color: #8f5902; font-style: italic } /* Comment */
.highlight .err { color: #a40000; border: 1px solid #ef2929 } /* Error */
.g { color: #000000 } /* Generic */
.k { color: #204a87; font-weight: bold } /* Keyword */
.l { color: #000000 } /* Literal */
.n { color: #000000 } /* Name */
.o { color: #ce5c00; font-weight: bold } /* Operator */
.x { color: #000000 } /* Other */
.p { color: #000000; font-weight: bold } /* Punctuation */
.ch { color: #8f5902; font-style: italic } /* Comment.Hashbang */
.cm { color: #8f5902; font-style: italic } /* Comment.Multiline */
.cp { color: #8f5902; font-style: italic } /* Comment.Preproc */
.cpf { color: #8f5902; font-style: italic } /* Comment.PreprocFile */
.c1 { color: #8f5902; font-style: italic } /* Comment.Single */
.cs { color: #8f5902; font-style: italic } /* Comment.Special */
.gd { color: #a40000 } /* Generic.Deleted */
.ge { color: #000000; font-style: italic } /* Generic.Emph */
.gr { color: #ef2929 } /* Generic.Error */
.gh { color: #000080; font-weight: bold } /* Generic.Heading */
.gi { color: #00A000 } /* Generic.Inserted */
.go { color: #000000; font-style: italic } /* Generic.Output */
.gp { color: #8f5902 } /* Generic.Prompt */
.gs { color: #000000; font-weight: bold } /* Generic.Strong */
.gu { color: #800080; font-weight: bold } /* Generic.Subheading */
.gt { color: #a40000; font-weight: bold } /* Generic.Traceback */
.kc { color: #204a87; font-weight: bold } /* Keyword.Constant */
.kd { color: #204a87; font-weight: bold } /* Keyword.Declaration */
.kn { color: #204a87; font-weight: bold } /* Keyword.Namespace */
.kp { color: #204a87; font-weight: bold } /* Keyword.Pseudo */
.kr { color: #204a87; font-weight: bold } /* Keyword.Reserved */
.kt { color: #204a87; font-weight: bold } /* Keyword.Type */
.ld { color: #000000 } /* Literal.Date */
.m { color: #0000cf; font-weight: bold } /* Literal.Number */
.s { color: #4e9a06 } /* Literal.String */
.na { color: #c4a000 } /* Name.Attribute */
.nb { color: #204a87 } /* Name.Builtin */
.nc { color: #000000 } /* Name.Class */
.no { color: #000000 } /* Name.Constant */
.nd { color: #5c35cc; font-weight: bold } /* Name.Decorator */
.ni { color: #ce5c00 } /* Name.Entity */
.ne { color: #cc0000; font-weight: bold } /* Name.Exception */
.nf { color: #000000 } /* Name.Function */
.nl { color: #f57900 } /* Name.Label */
.nn { color: #000000 } /* Name.Namespace */
.nx { color: #000000 } /* Name.Other */
.py { color: #000000 } /* Name.Property */
.nt { color: #204a87; font-weight: bold } /* Name.Tag */
.nv { color: #000000 } /* Name.Variable */
.ow { color: #204a87; font-weight: bold } /* Operator.Word */
.w { color: #f8f8f8; text-decoration: underline } /* Text.Whitespace */
.mb { color: #0000cf; font-weight: bold } /* Literal.Number.Bin */
.mf { color: #0000cf; font-weight: bold } /* Literal.Number.Float */
.mh { color: #0000cf; font-weight: bold } /* Literal.Number.Hex */
.mi { color: #0000cf; font-weight: bold } /* Literal.Number.Integer */
.mo { color: #0000cf; font-weight: bold } /* Literal.Number.Oct */
.sa { color: #4e9a06 } /* Literal.String.Affix */
.sb { color: #4e9a06 } /* Literal.String.Backtick */
.sc { color: #4e9a06 } /* Literal.String.Char */
.dl { color: #4e9a06 } /* Literal.String.Delimiter */
.sd { color: #8f5902; font-style: italic } /* Literal.String.Doc */
.s2 { color: #4e9a06 } /* Literal.String.Double */
.se { color: #4e9a06 } /* Literal.String.Escape */
.sh { color: #4e9a06 } /* Literal.String.Heredoc */
.si { color: #4e9a06 } /* Literal.String.Interpol */
.sx { color: #4e9a06 } /* Literal.String.Other */
.sr { color: #4e9a06 } /* Literal.String.Regex */
.s1 { color: #4e9a06 } /* Literal.String.Single */
.ss { color: #4e9a06 } /* Literal.String.Symbol */
.bp { color: #3465a4 } /* Name.Builtin.Pseudo */
.fm { color: #000000 } /* Name.Function.Magic */
.vc { color: #000000 } /* Name.Variable.Class */
.vg { color: #000000 } /* Name.Variable.Global */
.vi { color: #000000 } /* Name.Variable.Instance */
.vm { color: #000000 } /* Name.Variable.Magic */
.il { color: #0000cf; font-weight: bold } /* Literal.Number.Integer.Long */
