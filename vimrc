set nocompatible                  " Must come first because it changes other options.

" Manage the runtime path with  Pathogen.
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

" Shares the clipboard with OS X
set clipboard=unnamed

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

let mapleader=","
nnoremap ; :

runtime macros/matchit.vim        " Load matchit.vim plugin.

set encoding=utf-8

set ttyfast                       " Optimize for fast terminal connections

set binary                        " Don't add empty newlines at the end of files
set noeol                         "

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

" Better Completion
set complete=.,b,u,]
set completeopt=menu,preview
set wildmenu                      " Enhanced command line completion.
set wildmode=longest,list:longest " Complete files like a shell.

set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.jpg,*.jpeg,*.png,*.gif,vendor/**,db/sphinx,log/**,tmp/**,public/uploads,coverage/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=vendor/gems/*,vendor/ruby/*,node_modules/*,coverage/*

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set gdefault                      " Add the g flag to search/replace by default

set number                        " Show absolute line numbers (cf. relativenumber).
set ruler                         " Show cursor position.
set cursorline                    " Highlight current line
set laststatus=2                  " Always show a status line.

set nostartofline                 " Don’t reset cursor to start of line when moving around.
set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set shiftwidth=2                  "
set tabstop=2                     " Tabs and spaces.
set expandtab                     "

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " No backups.
set nowritebackup                 " No backups.
set noswapfile                    " No swap files; more hassle than they're worth.

set tildeop                       " Make tilde command behave like an operator.
set shortmess=atI                 " Avoid unnecessary hit-enter prompts.

set noequalalways                 " Resize windows as little as possible.

set autoread                      " Automatically re-read files changed outside Vim.

set so=999 " center scroll vertically for tabn, tabp

set t_Co=256
set background=light
colorscheme badwolf

" Very magic regexes.
nnoremap / /\v
vnoremap / /\v

" turn off search highlighting.
nnoremap <Leader><space> :noh<CR>

" http://vim.devth.com/put-paste-above-below
" http://stackoverflow.com/questions/1346737/how-to-paste-in-a-new-line-with-vim
nmap <leader>po o<Esc>p==
nmap <leader>pO O<Esc>p==

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Map § to # for typing convenience
set iminsert=1
set imsearch=-1
noremap  § #
noremap! § #
lnoremap § #

" Make Y consistent with D and C (instead of yy)
noremap Y y$

" Visually select the text that was most recently edited/pasted.
" nmap gV `[v`]

" Make * and # work with visual selection.
vnoremap <silent> * :call VisualSearch("f")<CR>
vnoremap <silent> # :call VisualSearch("b")<CR>

" indent, reselect
:vmap < <gv
:vmap > >gv

" Use cursor keys to navigate buffers.
" map  <Right> :bnext<CR>
" map  <Left>  :bprev<CR>
" imap <Right> <ESC>:bnext<CR>
" imap <Left>  <ESC>:bprev<CR>
map  <Right> :tabn<CR>
map  <Left>  :tabp<CR>
imap <Right> <ESC>:tabn<CR>
imap <Left>  <ESC>:tabp<CR>
map  <Del>   :bd<CR>

" Show tabs and trailing whitespace visually
" http://github.com/ciaranm/dotfiles-ciaranm/blob/master/vimrc
"
" See also here for a different solution:
" http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
if (&termencoding == "utf-8") || has("gui_running")
  if v:version >= 700
    if has("gui_running")
      set list listchars=tab:»·,trail:·,extends:…,nbsp:‗
    else
      " xterm + terminus hates these
      set list listchars=tab:»·,trail:·,extends:>,nbsp:_
    endif
  else
    set list listchars=tab:»·,trail:·,extends:…
  endif
else
  if v:version >= 700
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_
  else
    set list listchars=tab:>-,trail:.,extends:>
  endif
endif

"
" Plugins
"
" BufExplorer configuration
nmap <script> <silent> <unique> <Leader><Leader> :BufExplorer<CR>
let g:bufExplorerShowRelativePath=1

" key = value
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
" key { value
nmap <Leader>t{ :Tabularize /{<CR>
vmap <Leader>t{ :Tabularize /{<CR>
" key => value
nmap <Leader>t=> :Tabularize /=><CR>
vmap <Leader>t=> :Tabularize /=><CR>
" key: value
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
" Ruby symbols
" nmap <Leader>ts :Tabularize /:/l1c0l0<CR>
" vmap <Leader>ts :Tabularize /:/l1c0l0<CR>
" key, value
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>


" a few useful shortcuts - taken from https://github.com/lsdr/vim-folder/blob/master/_vimrc :)
command! Rehash source ~/.vimrc

" all the code below from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w

  if match(a:filename, "\.feature$") != -1
    exec ":!script/features " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif filereadable("Gemfile")
      exec ":!SPEC_ALL=true bundle exec rspec --color " . a:filename
    else
      exec ":!SPEC_ALL=true rspec --color " . a:filename
    end
  end
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunTestFileNoRails()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
    :w
    exec ":!rspec --color " . t:grb_test_file
  end
endfunction

function! RunNearestTest()
  let spec_line_number = line(".")
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

map <leader>s :call RunTestFile()<cr>
map <leader>S :call RunNearestTest()<cr>
map <leader>b :call RunTestFileNoRails()<cr>
map <leader>a :call RunTests("spec")<cr>

map <leader>r :! %<cr>
" All functions bellow from https://github.com/vim-scripts/Specky
"
" When in ruby code or an rspec BDD file, try and search recursively through
" the filesystem (within the current working directory) to find the
" respectively matching file.  (code to spec, spec to code.)
"
" This operates under the assumption that you've used chdir() to put vim into
" the top level directory of your project.

function! SpecSwitcher()
  " If we aren"t in a ruby or rspec file then we probably don"t care
  " too much about this function.
  if &ft != "ruby" && &ft != "rspec"
    call s:err( "Not currently in ruby or rspec mode." )
    return
  endif

  " Ensure that we can always search recursively for files to open.
  let l:orig_path = &path
  set path=**

  " Get the current buffer name, and determine if it is a spec file.
  "
  " /tmp/something/whatever/rubycode.rb ---> rubycode.rb
  " A requisite of the specfiles is that they match to the class/code file,
  " this emulates the eigenclass stuff, but doesn't require the same
  " directory structures.
  "
  " rubycode.rb ---> rubycode_spec.rb
  let l:filename     = matchstr( bufname("%"), "[0-9A-Za-z_.-]*$" )
  let l:is_spec_file = match( l:filename, "_spec.rb$" ) == -1 ? 0 : 1

  if l:is_spec_file
    let l:other_file = substitute( l:filename, "_spec\.rb$", "\.rb", "" )
  else
    let l:other_file = substitute( l:filename, "\.rb$", "_spec\.rb", "" )
  endif

  let l:bufnum = bufnr( l:other_file )
  if l:bufnum == -1
    " The file isn"t currently open, so let"s search for it.
    execute "find " . l:other_file
  else
    " We've already got an open buffer with this file, just go to it.
    execute "buffer" . l:bufnum
  endif
  "execute "set path=" . l:orig_path
endfunction

nnoremap <leader>. :call SpecSwitcher()<cr>

" nnoremap <leader>dq :%s/'\([^"\|^"]*\)"/"\1"/<cr>

let g:ctrlp_custom_ignore = 'vendor/ruby/\|node_modules/\|tmp/|coverage/'
" let g:ctrlp_custom_ignore = 'vendor/ruby/\|bin/\|node_modules/\|tmp/|coverage/'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_use_caching = 1

" NERDCommenter
let NERDDefaultNesting = 0
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1

set shell=zsh

function! LogLabuta(operation)
  if expand('%') != "labuta.csv"
    silent exec ":!echo `date`," . a:operation . ",%:p >> /Users/pablo/labuta.csv"
  endif
endfunction

" Automatically removing all trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufReadPre * :call LogLabuta('BufReadPre')
autocmd BufWritePre * :call LogLabuta('BufWritePre')

" git_template/hooks/ctags
" nnoremap <leader>ct :!`brew --prefix`/bin/ctags --tag-relative -Rf.git/tags --exclude=tmp  --exclude=.git --exclude=log . `bundle show --paths`<cr>
nnoremap <leader>ct :! /Users/pablo/.git_template/hooks/ctags<cr>

" require brew install yajl
" command JsonVerify execute "! cat % | json_verify"
" command JsonBeautify execute "%! json_reformat"
" command JsonMinify execute "%! json_reformat -m"
" command EndpointVerify execute "!BUNDLE_GEMFILE=/Users/pablo/workspace/augury/Gemfile bundle exec /Users/pablo/workspace/augury/bin/validate --schema-path=/Users/pablo/workspace/augury_messages/lib/augury_messages/validators/schemas/endpoint/definition.json --json-path=%:p"

" Forgot sudo?
command Sudow w !sudo tee % >/dev/null

" enable spell checking
set spell
hi clear SpellBad
hi SpellBad cterm=underline

" https://github.com/ggreer/the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" folding settings
" set foldmethod=indent   "fold based on indent
set foldmethod=manual
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
