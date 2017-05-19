:filetype plugin on
:syntax enable
:imap jj <Esc>
autocmd BufRead,BufNewFile *.log set syntax=log4j
set number			" Zeilennummerierung
"set showcmd
set showmatch			" passende Klammern hervorheben
set incsearch 			" Suche beim Eintippen starten
set hlsearch 			" Suche highlighten
set lazyredraw 			" Effizienz dank Faulheit
set cursorline			" aktuelle Zeile hervorheben
:hi CursorLine cterm=NONE ctermbg=green	" nicht unterstreichen, Farbe der aktuellen Zeile
set tabstop=4			" Tabgroesse
set autoindent			" automatische Einrueckung
