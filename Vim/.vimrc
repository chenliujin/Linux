set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'posva/vim-vue'

call vundle#end()
filetype plugin indent on   

set nu
set smarttab "根据文件中其他地方的缩进空格个数来确定一个 tab 是多少个空格
set tabstop=2 "一个 tab 显示出来是多少个空格，默认 8
set shiftwidth=2 "每一级缩进是多少个空格
set expandtab "将 tag 扩展成空格


