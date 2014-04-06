Custom Emacs configuration
==========================

This is the repository I use to store my custom Emacs configuration, so to easily keep my different Emacs installations (home, office, virtual machines, etc.) in synch without much effort, and also to version it in case some new extension or configuration i may add ends up breaking everything.

Installation
------------

Not much to do here. Just clone the repository with name `.emacs.d/` in your home, and copy the configuration file `~/.emacs.d/.emacs` inside your home as well.

If you want to use another directory name, you'll have to edit `~/.emacs` accordingly.

To update, just call `git pull` inside `~/.emacs.d/`.

Features
--------

Windows configuration:

* `windows.el` and `revive.el` to save and resume windows configuration. Code added to save at quit, and resume at startup automatically.
* Default windows size set at startup to a decent value.
* Disabled splash screen.

Command line interface:

* Emacs server is started by default when using window system (when you don't use Emacs inside the command line). This is useful to open new files inside the existing Emacs frame from the command line, instead of opening a new frame each time (default behaviour when calling simply `emacs`). To do this you can call `emacsclient -n filename`. I actually aliased it to `cemacs` adding this line to my `.zshrc`:

```
alias cemacs="emacsclient -n"
```

Editing:

* `autopair.el` to automatically close open parenthesis. Matching parenthesis highlighted.
* Automatically indenting at newline. Indenting with spaces instead of tabs.
* Showing line numbers at startup.
* `cua-mode` to enable common Ctrl+C, Ctrl+V, Ctrl+X, Ctrl+Z shortcuts, and to have backspace delete selected region.
* Smart beginning of line: `home` key jumps to the first non-white character. If point is already there, jump to the actual beginning of line.

Theme:

* `zenburn` theme is used.

Modes:

* `php-mode`
* `js2-mode`
* `web-mode` linked to `.phtml`, `.tpl`, `.jsp`, `.aspx`, `.erb`, `.mustache`, `.djhtml` and `.html` extensions. Set indent offset to 4 spaces, and current element highlighting.
* `scss-mode` (auto-compile disabled, since i use Grunt for it)
* `puppet-mode`