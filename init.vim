set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

set expandtab
set shiftwidth=2
set tabstop=2

filetype plugin indent on
syntax on

set t_Co=256

if $TERM !=? 'xterm-256color'
  set termguicolors
endif

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"



call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'vim-airline/vim-airline'

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'

Plug 'plasticboy/vim-markdown'

Plug 'airblade/vim-gitgutter'

Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'EdenEast/nightfox.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pocco81/auto-save.nvim'
Plug 'ryanoasis/vim-devicons'

call plug#end()


lua require("coc_config")
lua require("lsp_config")

autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)

"colorscheme gruvbox
colorscheme tender 

syntax enable
if (has("termguicolors"))
 set termguicolors
endif


let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tablines#enabled = 1

let NERDTreeShowHidden=1

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


" Disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']


" Normal mode remappings
nnoremap <C-q> :q!<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>

" Your vimrc
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}



