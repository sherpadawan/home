" Metal3d config, some values was created by mkvimrc from gvim - even if I use
" vim on terminal

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
call pathogen#infect()

if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save

" Default Indentation - ftplugins can reset this values
set autoindent
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2
set incsearch
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set comments+=f://
set backspace=indent,eol,start
set cscopeprg=/usr/bin/cscope
set cscopetag
set cscopeverbose
set fileencodings=ucs-bom,utf-8,latin1
set formatoptions=tcqlr
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,a:blinkon0
set guifont=Monospace\ 8
set helplang=fr
set history=50
set hlsearch
set mouse=a
set ruler
set termencoding=utf-8
set viminfo='20,\"50
set wildignore=*.pyc
set window=48

set number


filetype plugin on
set ofu=syntaxcomplete#Complete

" TagList on righ, because I use NERDTree on the left
let Tlist_Auto_Open=1
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1

" I've got a azerty keybord, <Leader> was set to "\" that's not nice on that
" kind of keyboard. So i remap this to ","
let mapleader=","

map  NewKey   <Plug>ShowFunc  
map! NewKey   <Plug>ShowFunc 

nmap <Leader>n :NERDTree<CR>

" theme
set background=light
colorscheme evening 
au VimEnter * NERDTree
" Drupal specific settings
au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead *.test set filetype=php
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.json set filetype=javascript
au BufReadPost *.module,*.install,*.theme set syntax=php
" vim: set ft=vim :

" Bundles installed via vundle
" Bundle 'joonty/vim-phpqa.git'

"phpqa configuration
let mapleader="@"
" let g:phpqa_php_cmd = "/usr/bin/php"
" let g:phpqa_codesniffer_cmd = "/usr/bin/phpcs"
" let g:phpqa_codesniffer_args = "--standard=Drupal"
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_messdetector_autorun = 0

let g:syntastic_phpcs_conf=" --standard=Drupal --extensions=php,module,inc,install,test,profile,theme"

set colorcolumn=80
filetype plugin indent on     " required!
