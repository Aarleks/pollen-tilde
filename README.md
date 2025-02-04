# Tilde Pollen

My website build using [Matthew Butterick's `pollen`](https://practicaltypography.com/) language for document production.

## TODO

* consider using `punct` instead of `pollen`
* add old blog posts from dralexnorman.net
* separate functions in Racket file into new writing and page building files
* develop the resources page;
* develop the teaching page;
* add a cv page;

## Sidenotes

Need to produce html that looks like this:
```
<span class="sidenote-wrapper">
<span><label for="fn-3" class="margin-toggle sidenote-number"></label>
<input type="checkbox" id="fn-3" class="margin-toggle"/>
<input type="checkbox" id="fn-3-expand" class="margin-expand"/>
<label for="fn-3-expand" class="sidenote" hyphens="none">If you’re not already reading this on a small screen, you can preview this behaviour by narrowing this browser window.</label>
</span></span>
```

From something like this:
```
◊note{Note text goes in here.}
◊note[#:expanded #t]{A note that will always be fully expanded, as oppossed to collapsed when too long.}
```

Which, I guess, means all I really need to do is figure out how to get the note number to add as it goes.

