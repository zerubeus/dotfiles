" --------------------------------------- Plugins ---------------------------------------

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.

" Markdown
Plug 'reedes/vim-pencil'
Plug 'nelstrom/vim-markdown-folding'

" Cool git util
Plug 'tpope/vim-fugitive'

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
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'

" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" --------------------------------------- General config ---------------------------------------

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
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" airline
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#branch#enabled = 1 
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = '' 
let g:airline_section_y = '' 
let g:airline_section_x = '' 
set laststatus=2 " for airline

" General config
set number " Show line numbers
set noswapfile " No swap file
set nobackup
set nowritebackup

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