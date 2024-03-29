#lang pollen

◊(define-meta topic "A Zettelkasten with Vim")
◊(define-meta publish-date "2020-03-29")
◊(define-meta incipit "I've long struggled with categorising my notes. When I moved from paper to electronic notes I started to struggle; I felt like I needed to 'file' things because that's what you did with files on a computer. You put them in folders")

◊topic{◊(select-from-metas 'topic metas)}

◊incipit{◊(select-from-metas 'incipit metas)}.

The problem is my mind doesn't work in folders; it works more like a network. This problem was mostly solved when I discovered wiki-style note-taking. For this, I used ◊link["https://github.com/vimwiki/vimwiki"]{Vimwiki} which works excellently. But I wanted for a theory and method with which to use this tool. Enter Zettelkasten.

A Zettelkasten is a 'slip box'; or box of notes. The zettelkasten method was first described by sociologist, Thomas Luhmann, and recently developed for digital tools by Christian Tietze and Sascha Fast at ◊link["https://zettelkasten.de/"]{zettelkasten.de/}. The basic idea is that you make notes and put them all into one folder. The structure comes from the links you make in the notes themselves to other notes in the folder.

Now that I've switched to ◊link["https://www.vim.org"]{Vim} for all my writing, I wanted to make sure I had a dedicated zettelkasten system within it. There are two good-looking zettelkasten plugins - ◊link["https://github.com/KevinBockelandt/notoire"]{Notoire} and ◊link["https://github.com/michal-h21/vim-zettel"]{vim-zettel,} neither seemed to do exactly what I wanted. Also, I just wanted to write my own Vim plugin…

So, I give you ◊link["https://github.com/Aarleks/zettel.vim"]{Zettel.vim}. It's a work-in-progress and very early days so far. But I'm hoping it can be a useful little plugin that sticks pretty close to vanilla Vim; the exceptions will be the use of ◊link["https://github.com/junegunn/fzf"]{fzf} and its accompanying Vim plugin for fuzzy search, and ◊link["https://github.com/BurntSushi/ripgrep"]{ripgrep} for searching file contents.

◊sig{—Alex Norman
Gadigal-Wangal Country
◊post-date{29 March, 2020}
}
