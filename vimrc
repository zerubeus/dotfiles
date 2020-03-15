" --------------------------------------- Plugins ---------------------------------------

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.

" Markdown
Plug 'reedes/vim-pencil'
Plug 'nelstrom/vim-markdown-folding'

" Cool git util
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" git messenger have some functionalities of git lense in VSCode
Plug 'rhysd/git-messenger.vim'

" Fuzzy seach for files and stuff
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" I don't know if i'm going to need this tree but let it hang there
" Plug 'preservim/nerdtree'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" For eslint/prettier
Plug 'dense-analysis/ale'

" Appearance and Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'

" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mattn/emmet-vim'

" Beeter way to close buffers
Plug 'moll/vim-bbye'

" Highlights the line of the cursor only in the current window.
Plug 'miyakogi/conoline.vim'

" Perform all your vim insert mode completions with Tab
Plug 'ervandew/supertab'

" maximize and restore current window
Plug 'szw/vim-maximizer'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" comment code and text (see github for keys)
Plug 'tpope/vim-commentary'

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

" text filtering and alignment
Plug 'godlygeek/tabular'

" pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" enhance netrw with some useful keys see readme
Plug 'tpope/vim-vinegar'

" save the current state of vim, window position, open folds, see github
Plug 'tpope/vim-obsession'

" few utilities for pretty tabs see github for doc
Plug 'gcmt/taboo.vim'

" parentheses improved
Plug 'luochen1990/rainbow'

" manage tag files auto
Plug 'ludovicchabant/vim-gutentags'

" fading effect for focused tab
Plug 'TaDaa/vimade'

" display css colors
Plug 'ap/vim-css-color'
Plug 'editorconfig/editorconfig-vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" --------------------------------------- General config ---------------------------------------
" Disallow detection of filetypes
filetype off
filetype plugin indent on " requied

" Stop concealing quotes in JSON
let g:vim_json_syntax_conceal = 0

" Enable JSX syntax highlighting in .js files
let g:jsx_ext_required = 0

" More natural split opening.
set splitbelow
set splitright

" Show leader key
set showcmd

" #TABS AND SPACES {{{
set expandtab " On pressing tab, insert 2 spaces
set tabstop=2 " show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2 " when indenting with '>', use 2 spaces width
"}}}

set number " Show line numbers
set noswapfile " No swap file
set nobackup
set nowritebackup

set textwidth=80
set formatoptions+=t
set colorcolumn=+1
set showmatch

" If on, Vim will wrap long lines at a character in 'breakat' rather
" than at the last character that fits on the screen.  Unlike
" 'wrapmargin' and 'textwidth', this does not insert <EOL>s in the file,
" it only affects the way the file is displayed, not its contents.
" If 'breakindent' is set, line is visually indented. Then, the value
" of 'showbreak' is used to put in front of wrapped lines. This option
" is not used when the 'wrap' option is off.
" Note that <Tab> characters after an <EOL> are mostly not displayed
" with the right amount of white space.
set lazyredraw

" #FINDING FILES
" Use the `:find` command to fuzzy search files in the working directory
" The `:b` command can also be used to do the same for open buffers

" Search all subfolders
set path+=**

" Display matching files on tab complete
set wildmenu

