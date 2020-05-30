# Tilde Pollen

A test of [Matthew Butterick's `pollen`](https://practicaltypography.com/) language for document production.

## Things I want to do

* DONE add a rolling blog to the index;
* DONE make the index page a bit more purposeful;
* add a resources page;
* add a teaching page;
* add a cv page;
* DONE add an rss capability
* set up a cronjob on the site to look for git commits and git pull when there is a new one

---

## Website Build Script

* initialise site in folder if none exists
    * make new
    * git clone
* give options for actions:
    * create new post;
    * update page;
    * build with pollen

```sh
# take homepage file
# create 'frontblog.md' with
    ## latest 10posts
    ## last post title is changed to h2, date into a
    14 April, 2020
    Title hyperlinked to post page

    | block quote opening few lines
```
