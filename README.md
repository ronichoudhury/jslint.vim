# jslint.vim: A Vim quickfix plugin for Node jslint

## About

jslint.vim runs [Node JSLint](http://www.jslint.com) on your JavaScript code,
and lets you use the quickfix panel to bring it up to snuff.

It only requires `jslint` to be in your path.  The easiest way is via [Node
Packaged Modules](https://npmjs.org/).  Install that, and then

    npm install -g jslint

This plugin was inspired by Andreas Wålm's excellent
[jshint.vim](https://github.com/walm/jshint.vim) plugin, but I needed JSLint's
extra shot of stick-in-the-mudness for my projects.  Use it for good.

## Installation

Use [Vundle](https://github.com/gmarik/vundle) or
[Pathogen](https://github.com/tpope/vim-pathogen/).  Easy!

## Usage

Open a file you want to de-lint, then simply do

    :JSLint

The quickfix window will open, and you can use `j` and `k` to navigate through
the error list, `<CR>` to select an error to jump to and fix, and `q` to close
the quickfix window.

## License

Copyright (c) 2013 A.N.M. "Roni" Imroz Choudhury

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