" Ignore node_modules and images from search results
set wildignore+=**/node_modules/**,**/dist/**,**_site/**,*.swp,*.png,*.jpg,*.gif,*.webp,*.jpeg,*.map

" Use the system register for all cut yank and paste operations
" set clipboard=unnamedplus

" Toggle Hybrid Numbers in insert and normal mode
:set number relativenumber
set listchars=tab:→→,eol:¬,space:.

" Automatically hide buffer with unsaved changes without showing warning
set hidden

" Treat all numbers as decimal regardless of whether they are padded with zeros
set nrformats=

" Highlight matches when using :substitute
set hlsearch

" Predicts case sensitivity intentions
set smartcase

" Jump to match when searching
set incsearch

set updatetime=300

" Enable word completion
set complete+=kspell

hi NonText guifg=#4a4a59
hi SpecialKey guifg=white guibg=#cc0000

" Strip trailing whitespace from all files
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\s\+$//e

" Automatically remove the preview window after autocompletion
autocmd CompleteDone * pclose

au BufRead,BufNewFile,BufReadPost *.json set syntax=json

" Rainbow.vim
let g:rainbow_active = 1

" ------------------------------------------- keys ---------------------------------------------

" Change leader key from \ to ,
let mapleader = ","

" Disable F1 bringing up the help doc every time
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" A saner way to save files.<F2> is easy to press (in normal mode)
nnoremap <F2> :w<CR>

" Remap shift+tab (litral tab character) in insert mode
inoremap <S-Tab> <C-d>

" MOVING LINES
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" QuickFix List
nnoremap <leader>co :cw<CR>
nnoremap <leader>cc :ccl<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprev<CR>

" Shortcut to open vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Save state of open Windows and Buffers
nnoremap <leader>s :mksession<CR>

" Delete buffer completely without messing up window layout
nnoremap <leader>q :Bwipeout<CR>

" turn off search highlights
nnoremap <leader><space> :nohlsearch<CR>

" Reload Vim config
nnoremap <Leader>r :so ~/.vim/vimrc<CR>

" Create file under cursor
:map <leader>gf :e <cfile><cr>

" Switching tabs quickly
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <leader>w :tabclose<CR>

nnoremap n nzz
nnoremap N Nzz
" ------------------------------------------- Plugin Config ---------------------------------------------

set termguicolors
set background=dark
colorscheme dracula

" #SUPERTAB {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabClosePreviewOnPopupClose = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<C-x><C-o>"
" }}}

" #COC {{{
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile

nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"}}}

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> [c <Plug>(coc-diagnostic-prev)

" #EMMET {{{
let g:user_emmet_expandabbr_key='<C-@>'
imap <expr> <C-Space> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
"}}}

" netrw config https://shapeshed.com/vim-netrw/
" http://blog.trk.in.rs/2015/12/01/vim-tips/
" http://modal.us/blog/2013/07/27/back-to-vim-with-nerdtree-nope-netrw/
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_banner = 0
let g:netrw_fastbrowse = 0
" Default to tree mode
let g:netrw_liststyle=3

" airline
let g:airline_theme = 'simple'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
set laststatus=2 " for airline

" #FZF {{{
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>h :FzfHistory<CR>
nnoremap <Leader>t :FzfBTags<CR>
nnoremap <Leader>T :FzfTags<CR>
nnoremap <C-p> :FzfFiles<CR>
" Have FZF list all tracked files plus untracked files minus your ignored files
nnoremap <Leader>p :FzfGitFiles --exclude-standard --others --cached<CR>
nnoremap <Leader>gt :FzfRg<CR>
" }}}

" #RIPGREP {{{
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}

" #CONOLINE {{{
" Highlight the line of the cursor
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_insert=1
" }}}

" Prevent errors from opening the location list
let g:go_fmt_fail_silently = 1

" Open local documentation
let g:go_doc_url = 'http://localhost:6060'

" Search and easily navigate between the function and type definitions within
" the package
au FileType go nmap <leader>d :GoDeclsDir<cr

" Use snakecase for JSON tags
let g:go_addtags_transform = "snakecase"

" Go to definition
au FileType go nmap <F5> <Plug>(go-def)

" Prevent prefilling new files
let g:go_template_autocreate = 0
" }}}

" #GUTENTAGS {{{
let g:gutentags_file_list_command = "rg --files --follow --ignore-file '/home/ayo/.vimignore'"
" }}}

" #SIGNIFY {{{
" Check for only Git
let g:signify_vcs_list = [ 'git' ]

" Jump to next and previous hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" #FUGITIVE {{{
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR>
" }}}

" #unimpaired {{{
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]
" }}}

" #EDITORCONFIG {{{
" Ensure plugin works well wil Fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
" }}}
"
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fixers = ['prettier', 'eslint']

" fix files when save
let g:ale_fix_on_save = 1

" map fixing a file ti f6
nmap <F6> <Plug>(ale_fix)

set mouse=a

