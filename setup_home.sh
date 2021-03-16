#! /bin/bash

function setup_vim_plug
{
    # install vim-plug per https://github.com/junegunn/vim-plug

    #for nvim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    #for vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


function setup_rustVimrc
{
cat > ~/rustVimrc << 'DONE'
call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

" for reference - from https://github.com/prabirshrestha/vim-lsp
if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'whitelist': ['rust'],
        \ })
endif

let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

let g:lsp_signs_error = {'text': '✗'}

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

" prevent >A in left margin from showing up all the time.
let g:lsp_document_code_action_signs_enabled = 0

" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" key bindings from https://github.com/MaskRay/ccls/wiki/vim-lsp
" Key bindings for vim-lsp.
nn <silent> <M-d> :LspDefinition<cr>
nn <silent> <M-r> :LspReferences<cr>
nn <f2> :LspRename<cr>
nn <silent> <M-a> :LspWorkspaceSymbol<cr>
nn <silent> <M-l> :LspDocumentSymbol<cr>
DONE

echo so ~/rustVimrc | tee -a ~/vimrc
}


function install_vim_plugins
{
    if [[ -x `which nvim` ]]; then
        nvim +PlugInstall +UpdateRemotePlugins +qa
    fi

    if [[ -x `which vim` ]]; then
        vim +PlugInstall +qa
    fi
}

function setup_rustBashrc
{
cat > ~/rustBashrc << 'DONE'
function rebu
{
    find src -type f -name '*.rs' | xargs ls | entr sh -c 'cargo build'
}
DONE

echo . ~/rustBashrc | tee -a ~/myBashrc
}

setup_vim_plug
setup_rustVimrc
install_vim_plugins
setup_rustBashrc

