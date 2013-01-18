noremap <silent> <F4> :!ctags -f ./tags --langmap=php:.engine.inc.module.theme.php --php-kinds=cdfi --languages=php --recurse .<CR>
setl tags=./tags,tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
