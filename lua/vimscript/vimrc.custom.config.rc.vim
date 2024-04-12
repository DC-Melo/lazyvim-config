" set

autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim help command
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
" git clone https://github.com/NvChad/example_config.git ~/.config/nvim/lua/custom
" :checkhealth lazy
" :Lazy help
" checkhealth
" TSInstall lua html

" cabbrev unqhis  :%s/\\$\n/\\§/g <Bar> %!sort -t ";" -k2 <Bar> %g/^: \d\{10}:\d;\(.*\)\s*\n: \d\{10}:\d;\1\s*\n/d <Bar> %g/§/m$ <Bar> %s/\\§/\\\r/g
" cabbrev unqhis  :%s/\\$\n/\\§/g <Bar> %!sort -t ";" -k2 <Bar> %g/^: \d\{10}:\d;\(.*\)\s*\n: \d\{10}:\d;\1\s*\n/d <Bar> %g/§/m$ <Bar> %s/\\§/\\\r/g
" uniq history
cabbrev unqhis  :%!sort -t ';' -k2 <Bar> g/^: \d\{10}:\d;\(.*\)\s*\n: \d\{10}:\d;\1\s*$/d

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic shortcut
" Using CTRL + V signals Vim that it should take the next character literally. Even in insert mode.
" input ^M ctrl+v and enter
" Normal
" Insert
" Visual
" Command-line
" Replace
" Binary
" Org
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.puml set filetype=markdown
vnoremap <C-t> :Tabularize/\|<CR>
imap <C-o> <esc>O
imap <C-j> <esc>o
imap <C-l> <Right>
imap <C-h> <Left>
cmap <C-p> <Up>
cmap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-n> <Down>

" nmap     <C-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
" nnoremap <silent> <leader>gg :cd %:p:h <Bar> LazyGit<CR>
" nnoremap <silent> <leader>gg :LazyGit<CR>
" cabbrev ter  split <Bar> resize 10 <Bar> terminal
" inoremap dts <c-r>=strftime('%s')<CR>
"
vnoremap <silent> <leader>gg :LazyGit<CR>
vnoremap <silent> <leader>yv :LazyGit<CR>
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>
vmap <C-c> y:new ~/.vimbuf<CR>VGp:x<CR>:!pbcopy < ~/.vimbuf<CR><CR>

"the c-u does a union of all lines in visual selection.
"this goes in the vimrc



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim to terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:command!   -nargs=1 Mktouch    execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> execute('silent! !touch "<args>"') <Bar>  e <args> <Bar> redraw!
:command!   -range=% -nargs=* SetRun <line1>,<line2> :call SetRun(<f-args>)
:command!   -range=% -nargs=* ShRun <line1>,<line2> :call ShRun(<f-args>)
:command!   -range=% -nargs=* JavaClass <line1>,<line2> :call JavaClass(<f-args>)
:command!   -range=% -nargs=* JavaRun <line1>,<line2> :call JavaRun(<f-args>)
:command!   -range=% -nargs=* ChRun <line1>,<line2> :call ChRun(<f-args>)
:command!   -range=% -nargs=* SQLRun <line1>,<line2> :call SQLRun(<f-args>)
:command!   -range=% -nargs=* RedisRun <line1>,<line2> :call RedisRun(<f-args>)
:command!   -range=% -nargs=* JsRun <line1>,<line2> :call JsRun(<f-args>)
:command!   -range=% -nargs=* PyRun <line1>,<line2> :call PyRun(<f-args>)
:command!   -range=% -nargs=* VimRun <line1>,<line2> :call VimRun(<f-args>)
:command!   -range=% -nargs=* UmlRun <line1>,<line2> :call UmlRun(<f-args>)
:command!   -range=% -nargs=* UmlGet  :call UmlGet()



:command!   -range=% -nargs=* CalExp call CalExp(<f-args>)
:command!   -range=% -nargs=* SumColumnEval <line1>,<line2> :call SumColumnEval(<f-args>)
:command!   -range=% -nargs=* SumSplitBill <line1>,<line2> :call SumSplitBill(<f-args>)
:command!   -range=% -nargs=* SplitBill <line1>,<line2> :call SplitBill(<f-args>)
:command!   -range=% -nargs=* ConvertDate <line1>,<line2> :call ConvertDate(<f-args>)

:command!   -range=% -nargs=* Snip call AIC(<f-args>)
cabbrev aic      r! ai -c 
cabbrev ts2utc   ConvertDate 0
cabbrev utc2ts   ConvertDate 1
cabbrev ts2local ConvertDate 2
cabbrev local2ts ConvertDate 3
cabbrev tsms2utc %s/\(\D\?1\d\{9}\)\d\d\d\(\D\?\)/\=trim(system('dateconv --sed-mode --input-format="%s" --format="%Y-%m-%d %H:%M:%S" <<< "'.submatch(1).'"'))/gc
cabbrev diff2 tabnew % <Bar> windo diffthis <Bar> :vert diffsplit f
cabbrev bufonly %bd <Bar> e#


cabbrev rev  g/^/m0

:command!   -nargs=* LoadImage2Markdown      : call LoadImage2Markdown(<f-args>)
cabbrev lfc   LoadImage2Markdown -1 name 
cabbrev lfg   LoadImage2Markdown 0  name 
cabbrev lfw   LoadImage2Markdown 1  name 
:command!   -nargs=* CopyLinkFile2clipboard  : call CopyLinkFile2clipboard(<f-args>)
:command!   -nargs=* ConvMarkdown2clipboard  : call ConvMarkdown2clipboard(<f-args>)
:command!   -nargs=* ConvMarkdown2lark  : call ConvMarkdown2lark(<f-args>)
:command!   -nargs=* OpenURL             : call OpenURL(<f-args>)
:command!   -nargs=* SumVis             : call SumVis(<f-args>)
:command!   -nargs=* DiffTwoLines call DiffTwoLines(<f-args>)

" :command!   -range FormatJson <line1>,<line2>!xargs -0 -I {} node -e 'console.log(JSON.stringify({}, null, 2));'
" :command!   -nargs=* OpenDrawio  : call OpenDrawio(<f-args>)
:command!   -nargs=* NewDrawio   : call NewDrawio(<f-args>)
:command!   -range=% -nargs=* Space2MarkdownTable <line1>,<line2> :call Space2MarkdownTable(<f-args>)
:command!            Snip2Json               : call Snip2Json()
:command!   -nargs=* SurroundString          : call SurroundString(<f-args>)
:command!   -nargs=* CL                      : call CompareLines(<f-args>)
:command!            Align                   : call s:align()
:command!   -nargs=* FormatText2GifScript    : call FormatText2GifScript(<f-args>)
:command!   -nargs=* AppendImage             : call AppendImage(<f-args>)
:command!   -nargs=* BatchCommand             : call BatchCommand(<f-args>)

" command!   -nargs=* FormatText2GifScript call FormatText2GifScript(<f-args>)
command!   -nargs=* GenTemplateCode2File call GenTemplateCode2File(<f-args>)
command!   AddTitle            : call AddTitle()
command!   AddAuthor           : call AddAuthor()
command!   UpdateTitle         : call UpdateTitle()

:command!   -nargs=* GenMarkdownPlantuml  : call GenMarkdownPlantuml(<f-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" datetime
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


cabbrev sreg    for i in range(char2nr('a'),char2nr('z')) <Bar> :call writefile(getreg(nr2char(i), 1, 1), $HOME."/.config/reg/".nr2char(i))  <Bar> endfor 
cabbrev debug   :lua require'dap'.continue()
cabbrev cdcur   :lcd %:p:h<CR>:pwd<CR>
cabbrev pdate   :put=strftime('%F')
cabbrev ptime   :put=strftime('%T')
" cabbrev pdtime  :put=strftime('%F %T')
cabbrev pdtime  :put=strftime('%Y-%m-%d %H:%M:%S')
cabbrev pdtymdh :put=strftime('%Y-%m-%d %H:00:00')
cabbrev ldtime  :let $dtime=trim(system('date +%Y%m%d_%H%M%S'))
" cabbrev ter  split <Bar> resize 10 <Bar> terminal

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" data generate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" put serial number
cabbrev psn :put =map(range(1,150), 'printf(''%04d'', v:val)')
" sequence from to
cabbrev pseq r !seq 1 2 100
" put timestamp
cabbrev pts put=strftime(\"%s\")
" create serial number
cabbrev s2in   let i=0 \| g/\(push\|pop\)/let i = i + 1\|put!='print \"DEBUG ' . i . '\"' " add string with serial number
cabbrev forloop    for i in range(1,10) <Bar> if i > 2 <Bar> put ='192.168.0.'.i <Bar> endif <Bar> endfor 
cabbrev stab set expandtab <Bar> set tabstop=2 <Bar> set shiftwidth=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" data convert
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbrev avq  s/^\\|$/"/g  <Bar> :noh
cabbrev avs  s/\(\S.*\)$\n\(\s*\S\)/\1 \\\r\2/g  <Bar> :noh
cabbrev dvs  s/ \\$//g  <Bar> :noh
" global pattern write to file
cabbrev gsv  g/^BEGIN:VCARD/,/^END:VCARD/write! ~/.contacts/friends/`uuidgen`.vcf


cabbrev t2t  '<,'> s/[:：]/\|/e <Bar> '<,'> s/^\\|$/\|/g  <Bar> :noh
" substitute with index
cabbrev subi :let SI=MakeSearchIndex(0) <Bar> s#[^\|]\+\|#\=SI().'\|'#gc

cabbrev sr2r exe "'<,'> s/" . @a . "/".@"."/gc"

" fresh screen
cabbrev fresh NvimTreeOpen <Bar> NvimTreeRefresh <Bar> redraw
"sum by column
cabbrev sumc   %!awk -F '\|' '{print; x+=$1;y+=$2;z+=$3}; END {print("sum:",x,y,z)}'
" substitute with vitural mode
cabbrev subv %s/\%Vold/NEW/g
" This sorted by the second column (-k2), treats the text as a number (n) and then sorts in reverse (r), which results in.
" sort string
cabbrev sortline  :call setline('.', join(sort(split(getline('.'), '\zs')), ""))
" sort by
cabbrev sortby   %!sort -t '\|' -k2nr
cabbrev sort2    %!sort -t ';' -k 2,2 -k 1,1r
" uniq by
cabbrev uniqby   %! sort -u -t '\|' -k 1,1 -k 2,2
cabbrev uniq2    %! sort -u -t ';' -k 2,2

" script into register and run register
cabbrev macro  let @q = '10jD10ko<C-v><Esc>p0j' <Bar> norm 10@q
cabbrev cross  let @q = '10jD10ko<C-v><Esc>p0j' <Bar> norm 10@q
cabbrev inter  let @q = '10jD10ko<C-v><Esc>p0j' <Bar> norm 10@q
" set nowrap
cabbrev init  :set nowrap <Bar> set list lcs=trail:·,tab:»· <Bar> set noexpandtab!

cabbrev svar  %s/ tdate /\=' ' . trim(system('gdate +"%H:%M %Y-%m-%d"')).' '/gIe <Bar> %s/ date /\=' ' . trim(system('gdate +"%d-%b-%Y"')).' '/gI
cabbrev s2j  %s#\\#\\\\#ge <Bar> %s#"#\\"#ge <Bar> %s#\$#\\\\\$#ge <Bar> %s#^#"#ge <Bar> %s#$#",#ge
cabbrev sjq  %s/[ \t]\([A-Za-z_].*\):/"\1":/
cabbrev t2s  %s/^\(\t*\)\(\S\)/\='#'.repeat("#", len(submatch(1))) .' '. submatch(2)/g
cabbrev t2b  set noexpandtab! <Bar> %s#\t#  #ge
cabbrev s2t  %s/^\(#*\)# /\=repeat("\t", len(submatch(1)))/g
cabbrev schar   call append(line('.'), 'ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩ①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂⒃⒄⒅⒆⒇←↑→↓↔↕⇐⇒⇔∀∂∃∅∆∇∈∋∏∑−∓∗∘∙√∝┚┛├┝┠┣┤┥┨┫┬┯┰┳┴┷┸┻┼┿╂╋╱╲▀▄█▌▐░▒▓■□▢▣▤▥▦▧▨▩▪▬▭▲△▶▷▼▽◀◁◆◇◊○◎●◐◑◘◙◢◣★☆☜☞☺☻☼♀♂♠♡♢♣♩♪♫♭♮♯✓✗✠　〄〇')
cabbrev tl2en   call append(line('.'), trim(system('trans -b :en "'. getline('.').'"')))
cabbrev tl2zh   call append(line('.'), trim(system('trans -b :zh "'. getline('.').'"')))
cabbrev zh2en   %s/trans(\(.\{-}\))/\='str2var('.trim(system('trans -no-warn -b :en "'. submatch(1).'"')).')'/gc
cabbrev str2var   %s/str2var(\(.\{-}\))/\=Str2Var(submatch(1))/gc
cabbrev ASC2Hex call append(line('.'), char2nr(getline('.')))


" go and run register
cabbrev g2a  g/abc/normal! @a                                                           " go and substitute
cabbrev g2e  g/abc/normal! hgcc                                                         " go and comment

" uniq the file
" delete duplicate duplicate field:cat file  uniq -f 1
cabbrev unq   g/^\(.*\)\s*\n\1\s*$/d
" delete duplicate
cabbrev unq1  s/^\(.*\)\(\n\1\)\+$/\1/
" Delete lines which appears twice
cabbrev unq2  s/^\(.*\)\n\1$/\1/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" data delete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" delete
" delete html tab
cabbrev dht   %s#&nbsp;# #ge \| %s#</li>#\r</li>#ge \| %s#\(</li>\)\\|\(</div>\)#\0\r#ge \| %s#<[^>]\+>##ge \| %s#&lt;#<#ge \| %s#&gt;#>#ge \| %s#&nbsp;# #ge                             " Delete HTML tags but keeps text
" 'a,'b g/^\s\+\.\(test_case_\)\@!/co$
" delete blank line
cabbrev dbl   g/^[\s\t ]*$/d                                                              " delete blank line
" delete blank space
cabbrev dbs   s/[\s\t ]*//g   <Bar> :noh  " delete blank space
" delete begin blank
cabbrev dbb   s/^\s*//g;s/\s*$//g                                                        " delete blank begin
" delete not A
cabbrev dnA   g!/A/d                                                                     " delete not A
" delete not A or B
cabbrev dnAB  v/\(A\|B\)/                                                                " delete not A and B
" delete multiple line
cabbrev dml   g/SPECIAL/.,.+3d                                                           " go pattern and delete next 3 line
" delete
cabbrev dbc   %s/([^)]*)//g                                                              " delete in ()
cabbrev ddu   %s/^\(.*\)\s*\n\1\s*$//g                                                     " delete duplicate duplicate field:cat file  uniq -f 1

" cabbrev snip  %s/\\/\\\\/g <Bar> %s/\//\\\//g <Bar> %s/"/\\"/g <Bar> %s/\$/\\\\\$/g <Bar> %s/^/"/ <Bar> %s/$/",/g <Bar> :noh
" cabbrev snip  's,'S s/\\/\\\\/g <Bar> 's,'S s/\//\\\//g <Bar> 's,'S s/"/\\"/g <Bar> 's,'S s/\$/\\\\\$/g <Bar> 's,'S s/^/"/ <Bar> 's,'S s/$/",/g <Bar> :noh
" cabbrev snip  's,'S s/\\/\\\\/ge <Bar> 's,'S s/\//\\\//ge <Bar> 's,'S s/"/\\"/ge <Bar> 's,'S s/\$/\\\\\$/ge <Bar> 's,'S s/^/"/e <Bar> 's,'S s/$/",/ge <Bar> :noh
" cabbrev snip  '<,'> s/\\/\\\\/ge <Bar> '<,'> s/\//\\\//ge <Bar> '<,'> s/"/\\"/ge <Bar> '<,'> s/\$/\\\\\$/ge <Bar> '<,'> s/^/"/e <Bar> '<,'> s/$/",/ge <Bar> :noh



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vitural process substitute calculate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" path / to _
cabbrev vss_  s/\%V\//_/g
" _ variable to camel
cabbrev vs_c  s/\%V_\(\a\)/\u\1/g
" camel variable to _
cabbrev vsc_  s/\%V\(\a\)\([A-Z]\)/\l\1_\l\2/g
" string to variable 
cabbrev vsb_  s/\%V /_/g
" visual delete blank
cabbrev vdb  s/\%V //g

" visual calculate expression
cabbrev vcal  s/\%V.*/\=submatch(0) . '=' .string(eval(submatch(0)))/


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbrev fas  g/-/ s/\\\?\s*$/ `# ` \\/g                                                 " add change line at the end
cabbrev fjs  !python3 -m json.tool
cabbrev fjs  !jq
cabbrev ufjs !jq -c
cabbrev fnum s/\(\.\d\d\d\)\d\+/\1/g
cabbrev c2m  :g/[^\|]$/norm J   " csv to md format


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" save with root user
cabbrev b2s    w!sudo tee %
"  replace buffer
cabbrev bsu    bufdo %s/pattern/replace/gce \| update
cabbrev his    r!echo "history 10" \| bash -i 2>/dev/null \| sed -e 's/\x1b\[.//g'


" cabbrev  WQA   execute 'mksession! $HOME/.config/reg/session.' . fnamemodify(getcwd(), ':t') . '.vim <Bar> wqa'
command!  WQA    execute 'call TerminalDelete() <Bar> wqa'
" cabbrev  SS   execute 'mksession! $HOME/.config/reg/session.' . fnamemodify(getcwd(), ':t') . '.vim'
" command! -bar W exe 'w !sudo tee >/dev/null %:p:S' |setl nomod
command!   W  :execute ':silent w !sudo tee % > /dev/null' | :edit!
command!   SE :execute ':silent w !sudo tee % > /dev/null' | :edit!

" change language
cabbrev lgcn  execute(':lang zh_CN.UTF-8')
cabbrev lgen  execute(':lang en_US.UTF-8')

" command!   WQA :execute ':silent write! $HOME/.config/reg/fileb' <Bar> :execute ':silent write! >> $HOME/.config/reg/fileB' <Bar> :wqa
" command!   WQA :execute ':silent write! $HOME/.config/reg/fileb' <Bar> :call writefile(getline(1,'$'), $HOME.'/.config/reg/fileba', 'a')  <Bar> :wqa
" command!   WQB :execute ':silent write! $HOME/.config/reg/fileb' <Bar> :call writefile(getline(1,'$'), $HOME.'/.config/reg/fileba', 'a')  <Bar> :execute ':g/^\s*#/m$' <Bar> :wqa
" command!   WQB :execute ':silent write! $HOME/.config/reg/fileb' <Bar> :call writefile(getline(1,'$'), $HOME.'/.config/reg/fileba', 'a')  <Bar> :execute ':g/^\s*#/d' <Bar> :execute ':g/^/norm -J' <Bar> :wqa
" command!   SC  :execute '%s/\s-/\r-/ge'
" command!   -nargs=* TranslateCurrentLine : call TranslateCurrentLine(<f-args>)
" new local file
cabbrev efile e %:p:h/f
" cabbrev trashf call delete(expand('%')) | bdelete!
cabbrev trashf call system('trash '. expand('%')) <Bar> bdelete!


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" data substitute
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" add end slash
cabbrev aes  s/$/ \\/  <Bar> :noh
" add begin end |
cabbrev aael s/^\\|$/\|/g  <Bar> :noh
" add begin |
cabbrev aal  s/^/\|/g  <Bar> :noh
" add end |
cabbrev ael  s/$/\|/g  <Bar> :noh
" add begin dash
cabbrev aad  s/^\s*/\0- /  <Bar> :noh
" substitute space between words with _
cabbrev sw_  s/\a \a/\=substitute(submatch(0),' ','_','g')/g

" echo vim varialbe
cabbrev getvar   echo &g:mysql_database
cabbrev setvar   let g:mysql_database='db'
cabbrev setdb   let g:mysql_database=substitute(getline('.'),'use\s\([a-zA-Z0-9_]*\)\s*;\?','\1','')



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" data delete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" delete not character
cabbrev dnc  s/[^[:print:]]//g  <Bar> :noh
" delete colour
cabbrev dcl  %s/\e\[[0-9;]*m//g  <Bar> :noh
cabbrev dcl  %s/\%x1b\[[0-9;]*m//g  <Bar> :noh
" delete decimal point after 2
cabbrev dcm2  s/\(\.\d\d\)\d\+/\1/g  <Bar> :noh
" delete space
cabbrev dsp  s/ //g  <Bar> :noh
cabbrev dbk  s/\s//g  <Bar> :noh


" NOTE: when use delete the last space character,for 中文 不起作用
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Tabular cheatsheet](https://devhints.io/tabular)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbrev tabjson Tab /: \zs/l0l1
" Colons
" title:       "Hello world"
" description: "This is a description"
cabbrev tabra Tab /:/r0
" Right align
" title:My picture
"   src:   img.jpg
cabbrev tabzs Tab /:\zs
" The \zs atom The \zs atom will exclude the : from the search match.
" title:  My picture
" src:    img.jpg
cabbrev tabspc Tab /:/r1c1l0
" Specifier
" title : My picture
"   src : img.jpg
" Explanation
" r1 – Right align with 1 space
" c1 – Center align the comma with 1 space
" l0 – Left align with 0 spaces
cabbrev tabreg Tab /^[^,]*\zs,/r0
" Regexp
" abc,hello
"   c,hi there
"   a,yo
cabbrev tabvar Tabularize /\$/l1r0
" title $My picture
" src   $img.jpg
cabbrev tabnospace  Tabularize /:/l0
" tab right and left no space
" title:My picture
" src  :img.jpg
cabbrev tabblank  Tabularize /\S\(' . split(&commentstring, '%s')[0] . '.*\)\@<!\zs\s/l0
cabbrev tabspace  Tabularize /\S\(' . split(&commentstring, '%s')[0] . '.*\)\@<!\zs\ /l0
" cabbrev tabblank  Tabularize/\s\+\zs\s/l0c0
" tab by spaces
cabbrev tabgroup   Tabularize/\( "\)/l0
cabbrev tabgroup  Tabularize/\(\s"\)/l0
" tab by group

cabbrev tabsharps  Tabularize/\(#\+\)
" cabbrev tab  Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0
"tab on the first match
cabbrev tabfirst  Tabularize /^[^:]*\zs:
"tab on the first match
cabbrev tabfirst1  Tabularize /^[^@]*\zs@/l1l0
"tab on the last match
cabbrev tablast  Tabularize /.*\zs,/
"align at the  2nd occurence of ','
cabbrev tabnth Tabularize /^\(.\{-}\zs,\)\{2}\zs/l0l1
"align at the  2nd occurence of ','
cabbrev tabno  Tabularize /^\(.\{-}\zs,\)\{2}/l0
"Tabularize from last
cabbrev tabfromlast  Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0
"Tabularize block of text table
cabbrev tabblock  g/[^\|]/+1.,/[^\|]/-1 Tabularize/\|
"Tabularize or 
cabbrev tabnrls  Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" document format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" yaml,json,sql,markdown,html,sh,py,java
cabbrev sft set filetype=json
" set all space
cabbrev setvir set virtualedit=all

" set line number
cabbrev snnum    set nornu  \|set nonu
cabbrev snum    set nu  \|set rnu
" set wrap
cabbrev snwrap    set nowrap
cabbrev swrap    set nowrap
" set show space simble
cabbrev snlist    set nolist
cabbrev slist    set list


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" edit file new buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbrev sou  :source ~/.config/nvim/lua/vimscript/vimrc.custom.config.rc.vim
cabbrev esou :edit ~/.config/nvim/lua/vimscript/vimrc.custom.config.rc.vim
cabbrev gopassenv :source ~/.config/reg/gopassenv.vim
" edit temp file
cabbrev etemp :let $dtime=trim(system('date +%Y%m%d_%H%M%S')) <Bar> edit `mktemp $TMPDIR/TMP_$dtime.md`
" edit temp file
" cabbrev etmp  :edit /tmp/`uuidgen`.md
cabbrev etmp  :edit $TMPDIR/`uuidgen`

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" interact with outside file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" copy yank
cabbrev yyy  call writefile(getreg('"', 1, 1), $HOME."/.config/reg/filer")  \| call setreg('+',getline('.')) \| call setreg('l',getline('.')) \| call writefile([getline('.')], $HOME.'/.config/reg/filel')  \| write! $HOME/.config/reg/filef
" cabbrev swq  :execute('write! $HOME/.config/reg/fileb') \| execute('g/^[\s\t]*#/d') \| execute('wqa')
cabbrev sw  :write! $HOME/.config/reg/fileb \| g/^\s*#/d
cabbrev y4l  call writefile([getline('.')], $HOME.'/.config/reg/filel') \| call setreg('+',getline('.')) \| call setreg('l',getline('.'))
cabbrev y4r  call writefile(getreg('"', 1, 1), $HOME.'/.config/reg/fileu')
" yark file path
cabbrev yfp   call writefile([expand("%:p")],   $HOME."/.config/reg/filep") <Bar> call system('printf "'. expand("%:p") . '" \|pbcopy \|xsel -i -b ')
" yark file directory
cabbrev yfd   call writefile([expand("%:p:h")], $HOME."/.config/reg/filep") <Bar> call system('printf "'. expand("%:p:h") . '" \|pbcopy \|xsel -i -b ')
" yark the path
cabbrev ypwd  call writefile([getcwd()], $HOME."/.config/reg/filep")        <Bar> call system('printf "'. getcwd() . '" \|pbcopy')
" copy to register
cabbrev y2r  call system('xsel -i -b ', @")
" copy to clipboard
cabbrev y2x  .write !xsel -i -b
" cabbrev y2d  .write! $HOME/Desktop/tmp.md
" yark to tmp
cabbrev y2t  .write! /tmp/`uuidgen`.md
" yark to
cabbrev y2y  .write! $HOME/.config/reg/filey
cabbrev y2f   write! $HOME/.config/reg/filef
cabbrev y2l  .write! $HOME/.config/reg/filel
cabbrev y2u  .write! $HOME/.config/reg/fileu
cabbrev y2i  .write! $HOME/.config/reg/filei
cabbrev y2o  .write! $HOME/.config/reg/fileo
cabbrev y2s  .write! $HOME/.config/reg/files
cabbrev y2c  .write! $HOME/.config/reg/filec
" cabbrev y2v   call writefile(getreg('"', 1, 1), $HOME."/.config/reg/filev")
cabbrev y2v  Y2v
command!   -range=% -nargs=* Y2v <line1>,<line2> :call Save_visually_selected_text_to_file(<f-args>)
" add to
cabbrev a2y  write! >> $HOME/.config/reg/filey
cabbrev a2f  write! >> $HOME/.config/reg/filef
cabbrev a2l  write! >> $HOME/.config/reg/filel
cabbrev a2u  write! >> $HOME/.config/reg/fileu
cabbrev a2i  write! >> $HOME/.config/reg/filei
cabbrev a2o  write! >> $HOME/.config/reg/fileo
cabbrev a2s  write! >> $HOME/.config/reg/files
" past ctrl+r a:past register in command line
cabbrev ppp  normal "+p
cabbrev p4b  r $HOME/.config/reg/fileb
cabbrev p4d  r $HOME/Desktop/tmp.md
cabbrev p4y  r $HOME/.config/reg/filey
cabbrev p4u  r $HOME/.config/reg/fileu
cabbrev p4i  r $HOME/.config/reg/filei
cabbrev p4p  r $HOME/.config/reg/filep
cabbrev p4f  r $HOME/.config/reg/filef
cabbrev p4l  r $HOME/.config/reg/filel
cabbrev p4r  r $HOME/.config/reg/filer
cabbrev p4t  r $HOME/.config/reg/filet.txt
cabbrev p4s  r $HOME/.config/reg/files
cabbrev p4x  r $HOME/.config/reg/filex
cabbrev e4tn :let $newTempFile='/tmp/'.trim(system('date +%Y%m%d_%H%M%S')) \| e $newTempFile
cabbrev p4tl :let $lastTempFile='/tmp/'.trim(system('ls -tU /tmp/ \| head -1 \| tail -1 ')) \| r $lastTempFile
cabbrev e4tl :let $lastTempFile='/tmp/'.trim(system('ls -tU /tmp/ \| head -1 \| tail -1 ')) \| e $lastTempFile
cabbrev evmd e $HOME/.config/nvim/vimscript/README.md
" edit new file
cabbrev enf e %:p:h/fname
" cabbrev p4w  r!sed -n 1,+50p /tmp/www
cabbrev p4w  PasteFromFile /tmp/www 1 1
cabbrev p4h  r! tail -1 ~/.config/zshenv/zshhi.sh

" past from clipboard
" cabbrev p4c  r!xsel -o -b
cabbrev p4c  r!xsel --clipboard --output

cabbrev mdpv  :let g:mkdp_port='8889' <Bar> MarkdownPreview
cabbrev des  :s/ *\\//g

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim to chrome/canary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

cabbrev chfresh :call writefile(['setopt aliases;','source ~/.config/zshenv/zshfun.sh;','chromeReload ;'],  $HOME."/.config/reg/instant.sh") <Bar> call system("/bin/zsh $HOME/.config/reg/instant.sh ")
cabbrev chfr :!chrome-cli reload
cabbrev cafr :call writefile(['setopt aliases;','source ~/.config/zshenv/zshfun.sh;','canaryReload ;'],  $HOME."/.config/reg/instant.sh") <Bar> call system("/bin/zsh $HOME/.config/reg/instant.sh ")
" get browser link
cabbrev gsal   r! osascript /usr/local/4T/script/browserGetTabLink.scpt 'safari'
cabbrev gchl   r! osascript /usr/local/4T/script/browserGetTabLink.scpt 'Google Chrome'
cabbrev gcal   r! osascript /usr/local/4T/script/browserGetTabLink.scpt 'Google Chrome Canary'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim to taskwarrior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cabbrev tskt :call append(line(".")-1, "# ".trim(system("task _get ".expand("%:t:r").".description"))." #")
cabbrev tsk :! task oldest +bg
cabbrev tske :execute 'edit ' . "$BLOG_HOME/" . trim(system("task _get 75.uuid")) . ".md"





" cabbrev smh    /#.*#\s*$
" cabbrev ldn    s#^\s*\d*\.\?\s*#1. #g <Bar> :noh
" cabbrev lds    s#^\(\s*\d\+\)\s\+\.#\1\.#g <Bar> :noh






" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 用户自定义配置（该文件放一般性配置，可覆盖~/.vimrc里的配置，若要增加、卸载插件，请放入~/.vimrc.custom.plugins）
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ":verbose set mm? mmt? mmp?
" set mmp=5000

" " 开启相对行号
" set relativenumber
" set showcmd
" " set noshowcmd

" " 设置默认进行大小写不敏感查找
" " set ignorecase
" " 如果有一个大写字母，则切换到大小写敏感查找
" set smartcase

" " 开启鼠标
" " set mouse=a

" " 设置光标所在列高亮
" " set cursorcolumn

" " indentLine 开启代码对齐线
" let g:indentLine_enabled = 1
" "ctags
" " map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" " map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" " markdown
" " let system = system('uname -s')
" " if system == 'Darwin\n'
" "     let g:mkdp_path_to_chrome = '/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome'
" " else
" "     let g:mkdp_path_to_chrome = '/usr/bin/google-chrome-stable %U'
" " endif
" " nmap <silent> <F7> <Plug>MarkdownPreview
" " imap <silent> <F7> <Plug>MarkdownPreview
" " nmap <silent> <F8> <Plug>StopMarkdownPreview
" " imap <silent> <F8> <Plug>StopMarkdownPreview

" " Doxygen
" " let g:DoxygenToolkit_authorName="chxuan, 787280310@qq.com"
" " let s:licenseTag = 'Copyright(C)\<enter>'
" " let s:licenseTag = s:licenseTag . 'For free\<enter>'
" " let s:licenseTag = s:licenseTag . 'All right reserved\<enter>'
" " let g:DoxygenToolkit_licenseTag = s:licenseTag
" " let g:DoxygenToolkit_briefTag_funcName="yes"
" " let g:doxygen_enhanced_color=1
" " let g:DoxygenToolkit_commentType="Qt"


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " DC自定义配置（该文件放一般性配置，可覆盖~/.vimrc里的配置，若要增加、卸载插件，请放入~/.vimrc.custom.plugins）
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set history=10000 " the max is 10000
" set nowrap
" set list
" set relativenumber
" ""folding settings
" "set foldmethod=indent   "fold based on indent
" "set foldnestmax=10      "deepest fold is 10 levels
" "set nofoldenable        "dont fold by default
" "set foldlevel=1         "this is just what i use
" " 设置你的undo保存位置，你需要先 mkdir $HOME/.vim/undodir
" set undodir=$HOME/.vim/undodir
" if empty(glob($HOME.'/.vim/undodir'))
"     call mkdir($HOME.'/.vim/undodir','p')
" endif
" set undofile " Maintain undo history between sessions

" " echo &dictionary
" " tell Vim where our dictionary is located
" set dictionary+=/usr/share/dict/words
" " setlocal dictionary=CANDBC/S202_signal_id.txt
" set thesaurus+=/usr/coderoot/usr/share/dict/thesaurus.txt
" let g:tq_online_backends_timeout = 10
" let g:tq_language=['en', 'cn']
" let g:tq_enabled_backends=["yarn_synsets", "openoffice_en", "mthesaur_txt"]
" let g:tq_enabled_backends=["cilin_txt",
"             \"openthesaurus_de",
"             \"yarn_synsets",
"             \"openoffice_en",
"             \"mthesaur_txt",
"             \"datamuse_com",]
" let g:tq_openoffice_en_file="/usr/coderoot/usr/share/myspell/dicts/th_en_US_new"
" let g:tq_mthesaur_file="/usr/coderoot/usr/share/dict/mthesaur.txt"
" let g:tq_cilin_txt_file="/usr/coderoot/usr/share/dict/cilin.txt"

" " A list of directory names that are searched for snippets.
" " cabbrev tysh   set filetype=sh
" " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | execute '10Term' | endif
" cabbrev sft set filetype=yaml,json,sql,markdown,html,sh,py,java
" autocmd VimEnter * if @% =~ "bash" | execute 'set filetype=sh' | endif
" autocmd VimEnter * if has_key(g:ycm_filetype_blacklist, 'markdown') | execute 'let test=remove(g:ycm_filetype_blacklist, "markdown")' | endif
" if !exists('g:UltiSnipsSnippetDirectories')
"     let g:UltiSnipsSnippetDirectories = [ 'UltiSnips','UltiSnipsDC', ]
" endif
" " let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsExpandTrigger="<c-t><c-t>"
" " let g:UltiSnipsListSnippets = "<c-tab>"
" let g:UltiSnipsListSnippets = "<c-t><c-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-t><c-f>"
" let g:UltiSnipsJumpBackwardTrigger="<c-t><c-b>"

" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" " g:JavaComplete_LibsPath=""
" " To enable smart (trying to guess import option) inserting class imports with F4, add:
" nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" " To enable usual (will ask for import option) inserting class imports with F5, add:
" nmap <F5> <Plug>(JavaComplete-Imports-Add)
" imap <F5> <Plug>(JavaComplete-Imports-Add)
" " To add all missing imports with F6:
" nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" " To remove all unused imports with F7:
" nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
" imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
" " add close brace automatically, when complete method declaration.
" " let g:JavaComplete_ClosingBrace = 1
" " path to additional jar files. This path appends with your libraries specified in pom.xml.
" " let g:JavaComplete_LibsPath = ""
" " path of additional sources. Don't try to add all sources you have, this will slow down the parsing process.
" " g:JavaComplete_SourcesPath
" " let g:JavaComplete_GradleExecutable = './gradlew'
" " let g:JavaComplete_GradleExecutable = 'gradle'
" " insert mode cursor move right
" inoremap <C-l> <Right>
" " inoremap <C-l> <S-Right>
" inoremap <C-h><C-h> <S-Left>
" inoremap <C-k> <Up>
" inoremap <C-j> <Down>
" iabbrev <expr> CDAY  strftime("%Y-%m-%d")
" iabbrev <expr> CWEEK strftime("%V")
" iabbrev <expr> PWD   getcwd()
" " inoremap <silent> <C-C><C-A> <C-R>=string(eval(input("Calculate: ")))<CR>
" "inoremap <silent> <C-D><C-D> <C-R>=strftime("%Y-%m-%d")<CR>
" "inoremap <silent> <C-D><C-T> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" " nomal 模式 Ctrl-j 换行 与java冲突
" nnoremap <C-J> i<CR><Esc>
" nnoremap <leader>o o<Esc>
" nnoremap <leader>O O<Esc>

" " vnoremap p "_dP
" " vnoremap p "0P
" vnoremap <leader>p "_di<CR><CR><Esc>kpkJJ
" vnoremap <leader>P "_di<CR><CR><Esc>kpkJ
" nnoremap <leader>p i<CR><CR><Esc>kpkJJ
" nnoremap <leader>P i<CR><CR><Esc>kpkJ
" " command mode cursor move right
" cnoremap <C-D> <Delete>
" cnoremap <C-F> <S-Right>
" cnoremap <C-A> <Home>
" cnoremap <C-B> <Left>
" cnoremap <C-P> <Up>
" cnoremap <C-N> <Down>
" cnoremap <Esc>b <S-Left>
" cnoremap <Esc>f <S-Right>



" nnoremap <leader>d "_d
" vnoremap <leader>d "_d


" " :vert diffsplit main.py

" " surround change
" cabbrev nysiw normal ysiw"
" cabbrev nysiW normal ysiW"
" cabbrev nysaw normal ysaw"
" cabbrev nyss  normal yss"
" cabbrev nvS   normal S"

" " g/0x[0-9a-zA-Z]\{4,10\}/yank | /;;/normal! pkk
" " g/cat << EOF/.,/^EOF/-1 Tabularize/|
" " window change
" cabbrev wch wincmd h
" cabbrev wcj wincmd j
" cabbrev wck wincmd k
" cabbrev wcl wincmd l
" " help
" " help global-variable
" " help digraph-table
" " echo variable
" cabbrev a2snip   write >> ${HOME}/.vim/plugged/vim-snippets/UltiSnipsDC/sh.snippets
" cabbrev e2v  echo g:JavaComplete_LibsPath


" cabbrev touchfile !touch %:p:h/file
" cabbrev mvfile !mv %:p %:p:h/file

" " shell format
" cabbrev sfm  s#\s\+--# \\\r--#g
" cabbrev sfl  s#\s*\\\n\s*--# --#g

" " copy yank
" " cabbrev yyy   call writefile(getreg('"', 1, 1), $HOME.'/.config/reg/filey') \| call setreg('q',@")
" cabbrev yyy  call writefile(getreg('"', 1, 1), $HOME."/.config/reg/filer")  \| call setreg('+',getline('.')) \| call setreg('l',getline('.')) \| call writefile([getline('.')], $HOME.'/.config/reg/filel')  \| write! $HOME/.config/reg/filef
" cabbrev yyy1 call writefile(getreg('"', 1, 1), $HOME."/.config/reg/filer1") \| call setreg('+',getline('.')) \| call setreg('l',getline('.')) \| call writefile([getline('.')], $HOME.'/.config/reg/filel1') \| write! $HOME/.config/reg/filef1
" " cabbrev swq  :execute('write! $HOME/.config/reg/fileb') \| execute('g/^[\s\t]*#/d') \| execute('wqa')
" cabbrev sw  :write! $HOME/.config/reg/fileb \| g/^\s*#/d
" cabbrev y4l  call writefile([getline('.')], $HOME.'/.config/reg/filel') \| call setreg('+',getline('.')) \| call setreg('l',getline('.'))
" cabbrev y4r  call writefile(getreg('"', 1, 1), $HOME.'/.config/reg/fileu')
" cabbrev yfp   call writefile([expand("%:p")],   $HOME."/.config/reg/filep") <Bar> call system('printf "'. expand("%:p") . '" \|pbcopy \|xsel -i -b ')
" cabbrev yfd   call writefile([expand("%:p:h")], $HOME."/.config/reg/filep") <Bar> call system('printf "'. expand("%:p") . '" \|pbcopy \|xsel -i -b ')
" cabbrev ypwd  call writefile([getcwd()], $HOME."/.config/reg/filep")
" cabbrev y2r  call system('xsel -i -b ', @")
" cabbrev y2x  .write !xsel -i -b
" cabbrev y2y  .write! $HOME/.config/reg/filey
" cabbrev y2f  write! $HOME/.config/reg/filef
" cabbrev y2f2  write! $HOME/.config/reg/filef2
" cabbrev y2l  .write! $HOME/.config/reg/filel
" cabbrev y2u  .write! $HOME/.config/reg/fileu
" cabbrev y2i  .write! $HOME/.config/reg/filei
" cabbrev y2o  .write! $HOME/.config/reg/fileo
" cabbrev y2s  .write! $HOME/.config/reg/files
" cabbrev a2y  write! >> $HOME/.config/reg/filey
" cabbrev a2f  write! >> $HOME/.config/reg/filef
" cabbrev a2f2 write! >> $HOME/.config/reg/filef2
" cabbrev a2l  write! >> $HOME/.config/reg/filel
" cabbrev a2u  write! >> $HOME/.config/reg/fileu
" cabbrev a2i  write! >> $HOME/.config/reg/filei
" cabbrev a2o  write! >> $HOME/.config/reg/fileo
" cabbrev a2s  write! >> $HOME/.config/reg/files
" " past ctrl+r a:past register in command line
" cabbrev ppp  normal "+p
" cabbrev p4b  r $HOME/.config/reg/fileb
" cabbrev p4B  r $HOME/.config/reg/fileB
" cabbrev p4d  r $HOME/Desktop/tmp.md
" cabbrev p4y  r $HOME/.config/reg/filey
" cabbrev p4u  r $HOME/.config/reg/fileu
" cabbrev p4i  r $HOME/.config/reg/filei
" cabbrev p4p  r $HOME/.config/reg/filep
" cabbrev p4f  r $HOME/.config/reg/filef
" cabbrev p4l  r $HOME/.config/reg/filel
" cabbrev p4r  r $HOME/.config/reg/filer
" " cabbrev p4w  r!sed -n 1,+50p /tmp/www
" cabbrev p4w  PasteFromFile /tmp/www 1 1
" cabbrev p4x  r!xsel -o -b
" " go
" cabbrev w2c  %s/./&/g
" cabbrev g2a  g/abc/normal! @a                                                           " go and substitute
" cabbrev g2e  g/abc/normal! hgcc                                                         " go and comment
" "find
" cabbrev fw   /\
" " delete
" " 'a,'b g/^\s\+\.\(test_case_\)\@!/co$
" cabbrev dbl   g/^[\s\t]*$/d                                                              " delete blank line
" cabbrev dbb   s/^\s*//g;s/\s*$//g                                                        " delete blank begin
" cabbrev dnA   g!/A/d                                                                     " delete not A
" cabbrev dnAB  v/\(A\|B\)/                                                                " delete not A and B
" cabbrev dml   g/SPECIAL/.,.+3d                                                           " go pattern and delete next 3 line
" cabbrev dbc   %s/([^)]*)//g                                                              " delete in ()
" cabbrev unq   %g/^\(.*\)\s*\n\1\s*$/d                                                     " delete duplicate duplicate field:cat file  uniq -f 1
" cabbrev unq1  %s/^\(.*\)\(\n\1\)\+$/\1/                                                 " delete duplicate
" cabbrev unq2  %s/^\(.*\)\n\1$/\1/                                                        " Delete lines which appears twice
" cabbrev dht   %s#\(</li>\)\\|\(</div>\)#\0\r#g \| %s#<[^>]\+>##g \| %s#&lt;#<#g \| %s#&gt;#>#g \| %s#&nbsp;# #g                             " Delete HTML tags but keeps text
" cabbrev dht0  %s#</li>#\r</li>#gc
" cabbrev dht1  %s#&nbsp;# #gc

" " format
" cabbrev fas  g/-/ s/\\\?\s*$/ `# ` \\/g                                                 " add change line at the end
" cabbrev fjs  :%!python3 -m json.tool                                                    " format with json
" cabbrev fjs  :%!python3 -m json.tool                                                    " format with json
" cabbrev c2m  :g/[^\|]$/norm J   " csv to md format

" " tab
" "Tabularize
" cabbrev tab  Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0
" "tab with groups of spaces
" cabbrev tabspace Tabularize /\S\(' . split(&commentstring, '%s')[0] . '.*\)\@<!\zs\ /l0<CR>
" cabbrev tabspace1  Tabularize /\s\+\zs\s/l0c0<CR>
" cabbrev tabgroup  Tabularize/\( "\)/l0
" "tab right no space left no space
" cabbrev tabnospace  Tabularize/:/l0<CR>
" "tab on the first match
" cabbrev tabfirst  Tabularize /^[^:]*\zs:<CR>
" "tab on the first match
" cabbrev tabfirst1  Tabularize /^[^@]*\zs@/l1l0<CR>

" cabbrev tabfm  Tabularize /.*\zs,/<CR>                                                      "tab on the last match
" cabbrev tabno Tabularize /^\(.\{-}\zs,\)\{2}\zs/l0l1<CR>                                    "align at the  2nd occurence of ','
" cabbrev tabno Tabularize /^\(.\{-}\zs,\)\{2}/l0<CR>                                        "align at the  2nd occurence of ','
" cabbrev tabnrls  Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0<CR>                        "Tabularize
" cabbrev tabnls Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0<CR>                         "Tabularize
" cabbrev tabnrs Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0<CR>                         "Tabularize
" cabbrev tabfl  Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0<CR>                          "Tabularize from last
" cabbrev tabbt  g/[^\|]/+1.,/[^\|]/-1 Tabularize/\|                                      "Tabularize block table
" " buffer
" cabbrev b2s    w!sudo tee %                                                               "  save with root user
" cabbrev c_m    ctrl+v and enter                                                           "  input ^M
" cabbrev bsu    bufdo %s/pattern/replace/gce \| update                                     "  replace buffer
" cabbrev his    r!echo "history 10" \| bash -i 2>/dev/null \| sed -e 's/\x1b\[.//g'
cabbrev mh0    s/^\s*#*\s*\(.\{-}\)\s\+#\+\s*$/\1/g <Bar> :noh
cabbrev mh0    s/^\s*#*\s*\(.\{-}\)\s*#*\s*$/\1/g <Bar> :noh
cabbrev mh1    s/^\s*\(.\{-}\)\s*$/# \1/g <Bar> :noh
cabbrev mh2    s/^\s*\(.\{-}\)\s*$/## \1/g <Bar> :noh
cabbrev mh3    s/^\s*\(.\{-}\)\s*$/### \1/g <Bar> :noh
cabbrev mh4    s/^\s*\(.\{-}\)\s*$/#### \1/g <Bar> :noh
" cabbrev mh1    s/^\s*\(.\{-}\)\s*$/# \1 #/g <Bar> :noh
" cabbrev mh2    s/^\s*\(.\{-}\)\s*$/## \1 ##/g <Bar> :noh
" cabbrev mh3    s/^\s*\(.\{-}\)\s*$/### \1 ###/g <Bar> :noh
" cabbrev mh4    s/^\s*\(.\{-}\)\s*$/#### \1 ####/g <Bar> :noh

cabbrev mb0    s#^[\#\*\.+\-~\_> 0-9]*\(.\{-}\)\s*[\#\*\_~]*$#\1#g <Bar> :noh
cabbrev mb1    s#^[\#\*\.+\-~\_> 0-9]*\(.\{-}\)\s*[\#]*$#\1  #g <Bar> :noh
cabbrev mb+    s#^[\#\*\.+\-~\_> 0-9]*\(.\{-}\)\s*[\#]*$#\+ \1#g <Bar> :noh
cabbrev mb-    s#^[\#\*\.+\-~\_> 0-9]*\(.\{-}\)\s*[\#]*$#- \1#g <Bar> :noh
cabbrev mb*    s#^[\#\*\.+\-~\_> 0-9]*\(.\{-}\)\s*[\#]*$#* \1#g <Bar> :noh
cabbrev mb2~   s#^[\#\*\.+\-~\_> 0-9]*\(.\{-}\)\s*[\#]*$#\~\~\1\~\~#g <Bar> :noh
cabbrev mb2_   s#^[\#\*\.+\-~\_> 0-9]*\(.\{-}\)\s*[\#]*$#__\1__#g <Bar> :noh
cabbrev mb2*   s#^[\#\*\.+\-~\_> 0-9]*\(.\{-}\)\s*[\#]*$#**\1**#g <Bar> :noh


" cabbrev mb*    s/^\s*\(.\{-}\)\s*$/\* \1/g <Bar> :noh
" cabbrev mb+    s/^\s*\(.\{-}\)\s*$/\+ \1/g  <Bar> :noh
" cabbrev mb-    s/^\s*\(.\{-}\)\s*$/\- \1/g  <Bar> :noh
" cabbrev mb2*   s/^\s*\(.\{-}\)\s*$/**\1**/g <Bar> :noh
" cabbrev mb2_   s/^\s*\(.\{-}\)\s*$/__\1__/g <Bar> :noh
" cabbrev mb2~   s/^\s*\(.\{-}\)\s*$/~~\1~~/g <Bar> :noh

" cabbrev mb0    s#^[\#\*\.+\-~\_> 0-9]*\(\S\)#\1#g <Bar> '<,'>s#[\*\.+\-~\_> ]*$##g <Bar> :noh
" cabbrev mb1    g#[:：]\s*$# s#^#- # <Bar> :noh
" cabbrev mb2    g!/\(^#\)\\|\([:：]\s*$\)/ s#^#\* # <Bar> norm >> <Bar> :noh
" cabbrev mb2*   s/^\s*\(.\{-}\)\s*$/**\1**/g <Bar> :noh
" cabbrev mbi    let i=1 <Bar> '<,'>g#^# s#^\s*\d*\.\?\s*#\=i.'. '# <Bar> let i+=2 " delete '<,'> area
" cabbrev srs    SurroundString **

" cabbrev mbs    .g#^# s#^\s*[\+\-\*]*\s*#- # <Bar> :noh
" cabbrev mbse   g#^\a# s#^\s*[\+\-\*]*\s*#- # <Bar> :noh
" cabbrev mbsc   g#^[^\x00-\xff]# s#^\s*[\+\-\*]*\s*#- # <Bar> :noh
" cabbrev mbp    .g#^# s#^\s*[\+\-\*]*\s*#+ # <Bar> :noh <Bar> norm >>
" cabbrev mbpe   g#^\a# s#^\s*[\+\-\*]*\s*#+ # <Bar> :noh <Bar> norm >>
" cabbrev mbpc   g#^[^\x00-\xff]# s#^\s*[\+\-\*]*\s*#+ # <Bar> :noh <Bar> norm >>
" cabbrev mbm    .g#^# s#^\s*[\+\-\*]*\s*#* # <Bar> :noh <Bar> norm >>
" cabbrev mbme   g#^\e# s#^\s*[\+\-\*]*\s*#* # <Bar> :noh <Bar> norm >>
" cabbrev mbmc   g#^[^\x00-\xff]# s#^\s*[\+\-\*]*\s*#* # <Bar> :noh <Bar> norm >>
" cabbrev mbl1   g#:$# s#^\s*[\+\-\*]*\s*#- # <Bar> :noh
" cabbrev mbl2   g!#:$# s#^\s*[\+\-\*]*\s*#* # <Bar> :noh <Bar> norm >>
" cabbrev mbn0   s#^[>]*\s*##
" cabbrev mbn    s#^[^\x00-\xff]#> \0#
" cabbrev mbn2   s#^[^\x00-\xff]#>> \0#
" cabbrev mbt    g#^\s*\d# norm >>
" cabbrev mbc    s@^[\#\*\.+\-\_> 0-9]*\(\S\)@\[\] \1@g
" " cabbrev mh4     echo getline("'<") 最前行 getpos("'<")


" cabbrev n2f    e %:h/readme.md
" cabbrev snnum    set nornu  \|set nonu
" cabbrev snum    set nu  \|set rnu
" cabbrev snwrap    set nowrap
" cabbrev swrap    set nowrap
" cabbrev snlist    set nolist
" cabbrev slist    set list

" cabbrev smh    /#.*#\s*$

" cabbrev ldn    s#^\s*\d*\.\?\s*#1. #g <Bar> :noh
" cabbrev lds    s#^\(\s*\d\+\)\s\+\.#\1\.#g <Bar> :noh

" " bufonly %bd |e#
" " terminal
" cabbrev ter  set splitbelow \| terminal ++rows=3
" " fresh NERDTree
" cabbrev ntc  NERDTreeCWD <Bar> NERDTreeFocus <Bar> NERDTreeRefreshRoot <Bar> redraw!
" " NERDTree to current file
" cabbrev ntf  NERDTree %:p:h <Bar> redraw!
" cabbrev nth  let NERDTreeShowHidden=1

" cabbrev fresh redraw!
" " sort and move
" " g/method_name/exec "m ".i | let i+= 1
" " g/Pattern/exec i.",".i." co ."|let i+=1
" cabbrev sbc1   %!sort -t'\|' -k1,1r -k2,2n -u                                                            " sort
" cabbrev sbc2   %!sort -k2nr " This sorted by the second column (-k2), treats the text as a number (n) and then sorts in reverse (r), which results in.
" cabbrev scm   s/\([a-z]\)\([A-Z]\)/\1_\L\2/gc
" cabbrev sbn   s/\s\d[.、]/\r\0/gc
" cabbrev stb    'b,'e g/^KS/,/^KE/-1s/$/@@/ \| 'b,'e g/^KS/,/^KE/join \| 'b,'e !sort -r \| 'b,'e s/@@/^M/g " sort block
" cabbrev m2b    g/SYNTAX/.,/DESCRIPTION/-1 move /PARAMETERS/-1                                             " move block
" cabbrev mobo   g/Pattern/exec "1m."                                                            " sort
" cabbrev gpe    g/pat/+1.,/pat/-1 co$
" let @a=''|g/startpattern/.+1,/stoppattern/-1 delete A
" cabbrev m2l    g/name.*\n\v^((name)@!.)*$/j                                                               " connect not end with name

" cabbrev msg    messages
" cabbrev msgc   for n in range(200) <Bar> echom "" <Bar> endfor
" " exchange
" cabbrev e2h    r! xxd -u -p <(echo -n 'ABC')                                              " ASC to Hex
" cabbrev e2a    r! xxd -r -p <(echo 414243)                                                " Hex to ASC
" cabbrev tce    s/[^\x00-\xff]\+/\=trim(system('trans -b :en ' . submatch(0)))/                  " translate chinese to english
" cabbrev e2c    %s/.*/\U&/g                                                                " exchange Up or Lower
" exchange variable by _ to camel
" cabbrev _2u    %s#_\(\l\)#\u\1#gc " set _a to A
" cabbrev e2u1   %s/\<./\u&/g	    " Sets first letter of each word to uppercase
" cabbrev e2u2   %s/\<./\l&/g	    " Sets first letter of each word to lowercase
" cabbrev e2u3   %s/.*/\u&	        " Sets first letter of each line to uppercase
" cabbrev e2u4   %s/.*/\l&	        " Sets first letter of each line to lowercase
" cabbrev d2d    %s/TODAY/\=strftime("%Y-%m-%d")/g
" cabbrev w2d    %s/TOWEEK\.\(\d\)/\=trim(system('date -d"last-sunday +' . submatch(1) .' day" +%Y-%m-%d'))/g
" " substitute
" " let c=0|g/^\d\+\ze\./let c+=1|s//\=c
" " ├─────┘ ├───────────┘├──────┘ ├─┘├─┘
" " │       │            │        │  └ with the current value of the counter (i.e. new number)
" " │       │            │        └ replace last used pattern (i.e. old number)
" " │       │            └ for every matched line, increment the counter
" " │       └ iterate over the lines starting with a number followed by a dot
" " └ initialize counter to 0
" " :%s/onward/forward/gi	Replace onward by forward, case unsensitive
" " /\<\d\d\d\d\>	Search exactly 4 digits
" cabbrev iniij  let i=0 \|let j=0
" cabbrev sabf   tabdo %s/foo/bar/g	                                                    " substitute all buffer
" cabbrev s2b    %s/\(　\)\\|\(\%ua0\)/ /g
" cabbrev s2sp   %s/\(　\)\\|\(\%ua0\)/ /g                                                " IDEOGRAPHIC SPACE(　) non-breaking spaceNBSP( ) to space
" cabbrev s2an   s/\(\d\+\)STR/\=(submatch(1)+1).'STR'/gc                                   " substitute number with number+1
" cabbrev s2sn   let i=1 \| 11,17g#index#s#index#\=printf('index%02d',i/3)#g \| let i= i+1  " substitute serial number
" cabbrev gpsn   let i=1 \| g#pattern\zs\d\+\ze# s##\=i# \| let i+=1                        " go pattern and subs with serial number
" cabbrev gpsn1  let i=1 \| g#pattern# s#\zs\d\+\ze#\=i# \| let i+=1                        " go pattern and subs with serial number
" cabbrev gpsn2  let i=1 \| g/pattern/execute "normal! I".printf("%02d ", i)\|let i = i+1   " go pattern and subs with serial number
" cabbrev gpsn3  let i=1 \| %s/pattern/\='REPLACE_'.i.execute('let i+=1')/g                 " go pattern and subs with serial number
" cabbrev gAnB   g/\(AAA\)\(.*BBB\)\@!/
" cabbrev rev    g/^/m0
" cabbrev s2sn1  let @r=1\| %s/abc/\='xyz_'.(@r+setreg('r',@r+1))/g                         " substitute serial number with register
" cabbrev ra     call setreg('a',@")
" cabbrev rb     call setreg('b',@")
" cabbrev rq     call setreg('q',@")
" cabbrev s2sn2  let n=[0]\|%s/Id="I"/\='Id="'.map(n,'v:val+1')[0].'"'/g                    " substitute serial number with register
" cabbrev s2ilz  let SI=MakeSearchIndex(-1) \| %s/^\d\+/\=SI(0,5).'_'.submatch(0)/gc        " substitute with index with leading 0000
" cabbrev snpf   let g:UltiSnipsSnippetDirectories = [ 'UltiSnips','UltiSnipsDC', ] <Bar> :call UltiSnips#RefreshSnippets()
" cabbrev snpl   let PS=PasteSnippets(0,0)
" cabbrev snpl1  let PS=PasteSnippets(0,1)
" cabbrev snpl2  let PS=PasteSnippets(0,2)
" cabbrev snpw   let PS=PasteSnippets(1,0)
" cabbrev snpw1  let PS=PasteSnippets(1,1)
" cabbrev snpw2  let PS=PasteSnippets(1,2)
" cabbrev s2iln  let S4I=MakeSearchIndex4(-1) \| %s/^\d\+/\=S4I(0,5).'_'.submatch(0)/gc    " substitute with index with leading 0000
" cabbrev v_2c    %s/\%V\([a-zA-Z0-9]\)_\([a-zA-Z0-9]\)/\1_\U\2/g
" cabbrev vb2c    %s/\%V\([a-zA-Z0-9]\)\s\+\([a-zA-Z0-9]\)/\1\U\2/g
" cabbrev vd2c    %s/\%V\([a-zA-Z0-9]\)-\([a-zA-Z0-9]\)/\1\U\2/g
" cabbrev vc2_    %s/\%V\([a-z]\)\([A-Z]\)/\1_\l\2/g
" cabbrev vc2b    %s/\%V\([a-z]\)\([A-Z]\)/\1 \l\2/g
" cabbrev vb2_    %s/\%V\s/_/g
" cabbrev vb2_    %s/\%V\s//g
" cabbrev v_2b    %s/\%V_/ /g
" cabbrev dcm     %s,/\*\_.\{-}\*/,,g \| %s#//.*$##g

" cabbrev s2s    %s/\(AAA.*\)\s\+\(.*BBB\)/\1\2/gc                                          " substitute a with b
" cabbrev sas    %s/{".*"}/\=substitute(submatch(0),'\s\+','","','g')/gc                    " substitute and then substitute
" cabbrev varh   %s#[ !"#$%&'()*+,-./:;<=>?@[\]^_`{\|}~]#_#gc
" cabbrev vara   %s#[　！＂＃＄％＆＇（）＊＋，－。／：；＜＝＞？＠［＼］＾＿｀｛｜｝～]#_#gc
" cabbrev varc   %s#[ ！“”#\%&‘’（）*+，\-。/：；《=》？@【、 】…—～\|」～]#_#gc
" cabbrev varhs  s#=var{\(.*\)}#\="=var{" . substitute(submatch(1),"[ !\"\#$%&'()*+,-./:;<=>?@[\\]\^_`{\|}~]","_","g") . "}"#gc
" cabbrev varas  s#=var{\(.*\)}#\='=var{' . substitute(submatch(1),'[　！＂＃＄％＆＇（）＊＋，－。／：；＜＝＞？＠［＼］＾＿｀｛｜｝～]','_','g') . '}'#gc
" cabbrev varcs  s#=var{\(.*\)}#\='=var{' . substitute(submatch(1),'[ ！“”\#\$\%&‘’（）*+，\-。/：；《=》？@【、 】…—～\|」～]','_','g') . '}'#gc
" cabbrev varrm  s#=var{\(.*\)}#\1#gc
" cabbrev to2h   %s/\d\+/\='%'.printf("0x%x",submatch(0))/g                                " translate oct to hex
" cabbrev th2o   %s/0[xX]\x\+/\=str2nr(submatch(0), 16)/g                                  " translate hex to oct
" cabbrev tf2c   %s/regex/\= function(submatch(1))/g                                       " translate function
" cabbrev talz   put =map(range(1,150), 'printf(''%04d'', v:val)')                          " add leading zero
" cabbrev s2reg  execute '%s/'.@o.'/'.@b.@n.@e.'/gc'                                        " substitute with register
" cabbrev spreg    let @b=substitute(@b,'\n','\\r','g') \| let @n=substitute(@o,'\n','\\r','g') \| let @e=substitute(@e,'\n','\\r','g') \| let @o=substitute(@o,'\n','\\n','g')

" " calculate
" cabbrev sum1   %!awk -F '\|' '{print; sum+=$6}; END {print("Total:",sum)}'                " add column value
" cabbrev sum2   r!awk '{sum+=$6} END {print("Total:",sum)}' %                              " add column value
" cabbrev calcexp s/.*/\=submatch(0).'='.CalcExp(submatch(0))/
" " create
" cabbrev addlinenum    %s/^/\=line('.')."\t"/                                                     " create line number
" cabbrev clnlz  g/^/exec 's/^/'.strpart(line('.').' ', 0, 4)                               " create line number
" cabbrev clnlz1 %s/^/\=strpart(line('.').' ', 0, 4)/g                                      " create line number
" cabbrev csn    for i in range(1,10) \| if i > 2 \| put ='192.168.0.'.i \| endif \| endfor " create serial number
" cabbrev crn    r! for i in $(seq 1 20); do echo -e -n "\# ${i} $((RANDOM\%10)), \n"; done " create random number
" cabbrev ctags  !ctags --recurse=yes --exclude=.git --exclude=BUILD --languages=java,python -o .tags .
" cabbrev mks   execute 'mksession! $HOME/.config/reg/' . fnamemodify(getcwd(), ':t') .strftime("_%y%m%d_%H%M%S", localtime()). '.session.vim'
" cabbrev mksl  execute 'mksession! session.vim'
" cabbrev figlet  r!figlet -w 90 -f big -c DC.Melo 2021/08/07
" cabbrev tcfile !touch %:p:h/name.java
" cabbrev tsfile !trash %:p:h/name.java
" cabbrev regc :for i in range(34,122) \| silent! call setreg(nr2char(i), []) \| endfor
" cabbrev CleanRegw call setreg('w', [])
" command!   -nargs=1 Mkfile    execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> execute('silent! !touch "<args>"') <Bar>  e <args> <Bar> redraw!
" command!   -nargs=1 MkDir     execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>
" command!   W :execute ':silent w !sudo tee % > /dev/null' | :edit!
" " command!   WQA :execute ':silent write! $HOME/.config/reg/fileb' <Bar> :execute ':silent write! >> $HOME/.config/reg/fileB' <Bar> :wqa
" command!   WQA :execute ':silent write! $HOME/.config/reg/fileb' <Bar> :call writefile(getline(1,'$'), $HOME.'/.config/reg/fileba', 'a')  <Bar> :wqa


" command!   CleanRegs for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" command!   CleanMsg  for i in range(200) | echom '' | endfor

" " 设置mark保存
" " set viminfo='1000,f1

" " let g:multi_cursor_use_default_mapping=0



" " Default mapping
" " let g:multi_cursor_start_word_key      = '<C-m>'
" " let g:multi_cursor_select_all_word_key = '<A-n>'
" " let g:multi_cursor_start_key           = 'g<C-n>'
" " let g:multi_cursor_select_all_key      = 'g<A-n>'
" " let g:multi_cursor_next_key            = '<C-m>' " def '<C-n>'
" " let g:multi_cursor_prev_key            = '<C-w>' " def'<C-p>'
" " let g:multi_cursor_skip_key            = '<C-x>'
" " let g:multi_cursor_quit_key            = '<Esc>'

" " https://vi.stackexchange.com/questions/3182/is-it-possible-to-make-a-numerically-prefixed-hotkey-run-a-function-that-many-ti
" " nnoremap <M-.> :<C-u>call ReadLines(v:count1)<cr>
" " nnoremap <C-l> :<C-u>exe v:count1 . 'ReadLines'<CR>
" " nnoremap <C-l> :call PS()<CR>
" nnoremap <C-l> :let next=PS()<CR>
" nnoremap <C-s> :<C-u>execute v:count1 . 'CopySnips' <Bar> let PS=PasteSnippets(1,0) <CR>
" "nnoremap <C-s> :<C-u>execute v:count1 . 'CopySnips'<CR> :let PS=PasteSnippets(1,0) <CR>
"




" " ========================
" command!   VisualSelection call VisualSelection()
" command!   JCommentWriter call JCommentWriter()
" command!   -nargs=* JCommentSearchInvald  call SearchInvalidComment(<f-args>)
" set tags+=.tags
" set tags+=.python.tags
" set tags+=.java.tags
" set tags+=.source.tags


" command!   FormatJson          call FormatJson()
" command!   FormatXML    call Xml()
" command!   PrettyXML    call DoPrettyXML()
" command!   Html2Txt          call Html2Txt()
" command!   -nargs=* Add2Snippet call Add2Snippet(<f-args>)
" command!   -nargs=* GenFuncCode2File     call GenFuncCode2File(<f-args>)
" command!   -nargs=* LoadImage2Markdown : call LoadImage2Markdown(<f-args>)
" command!   -nargs=* CopyLinkFile2clipboard : call CopyLinkFile2clipboard(<f-args>)
" command!   -nargs=* ConvMarkdown2clipboard : call ConvMarkdown2clipboard(<f-args>)
" command!   TestFunc            : call TestFunc()
" command!   -nargs=* PasteFromFile : call PasteFromFile(<f-args>)
" command!   -nargs=* Pat2Pat2OneLine      call Pat2Pat2OneLine(<f-args>)
" command!   -nargs=* Pat2PatTabularize    call Pat2PatTabularize(<f-args>)
" command!   -nargs=* Pat2PatProcess       call Pat2PatProcess(<f-args>)
" command!   -nargs=* FormatAndroidID      call FormatAndroidID(<f-args>)
" command!   -nargs=* FormatPyFunc         call FormatPyFunc(<f-args>)
" command!   -nargs=* RangeProcess         call RangeProcess(<f-args>)
" command!   -nargs=* AllProcess           call AllProcess(<f-args>)
" command!   -nargs=* GlobalTrans          call GlobalTrans(<f-args>)
" command!   -nargs=* Week2Date            call Week2Date(<f-args>)
" command!   -nargs=* SubsOldAddBegEnd     call SubsOldAddBegEnd(<f-args>)
" command!   -nargs=* AddArtTitle          call AddArtTitle(<f-args>)
" command!   -nargs=* SurroundString       : call SurroundString(<f-args>)
" command!   -count=1 ReadLines            call ReadLines(<count>)
" command!   -count=1 CopySnips            call CopySnips(<count>)

" command!   -nargs=* SaveRegisters  call SaveRegisters(<f-args>)
" command!   -nargs=* LoadRegisters  call LoadRegisters(<f-args>)
" command!   CleanRegisters            : call CleanRegisters()

" command!   TestFunc            : call TestFunc()
" command!   SecDown            : call SecDown()
" command!   SecUp            : call SecUp()
" command!   UnFindMore          : call UnFindMore()
" command!   GenerateDOCComment  : call GenerateDOCComment()
" " Create a user-defined command.
" command!   -nargs=* CalcExp call CalcExp (<f-args>)
" command!   -nargs=* ReplaceCalcExp call ReplaceCalcExp (<f-args>)
" command!   -nargs=* ReplaceCalcMatrix call ReplaceCalcMatrix (<f-args>)
" command!   -nargs=* ReplaceAllToHalf call ReplaceAllToHalf (<f-args>)
" command!   -nargs=* MinusTime :call MinusTime(<f-args>)
" command!   -nargs=* MinusNumber :call MinusNumber(<f-args>)
" command!   -nargs=* MutiplyDot :call MutiplyDot(<f-args>)
" " cnoremap <silent> <C-G><C-G> <C-R>=string(input("Go to: "))<CR>

function! Str2Var(...)
    let paras=a:000 "a:000 is an array («List»)
    let str = trim(l:paras[0])
    let str = substitute(str, "<br>", "", "g")
    let str = substitute(str, "'", "", "g")
    let str = trim(str)
    let str = substitute(str, "[ 　,./;\\-，。；]", '_', 'g')
    let str = substitute(str, "__\+", '__', 'g')
    " let str = substitute(str, "__", '_', 'g')
    let str = substitute(str, "_*→_*", '__', 'g')
    let str = substitute(str, "_*⇒_*", '__', 'g')
    let str = substitute(str, "[A-Z]", '\l&', 'g')
    return str
endfunction

" function! VisualSelection()
"     let [line_start, column_start] = getpos("'<")[1:2]
"     let [line_end, column_end] = getpos("'>")[1:2]
"     let lines = getline(line_start, line_end)
"     if len(lines) == 0
"         return ''
"     endif
"     echom lines
"     for i in range(0,len(lines)-1)
"         echom i
"         let lines[i] = lines[i][column_start - 1: column_end - 1]
"     endfor
"     return join(lines, "\n")
" endfunction

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " DC自定义函数，根据模版生成代码
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! UnFindMore()
"     let max_lines = line('$')
"     let file_name = ""
"     let i_begin_last=0
"     let i_end_last=0
"     let i_begin=0
"     " echom line(1026)
"     for i in range(1,max_lines)
"         if i+2 < l:max_lines && (getline(i)=~ "::::::::::::::") && (getline(i+2)=~"::::::::::::::")
"             let i_begin_last = l:i_begin
"             let i_end_last=i-1
"             if i_end_last > l:i_begin_last && l:file_name != ""
"                 :call writefile(getline(l:i_begin_last, l:i_end_last), l:file_name, "a")
"             endif

"             let i_begin=i+3
"             let file_name=getline(i+1)
"         endif
"         if i == l:max_lines
"             :call writefile(getline(l:i_begin, l:max_lines), l:file_name, "a")
"         endif
"     endfor
" endfunction
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DC自定义函数，根据模版生成代码
" 如：GenTemplateCode2File /tmp/$date 1 6 58 60 500
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GenTemplateCode2File(...)
    " let c=a:0
    let paras=a:000 "a:000 is an array («List»)
    let filename  =  l:paras[0]
		let filename = substitute(filename, '$dtime', trim(system('date +%Y%m%d_%H%M%S')), '')
    let head_beg  = str2nr(l:paras[1])
    let table_beg = str2nr(l:paras[2])
    let table_end = str2nr(l:paras[3])
    let code_beg  = str2nr(l:paras[4])
    let code_end  = str2nr(l:paras[5])
    let head_list = Strip_list(split(getline(l:head_beg),"|"))
    let col_type = index(head_list, "Type")
    let case_list = getline(l:table_beg,l:table_end)
    let case_vector = Mapped(function("Strip_list"),map(case_list,'split(v:val,"|")') )

		" follow the last line value
		for i in range(1,len(case_vector)-1)
			for j in range(len(case_vector[i]))
					if trim(case_vector[i][j])==''
						let case_vector[i][j]=case_vector[i-1][j]
					endif
			endfor
		endfor

    let pattern_type  = '^\s*Type\s\+\([a-zA-Z0-9_-]*\)\s*{\s*$'
    let pattern_block = '^\s*Block\s\+\([a-zA-Z0-9_-]*\)\s*{\s*$'
    " let pattern_type  = '^\s*Type\s\+\(.*\){\s*$'
    " let pattern_block = '^\s*Block\s\+\(.*\){\s*$'
    let comment = '//'
		let index = 0

    let type_beg = l:code_beg
    if l:col_type >= 0
        while !(getline(l:type_beg) =~ pattern_type) && (l:type_beg<l:code_end)
          let type_beg += 1
        endwhile
    endif

    while  l:type_beg < l:code_end
        if l:col_type >= 0
            let type_name = trim(substitute(getline(l:type_beg), pattern_type, '\1', ''))
        else
            let type_name = "TypeNone"
        endif
        " :echom "find type:" l:type_name

        if l:col_type >= 0
            call cursor(l:type_beg, 0)
            call cursor(l:type_beg, col('$'))
            let type_end = searchpair('{', '', '}')
        else
            let type_end = l:code_end
        endif
        " :call writefile([getline(type_beg)], l:filename, "a")
        let block_end = l:type_beg
        let block_beg = l:block_end
        while !(getline(l:block_beg) =~ pattern_block) && (l:block_beg < l:type_end)
          let block_beg += 1
        endwhile
        while l:block_beg < l:type_end
            let block_name = trim(substitute(getline(l:block_beg), pattern_block, '\1', ''))
            " :echom "find block:" l:block_name
            call cursor(l:block_beg, 0)
            call cursor(l:block_beg, col("$"))
            let block_end = searchpair('{', '', '}')
            :echom l:type_name l:type_beg l:type_end l:block_name l:block_beg l:block_end  '>>' l:filename
            :call writefile([ l:comment . l:type_name . "_" . l:block_name . "_generated_code_begin{" ], l:filename, "a")
            let index = 0
            for case in case_vector
                let index += 1
                if (l:col_type == -1) || (type_name == "All") || ((l:col_type >=0) && (type_name == case[col_type])) || ((l:col_type >=0) && (type_name == "TypeNone") && (case[col_type] != ""))
                " if (l:col_type == -1) || ((l:col_type >=0) && (type_name == case[col_type])) || ((l:col_type >=0) && (type_name == "Not-Blank") &&  (strlen(case[col_])>0))
                    " let index += 1
                    let block_str = join(getline(l:block_beg+1,l:block_end-1),"\n")
                    let block_temp_str = l:block_str
                    let i = 0
                    for item in head_list
                        let block_temp_str = substitute(block_temp_str, '\C__' . item, substitute(case[i],'&','\\\&','g'), "g")
                        " :echom l:item case[i]
                        " :echom l:item case[i] l:block_temp_str
                        let i += 1
                    endfor
                    let block_temp_str = substitute(block_temp_str, "__Index" , string(l:index), "g")
                    let block_temp_list = split(block_temp_str ,"\n")
                    :call writefile(l:block_temp_list, l:filename, "a")
                endif
            endfor
            :call writefile([ l:comment . l:type_name . "_" . l:block_name . "_generated_code_ended}" ], l:filename, "a")
            let block_beg = l:block_end
            while !(getline(l:block_beg) =~ pattern_block) && (l:block_beg < l:type_end)
              let block_beg += 1
            endwhile
        endwhile

        " :call writefile([getline(type_end)], l:filename, "a")
        let type_beg = l:type_end
        if l:col_type >= 0
            while !(getline(l:type_beg) =~ pattern_type) && (l:type_beg<l:code_end)
              let type_beg += 1
            endwhile
        endif
    endwhile
    " :echom "type begin:" l:type_beg "code end:" l:code_end
endfunction



function! CalExp(...) 

      return str
endfunction

function! AIC(...) 
    let l:extension = expand('%:e')
    let l:lang = expand('%:e')
    if l:extension == "py"
      let l:lang = "python"
    elseif l:extension == "java"
      let l:lang = "java"
    elseif l:extension == "rs"
      let l:lang = "rust"
    elseif l:extension == "go"
      let l:lang = "golang"
    elseif l:extension == "yaml"
      let l:lang = "yaml"
    elseif l:extension == "xml"
      let l:lang = "xml"
    else
      let l:lang = ""
    endif
    let l:question=getline(line("."))
    let l:question=substitute(l:question, "<!--", "", "g")
    let l:question=substitute(l:question, "-->", "", "g")
    let l:question=substitute(l:question, "#", " ", "g")
    let l:question=substitute(l:question, "//", " ", "g")
    let l:question=substitute(l:question, "--", " ", "g")
    let l:question=trim(l:question)
    let l:answer=split(system("aichat -c ".l:lang." ".l:question),"\n")
    :call append(line("."),l:answer )
endfunction

function! SumColumnEval(...) range
    let l:line_list_raw = getline(a:firstline + 0,a:lastline + 0)
    let l:value_sum=EvalSumColumn(deepcopy(l:line_list_raw))
    let l:sum_str='| Total | '.join(value_sum[1:], ' | ') . ' |'
    :call append(line("'>"),l:sum_str )
endfunction

function! SumSplitBill(...) range
    let l:line_list_raw = getline(a:firstline + 0,a:lastline + 0)
    let l:line_list = deepcopy(l:line_list_raw)
    let l:value_vector = Mapped(function("Split_number_expression_in_list"),map(line_list,'split(v:val,"|")') )
    let l:value_list=map(l:value_vector,'"|".join(v:val,"|")."|"')
    let l:value_sum=EvalSumColumn(deepcopy(l:value_list))
    let l:sum_str='| Total | '.join(value_sum[1:], ' | ') . ' |'

    call add(l:value_list,l:sum_str)
    :call append(line("'>"),l:value_list )
endfunction

function! SplitBill(...) range
    let l:line_list_raw = getline(a:firstline + 0,a:lastline + 0)
    let l:line_list = deepcopy(l:line_list_raw)
    let l:value_vector = Mapped(function("Split_number_into_each"),map(line_list,'split(v:val,"|")') )
    let l:value_list=map(l:value_vector,'"|".join(v:val,"|")."|"')
    let l:value_sum=EvalSumColumn(deepcopy(l:value_list))
    let l:sum_str='| Total | '.join(value_sum[1:], ' | ') . ' |'

    call add(l:value_list,l:sum_str)
    :call append(line("'>"),l:value_list )
endfunction

function! Space2MarkdownTable(...) range
    " let be_change_lines[0] = getline(a:firstline + 0)
    let be_change_lines = getline(a:firstline + 0,a:lastline + 0)
    let cur_row=a:firstline

    while match(l:be_change_lines[0],' -') >= 0
      let cur_col_num = match(l:be_change_lines[0],' -')
      let be_change_lines[0] =strpart(be_change_lines[0], 0, cur_col_num ) . "|" . strpart(be_change_lines[0], cur_col_num +1)
      for i in range(1,len(l:be_change_lines)-1)
        let posMinCha=0
        let posExch=0
        while posExch < cur_col_num
          if char2nr(l:be_change_lines[i][posMinCha]) > 127
            let posMinCha+=3
            let posExch+=2
          else
            let posMinCha+=1
            let posExch+=1
          endif
        endwhile
        let l:be_change_lines[i] =strpart(l:be_change_lines[i], 0, posMinCha ) . "|" . strpart(l:be_change_lines[i], posMinCha + 1)
      endfor
    endwhile
    :call extend(l:be_change_lines, [''])
    :call append(line("'<")-1,l:be_change_lines )
    :call cursor(cur_row,0 )
    " :call append(line("'>")-1,l:be_change_lines )
endfunction

" function! Space2MarkdownTable(...) range
"     let l:line_list_raw = getline(a:firstline + 0,a:lastline + 0)
"     let l:line_list=map(l:line_list_raw,'"|".v:val.repeat(" ", 200)."|"')
"     " echo l:line_list
"     while match(l:line_list[0],' \S') >= 0
"       let pos=match(l:line_list[0],' \S')
"       let l:line_list[0]=l:line_list[0][0:pos-1].'|'.l:line_list[0][pos+1:]
"       for i in range(1,len(l:line_list)-1)
"         let posNew=pos
"         while pos != (len(l:line_list[i][0:posNew-1]) + len(substitute(l:line_list[i][0:posNew-1], '[^\x00-\x7f]', 'C', 'g')))/2
"         " while pos != len(l:line_list[i][0:posnew-1])
"           let posNew+=1
"         endwhile
"         " echo pos-len(l:line_list[0][0:pos-1])
"         let l:line_list[i]=l:line_list[i][0:posNew-1].'|'.l:line_list[i][posNew+1:]
"       endfor
"     endwhile

"     " echo l:line_list
"     :call append(line("'>"),l:line_list )
" endfunction

function! SetRun(...) range
  let g:run_header = getline(a:firstline, a:lastline)
endfunction


function! ShRun(...) range
  let l:script=['setopt aliases;','source ~/.config/zshenv/zshfun.sh;']
  let l:scriptCode = getline(a:firstline, a:lastline)
  call extend(script, scriptCode)
  :call writefile(l:script,  $HOME."/.config/reg/zsh_history.sh","a")
  :call writefile(l:script,  $HOME."/.config/reg/zsh.sh")
  echo system("/bin/zsh $HOME/.config/reg/zsh.sh ")
endfunction

function! JavaRun(...) range
    let l:scriptBegin=['public class JavaRun {', 'public static void main(String[] args) {']
    let l:scriptEnd=['}','}']
    let l:scriptCode = getline(a:firstline, a:lastline)
    call extend(scriptBegin,scriptCode)
    call extend(scriptBegin,scriptEnd)
    echo system("yes | cp -rf $HOME/.config/reg/java/JavaImport.java $HOME/.config/reg/java/JavaRun.java")
    :call writefile(l:scriptBegin,  $HOME."/.config/reg/java/JavaRun.java","a")
    echo system("rm -f -- $HOME/.config/reg/*.class(N) ")
    echo system('javac -g --class-path  "$HOME/.config/reg/java:$(printf : /usr/local/4T/jar/*.jar)" $HOME/.config/reg/java/JavaRun.java')
    echo system('java --class-path  "$HOME/.config/reg/java:$(printf : /usr/local/4T/jar/*.jar)" JavaRun')
endfunction
    " TODO: delete next time
    " let l:classPath=[ 
    "             \'$HOME/.config/reg/java/', 
    "             \'$HOME/.config/reg/jar/hutool-core-5.8.23.jar', 
    "             \'$HOME/.config/reg/jar/hamcrest-2.1.jar',
    "             \'$HOME/.config/reg/jar/hamcrest-all-1.3.jar',
    "             \'$HOME/.config/reg/jar/hamcrest-core-1.1.jar',
    "             \'$HOME/.config/reg/jar/hamcrest-libsrary-1.3-sources.jar',
    "             \'$HOME/.config/reg/jar/hutool-core-5.8.23.jar',
    "             \'$HOME/.config/reg/jar/mysql-connector-j-8.2.0.jar',
    "             \]
    " let l:strCP = join(l:classPath, ":")
    " echo l:strCP 
    " echo system("javac -g --class-path ".l:strCP." $HOME/.config/reg/java/JavaRun.java")
    " echo system("java  --class-path ".l:strCP." JavaRun")

function! JavaClass(...) range
    let l:scriptCode = getline(a:firstline, a:lastline)
    let l:str = join(getline(a:firstline, a:lastline), "\n")
    let l:className = matchstr(l:str, 'public\s\+class\s\+\zs[a-zA-Z0-9_]\+\ze')
    if empty(l:className) 
        throw "no recognized java class "
    else
        let l:filePath=$HOME.."/.config/reg/java/" .. l:className .. ".java"
        echo system("cp -f $HOME/.config/reg/java/JavaImport.java ".l:filePath)
        call writefile(l:scriptCode,l:filePath,"a")
        echo system("rm -f -- $HOME/.config/reg/*.class(N) ")
    endif
    echo system('javac -g --class-path  "$HOME/.config/reg/java:$(printf : /usr/local/4T/jar/*.jar)" '.l:filePath)
    echo system('java --class-path  "$HOME/.config/reg/java:$(printf : /usr/local/4T/jar/*.jar)" '.l:className)
endfunction
        " TODO: delete next time
        " let l:classPath=[ 
        "             \'$HOME/.config/reg/java/', 
        "             \'$HOME/.config/reg/jar/hutool-core-5.8.23.jar', 
        "             \'$HOME/.config/reg/jar/hamcrest-2.1.jar',
        "             \'$HOME/.config/reg/jar/hamcrest-all-1.3.jar',
        "             \'$HOME/.config/reg/jar/hamcrest-core-1.1.jar',
        "             \'$HOME/.config/reg/jar/hamcrest-library-1.3-sources.jar',
        "             \'$HOME/.config/reg/jar/hutool-core-5.8.23.jar',
        "             \'$HOME/.config/reg/jar/mysql-connector-j-8.2.0.jar',
        "             \]
        " let l:strCP = join(l:classPath, ":")
        " echo system('javac -g --class-path '.l:strCP.' '.l:filePath)
        " echo system('java  --class-path '.l:strCP.' '.l:className)

function! RedisRun(...) range
  let l:str = join(getline(a:firstline, a:lastline), "\n")
  let l:lst = []
  " call substitute(l:str, '\${[a-zA-Z0-9_]*}', '\=add(l:lst, submatch(0))', 'g')
  call substitute(l:str, 'process.env.[a-zA-Z0-9_]\+', '\=add(l:lst, submatch(0))', 'g')
  for item in l:lst
    " let l:envName='$'.substitute(item, '\${\([a-zA-Z0-9_]*\)}', '\1', '')
    let l:envName='$'.substitute(item, 'process.env.\([a-zA-Z0-9_]\+\)', '\1', '')
    let l:envValue=expand(l:envName)
    let l:str = substitute(l:str, l:item, l:envValue, 'g')
  endfor
  :call writefile(split(l:str,"\n"),  $HOME."/.config/reg/redis_history.sql","a")
  echo system('echo '.shellescape(l:str) . ' | redis-cli -c -h $redis_host -p $redis_port -a $redis_password  --no-auth-warning ')
endfunction

function! PyRun() range
  echo system('python3 -c ' . shellescape(join(getline(a:firstline, a:lastline), "\n")))
endfunction

function! VimRun() range
        execute "'<,'>source"
endfunction


function! ChRun(...) range
    let l:str=''
    if exists("g:run_header")
        let l:str = join(g:run_header, "\n") . "\n\n" . join(getline(a:firstline, a:lastline), "\n")
    else
        let l:str = join(getline(a:firstline, a:lastline), "\n")
    endif
    let l:lst = []
  " call substitute(l:str, '\${[a-zA-Z0-9_]*}', '\=add(l:lst, submatch(0))', 'g')
  call substitute(l:str, 'process.env.[a-zA-Z0-9_]\+', '\=add(l:lst, submatch(0))', 'g')
  for item in l:lst
    " let l:envName='$'.substitute(item, '\${\([a-zA-Z0-9_]*\)}', '\1', '')
    let l:envName='$'.substitute(item, 'process.env.\([a-zA-Z0-9_]\+\)', '\1', '')
    let l:envValue=expand(l:envName)
    if empty(l:envValue) || l:envName == l:envValue
      :echohl WarningMsg | echo l:envName." : ".l:envValue | echohl None 
    endif
    let l:str = substitute(l:str, l:item, l:envValue, 'g')
  endfor
  :call writefile(split(l:str,"\n"),  $HOME."/.config/reg/chromejs_history.js","a")
  echo system('chrome-cli execute ' . shellescape(l:str))
  if len(a:000)>0
    echom 'sleep 3 second reload page'
    :call system('sleep 3s; chrome-cli reload ')
  endif
endfunction

" function! ChRun(...) range
"   let l:str = join(getline(a:firstline, a:lastline), "\n")
"   let l:lst = []
"   " call substitute(l:str, '\${[a-zA-Z0-9_]*}', '\=add(l:lst, submatch(0))', 'g')
"   call substitute(l:str, 'process.env.[a-zA-Z0-9_]\+', '\=add(l:lst, submatch(0))', 'g')
"   for item in l:lst
"     " let l:envName='$'.substitute(item, '\${\([a-zA-Z0-9_]*\)}', '\1', '')
"     let l:envName='$'.substitute(item, 'process.env.\([a-zA-Z0-9_]\+\)', '\1', '')
"     let l:envValue=expand(l:envName)
"     if empty(l:envValue) || l:envName == l:envValue
"       :echohl WarningMsg | echo l:envName." : ".l:envValue | echohl None 
"     endif
"     let l:str = substitute(l:str, l:item, l:envValue, 'g')
"   endfor
"   :call writefile(split(l:str,"\n"),  $HOME."/.config/reg/chromejs_history.js","a")
"   echo system('chrome-cli execute ' . shellescape(l:str))
"   if len(a:000)>0
"     echom 'sleep 3 second reload page'
"     :call system('sleep 3s; chrome-cli reload ')
"   endif
" endfunction


function! UmlRun(...) range
  let paras=a:000 "a:000 is an array («List»)
  let l:timestamp=strftime('_%y%m%d%H%M%S')
  let l:name='uml'
  if len(l:paras)>0
    let l:name=l:paras[0] .'_uml'
  endif
  let l:outPlantuml = expand("%:p:h") . '/docs/media/' . l:name . l:timestamp .'.puml'
  " echo l:outPlantuml
  let l:outImage = 'docs/media/' . l:name . l:timestamp .'.png'
  " echo l:outImage
  :call writefile(getline(a:firstline, a:lastline),  l:outPlantuml)
  let l:commandString=join(split('java -DPLANTUML_LIMIT_SIZE=8192 -jar $TOOLS_HOME/bin/plantuml.jar -charset UTF-8 ' . l:outPlantuml ),' ')
  call system(commandString)
  :call append(a:firstline-1, ['!['.l:name.']('.l:outImage.')'])
  " :call append(a:lastline, ['!['.l:name.']('.l:outImage.')'])
endfunction

function! UmlGet()
  let s:file = matchstr(getline("."), 'docs\/media\/[^ >,;()|｜]*')
  if s:file != ""
    echo "plantuml '".expand("%:p:h") ."/" . s:file."'"
    let l:outImage = expand("%:p:h") ."/" . s:file
    let l:commandString=join(split('java -DPLANTUML_LIMIT_SIZE=8192 -jar $TOOLS_HOME/bin/plantuml.jar -charset UTF-8 -metadata ' . l:outImage ),' ')
    :call append(a:lastline,systemlist(commandString))
  endif
endfunction

function! JsRun(...) range
  :call writefile(getline(a:firstline, a:lastline),  $HOME."/.config/reg/nodejs_history.js","a")
  echo system('node -e ' . shellescape(join(getline(a:firstline, a:lastline), "\n")))
endfunction


function! SQLRun(...) range
  let l:str = join(getline(a:firstline, a:lastline), "\n")
  let l:lst = []
  " call substitute(l:str, '\${[a-zA-Z0-9_]*}', '\=add(l:lst, submatch(0))', 'g')
  call substitute(l:str, 'process.env.[a-zA-Z0-9_]\+', '\=add(l:lst, submatch(0))', 'g')
  for item in l:lst
    " let l:envName='$'.substitute(item, '\${\([a-zA-Z0-9_]*\)}', '\1', '')
    let l:envName='$'.substitute(item, 'process.env.\([a-zA-Z0-9_]\+\)', '\1', '')
    let l:envValue=expand(l:envName)
    let l:str = substitute(l:str, l:item, l:envValue, 'g')
  endfor
  :call writefile(split(l:str,"\n"),  $HOME."/.config/reg/mysql_history.sql","a")
  if !exists("g:mysql_database")
    echo system('mysql --host=$mysql_host --port=$mysql_port --user=$mysql_username --password="$mysql_password" -e ' . shellescape(l:str))
  else
    echo system('mysql --host=$mysql_host --port=$mysql_port --user=$mysql_username --password="$mysql_password" --database='. g:mysql_database .' -e ' . shellescape(l:str))
  endif


endfunction




function! ConvertDate(...) range
    let paras=a:000 "a:000 is an array («List»)
    let l:method=0
    if len(l:paras)>0
        let l:method  =  str2nr(l:paras[0])
    endif

    let l:line_list = getline(a:firstline + 0,a:lastline + 0)
    let l:convert_list = []
    for i in range(0,len(line_list)-1)
      if l:method == 0
        let l:commandString=join(split('dateconv --sed-mode --input-format="%s" --format="%Y-%m-%d %H:%M:%S" <<< '."'". line_list[i] ."'" ),' ')
      " elseif l:method == 4
      "   let l:commandString=join(split('dateconv --sed-mode --input-format="%s" --format="%Y-%m-%d %H:%M:%S" <<< '."'". line_list[i] ."'" ),' ')
      elseif l:method == 1
        let l:commandString=join(split('dateconv --sed-mode --input-format="%Y-%m-%d %H:%M:%S" --format="%s" <<< '."'". line_list[i] ."'" ),' ')
      elseif l:method == 2
        let l:commandString=join(split('dateconv --sed-mode --input-format="%s" --format="%Y-%m-%d %H:%M:%S" --zone="Asia/Shanghai" <<< '."'". line_list[i] ."'" ),' ')
      elseif l:method == 3
        let l:commandString=join(split('dateconv --sed-mode --input-format="%Y-%m-%d %H:%M:%S" --from-zone="Asia/Shanghai" --format="%s" <<< '."'". line_list[i] ."'" ),' ')
      else
        let l:commandString=join(split('dateconv -S -i "%s" -f "%Y-%m-%d %H:%M:%S" -z "Asia/Shanghai" <<< '."'". line_list[i] ."'" ),' ')
      endif
      " echom l:commandString
      let l:convertString = trim(system(l:commandString))
      call add(l:convert_list,l:convertString)
    endfor

    :call append(a:lastline,l:convert_list )
endfunction


command! -range Test call TestFunc(<range>,<line1>,<line2>,<f-args>)
function! TestFunc(r,l1,l2,...) abort

    if a:r == 0
        echo "No range"
        let l:cursor_pos = line(".")
        echo l:cursor_pos
    elseif a:r == 1
        echo "Single Line given (like :22Test)"
        echo a:l1
        echo a:l2
    else
        echo "Line range given (like 1,23Test, '<,'>Test or %Test)"
        echo a:l1
        echo a:l2
    endif
        let l:my_range = getcmdline()
        echo l:my_range 



    " let paras=a:000 "a:000 is an array («List»)
    " echo l:paras
    " let l:method=0
    " if len(l:paras)>0
    "     let l:method  =  str2nr(l:paras[0])
    " endif

    " let l:line_list = getline(a:firstline + 0,a:lastline + 0)
    " let l:convert_list = []
    " for i in range(0,len(line_list)-1)
    "   if l:method == 0
    "     let l:commandString=join(split('dateconv --sed-mode --input-format="%s" --format="%Y-%m-%d %H:%M:%S" <<< '."'". line_list[i] ."'" ),' ')
    "   elseif l:method == 1
    "     let l:commandString=join(split('dateconv --sed-mode --input-format="%Y-%m-%d %H:%M:%S" --format="%s" <<< '."'". line_list[i] ."'" ),' ')
    "   elseif l:method == 2
    "     let l:commandString=join(split('dateconv --sed-mode --input-format="%s" --format="%Y-%m-%d %H:%M:%S" --zone="Asia/Shanghai" <<< '."'". line_list[i] ."'" ),' ')
    "   elseif l:method == 3
    "     let l:commandString=join(split('dateconv --sed-mode --input-format="%Y-%m-%d %H:%M:%S" --from-zone="Asia/Shanghai" --format="%s" <<< '."'". line_list[i] ."'" ),' ')
    "   else
    "     let l:commandString=join(split('dateconv -S -i "%s" -f "%Y-%m-%d %H:%M:%S" -z "Asia/Shanghai" <<< '."'". line_list[i] ."'" ),' ')
    "   endif
    "   " echom l:commandString
    "   let l:convertString = trim(system(l:commandString))
    "   call add(l:convert_list,l:convertString)
    " endfor
    "
    " :call append(line("'>"),l:convert_list )
endfunction
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " DC自定义函数
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! GenFuncCode2File(...)
"     " let c=a:0
"     let paras=a:000 "a:000 is an array («List»)
"     let fileName  = l:paras[0]
"     :echom "append code to:" l:fileName
"     let funName = matchlist(getline('.'), '^\s\+\.\([a-zA-Z0-9_]\+\)(''\(.*\)''')
"     echom "function name:" l:funName[1] "comment:" l:funName[2]
"     let code= ['',
"             \  '    # generate code by DC',
"             \  '    def '.funName[1].'(self,desc=""):' ,
"             \  '        """ '.funName[2],
"             \  '         ',
"             \  '        :param   desc',
"             \  '        :returns self',
"             \  '         ',
"             \  '        """',
"             \  '         ',
"             \  '        logger.info(desc)',
"             \  '        # 若该函数是非隐藏函数：TODO 请设定点击、断言的元素属性。若该函数是隐藏函数，说明该函数在该文件中已经实现,仅作为留用函数。',
"             \  '        # self.click_element_by_prop_value(C.ID_ ,"xpath",C.VALUE_STATE_OFF)',
"             \  '        # self.assert_element_by_prop_value(C.ID_ ,"resourceId",C.VALUE_STATE_OFF)',
"             \  '        return self ']
"     let allcode= ['',
"             \  '    # generate code by DC',
"             \  '    def '.funName[1].'(self,desc=""):' ,
"             \  '        """ '.funName[2],
"             \  '         ',
"             \  '        :param   desc',
"             \  '        :returns self',
"             \  '         ',
"             \  '        """',
"             \  '         ',
"             \  '        logger.info(desc)',
"             \  '        # self.click_element_by_prop_value(C.ID_,)',
"             \  '        # self.click_element_by_prop_value(C.ID_,"text",C.VALUE_STATE_OFF)',
"             \  '        # self.click_element_by_prop_value(C.ID_,"icon",C.VALUE_STATE_OFF)',
"             \  '        # self.click_element_by_prop_value(C.ID_,"position",C.VALUE_STATE_OFF)',
"             \  '        # self.check_element_by_prop_value(C.ID_)',
"             \  '        # self.check_element_by_prop_value(C.ID_,"text",C.VALUE_STATE_OFF)',
"             \  '        # self.check_element_by_prop_value(C.ID_,"icon",C.VALUE_STATE_OFF)',
"             \  '        # self.assert_element_by_prop_value(C.ID_)',
"             \  '        # self.assert_element_by_prop_value(C.ID_,"icon",C.VALUE_STATE_OFF)',
"             \  '        # self.assert_element_by_prop_value(C.ID_,"text",C.VALUE_STATE_OFF)',
"             \  '        # # 保存页面元素',
"             \  '        # self.ele_before=self.get_element_prop(C.ID_MEDIA_PLAYING_TITLE)',
"             \  '        # # 点击上一曲',
"             \  '        # self.click_element_by_prop_value(C.ID_MEDIA_PRE,)',
"             \  '        # # 保存页面元素',
"             \  '        # self.ele_before=self.get_element_prop(C.ID_MEDIA_PLAYING_TITLE)',
"             \  '        # self.assert_element_by_prop_value_changed(self.ele_before,self.ele_now)',
"             \  '        return self ']
"
"     :call writefile(l:code, l:fileName, "a")
"     " :call system('ctags -R -o .tags .')

" endfunction

function! CompareLines(...)

    " Check the number of arguments
    " And get lines numbers
    if len(a:000) == 0
        let l1=line(".")
        let l2=line(".")+1
    elseif len(a:000) == 1
        let l1 =line(".")
        let l2 =a:1
    elseif len(a:000) == 2
        let l1 = a:1
        let l2 = a:2
    else
        echom "bad number of arguments"
        return
    endif

    " Get the content of the lines
    let line1 = getline(l1)
    let line2 = getline(l2)

    let pattern = ""

    " Compare lines and create pattern of diff
    for i in range(strlen(line1))
        if strpart(line1, i, 1) != strpart(line2, i, 1)
            if pattern != ""
                let pattern = pattern . "\\|"
            endif
            let pattern = pattern . "\\%" . l1 . "l" . "\\%" . ( i+1 ) . "c"
            let pattern = pattern . "\\|" . "\\%" . l2 . "l" . "\\%" . ( i+1 ) . "c"
        endif
    endfor

    " Search and highlight the diff
    execute "let @/='" . pattern . "'"
    set hlsearch
    normal n
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DC自定义函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Mapped(fn, l)
    let new_list = deepcopy(a:l)
    call map(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DC自定义函数,对一个list 去空
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Strip_list(l)
    let new_list=[]
    for item in a:l
      let item_strip = substitute(item, '^\s*\(.\{-}\)\s*$', '\1', '')
      if item_strip =~ "^="
        " echom l:item_strip
        let item_strip_exp = substitute(item_strip, '^=\(.*\)', '\1', '')
        " echom l:item_strip_exp
        let item_strip_value = eval(item_strip_exp)
        call add(new_list,item_strip_value)
      else
        call add(new_list,item_strip)
      endif
    endfor
    return new_list
endfunction

function! Get_number_expression_in_list(l)
    let num_list=[]
    for item in a:l
      let num_expression = matchstr(item, '[\-\(\)0-9][\+\-\*\/\(\)\.0-9 ]*')
      if num_expression == ''
        call add(num_list,0)
      else
        " call add(num_list,eval(num_expression))
        try
          let val=eval(num_expression)
          call add(num_list,val)
        catch /.*/
          echo "Caught error: " . num_expression . " replace by 0 "
          call add(num_list,0)
        endtry
      endif
    endfor
  return num_list
endfunction

function! EvalSumColumn(l)
  let l:value_vector = Mapped(function("Get_number_expression_in_list"),map(a:l,'split(v:val,"|")') )
  let l:value_sum=map(range(len(value_vector[0])), 0)
  for item_list in l:value_vector
    for i in range(0,len(item_list)-1)
      let l:value_sum[i] += item_list[i]
    endfor
  endfor
  " let l:sum_string='| Total |'.join(value_sum[1:], ' | ') . ' |'
    " :call append(line("'>"),l:sum_string )
  " let l:sum_string='| Total |' . ' |'
  return l:value_sum
endfunction

function! Split_number_expression_in_list(l)
  let num_list=[]
  let split_num_list=a:l[:1]
  for item in a:l
    let num_expression = matchstr(item, '-\?(\?[0-9][\+\-\*\/\(\)0-9\. ]*')
    if trim(num_expression) == ''
      call add(num_list,'0.0' )
    elseif trim(num_expression) == '-0'
      call add(num_list,'-0')
    else
      " call add(num_list,eval(num_expression))
      try
        let val=eval(num_expression)
        call add(num_list,string(val))
      catch /.*/
        echo "Caught error: " . num_expression . " replace by 0 "
        call add(num_list,'0.0' )
      endtry
    endif
  endfor
  let npices=0.0
  for item in l:num_list[2:]
    let npices+=abs(str2float(item))
  endfor
  " echo l:num_list
  for i in range(2,len(l:num_list)-1)
    if npices!= 0
      let unitSpend=str2float(num_list[1])/npices
      " abs(str2float(num_list[i]))*
      let pices=abs(eval(num_list[i]))

      let spendStr = ''
      if stridx(num_list[i], '-') == 0
          let spendStr = '-'.num_list[1]
      endif

      if pices == 0
        let spendStr = spendStr
      elseif pices == 1
        if spendStr == ''
          let spendStr = string(unitSpend)
        else
          let spendStr = spendStr.'+'.string(unitSpend)
        endif
      else
        if spendStr == ''
          if unitSpend == 1.0
            let spendStr = string(pices)
          else
            let spendStr = string(unitSpend).'*'.string(pices)
          endif
        else
          if unitSpend == 1.0
            let spendStr = spendStr.'+'.string(pices)
          else
            let spendStr = spendStr.'+'.string(unitSpend) .'*'.string(pices)
          endif
        endif
      endif
      call add(split_num_list, spendStr)
    else
      call add(split_num_list, a:l[i])
    endif
  endfor
  return split_num_list
endfunction

function! Split_big_into_each(l)
  return split_num_list
endfunction



function! MakeSearchIndex(...)
    let counter = a:1
    function! SearchIndex() closure
        let counter += 1
        return counter
    endfunction
    return funcref('SearchIndex')
endfunction


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "  DC自定义函数,格式化xml
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! DoPrettyXML()
"   " save the filetype so we can restore it later
"   let l:origft = &ft
"   set ft=
"   " delete the xml header if it exists. This will
"   " permit us to surround the document with fake tags
"   " without creating invalid xml.
"   1s/<?xml .*?>//e
"   " insert fake tags around the entire document.
"   " This will permit us to pretty-format excerpts of
"   " XML that may contain multiple top-level elements.
"   0put ='<PrettyXML>'
"   $put ='</PrettyXML>'
"   silent %!xmllint --format -
"   " xmllint will insert an <?xml?> header. it's easy enough to delete
"   " if you don't want it.
"   " delete the fake tags
"   2d
"   $d
"   " restore the 'normal' indentation, which is one extra level
"   " too deep due to the extra tags we wrapped around the document.
"   silent %<
"   " back to home
"   1
"   " restore the filetype
"   exe "set ft=" . l:origft
" endfunction

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "  DC自定义函数,格式化xml
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function FormatJson()
"     " l:cmdStr='python3 -c 'import json, sys; sys.stdout.buffer.write(json.dumps(json.loads(sys.stdin.read()), indent=4,ensure_ascii=False).encode("utf8"))''
"     :call execute('%!jq .')
" endfunction
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "  DC自定义函数,格式化xml
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function Xml()
"    set filetype=xml
"    :%s/></>\r</g "把><替换成>回车<
"    :normal gg=G<cr>
" endfunction
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "  DC自定义函数,删除html标签
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function Html2Txt()
"     execute  '%s#</div>#\0\r#g'
"     execute  '%s#</li>#\0\r#g '
"     execute  '%s#<[^>]\+>##g  '
"     execute  '%s#&lt;#<#g     '
"     execute  '%s#&gt;#>#g     '
"     execute  '%s#&nbsp;# #g   '
" endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  函数：添加代码描述
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! AddAuthor()
    call append(0 ,' _________     _                 _____   _____      __  __      _       ')
    call append(1 ,'|___   ___|   (_)  _________    |  __ \ / ____|    |  \/  |    | |      ')
    call append(2 ,' ___| |___      _ |_________|   | |  | | |   ______| \  / | ___| | ___  ')
    call append(3 ,'|___   ___|    (_)    | |       | |  | | |  |______| |\/| |/ _ \ |/ _ \ ')
    call append(4 ,' ___| |___    /|   ___| |___    | |__| | |____     | |  | |  __/ | (_) |')
    call append(5 ,'|_________|  (_)  |_________|   |_____/ \_____|    |_|  |_|\___|_|\___/ ')
endfunction

function! AddTitle()
    let figletName=system('figlet -f big "DC-Melo"')
    let figletTime=system('figlet -f big `date +%Y/%m/%d`')
    let l:file_name = expand("%:e")
    if  l:file_name == 'c' || l:file_name == 'cpp' || l:file_name == 'h' || l:file_name == 'java' || l:file_name == 'js' || l:file_name == 'ts'
				call append(0,'//  _________     _                 _____   _____      __  __      _       ')
				call append(1,'// |___   ___|   (_)  _________    |  __ \ / ____|    |  \/  |    | |      ')
				call append(2,'//  ___| |___      _ |_________|   | |  | | |   ______| \  / | ___| | ___  ')
				call append(3,'// |___   ___|    (_)    | |       | |  | | |  |______| |\/| |/ _ \ |/ _ \ ')
				call append(4,'//  ___| |___    /|   ___| |___    | |__| | |____     | |  | |  __/ | (_) |')
				call append(5,'// |_________|  (_)  |_________|   |_____/ \_____|    |_|  |_|\___|_|\___/ ')
        call append(6,"// AUTHOR   : DC-Melo王江")
        call append(7,"// MAIL     : melo.da.chor@gmail.com")
        call append(8,"// GITHUB   : https://github.com/DC-Melo https://gitee.com/DC-Melo")
        call append(9,"// BLOG     : www.dc-melo.com")
        call append(10,"// FILE     : ".expand("%:t"))
        call append(11,"// CREATED  : ".strftime("%Y-%m-%d %H:%M"))
        call append(12,"// MODIFIED : ".strftime("%Y-%m-%d %H:%M"))
        call append(13,"// VERSION  : V-0.0.1.".strftime("%y%m%d")."_a;")
        call append(14,"// DESCRIB  : ")
        call append(15,"// NOTICES  : ")
        call append(16,"// ".l:figletName)
        call append(17,"// ".l:figletTime)
        call append(18,"")
        execute '1,19 s/[\x0]/\r\/\/ /g'
        echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
    else
				call append(0,'#  _________     _                 _____   _____      __  __      _       ')
				call append(1,'# |___   ___|   (_)  _________    |  __ \ / ____|    |  \/  |    | |      ')
				call append(2,'#  ___| |___      _ |_________|   | |  | | |   ______| \  / | ___| | ___  ')
				call append(3,'# |___   ___|    (_)    | |       | |  | | |  |______| |\/| |/ _ \ |/ _ \ ')
				call append(4,'#  ___| |___    /|   ___| |___    | |__| | |____     | |  | |  __/ | (_) |')
				call append(5,'# |_________|  (_)  |_________|   |_____/ \_____|    |_|  |_|\___|_|\___/ ')
        call append(6,"# AUTHOR   : DC-Melo王江")
        call append(7,"# MAIL     : melo.da.chor@gmail.com")
        call append(8,"# GITHUB   : https://github.com/DC-Melo https://gitee.com/DC-Melo")
        call append(9,"# BLOG     : www.dc-melo.com")
        call append(10,"# FILE     : ".expand("%:t"))
        call append(11,"# CREATED  : ".strftime("%Y-%m-%d %H:%M"))
        call append(12,"# MODIFIED : ".strftime("%Y-%m-%d %H:%M"))
        call append(13,"# VERSION  : V-0.0.1.".strftime("%y%m%d")."_a;")
        call append(14,"# DESCRIB  : ")
        call append(15,"# NOTICES  : ")
        call append(16,"# ".l:figletName)
        call append(17,"# ".l:figletTime)
        call append(18,"")
        execute '1,19 s/[\x0]/\r\# /g'
        echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  函数：更新版本信息
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! UpdateTitle()
    execute '%s/\(FILE\s\+:\s\+\)[a-zA-Z0-9_\-\.]\+/\=submatch(1).expand("%:t")/gc'
    execute '%s/\(MODIFIED\s\+:\s\+\)\d\d\d\d-\d\d-\d\d\s\d\d:\d\d/\=submatch(1).strftime("%Y-%m-%d %H:%M")/gc'
    execute '%s/\(VERSION\s\+:\s\+\)V-\(\d\)\.\(\d\)\.\(\d\)\.\(\d\d\d\d\d\d\)_\([a-z];\)/\=submatch(1)."V-".submatch(2).".".submatch(3).".".(submatch(4)+1).".".strftime("%y%m%d")."_".submatch(6)'
    " normal m'
    " normal ''
    " normal m'
    " normal ''
    " normal mk
    " execute '/FILE/s@:.*$@\=": ".expand("%:t")@'
    " execute "noh"
    " normal 'k
    " execute 'g/VERSION/s@\(#\sVERSION\s*:\sV\)-\(\d*\.\d*\)\.\(\d*\)\.\(\d*\)_\([a-z]\):\(.*\)@\=submatch(1)."-".submatch(2).".".(submatch(3)+1).".".strftime("%y%m%d")."_".submatch(5).": ;V-".submatch(2).".".submatch(3).".".submatch(4)."_".submatch(5).":".submatch(6)@'
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "  函数：更新版本信息
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! Toweek(str)
"     " echom 'string is ' . a:str
"     let toweek=trim(system('date -dlast-sunday +%Y-%m-%d'))
"     return toweek
" endfunction
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "  函数：更新版本信息
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! Hex2Dec(str)
"     " echom 'string is ' . a:str
"     return str2nr(a:str,16)
" endfunction
" function! Dec2Hex(str)
"     " echom 'string is ' . a:str
"     return printf('0x%x',str2nr(a:str,10))
" endfunction

" function! Hex2Asc(str)
"     " echom 'string is ' . a:str
"     return str2nr(a:str,16)
" endfunction

" function! Asc2Hex(str)
"     echom 'string is ' . a:str
"     return char2nr(a:str)
" endfunction

" function CalcMatrix(...)

" endfunction
" " Control the precision with this variable
" " let g:MyCalcPresition = 0
" " Comment this if you don't want rounding
" " let g:MyCalcRounding = 0
" " Comment this if you don't want obase
" " let g:MyCalcRounding = 0
" "cabbrev cai  %s#\(\d\+\.\?\d*\)\/\(\d\+\.\?\d*\)#\=submatch(1)/submatch(2) . "(" . submatch(0) . ")"#gc                          "  表达式计算并替换
" "cabbrev caf  %s#\(\d\+\.\?\d*\)\/\(\d\+\.\?\d*\)#\=string(str2float(submatch(1))/str2float(submatch(2))).'('.submatch(0).')'#gc  "  表达式计算并替换
" " %s#PATTERN#\=CalcExp(submatch(1)+1).'STRING'#gc
" function CalcExp(...)
"     " if exists("g:MyCalcRounding")
"     if a:0>1
"         " if a:2==1
"         "     let ret=system("echo 'x=" . a:1 . ";d=.5/10^" . g:MyCalcPresition . ";if (x<0) d=-d; x+=d; scale=" . g:MyCalcPresition . ";print x/1' | bc -l")
"         "     echom "calclate " . a:1 .'='.ret
"         "     return ret
"         " " elseif exists("g:MycalcScale")
"         " elseif a:2==2
"         "     " let ret=system("echo 'scale=" . g:MyCalcPresition . " ; print " . a:1 . "' | bc -l")
"         "     let ret=system("echo 'scale=2" . g:MyCalcPresition . " ; print " . a:1 . "' | bc -l")
"         "     echom "calclate " . a:1 .'='.ret
"         "     return ret
"         " " elseif exists("g:MycalcObase")
"         " elseif a:2==3
"         "     let ret=system("echo 'obase=" . g:MyCalcObase . " ; print " . a:1 . "' | bc -l")
"         "     echom "calclate " . a:1 .'='.ret
"         "     return ret
"         " else
"             " let ret=system("echo '" . a:1 . "' | bc ")
"             let ret=system("echo 'scale=3; print " . a:1 . "' | bc -l")
"             echom "calclate " . a:1 .'='.ret
"             return ret
"         " endif
"     else
"             let ret=system("echo 'scale=0; print " . a:1 . "' | bc -l")
"             echom "calclate " . a:1 .'='.ret
"             return ret
"     endif
" endfunction

" function ReplaceCalcMatrix()
"     execute  '%s#(\s*\([0-9\.]\+\)\s*,\s*\([0-9\.]\+\)\s*)\s*\*\s*(\s*\([0-9\.]\+\)\s*,\s*\([0-9\.]\+\)\s*)#\=submatch(0) . " = (" . string(eval(submatch(1)) * eval(submatch(3))) . " , " . string(eval(submatch(2)) * eval(submatch(4))) . ")"#gc'
"     execute  '%s#(\s*\([0-9\.]\+\)\s*,\s*\([0-9\.]\+\)\s*)\s*+\s*(\s*\([0-9\.]\+\)\s*,\s*\([0-9\.]\+\)\s*)#\=submatch(0) . " = (" . string(eval(submatch(1)) + eval(submatch(3))) . " , " . string(eval(submatch(2)) + eval(submatch(4))) . ")"#gc'
"     execute  '%s#(\s*\([0-9\.]\+\)\s*,\s*\([0-9\.]\+\)\s*)\s*-\s*(\s*\([0-9\.]\+\)\s*,\s*\([0-9\.]\+\)\s*)#\=submatch(0) . " = (" . string(eval(submatch(1)) - eval(submatch(3))) . " , " . string(eval(submatch(2)) - eval(submatch(4))) . ")"#gc'
" endfunction

" function ReplaceCalcExp()
"     " not greedy find
"     execute 'let SI=MakeSearchIndex(0)'
"     execute  '%s#=cali{\(.\{-}\)}#\=CalcExp(substitute(submatch(1),"i",SI(1,"i"),"g"))#gc'
"     execute  '%s#=calj{\(.\{-}\)}#\=CalcExp(substitute(submatch(1),"j",SI(1,"j"),"g"))#gc'
"     execute  '%s#=calk{\(.\{-}\)}#\=CalcExp(substitute(submatch(1),"k",SI(1,"k"),"g"))#gc'
"     execute  '%s#=cal{\(.\{-}\)}#\=CalcExp(submatch(1))#gc'
" endfunction

" function ReplaceAllToHalf()
"     let char_all= ['１','２','３','４','５','６','７','８','９','０','～','！','＠','＃','＄','％','＾','＆','＊','（','）','＿','＋','＝','＼','［','］','｛','｝','：','；','＂','＇','＜','＞','／','？']
"     let char_half= ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '=', '\', '[', ']', '{', '}', ':', ';', '"', "'", '<', '>', '/', '?']
"     for i in range(0,len(l:char_all)-1)
"         execute  '%s#'.l:char_all[i].'#'.l:char_half[i].'#gc'
"     endfor
" endfunction

" function! MakeSearchIndex(...)
"     let counter = a:1
"     let counteri = a:1
"     let counterj = a:1
"     let counterk = a:1
"     function! SearchIndex(...) closure
"         if len(a:000) > 1
"             if a:2=="i"
"                 let counteri += a:1
"                 return counteri
"             elseif a:2=="j"
"                 let counterj += a:1
"                 return counterj
"             elseif a:2=="k"
"                 let counterk += a:1
"                 return counterk
"             endif
"             return 2
"         elseif len(a:000)=1
"             let counter += a:1
"             return counter
"             return 1
"         else
"             let counter += 1
"             return counter
"         endif
"     endfunction
"     return funcref('SearchIndex')
" endfunction
" " let SI=MakeSearchIndex()
" function! MakeSearchIndex4(...)
"     if (a:0 > 0)
"         let counter = a:1
"     else
"         let counter = 0
"     endif
"     function! SearchIndex(...) closure
"         let ret = l:counter
"         if (a:0 > 1)
"             let counter += a:2
"         else
"             let counter += 1
"         endif
"         return printf('%04d', ret)
"     endfunction
"     return funcref('SearchIndex')
" endfunction
" " let S4I=MakeSearchIndex4()

" " Add argument (can be negative, default 1) to global variable i.
" " Return value of i before the change.
" function Inc(...)
"   let result = g:i
"   let g:i += a:0 > 0 ? a:1 : 1
"   return result
" endfunction

" function! GenerateDOCComment()
"   let l:file_name = expand("%:e")
"   let l    = line('.')
"   let i    = indent(l)
"   let pre  = repeat(' ',i)
"   let text = getline(l)
"   let params   = matchstr(text,'([^)]*)')
"   let paramPat = '\([$a-zA-Z_0-9]\+\)[, ]*\(.*\)'
"   echomsg params
"   let vars = []
"   let m    = ' '
"   let ml = matchlist(params,paramPat)
"   while ml!=[]
"     let [_,var;rest]= ml
"     let vars += [pre.' * @param '.var]
"     let ml = matchlist(rest,paramPat,0)
"   endwhile
"   let comment = [pre.'/**',pre.' * '] + vars + [pre.' */']
"   call append(l-1,comment)
"   call cursor(l+1,i+3)
" endfunction

" "" line1 is the line number the first timestamp is on.
" " line2 is the line number the second timestamp is on.
" function! MinusTime(...)
"     " Get line content and split it where ":" matches.
"     let params=a:000 "a:000 is an array («List»)
"     if len(l:params)>=2
"         let t1Time   = matchstr(getline(l:params[0]),'\d\d\?:\(\d\d\?:\)\?\d\d\?')
"         let t2Time   = matchstr(getline('.'),'\d\d\?:\(\d\d\?:\)\?\d\d\?')
"     else
"         " let t1Time   = matchstr(getline(line('.')-1),'\d\d\?:\(\d\d\?:\)\?\d\d\?\.\?\d\?\d\?\d\?')
"         " let t2Time   = matchstr(getline('.'),'\d\d\?:\(\d\d\?:\)\?\d\d\?\.\?\d\?\d\?\d\?')
"         let tfun   = matchstr(getline('.'),'\d\d\?:\(\d\d\?:\)\?\d\d\?\.\?\d\?\d\?\d\?\s\+\-\s\+\d\d\?:\(\d\d\?:\)\?\d\d\?\.\?\d\?\d\?\d\?')
"         let l:tTime = split(tfun, "-" )
"         let l:t1Time=l:tTime[0]
"         let l:t2Time=l:tTime[1]
"     endif
"     " let pa   = matchstr(getline(a:line1),'\d\d:\d\d\?')
"     echom t2Time "-" t1Time
"     let l:t1List = split( t1Time, ":" )
"     let l:t2List = split( t2Time, ":" )
"     " echom l:t1List l:t2List
"     " Get the difference in seconds
"     let t1Sec=0.0
"     for i in l:t1List
"      let t1Sec *= 60
"      let t1Sec += str2float(i)
"     endfor
"     let t2Sec=0.0
"     for i in l:t2List
"      let t2Sec *= 60
"      let t2Sec += str2float(i)
"     endfor

"     let l:diffSec = abs(t2Sec-t1Sec)
"     echom l:diffSec t2Sec t1Sec
"     " let l:diffSec = abs(  (l:t1List[0] * 3600 + l:t1List[1] * 60 + l:t1List[2]) - (l:t2List[0] * 3600 + l:t2List[1] * 60 + l:t2List[2])   )
"     let l:sec=fmod(l:diffSec,60)
"     let l:min=trunc(fmod(l:diffSec,3600) / 60) " 60x60
"     let l:hrs=trunc(l:diffSec / 3600)
"     " Replace the line with the result.
"    " call append(a:line2, printf("%.0f hrs %.0f min %.0f sec", l:hrs,l:min,l:sec))
"    let ret=printf("%.0f:%.0f:%s",l:hrs,l:min,l:sec)
"    if len(l:params)>=2
"         call setline(l:params[1], getline(l:params[1]) . ret)
"     else
"         call setline('.', getline('.') .' = ' . ret)
"     endif

"     " Delete the other one.
"     " execute a:line2 . "delete"
" endfunction
" function! MinusNumber(...)
"     let params=a:000 "a:000 is an array («List»)
"     let l:nLine0 = []
"     let l:nLine1 = []
"     let l:minusRes=getline('.')
"     let l:meanRes=getline('.')
"     if len(l:params)>=1
"         call substitute(getline('.'), '\d[0-9\.]*', '\=add(nLine0, submatch(0))', 'g')
"         call substitute(getline(l:params[0]), '\d[0-9\.]*', '\=add(l:nLine1, submatch(0))', 'g')
"     else
"         call substitute(getline('.'), '\d[0-9\.]*', '\=add(nLine0, submatch(0))', 'g')
"         call substitute(getline(line('.')-1), '\d[0-9\.]*', '\=add(l:nLine1, submatch(0))', 'g')
"     endif
"     for i in range(0,len(l:nLine0)-1)
"         let numMinus=string(str2float(l:nLine0[i])-str2float(l:nLine1[i]))
"         let numMean=string(str2float(l:nLine0[i])/2+str2float(l:nLine1[i])/2)
"         let minusRes = substitute(minusRes, l:nLine0[i] , numMinus, '')
"         let meanRes = substitute(meanRes, l:nLine0[i] , numMean, '')
"     endfor
"     " call append(line('.'), l:strRes)
"     call setline('.', getline('.') . ' -Last= ' . l:minusRes." Avg=".l:meanRes)
" endfunction
" function! MutiplyDot(...)
"     let l:nLine0 = []
"     let strRes ="("
"     call substitute(getline('.'), '\d[0-9\.]*', '\=add(nLine0, submatch(0))', 'g')
"     for i in range(0,len(l:nLine0)/2-1)
"         let numMuti=string(str2float(l:nLine0[i])*str2float(l:nLine0[len(l:nLine0)/2+i]))
"         let strRes = l:strRes . l:numMuti.", "
"     endfor
"     let strRes = l:strRes . ")"
"     call setline('.', getline('.') .' dot*= ' . l:strRes)
" endfunction

" "==========================================================================

" function! Pat2Pat2OneLine(...)
"     let paras=a:000 "a:000 is an array («List»)
"     let blockBegPat = l:paras[0]
"     let blockEndPat = l:paras[1]
"     let skipBegEnd  = str2nr(l:paras[-1])
"     echom "beginPattern:" l:blockBegPat " endPattern:" l:blockEndPat
"     if !l:skipBegEnd
"         execute  'g/'.blockBegPat.'/,/'.blockEndPat.'/ s/$/^M/g'
"         execute  'g/'.blockBegPat.'/,/'.blockEndPat.'/ j'
"     else
"         execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/$/^M/g'
"         execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 j'
"     endif
" endfunction
"     " execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/"/\\"/g'

" function! Pat2PatTabularize(...)
"     let paras=a:000 "a:000 is an array («List»)
"     let blockBegPat  = l:paras[0]
"     let blockEndPat = l:paras[1]
"     echom "beginPattern:" l:blockBegPat " endPattern:" l:blockEndPat
" endfunction
" function! Pat2PatProcess(...)
"     let paras=a:000 "a:000 is an array («List»)
"     let blockBegPat  = l:paras[0]
"     let blockEndPat = l:paras[1]
"     echom "beginPattern:" l:blockBegPat " endPattern:" l:blockEndPat
" endfunction
"
" function! FormatAndroidID(...)
"     let paras=a:000 "a:000 is an array («List»)
"     let blockBegPat = '^Prop'
"     let blockEndPat = '^自动复制代码'
"     " let name=l:paras[0]
"     echom "beginPattern:" l:blockBegPat " endPattern:" l:blockEndPat
"     " 开头字符加上xpath
"     execute  'g/'.blockBegPat.'/ s/$/\=getline(line(".")+2)/'
"     " 代码后一行需要连在一起
"     execute  'g/^代码/ s/$/\t/g | norm J'
"     " 替换* # 等开头字符
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/^[\*#] //g'
"     " 将带有双引号的添加双引号
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/"/\\"/g'
"     " 添加双引号开头字符
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/^/"/'
"     execute  'g/^"/v/\t/s/$/\t/'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/$/",/'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/\t/":"/'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/"x, y/"x,y/'
"     " execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/"position\s\+"/"position"/'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/\s\+//'
"     " execute  'g/'.blockEndPat.'/ s/^/"icon":["main_page_off","main_page_on"],\r/'
"     " execute  'g/'.blockEndPat.'/ s/^/"state":0,\r/'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/\s*点击//g'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/\s*坐标\s*%\s*px/position/g'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/"true"/True/g'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/"false"/False/g'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/"\(\d\+\)"/\1/g'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/"\(\d\+\s*,\s*\d\+\)"/(\1)/'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 s/"(\(0\.\d\+\s*,\s*0\.\d\+\))"/(\1)/'
"     execute  'g/'.blockBegPat.'/+1,/'.blockEndPat.'/-1 Tabularize/^[^:]*\zs:'
"     " 添加行首{
"     execute  'g/'.blockBegPat.'/ s/$/={/'
"     execute  'g/'.blockBegPat.'/ s/\t/_/g'
"     " 添加尾部{
"     execute  'g/'.blockEndPat.'/ s/^/}\r/'
"     " 将字符串转数组
"     execute  'g/^"description"/v/\[/ s/: "/: ["/ |s/",/",],/'
"     " execute  'g/^"description"/v/\]/ s/",/",],/'
"     execute  'g/^"text"/v/\[/ s/: "/: ["/ | s/",/",],/'
"     " execute  'g/^"text"/v/\]/ s/",/",],/'
"     execute  'g/^"rect"/ s#"{#{# | s#}"#}# | s#\\"x\\"#"x"# | s#\\"y\\"#"y"# | s#\\"width\\"#"width"# | s#\\"height\\"#"height"# '

"     if len(l:paras)>1
"         execute  'g/^Prop_Value/ s/Prop_Value/\="Prop_Value".getline(line(".")+6)/'
"         execute  'g/^Prop_Value/ s/.*:\s*"\(.*\)",/ID\1/ |norm gUU'
"         " execute  'g/^Prop_Value/ s/.*:\s*"\(.*\)",/ID_'.name.'_\1/ |norm gUU'
"     else
"         execute  'g/^Prop_Value/ s#.*//\(.*\)=#\="ID".substitute(submatch(1),"[=:@\ ：，。%\.\*\"\/\\-\\[\\]]","_","g")."="# | norm gUU'
"         " execute  'g/^Prop_Value/ s/Prop_Value/\="Prop_Value".getline(line(".")+2)/'
"         " execute  'g/^Prop_Value/ s/.*:id\/\(.*\)",/ID_\1/ |norm gUU'
"         " execute  'g/^Prop_Value/ s/.*:id\/\(.*\)",/ID_'.name.'_\1/ |norm gUU'
"     endif

"     execute  'g/^自动/ norm gcc'

" endfunction

" function! FormatPyFunc(...)
"     let paras=a:000 "a:000 is an array («List»)
"     let pat  = l:paras[0]
"     echom "range:" pat
"     execute  pat.'s/[，。、；：！~【】“”（）,;~!@\"\-\+\>\<\/]/_/g'
"     execute  pat.'s/℃/度/g'
"     execute  pat.'s/%/百分/g'
"     execute  pat.'s/\(\S\)\s\+\(\d\)/\1\r\2/g'
"     execute  pat.'s/[\.\(\)]/_/g'
" endfunction

" function! GlobalTrans(...)
"     let paras=a:000 "a:000 is an array («List»)
"     " let pat  = l:paras[0]
"     " echom "range:" pat
"     " execute  pat.'s/\([^\x00-\x5E\x60\xff]\+\)(/\=trim(system("trans -b :en " . submatch(1)))/'
"     execute  's/\([^\x00-\x5E\x60\xff]\+\)(/\=trim(system("trans -b :en " . submatch(0)))/'
" ""     return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
" endfunction
" function! RangeProcess(...)
"     let paras=a:000 "a:000 is an array («List»)
"     let blockBegPat  = l:paras[0]
"     let blockEndPat = l:paras[1]
"     echom "beginPattern:" l:blockBegPat " endPattern:" l:blockEndPat
" endfunction

" function! AllProcess(...)
"     let paras=a:000 "a:000 is an array («List»)
"     " let blockBegPat  = l:paras[0]
"     " let blockEndPat = l:paras[1]
"     " echom "beginPattern:" l:blockBegPat " endPattern:" l:blockEndPat
"     " UI
"     " g/CAN_start_task('/normal @a
"     " %s/sk('.\{-}\X\([a-zA-Z0-9_]\+\)__\(0x[a-fA-F0-9]\+\)__=\s*\(0x\d\+\).*')/sk(\2,{'\1':\3,})/gc
"     " %s/# self.pm4.CAN_start_task(/self.pm4.CAN_start_task(/gc
"     " g/
"     " CAN
"     " g/CAN_sequence_check('/normal @a
"     " %s/ck('.\{-}\X\([a-zA-Z0-9_]\+\)__\(0x[a-fA-F0-9]\+\)__=\s*\(0x[0-9A-Fa-f]\+\).*')/ck([(\2,{'\1':\3,}),\r(\2,{'\1':\3,}),\r])/gc
" endfunction

" function! Week2Date(...)
"     execute  '%s/TOWEEK\.\(\d\)/\=trim(system(''date -d"last-sunday +'' . submatch(1) .'' day" +%Y-%m-%d''))/g'
" endfunction
" function! FormatGantt(...)
"     " execute  '%s/TOWEEK\.\(\d\)/\=trim(system('date -d"last-sunday +' . submatch(1) .' day" +%Y-%m-%d'))/g'
"     execute 'g/```/+1,/```/-1 Tabularize/\|'
" endfunction

" function! FormatGantt(...)
"     " execute  '%s/TOWEEK\.\(\d\)/\=trim(system('date -d"last-sunday +' . submatch(1) .' day" +%Y-%m-%d'))/g'
"     execute 'g/[^\|]/+1.,/[^\|]/-1 Tabularize/\|'
" endfunction
" function! FormatGantt(...)
"     " execute  '%s/TOWEEK\.\(\d\)/\=trim(system('date -d"last-sunday +' . submatch(1) .' day" +%Y-%m-%d'))/g'
"     execute 'g/[^\|]/+1.,/[^\|]/-1 Tabularize/\|'
" endfunction

" function! SubsOldAddBegEnd(...)
"     execute 'let @b=substitute(@b,''\n'',''\\r'',''g'')'
"     execute 'let @n=substitute(@o,''\n'',''\\r'',''g'')'
"     execute 'let @e=substitute(@e,''\n'',''\\r'',''g'')'
"     execute 'let @o=substitute(@o,''\n'',''\\n'',''g'')'
"     execute '%s/'.@o.'/'.@b.@n.@e.'/gc'
" endfunction

" function! AddArtTitle(...)
"     execute 'r!figlet -w 100 -f big -c DC.Melo '.strftime('%Y/%m/%d')
"     for i in range(0, len(a:000)-1)
"         execute 'r!figlet -w 100 -f big -c '.a:000[i]
"     endfor
" endfunction

" function! SaveRegisters(fileName)
"     for i in range(34,122)
"         let g:the_register_raw = getreg(nr2char(i))
"         silent! call writefile([g:the_register_raw], $HOME . "/.config/reg/register_".a:fileName .string(i) )
"     endfor
" endfunction

" function! LoadRegisters(fileName)
"     for i in range(34,122)
"         let filelines = readfile($HOME . '/.config/reg/register_'.a:fileName .string(i))
"         silent! call setreg(nr2char(i), filelines)
"     endfor
" endfunction

" function! CleanRegisters()
"     for i in range(34,122)
"         silent! call setreg(nr2char(i), [])
"     endfor
" endfunction

" " Adding automatons for when entering or leaving Vim
" fu! SaveSess()
"     execute 'NERDTreeClose'
"     execute 'mksession! ' .  $HOME . '/.config/reg/'. fnamemodify(getcwd(), ':t') .strftime("_%y%m%d_%H%M%S", localtime()) . '.session.vim'
" endfunction

" fu! RestoreSess()
" if filereadable(getcwd() . '/.session.vim')
"     execute 'so ' . getcwd() . '/.session.vim'
"     if bufexists(1)
"         for l in range(1, bufnr('$'))
"             if bufwinnr(l) == -1
"                 exec 'sbuffer ' . l
"             endif
"         endfor
"     endif
" endif
" endfunction

" autocmd VimLeave * call SaveSess()
" " autocmd VimEnter * nested call RestoreSess()

" "" insert mode abbrev and then space
" "iabbrev <silent> pwd        <C-R>=getcwd()<CR>
" "iabbrev <silent> datetime   <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
" "" -p, --primary " operate on the PRIMARY selection (default).
" "" -s, --secondary " operate on the SECONDARY selection.
" "" -b, --clipboard " operate on the CLIPBOARD selection.
" "" :cabbrev cv Cv  :cabbrev cz Cz  :cabbrev cx Cx
" "" :cabbrev pz Pz  :cabbrev px Px  :cabbrev pv Pv
" "command -range Cz :silent :<line1>,<line2>w !xsel -i -b
" "command -range Cx :silent :<line1>,<line2>w !xsel -i -p
" "command -range Cv :silent :<line1>,<line2>w !xsel -i -s
" "command -range Pz :silent :r !xsel -o -b
" "command -range Px :silent :r !xsel -o -p
" "command -range Pv :silent :r !xsel -o -s

" "" Tabularize https://devhints.io/tabular
" "cabbrev tzs  The \zs atom will exclude the : from the search match.
" "cabbrev trcl r1c1l0 multiple specifiers, one per column (the separator counts as a column)
" "cabbrev tlN  Left-align (with N spaces padding)
" "cabbrev trN  Right-align (with N spaces padding)
" "cabbrev tcN  Center-align (with N spaces padding)



" "" Search for current word and replace with given text for files in arglist.
" "" function! Replace(bang, replace)
" ""   let flag = 'ge'
" ""   if !a:bang
" ""     let flag .= 'c'
" ""   endif
" ""   let search = '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
" ""   let replace = escape(a:replace, '/\&~')
" ""   execute 'argdo %s/' . search . '/' . replace . '/' . flag
" "" endfunction
" "" command! -nargs=1 -bang Replace :call Replace(<bang>0, <q-args>)
" "" nnoremap <Leader>r :call Replace(0, input('Replace '.expand('<cword>').' with: '))<CR>
" ""
" ""  map <F4> :call TitleDet2() <cr>'s

" "" command! Wbn normal m execute 'w';
" "" command! Wabn :call Wabn()
" "" function! Wabn()
" ""     normal m'
" ""     execute 'w'
" ""     execute 'bn'
" "" endfunction

" ""
" "inoremap <expr> <c-x><c-k> SpellCheck("\<c-x>\<c-k>")
" "nnoremap z= :<c-u>call SpellCheck()<cr>z=
" "function! SpellCheck(...)
" "  let s:spell_restore = &spell
" "  set spell
" "  augroup restore_spell_option
" "    autocmd!
" "    autocmd CursorMoved,CompleteDone <buffer> let &spell = s:spell_restore | autocmd! restore_spell_option
" "  augroup END
" "  return a:0 ? a:1 : ''
" "endfunction

" "" Workaround using x11 minimum packages (under Linux)Edit
" "" If nothing work and you would like to copy from vim (under xterm) to leafpad, you may use this add-on to your ~/.vimrc
" "" Press F9, and it will copy to the x11 clipboard.
" "" function Func2X11()
" "" :call system('xclip -selection c', @r)
" "" endfunction
" "" vnoremap <F9> "ry:call Func2X11()<cr>
" "" vnoremap <m-c> "ry:call Func2X11()<cr>
" "" vnoremap <ESC-c> "ry:call Func2X11()<cr>



" "" function! Strip(input_string)
" ""     return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
" "" endfunction


" "let s:skip_comments = 'synIDattr(synID(line("."), col("."), 0), "name") =~?'
" "      \ . '"string\\|comment\\|doxygen"'

" "function! s:SearchBracket()
" "  let flag = 'cnzW'
" "  return searchpairpos('{', '', '}', flag, s:skip_comments)
" "endfunction




" "function! Reversed(l)
" "    let new_list = deepcopy(a:l)
" "    call reverse(new_list)
" "    return new_list
" "endfunction

" "function! Append(l, val)
" "    let new_list = deepcopy(a:l)
" "    call add(new_list, a:val)
" "    return new_list
" "endfunction

" "function! Assoc(l, i, val)
" "    let new_list = deepcopy(a:l)
" "    let new_list[a:i] = a:val
" "    return new_list
" "endfunction

" "function! Pop(l, i)
" "    let new_list = deepcopy(a:l)
" "    call remove(new_list, a:i)
" "    return new_list
" "endfunction

" "function! Filtered(fn, l)
" "    let new_list = deepcopy(a:l)
" "    call filter(new_list, string(a:fn) . '(v:val)')
" "    return new_list
" "endfunction
" "function! Removed(fn, l)
" "    let new_list = deepcopy(a:l)
" "    call filter(new_list, '!' . string(a:fn) . '(v:val)')
" "    return new_list
" "endfunction

" "" Trigger configuration. You need to change this to something else than <tab> if you use https://github.com/Valloric/YouCompleteMe.
" " if !exists("g:UltiSnipsJumpForwardTrigger")
" "   let g:UltiSnipsJumpForwardTrigger = "<tab>"
" " endif
" " if !exists("g:UltiSnipsJumpBackwardTrigger")
" "   let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" " endif
" " " If you want :UltiSnipsEdit to split your window.
" " let g:UltiSnipsEditSplit="vertical"
" " " UltiSnips
" " function! g:UltiSnips_Complete()
" "   call UltiSnips#ExpandSnippet()
" "   if g:ulti_expand_res == 0
" "     if pumvisible()
" "       return "\<C-n>"
" "     else
" "       call UltiSnips#JumpForwards()
" "       if g:ulti_jump_forwards_res == 0
" "         return "\<TAB>"
" "       endif
" "     endif
" "   endif
" "   return ""
" " endfunction

" "function! g:UltiSnips_Reverse()
" "  call UltiSnips#JumpBackwards()
" "  if g:ulti_jump_backwards_res == 0
" "    return "\<C-P>"
" "  endif
" "  return ""
" "endfunction

" "" 4.为了上面的函数创建一个自动BufEnter
" "au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" "au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" "" filetype off                  " required!
" "" " set rtp+=~/.vim/bundle/vundle/
" "" set rtp+=~/.vim/bundle/vundle/
" "" call vundle#rc()
" "" Plugin 'Valloric/YouCompleteMe'
" "" filetype plugin indent on     " required!
" "" " let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" "" let g:ycm_global_ycm_extra_conf='~/.vimplus/.ycm_extra_conf.py'

" "" snippet breakcommands "GDB break commands"
" "" pi Function
" "" endsnippet



" "" Default mapping multiple-cursors
" "let g:multi_cursor_use_default_mapping=0
" "let g:multi_cursor_next_key='<C-m>'
" "let g:multi_cursor_prev_key='<C-p>'
" "let g:multi_cursor_skip_key='<C-x>'
" "let g:multi_cursor_quit_key='<Esc>'

" "" When switching buffers, preserve window view.
" "if v:version >= 700
" "   au BufLeave * if !&diff | let b:winview = winsaveview() | endif
" "   au BufEnter * if exists('b:winview') && !&diff | call   winrestview(b:winview) | endif
" "endif





" " function! NextChange()
" "     while search('^.*', 'w') > 0
" "         if synIDattr(diff_hlID(line('.'),col('.')), 'name') is# 'DiffAdd'
" "             break
" "         endif
" "     endwhile
" " endfunction
" " com! NextChange :call NextChange()
" " function! do_git_diff_aware_gf(command)
" "   let target_path = expand('<cfile>')
" "   if target_path =~# '^[ab]/'  " with a peculiar prefix of git-diff(1)?
" "     if filereadable(target_path) || isdirectory(target_path)
" "       return a:command
" "     else
" "       " BUGS: Side effect - Cursor position is changed.
" "       let [_, c] = searchpos('\f\+', 'cenW')
" "       return c . '|' . 'v' . (len(target_path) - 2 - 1) . 'h' . a:command
" "     endif
" "   else
" "     return a:command
" "   endif
" " endfunction
" " command!   GoDelete call do_git_diff_aware_gf()
" function! ReadLines(begin)
"     execute 'r! sed -n ' . a:begin . 'p ' . $HOME . '/.config/reg/files'
" endfunction
" function! CopySnips(begin)
"     let l:ext_name = expand("%:e")
"     if  l:ext_name == 'java'
"         :call system('sed -n "' . a:begin .',/endsnippet/p" ' .$HOME . '/.vim/plugged/vim-snippets/UltiSnipsDC/java.snippets > '. $HOME . '/.config/reg/files')
"     elseif l:ext_name == 'py'
"         :call system('sed -n "' . a:begin .',/endsnippet/p" ' .$HOME . '/.vim/plugged/vim-snippets/UltiSnipsDC/python.snippets > '.$HOME . '/.config/reg/files')
"     else
"     " if  l:ext_name == 'c' || l:ext_name == 'cpp' || l:ext_name == 'h'
"         :call system('sed -n "' . a:begin .',/endsnippet/p" ' .$HOME . '/.vim/plugged/vim-snippets/UltiSnipsDC/cpp.snippets > '. $HOME .'/.config/reg/files')
"     endif
"     echom "copy snp " . a:begin
" endfunction
" function! PasteFromFile(...)
"     let paras=a:000 "a:000 is an array («List»)
"     let l:fileName=""
"     if len(l:paras)>0
"         let l:fileName  =  l:paras[0]
"     endif
"     let l:beginLine=1
"     if len(l:paras)>1
"         let l:beginLine  =  l:paras[1]
"     endif
"     let l:endLine=l:beginLine
"     if len(l:paras)>2
"         let l:endLine  =  l:paras[2]
"     endif
"     if l:beginLine>l:endLine
"         let l:tmp=l:beginLine
"         let l:beginLine=l:endLine
"         let l:endLine=l:beginLine
"     endif
"     execute 'r! sed -n ' . l:beginLine . ','.l:endLine.'p ' .l:fileName
" endfunction

" function! PasteSnippets(...)
"     let type = a:1 " 0 以line 还是word的方式提醒
"     let comm = a:2 " 带有那种类型的备注
"     let filelines = readfile($HOME .'/.config/reg/files')
"     let l:ext_name = expand("%:e")
"     let l:comm_list = []
"     if  l:ext_name == 'py'
"         for i in range(0,len(l:filelines)-1)
"             if l:comm <= 0
"                 let filelines[i] = substitute(l:filelines[i], '[\s\t]*""".*"""' , '', '')
"                 let filelines[i] = substitute(l:filelines[i], "[\s\t]*'''.*'''" , '', '')
"                 if match(l:filelines[i], '[\s\t]*""".*')>=0 || match(l:filelines[i], '.*"""')>=0 || match(l:filelines[i], "[\s\t]*'''.*")>=0 || match(l:filelines[i], ".*'''")>=0
"                     call add(l:comm_list,i)
"                 endif
"             endif
"             if l:comm <= 1
"                 let filelines[i] = substitute(l:filelines[i], '[\s\t]*#.*' , '', '')
"             endif
"             if len(l:comm_list)==1
"                 let filelines[i]=''
"             elseif len(l:comm_list)==2
"                 let filelines[i]=''
"                 let l:comm_list = []
"             endif
"         endfor
"     else
"         for i in range(0,len(l:filelines)-1)
"             if l:comm <= 0
"                 let filelines[i] = substitute(l:filelines[i], '[\s\t]*/\*.*\*/' , '', '')
"                 if match(l:filelines[i], '[\s\t]*/\*.*')>=0 || match(l:filelines[i], '.*\*/')>=0
"                     call add(l:comm_list,i)
"                 endif
"             endif
"             if l:comm <= 1
"                 let filelines[i] = substitute(l:filelines[i], '[\s\t]*//.*' , '', '')
"             endif
"             if len(l:comm_list)==1
"                 let filelines[i]=''
"             elseif len(l:comm_list)==2
"                 let filelines[i]=''
"                 let l:comm_list = []
"             endif
"         endfor
"     endif
"     let lines = filter(copy(filelines), 'v:val != ""')
"     let codeStr = join(l:lines[1:-1],' \n ')
"     call setreg('a',l:lines[0:-1])
"     echom l:lines[0:-1]
"     let words = split(codeStr , ' ' )
"     echom "init type(line/word):" . l:type ." comment:".l:comm. " lines:" . len(l:lines) ." words:" .len(l:words)
"     let lineIndex=1
"     let wordIndex=0
"     function! PasteSnippetsIndex(...) closure
"         if type ==0
"             if lineIndex < len(l:lines)-1
"                 " execute 'r! sed -n ' . l:lineIndex . 'p ' . $HOME .'/.config/reg/files'
"                 call append(line('.'),l:lines[l:lineIndex])
"                 execute 'normal! $j'
"                 let lineIndex += 1
"                 echom  l:lines[l:lineIndex]
"                 call setreg('l',l:lines[l:lineIndex])
"             else
"                 let lineIndex = 1
"                 echom  '===================='
"             endif
"         else
"             if wordIndex < len(l:words)
"                 if l:words[l:wordIndex] =='\n'
"                     call append(line('.'),'')
"                     execute 'normal! $j'
"                 else
"                     call setline('.', getline('.') .  l:words[l:wordIndex] . ' ')
"                     execute 'normal! $'
"                 endif
"                 let wordIndex += 1
"                 " echom  l:words[l:wordIndex]
"                 call setreg('l',l:words[l:wordIndex])
"             else
"                 let wordIndex = 0
"                 echom  '===================='
"             endif
"         endif
"     endfunction
"     return funcref('PasteSnippetsIndex')
" endfunction

function! FormatText2GifScript(...)
    " let paras=a:000 "a:000 is an array («List»)
    let splitNum  =  a:000[0]%10
    let upperCharKeep = nr2char(l:splitNum+64) "D-keep
    let lowerCharKeep = nr2char(l:splitNum+96) "a-c keep
    let maxNum  =  a:000[0]/10
    execute  'write! $HOME/.config/reg/fileb'
    " execute  'write! >> $HOME/.config/reg/fileba'
    call writefile(getline(1,'$'), $HOME.'/.config/reg/fileba', 'a')

    set noignorecase
    execute  '%s/^\(\s*\)#[0-'.maxNum.']\s\?/\1/g'
    execute  'g/^\(\s*\)#\d/d'

    if l:upperCharKeep =='@'
        execute  'g/^\(\s*\)#!@/d'
    else
        execute  '%s/^\(\s*\)#!@\s\?/\1/g'
    endif

    execute  '%s/^\(\s*\)#[a-'.lowerCharKeep.']\s\?/\1/g'
    execute  'g/^\s*#['.lowerCharKeep.'-z]/d'
    execute  '%s/^\(\s*\)#['.upperCharKeep.'-Z]\s\?/\1/g'
    execute  'g/^\s*#[A-'.upperCharKeep.']/d'
    execute  'g/^\s*#\s/d'
    set ignorecase
    echom l:lowerCharKeep
    echom l:upperCharKeep
    echom l:maxNum

    " execute  'wqa'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load Image from path to markdown
" argv1: file name
" argv2: load from folder
" argv3: load last N file
" argv4: open the file
" LoadImage2Markdown filename 0 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! LoadImage2Markdown(...)
    let paras=a:000 "a:000 is an array («List»)
    let l:timestamp=strftime('_%y%m%d%H%M%S')
    let l:sourceIndex=0
    if len(l:paras)>0
        let l:sourceIndex=str2nr(l:paras[0])
        " echom "答应值".l:sourceIndex
    endif
    let l:sourceFolder="$HOME/Documents/grid_image"
    if l:sourceIndex<=0
      let l:sourceFolder="$HOME/Documents/grid_image"
    else
      let l:sourceFolder="$HOME/Documents/Screenshots".l:sourceIndex
    endif

    let l:name=""
    if len(l:paras)>1
        let l:name  =  l:paras[1]
    endif
    let l:fileName  =  l:name . l:timestamp


    let l:index="1"
    if len(l:paras)>2
        let l:index=l:paras[2]
    endif

    call system('rename "s/ /_/g" '.l:sourceFolder."/*")
    let l:fileDir = expand('%:p:h')
    let l:commandString=join(split("ls -ptrah ".l:sourceFolder."/* |tail -".l:index ." | head -1"),' ')
    echom l:commandString
    let l:copyFileName = system(l:commandString)
    echom l:copyFileName
    let l:extName=trim(fnamemodify(l:copyFileName, ":e"))
    " let l:fileNamePath=l:sourceFolder.l:copyFileName
    let l:lnFileNamePath=l:fileDir.'/docs/media/'.l:fileName. '.'.l:extName
    " echom l:fileDir."/docs/media/"
    :call mkdir(l:fileDir."/docs/media/", "p")
    " let l:commandString=join(split('cp '. l:copyFileName.' '.l:lnFileNamePath),' ')
    if l:sourceIndex==-1
      let l:commandString=join(split('pngpaste '.l:lnFileNamePath ),' ')
    else
      let l:commandString=join(split('ln '. l:copyFileName.' '.l:lnFileNamePath),' ')
    endif
    echom l:commandString
    :call system(l:commandString)
    let l:isExist=system('[ -f '. l:lnFileNamePath.' ] && echo 1 || echo 0')
    if l:isExist == 0
    :echohl WarningMsg | echom '图片不存在' | echohl None
    endif
    " let l:commandString=join(split('mogrify -pointsize 50 -fill grey -weight bolder -gravity southeast -annotate +100+100 "'. substitute('DC', '_', ' ', 'g').'" '.l:lnFileNamePath),' ')
    " :call system(l:commandString)
    " 当参数第三个显示图片
    if len(l:paras) >3
        echom l:commandString
        let l:commandString=join(split('open ' .l:lnFileNamePath),' ')
        echom l:commandString
        :call system(l:commandString)
    endif
    :call append(line('.'), ['!['.l:name.'](docs/media/'.l:fileName.'.'.l:extName.')'])
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" copy markdown link to clipboard
" paremeter not zero will open png
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CopyLinkFile2clipboard(...)
    let paras=a:000 "a:000 is an array («List»)
  " call system("osascript -e 'set the clipboard to (read (POSIX file "'"'"/Users/bj00173ml/Desktop/test.png"'"'") as JPEG picture)'")
    let imagePath = substitute(getline('.'), '.*(\(.*\)).*', '\1', '')
    let fileDir = expand('%:p:h')
    let filePath=fileDir.'/'.imagePath
    let l:extName=trim(fnamemodify(l:filePath, ":e"))
    " let commandString  = join(split("osascript -e " . "'set the clipboard to (read (POSIX file ".'"'.fileDir.'/'.imagePath.'"'. ") as JPEG picture)'")," ")
    let commandString  = join(split("osascript -e " . "'tell app \"Finder\" to set the clipboard to ( POSIX file \"" . l:filePath. "\" )'")," ")

    echom commandString
    call system(commandString)
    if len(l:paras)>0
        let commandString=join(split('open '.l:filePath)," ")
        echom commandString
        call system(commandString)
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" convert copyed markdown to lark markdown
" parameter not zero will echo markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ConvMarkdown2lark(...)
    let paras=a:000 "a:000 is an array («List»)
    let fileDir = expand('%:p:h')

    let l:markdownText=join(getreg('"',1,1),'¶')
    let  l:markdownText = substitute(l:markdownText, '@startuml.\{-}@enduml', '\=Uml2png(submatch(0))', 'g')
    let  l:markdownText = substitute(l:markdownText, '@startwbs.\{-}@endwbs', '\=Uml2png(submatch(0))', 'g')
    let  l:markdownText = substitute(l:markdownText, '@startmindmap.\{-}@endmindmap', '\=Uml2png(submatch(0))', 'g')
    " echo l:markdownText
    let l:markdownTextFilter=split(l:markdownText,'¶')
    " echo l:markdownTextFilter
    for i in range(0,len(markdownTextFilter)-1)
        " 删除<>备注
        " let markdownText[i] = substitute(markdownText[i], '<!--.*-->', '\1', 'g')
        let markdownTextFilter[i] = substitute(markdownTextFilter[i], '<.\{-}>', '\1', 'g')
				" 处理.larksuite to \.larksuite
        let markdownTextFilter[i] = substitute(markdownTextFilter[i], '\.larksuite', '\\\0', 'g')
        " 处理图片
				let markdownTextFilter[i] = substitute(markdownTextFilter[i], '\!\[\(.*\)\](\(docs.*\))', '[【\1如图】]('.fileDir . '/\2)', 'g')
    endfor
    " echom markdownTextFilter
    call setreg('+',l:markdownTextFilter[0:-1])
endfunction

function! Uml2png(umlStr) 
  let l:fileDir = expand('%:p:h')
  let l:timestamp=strftime('_%y%m%d%H%M%S')

  let l:title=matchstr(a:umlStr, 'title\s\+[^¶]*')
  let l:title=substitute(l:title,'title\s\+\(.*\)','\=submatch(1)','')
  if l:title == ''
    let title='示意图'
  endif
  let l:md5=matchstr(system('echo -n '.shellescape(a:umlStr)   . '| md5sum'),'[a-zA-Z0-9]\+')

  let l:filePath=l:fileDir.'/docs/media/'.md5.'.puml'
  let l:umlList=split(a:umlStr,'¶')
  :call writefile(l:umlList,  l:filePath )
  let l:commandString=join(split('java -DPLANTUML_LIMIT_SIZE=8192 -jar $TOOLS_HOME/bin/plantuml.jar -charset UTF-8  -computeurl ' . l:filePath ),' ')
  let l:urlcode=trim(system(commandString))
  let l:commandString=join(split('java -DPLANTUML_LIMIT_SIZE=8192 -jar $TOOLS_HOME/bin/plantuml.jar -charset UTF-8 ' . l:filePath ),' ')
  let l:pngFile='!['.l:title.'](docs/media/'.l:md5.'.png)'
  " let l:pngFile='!['.l:title.'](https://www.plantuml.com/plantuml/img/'.l:urlcode.')'
  " echomsg l:pngFile
  return l:pngFile
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" convert copyed markdown to lark markdown
" parameter not zero will echo markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ConvMarkdown2clipboard(...)
    let paras=a:000 "a:000 is an array («List»)
    let fileDir = expand('%:p:h')
    let markdownText=getreg('"',1,1)
    let markdownTextFilter=[]
    let isPlantuml=0
    let markdownUMLFilter=[]
    let umlName=""
    " let markdownText=getreg('"')
    for i in range(0,len(markdownText)-1)
        " 删除startuml
        if (markdownText[i] =~ '@startuml') || (markdownText[i] =~ '@startwbs') || (markdownText[i] =~ '@startmindmap')
          let isPlantuml=1
        endif
        if isPlantuml==0
          call add(markdownTextFilter, markdownText[i])
        else
          call add(markdownUMLFilter, markdownText[i])
          if (markdownText[i] =~ '^\s*title\s')
            let umlName= substitute(markdownText[i], '\s*title\s\+\(\S*\)', '\1', 'g')
          endif
        endif
        if markdownText[i] =~ '@enduml' || (markdownText[i] =~ '@endwbs') || (markdownText[i] =~ '@endmindmap')
          " 无需添加图片
          " let l:outPlantuml='docs/media/'.umlName.strftime('_%y%m%d%H%M%S').".puml"
          " let l:outImage='docs/media/'.umlName.strftime('_%y%m%d%H%M%S').".png"
          " call writefile(l:markdownUMLFilter, l:outPlantuml, 'a')
          " let l:commandString=join(split('java -DPLANTUML_LIMIT_SIZE=8192 -jar $TOOLS_HOME/bin/plantuml.jar -charset UTF-8 ' . l:outPlantuml ),' ')
          " call system(commandString)
          " call add(markdownTextFilter, '!['.l:umlName.']('.l:outImage.')')
          let isPlantuml=0
          let markdownUMLFilter=[]
          let umlName=''
        endif
    endfor

    for i in range(0,len(markdownTextFilter)-1)
        " 删除<>备注
        " let markdownText[i] = substitute(markdownText[i], '<!--.*-->', '\1', 'g')
        let markdownTextFilter[i] = substitute(markdownTextFilter[i], '<.\{-}>', '\1', 'g')
				" 处理.larksuite to \.larksuite
        let markdownTextFilter[i] = substitute(markdownTextFilter[i], '\.larksuite', '\\\0', 'g')
        " 处理图片
				let markdownTextFilter[i] = substitute(markdownTextFilter[i], '\!\[\(.*\)\](\(.*\))', '[【\1如图】]('.fileDir . '/\2)', 'g')
    endfor
    if len(l:paras)>0
        echom markdownTextFilter
    endif
    call setreg('+',l:markdownTextFilter[0:-1])
" execute 's/:/' . escape(getreg('0'), '/')
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" genreate current block of uml code to link
" para1: link name
" para2: copy it(default no)
" para3: open it(default no)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GenMarkdownPlantuml(...)
  let l:fileDir = expand('%:p:h')
  let l:timestamp=strftime('_%y%m%d%H%M%S')
  let paras=a:000 "a:000 is an array («List»)
  let l:name=substitute(expand("%:r"), ' ', '_', 'g') "without extension name
  if len(l:paras)>0
    let l:name=l:paras[0]
  endif

  let l:lineStart = line(".")
  let l:lineEnd =  line(".")
  while !(getline(l:lineEnd) =~ '@enduml') && !(getline(l:lineEnd) =~ '@endwbs')  && !(getline(l:lineEnd) =~ '@endmindmap')
    let l:lineEnd=l:lineEnd+1
  endwhile
  while !(getline(l:lineStart) =~ '@startuml') &&  !(getline(l:lineStart) =~ '@startwbs')  &&  !(getline(l:lineStart) =~ '@startmindmap')
    let l:lineStart=l:lineStart-1
  endwhile
  let umlArray = getline(l:lineStart, l:lineEnd)
  echom l:lineStart  l:lineEnd

  let l:outPlantuml='docs/media/'.l:name .l:timestamp.'.puml'
  let l:outImage='docs/media/'.l:name .l:timestamp.'.png'
  echom l:lineStart  l:lineEnd l:fileDir l:outPlantuml
  call writefile(l:umlArray, l:outPlantuml, 'a')
  let l:commandString=join(split('java -DPLANTUML_LIMIT_SIZE=8192 -jar $TOOLS_HOME/bin/plantuml.jar -charset UTF-8 ' . l:outPlantuml ),' ')
  " echo l:commandString
  call system(commandString)
  :call append(lineEnd, ['!['.l:name.']('.l:outImage.')'])

  if len(l:paras)>1
    let commandString  = join(split("osascript -e " . "'tell app \"Finder\" to set the clipboard to ( POSIX file \"". l:outImage. "\" )'")," ")
    echom commandString
    call system(commandString)
  endif

  if len(l:paras)>2
    let l:commandString=join(split('open ' .l:outImage),' ')
    :call system(l:commandString)
  endif

endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" copy a new blank.drawio.png as a new png
" para1: name
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NewDrawio(...)
  let l:fileDir = expand('%:p:h')
  let l:timestamp=strftime('_%y%m%d%H%M%S')
  let paras=a:000 "a:000 is an array («List»)
  let l:name="示意图"
  if len(l:paras)>0
    let l:name=l:paras[0]
  endif
  let l:fileName=l:name.l:timestamp.'.drawio.png'
  let l:commandString=join(split('cp '.l:fileDir.'/docs/media/blank.drawio.png '.l:fileDir. '/docs/media/'. l:fileName ),' ')
  echom l:commandString
  :call system(l:commandString)
  :call append(line('.'), ['!['.l:name.'](docs/media/'.l:fileName.')'])
  let l:commandString=join(split('/Applications/draw.io.app/Contents/MacOS/draw.io '.l:fileDir.'/docs/media/'. l:fileName),' ')
  echom l:commandString
  :call system(l:commandString)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 暂时不用，之后删除
" para1: name
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function! ZZZDrawio(...)
"   let l:fileDir = expand('%:p:h')
"   let l:timestamp=strftime('_%y%m%d%H%M%S')
"   let paras=a:000 "a:000 is an array («List»)
"   let l:fileName=substitute(expand("%:r"), ' ', '_', 'g') "without extension name
"   let l:imagePath = substitute(getline('.'), '.*(\(.*\)).*', '\1', '')
"   if len(l:imagePath)>0
"     let filePath=fileDir.'/'.imagePath
"     let l:commandString=join(split('/Applications/draw.io.app/Contents/MacOS/draw.io '. l:filePath),' ')
"     :call system(l:commandString)
"   else
"     let l:name="示意图"
"     if len(l:paras)>0
"       let l:name=l:paras[0]
"     endif
"     let l:fileName=l:name.l:timestamp.'.drawio.png'
"     let l:commandString=join(split('cp docs/media/blank.drawio.png docs/media/'. l:fileName),' ')
"     " let l:commandString=join(split('ln docs/media/blank.drawio.png docs/media/'. l:fileName),' ')
"     echom l:commandString
"     :call system(l:commandString)
"     :call append(line('.'), ['!['.l:name.'](docs/media/'.l:fileName.')'])
"     let l:commandString=join(split('/Applications/draw.io.app/Contents/MacOS/draw.io '.l:fileDir.'/docs/media/'. l:fileName),' ')
"     echom l:commandString
"     :call system(l:commandString)
"   endif
" endfunction


function! AppendImage(...)
    let paras=a:000 "a:000 is an array («List»)
		let l:name  =  l:paras[0]
    let l:tile="2x2"
    if len(l:paras)>1
        let l:tile  =  l:paras[1]
    endif
    let l:timestamp=strftime('_%y%m%d%H%M%S')

    let pngPathList=getreg('"',1,1)
    for i in range(0,len(pngPathList)-1)
      let pngPathList[i] = substitute(pngPathList[i], '\!\[\(.*\)\](\(.*\))', '\2', 'g')
    endfor
	  let l:pngsPath= join(pngPathList," ")
		let l:outfile='docs/media/'.l:name.l:timestamp.'.png'
    let l:commandString=join(split('montage '. l:pngsPath . ' -tile ' . l:tile .' -geometry 1440x900+0+0 '.l:outfile ),' ')
    :call system(l:commandString)
    let l:commandString=join(split('mogrify -pointsize 50 -fill red -weight bolder -gravity center -annotate 0 "'. substitute(l:name, '_', ' ', 'g').'" '.l:outfile),' ')
    :call system(l:commandString)
    :call append(line('.')-1, ['!['.l:name.']('.l:outfile.')'])
endfunction
" function! SecDown()
"    :silent!  " execute  '%s/[^#]#######[^#]//g'
"    :silent!  execute  '%s/^\(\s*\)#######\([^#]\)/\1########\2/g'
"    :silent!  execute  '%s/\([^#]\)#######\(\s*\)$/\1########\2/g'
"    :silent!  execute  '%s/^\(\s*\)######\([^#]\)/\1#######\2/g'
"    :silent!  execute  '%s/\([^#]\)######\(\s*\)$/\1#######\2/g'
"    :silent!  execute  '%s/^\(\s*\)#####\([^#]\)/\1######\2/g'
"    :silent!  execute  '%s/\([^#]\)#####\(\s*\)$/\1######\2/g'
"    :silent!  execute  '%s/^\(\s*\)####\([^#]\)/\1#####\2/g'
"    :silent!  execute  '%s/\([^#]\)####\(\s*\)$/\1#####\2/g'
"    :silent!  execute  '%s/^\(\s*\)###\([^#]\)/\1####\2/g'
"    :silent!  execute  '%s/\([^#]\)###\(\s*\)$/\1####\2/g'
"    :silent!  execute  '%s/^\(\s*\)##\([^#]\)/\1###\2/g'
"    :silent!  execute  '%s/\([^#]\)##\(\s*\)$/\1###\2/g'
"    :silent!  execute  '%s/^\(\s*\)#\([^#]\)/\1##\2/g'
"    :silent!  execute  '%s/\([^#]\)#\(\s*\)$/\1##\2/g'
" endfunction

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "        make markdown secction up                                               "
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! SecUp()
"   :silent! execute  '%s/^\(\s*\)##\([^#]\)/\1#\2/g'
"   :silent! execute  '%s/\([^#]\)##\(\s*\)$/\1#\2/g'
"   :silent! execute  '%s/^\(\s*\)###\([^#]\)/\1##\2/g'
"   :silent! execute  '%s/\([^#]\)###\(\s*\)$/\1##\2/g'
"   :silent! execute  '%s/^\(\s*\)####\([^#]\)/\1###\2/g'
"   :silent! execute  '%s/\([^#]\)####\(\s*\)$/\1###\2/g'
"   :silent! execute  '%s/^\(\s*\)#####\([^#]\)/\1####\2/g'
"   :silent! execute  '%s/\([^#]\)#####\(\s*\)$/\1####\2/g'
"   :silent! execute  '%s/^\(\s*\)######\([^#]\)/\1#####\2/g'
"   :silent! execute  '%s/\([^#]\)######\(\s*\)$/\1#####\2/g'
"   :silent! execute  '%s/^\(\s*\)#######\([^#]\)/\1######\2/g'
"   :silent! execute  '%s/\([^#]\)#######\(\s*\)$/\1######\2/g'
"   :silent! execute  '%s/^\(\s*\)########\([^#]\)/\1#######\2/g'
"   :silent! execute  '%s/\([^#]\)########\(\s*\)$/\1#######\2/g'
" endfunction

function! SurroundString(surround)
    execute "normal! \<esc>\<esc>gvd"
    let the_register_raw = getreg('"')
    let line = getline('.')
    silent! call setline('.', strpart(line, 0, col('.') - 1). a:surround . the_register_raw . a:surround . strpart(line, col('.') - 1))
endfunction

" function! LeadingNumber()
" endfunction

" function! Add2Snippet(...)
"     " let paras=a:000 "a:000 is an array («List»)
"     let l:snipName =  a:000[0]
"     let l:snipDesc =  l:snipName
"     let l:snipFile  =  $HOME . '/.vim/plugged/vim-snippets/UltiSnipsDC/sh.snippets'
"     if len(a:000) > 1
"         let l:snipDesc = a:000[1]
"     endif
"     " execute  'write! >> $HOME/.config/reg/fileba'
"     let l:snipText=['', 'snippet ' . l:snipName.' "'.l:snipDesc.'" i']
"     call extend(l:snipText, getline(1,'$'))
"     call extend(l:snipText, ['$0','endsnippet',''])
"     " echom l:snipFile
"     echom l:snipText
"     call writefile(l:snipText, l:snipFile, 'a')
" endfunction

" function! TestFunc()
"     echom "test"
"     " echom str2nr(31)
"     echom char2nr("A")
"     echom nr2char(98)

"     silent! call setreg(nr2char(97 ), '# 替换 ==> "Hello world!" -> '."'Hello world!'       ")
"     silent! call setreg(nr2char(98 ), 'cs"'."'                                              ")
"     silent! call setreg(nr2char(99 ), '# 替换-标签(t=tag)  ==> <a>abc</a>a>  -> "abc"       ')
"     silent! call setreg(nr2char(100), 'cst"                                                 ')
"     silent! call setreg(nr2char(101), '# 替换标签 ==> <a>abc</a>a>  -> <html>abc</html>html>')
"     silent! call setreg(nr2char(102), 'cst<html>                                            ')
"     silent! call setreg(nr2char(103), '# 删除  ==> "Hello world!" -> Hello world!           ')
"     silent! call setreg(nr2char(104), 'ds"                                                  ')
"     silent! call setreg(nr2char(105), '# 添加(ys=you surround) ==> Hello -> "Hello"         ')
"     silent! call setreg(nr2char(106), 'ysiw"                                                ')
"     silent! call setreg(nr2char(107), '# 添加  ==> Hello -> "Hello"                         ')
"     silent! call setreg(nr2char(108), 'csw"                                                 ')
"     silent! call setreg(nr2char(109), '# 添加-两个词   ==> hello world -> "hello world"     ')
"     silent! call setreg(nr2char(110), 'veeS"                                                ')
"     silent! call setreg(nr2char(111), '# 添加-当前到行尾:                                   ')
"     silent! call setreg(nr2char(112), 'ys$"                                                 ')
"     silent! call setreg(nr2char(113), '# 添加-整行 ==> Hello world -> "Hello world"         ')
"     silent! call setreg(nr2char(114), 'yss"                                                 ')
"     silent! call setreg(nr2char(115), '# 添加到行首,行尾                                    ')
"     silent! call setreg(nr2char(116), 'ySS"                                                 ')

" endfunction
" function! TranslateCurrentLine(...)
" endfunction

function! Snip2Json()

  " delete the comment line between snippets
  execute  'g/^endsnippet/+1,/^snippet /-1 d'
  " execute '%s/endsnippet\n\(\(\s*\n\)\|\(#.*\)\)*snippet/endsnippet\rsnippet/g'

  " add slash for some words
  execute 'g/^snippet/+1,/^endsnippet/-1 s/\\/\\\\/g'
  execute 'g/^snippet/+1,/^endsnippet/-1 s/\//\\\//g'
  execute 'g/^snippet/+1,/^endsnippet/-1 s/\"/\\\"/g'
  execute 'g/^snippet/+1,/^endsnippet/-1 s/\$/\\\\$/g'


  execute 'g/^snippet/+1,/^endsnippet/-1 s/^/\"/g'
  execute 'g/^snippet/+1,/^endsnippet/-1 s/$/\",/g'


  " split body to lines
  " execute 'g!/^\(snippet\)\|\(endsnippet\)/ s/^/\"/g'
  " execute 'g!/^\(snippet\)\|\(endsnippet\)/ s/$/\",/g'

  execute '%s/^snippet\s\+\(\S\+\)\s\+\"\(.*\)\".*/\"\1\":{\r\"prefix\":\"\1\",\r\"description\":\"\2\",\r\"body\":['
  execute '%s/,\nendsnippet/\]},/'
  " execute 'g!/^\(snippet\)\|\(endsnippet\)/ s/\"/\\\"/g'
  " execute 'g!/^\(snippet\)\|\(endsnippet\)/ s/\//\\\//g'
  " execute 'g!/^\(snippet\)\|\(endsnippet\)/ s/\\/\\\\/g'
  " execute 'g!/^\(snippet\)\|\(endsnippet\)/ s/\$/\\\\$/g'
  " execute '%s/^snippet\s\+\(\S\+\)\s\+\"\(.*\)\".*/\"\1\":{\r\"prefix\":[\"\1\"],\r\"body\":['
  " execute '%s/,\nendsnippet/\]},/'
  " execute '%s/^snippet\s\+\(\S\+\)\s\+\"\(.*\)\".*\n\(\(.*\n\)\{-}\)endsnippet>\r<description>\2<\/description>\r<body>\r\3<\/body>\r<\/\1>'
  " execute '%s/^snippet\s\+\(\S\+\)\s\+\"\(.*\)\".*\n\(\(.*\n\)\{-}\)endsnippet>\r<description>\2<\/description>\r<body>\r\3<\/body>\r<\/\1>'
endfunction
" ============================================================================

" " :close
" " :windo diffthis
" " execute 's/:/' . escape(getreg('0'), '/')
" " execute '/'.substitute(trim(@a),'/','\\\/','g')
" " execute '?'. trim(@a)
" if has("autocmd")
"   " Highlight TODO, FIXME, NOTE, etc.
"   if v:version > 701
"     autocmd Syntax * call matchadd('Todo',       '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|NOBUG\|BUG\|HACK\|CLEVER\|MAGIC\)')
"     autocmd Syntax * call matchadd('Label',      '\W\zs\(SEE\|REFERENCE\|REF\|RVD\|REVIEWED\|REVIEW\|STATUS\|STAT\|GLOSSARY\|GLOSS\)')
"     autocmd Syntax * call matchadd('Statement',  '\W\zs\(NOTE\|INFO\|IDEA\|REQUIREMENT\|REQ\|STORY\|RFE\|FEETCH\|NYI\|FR\|FTRQ\|FTR\)')
"     autocmd Syntax * call matchadd('Error',      '\W\zs\(CAVEAT\|CAV\|CAVT\|WARNING\|CAUTION\)')
"     autocmd Syntax * call matchadd('Question',   '\W\zs\(QUESTION\|QUEST\|QSTN\|WTF\)')
"     autocmd Syntax * call matchadd('Special',    '\W\zs\(CREDIT\|CRED\|THANKS\)')
"     " autocmd Syntax * call matchadd('SpecialKey', '\W\zs\(\)')
"     " autocmd Syntax * call matchadd('Debug',      '\W\zs\(\)')
"     " autocmd Syntax * call matchadd('Tag',        '\W\zs\(QUESTION\|QUEST\|QSTN\|WTF\)')
"     " autocmd Syntax * call matchadd('Comment',    '\W\zs\(SEE\|REF\|REFERENCE\|RVD\|REVIEWED\|REVIEW\|STAT\|STATUS\|GLOSS\|GLOSSARY\)')
"   endif
" endif
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 用户自定义配置（该文件放一般性配置，可覆盖~/.vimrc里的配置，若要增加、卸载插件，请放入~/.vimrc.custom.plugins）
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ":verbose set mm? mmt? mmp?
" set mmp=5000

" " 开启相对行号
" set relativenumber
" set showcmd
" " set noshowcmd

" " 设置默认进行大小写不敏感查找
" " set ignorecase
" " 如果有一个大写字母，则切换到大小写敏感查找
" set smartcase

" " 开启鼠标
" " set mouse=a

" " 设置光标所在列高亮
" " set cursorcolumn

" " indentLine 开启代码对齐线
" let g:indentLine_enabled = 1
" "ctags
" " map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" " map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" " markdown
" " let system = system('uname -s')
" " if system == 'Darwin\n'
" "     let g:mkdp_path_to_chrome = '/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome'
" " else
" "     let g:mkdp_path_to_chrome = '/usr/bin/google-chrome-stable %U'
" " endif
" " nmap <silent> <F7> <Plug>MarkdownPreview
" " imap <silent> <F7> <Plug>MarkdownPreview
" " nmap <silent> <F8> <Plug>StopMarkdownPreview
" " imap <silent> <F8> <Plug>StopMarkdownPreview

" " Doxygen
" " let g:DoxygenToolkit_authorName="chxuan, 787280310@qq.com"
" " let s:licenseTag = 'Copyright(C)\<enter>'
" " let s:licenseTag = s:licenseTag . 'For free\<enter>'
" " let s:licenseTag = s:licenseTag . 'All right reserved\<enter>'
" " let g:DoxygenToolkit_licenseTag = s:licenseTag
" " let g:DoxygenToolkit_briefTag_funcName="yes"
" " let g:doxygen_enhanced_color=1
" " let g:DoxygenToolkit_commentType="Qt"


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " DC自定义配置（该文件放一般性配置，可覆盖~/.vimrc里的配置，若要增加、卸载插件，请放入~/.vimrc.custom.plugins）
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set history=10000 " the max is 10000
" set nowrap
" set list
" set relativenumber
" ""folding settings
" "set foldmethod=indent   "fold based on indent
" "set foldnestmax=10      "deepest fold is 10 levels
" "set nofoldenable        "dont fold by default
" "set foldlevel=1         "this is just what i use
" " 设置你的undo保存位置，你需要先 mkdir $HOME/.vim/undodir
" set undodir=$HOME/.vim/undodir
" if empty(glob($HOME.'/.vim/undodir'))
"     call mkdir($HOME.'/.vim/undodir','p')
" endif
" set undofile " Maintain undo history between sessions

" " echo &dictionary
" " tell Vim where our dictionary is located
" set dictionary+=/usr/share/dict/words
" " setlocal dictionary=CANDBC/S202_signal_id.txt
" set thesaurus+=/usr/coderoot/usr/share/dict/thesaurus.txt
" let g:tq_online_backends_timeout = 10
" let g:tq_language=['en', 'cn']
" let g:tq_enabled_backends=["yarn_synsets", "openoffice_en", "mthesaur_txt"]
" let g:tq_enabled_backends=["cilin_txt",
"             \"openthesaurus_de",
"             \"yarn_synsets",
"             \"openoffice_en",
"             \"mthesaur_txt",
"             \"datamuse_com",]
" let g:tq_openoffice_en_file="/usr/coderoot/usr/share/myspell/dicts/th_en_US_new"
" let g:tq_mthesaur_file="/usr/coderoot/usr/share/dict/mthesaur.txt"
" let g:tq_cilin_txt_file="/usr/coderoot/usr/share/dict/cilin.txt"

" " A list of directory names that are searched for snippets.
" " cabbrev tysh   set filetype=sh
" " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | execute '10Term' | endif
" cabbrev sft set filetype=yaml,json,sql,markdown,html,sh,py,java
" autocmd VimEnter * if @% =~ "bash" | execute 'set filetype=sh' | endif
" autocmd VimEnter * if has_key(g:ycm_filetype_blacklist, 'markdown') | execute 'let test=remove(g:ycm_filetype_blacklist, "markdown")' | endif
" if !exists('g:UltiSnipsSnippetDirectories')
"     let g:UltiSnipsSnippetDirectories = [ 'UltiSnips','UltiSnipsDC', ]
" endif
" " let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsExpandTrigger="<c-t><c-t>"
" " let g:UltiSnipsListSnippets = "<c-tab>"
" let g:UltiSnipsListSnippets = "<c-t><c-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-t><c-f>"
" let g:UltiSnipsJumpBackwardTrigger="<c-t><c-b>"

" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" " g:JavaComplete_LibsPath=""
" " To enable smart (trying to guess import option) inserting class imports with F4, add:
" nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" " To enable usual (will ask for import option) inserting class imports with F5, add:
" nmap <F5> <Plug>(JavaComplete-Imports-Add)
" imap <F5> <Plug>(JavaComplete-Imports-Add)
" " To add all missing imports with F6:
" nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" " To remove all unused imports with F7:
" nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
" imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
" " add close brace automatically, when complete method declaration.
" " let g:JavaComplete_ClosingBrace = 1
" " path to additional jar files. This path appends with your libraries specified in pom.xml.
" " let g:JavaComplete_LibsPath = ""
" " path of additional sources. Don't try to add all sources you have, this will slow down the parsing process.
" " g:JavaComplete_SourcesPath
" " let g:JavaComplete_GradleExecutable = './gradlew'
" " let g:JavaComplete_GradleExecutable = 'gradle'
" " insert mode cursor move right
" inoremap <C-l> <Right>
" " inoremap <C-l> <S-Right>
" inoremap <C-h><C-h> <S-Left>
" inoremap <C-k> <Up>
" inoremap <C-j> <Down>
" iabbrev <expr> CDAY  strftime("%Y-%m-%d")
" iabbrev <expr> CWEEK strftime("%V")
" iabbrev <expr> PWD   getcwd()
" " inoremap <silent> <C-C><C-A> <C-R>=string(eval(input("Calculate: ")))<CR>
" "inoremap <silent> <C-D><C-D> <C-R>=strftime("%Y-%m-%d")<CR>
" "inoremap <silent> <C-D><C-T> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" " nomal 模式 Ctrl-j 换行 与java冲突
" nnoremap <C-J> i<CR><Esc>
" nnoremap <leader>o o<Esc>
" nnoremap <leader>O O<Esc>

" " vnoremap p "_dP
" " vnoremap p "0P
" vnoremap <leader>p "_di<CR><CR><Esc>kpkJJ
" vnoremap <leader>P "_di<CR><CR><Esc>kpkJ
" nnoremap <leader>p i<CR><CR><Esc>kpkJJ
" nnoremap <leader>P i<CR><CR><Esc>kpkJ
" " command mode cursor move right
" cnoremap <C-D> <Delete>
" cnoremap <C-F> <S-Right>
" cnoremap <C-A> <Home>
" cnoremap <C-B> <Left>
" cnoremap <C-P> <Up>
" cnoremap <C-N> <Down>
" cnoremap <Esc>b <S-Left>
" cnoremap <Esc>f <S-Right>



" nnoremap <leader>d "_d
" vnoremap <leader>d "_d


" " :vert diffsplit main.py

" " surround change
" cabbrev nysiw normal ysiw"
" cabbrev nysiW normal ysiW"
" cabbrev nysaw normal ysaw"
" cabbrev nyss  normal yss"
" cabbrev nvS   normal S"

" " g/0x[0-9a-zA-Z]\{4,10\}/yank | /;;/normal! pkk
" " g/cat << EOF/.,/^EOF/-1 Tabularize/|
" " window change
" cabbrev wch wincmd h
" cabbrev wcj wincmd j
" cabbrev wck wincmd k
" cabbrev wcl wincmd l
" " help
" " help global-variable
" " help digraph-table
" " echo variable
" cabbrev a2snip   write >> ${HOME}/.vim/plugged/vim-snippets/UltiSnipsDC/sh.snippets
" cabbrev e2v  echo g:JavaComplete_LibsPath


" cabbrev touchfile !touch %:p:h/file
" cabbrev mvfile !mv %:p %:p:h/file

" " shell format
" cabbrev sfm  s#\s\+--# \\\r--#g
" cabbrev sfl  s#\s*\\\n\s*--# --#g

" " copy yank
" " cabbrev yyy   call writefile(getreg('"', 1, 1), $HOME.'/.config/reg/filey') \| call setreg('q',@")
" cabbrev yyy  call writefile(getreg('"', 1, 1), $HOME."/.config/reg/filer")  \| call setreg('+',getline('.')) \| call setreg('l',getline('.')) \| call writefile([getline('.')], $HOME.'/.config/reg/filel')  \| write! $HOME/.config/reg/filef
" cabbrev yyy1 call writefile(getreg('"', 1, 1), $HOME."/.config/reg/filer1") \| call setreg('+',getline('.')) \| call setreg('l',getline('.')) \| call writefile([getline('.')], $HOME.'/.config/reg/filel1') \| write! $HOME/.config/reg/filef1
" " cabbrev swq  :execute('write! $HOME/.config/reg/fileb') \| execute('g/^[\s\t]*#/d') \| execute('wqa')
" cabbrev sw  :write! $HOME/.config/reg/fileb \| g/^\s*#/d
" cabbrev y4l  call writefile([getline('.')], $HOME.'/.config/reg/filel') \| call setreg('+',getline('.')) \| call setreg('l',getline('.'))
" cabbrev y4r  call writefile(getreg('"', 1, 1), $HOME.'/.config/reg/fileu')
" cabbrev yfp   call writefile([expand("%:p")],   $HOME."/.config/reg/filep") <Bar> call system('printf "'. expand("%:p") . '" \|pbcopy \|xsel -i -b ')
" cabbrev yfd   call writefile([expand("%:p:h")], $HOME."/.config/reg/filep") <Bar> call system('printf "'. expand("%:p") . '" \|pbcopy \|xsel -i -b ')
" cabbrev ypwd  call writefile([getcwd()], $HOME."/.config/reg/filep")
" cabbrev y2r  call system('xsel -i -b ', @")
" cabbrev y2x  .write !xsel -i -b
" cabbrev y2y  .write! $HOME/.config/reg/filey
" cabbrev y2f  write! $HOME/.config/reg/filef
" cabbrev y2f2  write! $HOME/.config/reg/filef2
" cabbrev y2l  .write! $HOME/.config/reg/filel
" cabbrev y2u  .write! $HOME/.config/reg/fileu
" cabbrev y2i  .write! $HOME/.config/reg/filei
" cabbrev y2o  .write! $HOME/.config/reg/fileo
" cabbrev y2s  .write! $HOME/.config/reg/files
" cabbrev a2y  write! >> $HOME/.config/reg/filey
" cabbrev a2f  write! >> $HOME/.config/reg/filef
" cabbrev a2f2 write! >> $HOME/.config/reg/filef2
" cabbrev a2l  write! >> $HOME/.config/reg/filel
" cabbrev a2u  write! >> $HOME/.config/reg/fileu
" cabbrev a2i  write! >> $HOME/.config/reg/filei
" cabbrev a2o  write! >> $HOME/.config/reg/fileo
" cabbrev a2s  write! >> $HOME/.config/reg/files
" " past ctrl+r a:past register in command line
" cabbrev ppp  normal "+p
" cabbrev p4b  r $HOME/.config/reg/fileb
" cabbrev p4B  r $HOME/.config/reg/fileB
" cabbrev p4d  r $HOME/Desktop/tmp.md
" cabbrev p4y  r $HOME/.config/reg/filey
" cabbrev p4u  r $HOME/.config/reg/fileu
" cabbrev p4i  r $HOME/.config/reg/filei
" cabbrev p4p  r $HOME/.config/reg/filep
" cabbrev p4f  r $HOME/.config/reg/filef
" cabbrev p4l  r $HOME/.config/reg/filel
" cabbrev p4r  r $HOME/.config/reg/filer
" " cabbrev p4w  r!sed -n 1,+50p /tmp/www
" cabbrev p4w  PasteFromFile /tmp/www 1 1
" cabbrev p4x  r!xsel -o -b
" " go
" cabbrev w2c  %s/./&/g
" cabbrev g2a  g/abc/normal! @a                                                           " go and substitute
" cabbrev g2e  g/abc/normal! hgcc                                                         " go and comment
" "find
" cabbrev fw   /\
" " delete
" " 'a,'b g/^\s\+\.\(test_case_\)\@!/co$
" cabbrev dbl   g/^[\s\t]*$/d                                                              " delete blank line
" cabbrev dbb   s/^\s*//g;s/\s*$//g                                                        " delete blank begin
" cabbrev dnA   g!/A/d                                                                     " delete not A
" cabbrev dnAB  v/\(A\|B\)/                                                                " delete not A and B
" cabbrev dml   g/SPECIAL/.,.+3d                                                           " go pattern and delete next 3 line
" cabbrev dbc   %s/([^)]*)//g                                                              " delete in ()
" cabbrev unq   %g/^\(.*\)\s*\n\1\s*$/d                                                     " delete duplicate duplicate field:cat file  uniq -f 1
" cabbrev unq1  %s/^\(.*\)\(\n\1\)\+$/\1/                                                 " delete duplicate
" cabbrev unq2  %s/^\(.*\)\n\1$/\1/                                                        " Delete lines which appears twice
" cabbrev dht   %s#\(</li>\)\\|\(</div>\)#\0\r#g \| %s#<[^>]\+>##g \| %s#&lt;#<#g \| %s#&gt;#>#g \| %s#&nbsp;# #g                             " Delete HTML tags but keeps text
" cabbrev dht0  %s#</li>#\r</li>#gc
" cabbrev dht1  %s#&nbsp;# #gc

" " format
" cabbrev fas  g/-/ s/\\\?\s*$/ `# ` \\/g                                                 " add change line at the end
" cabbrev fjs  :%!python3 -m json.tool                                                    " format with json
" cabbrev fjs  :%!python3 -m json.tool                                                    " format with json
" cabbrev c2m  :g/[^\|]$/norm J   " csv to md format

" " tab
" "Tabularize
" cabbrev tab  Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0
" "tab with groups of spaces
" cabbrev tabspace Tabularize /\S\(' . split(&commentstring, '%s')[0] . '.*\)\@<!\zs\ /l0<CR>
" cabbrev tabspace1  Tabularize /\s\+\zs\s/l0c0<CR>
" cabbrev tabgroup  Tabularize/\( "\)/l0
" "tab right no space left no space
" cabbrev tabnospace  Tabularize/:/l0<CR>
" "tab on the first match
" cabbrev tabfirst  Tabularize /^[^:]*\zs:<CR>
" "tab on the first match
" cabbrev tabfirst1  Tabularize /^[^@]*\zs@/l1l0<CR>

" cabbrev tabfm  Tabularize /.*\zs,/<CR>                                                      "tab on the last match
" cabbrev tabno Tabularize /^\(.\{-}\zs,\)\{2}\zs/l0l1<CR>                                    "align at the  2nd occurence of ','
" cabbrev tabno Tabularize /^\(.\{-}\zs,\)\{2}/l0<CR>                                        "align at the  2nd occurence of ','
" cabbrev tabnrls  Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0<CR>                        "Tabularize
" cabbrev tabnls Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0<CR>                         "Tabularize
" cabbrev tabnrs Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0<CR>                         "Tabularize
" cabbrev tabfl  Tabularize/^-\+\D\\|\s-\+\D\\|`\\|\\\\|&\+/l1r0<CR>                          "Tabularize from last
" cabbrev tabbt  g/[^\|]/+1.,/[^\|]/-1 Tabularize/\|                                      "Tabularize block table
" " buffer
" cabbrev b2s    w!sudo tee %                                                               "  save with root user
" cabbrev c_m    ctrl+v and enter                                                           "  input ^M
" cabbrev bsu    bufdo %s/pattern/replace/gce \| update                                     "  replace buffer
" cabbrev his    r!echo "history 10" \| bash -i 2>/dev/null \| sed -e 's/\x1b\[.//g'
" " cabbrev mh0    s/^\s*#*\s*\(.\{-}\)\s\+#\+\s*$/\1/g <Bar> :noh
" cabbrev mh0    s/^\s*#*\s*\(.\{-}\)\s*#*\s*$/\1/g <Bar> :noh
" cabbrev mh1    s/^\s*\(.\{-}\)\s*$/# \1 #/g <Bar> :noh
" cabbrev mh2    s/^\s*\(.\{-}\)\s*$/## \1 ##/g <Bar> :noh
" cabbrev mh3    s/^\s*\(.\{-}\)\s*$/### \1 ###/g <Bar> :noh
" cabbrev mh4    s/^\s*\(.\{-}\)\s*$/#### \1 ####/g <Bar> :noh
" cabbrev mb0    s#^[\#\*\.+\-~\_> 0-9]*\(\S\)#\1#g <Bar> '<,'>s#[\*\.+\-~\_> ]*$##g <Bar> :noh
" cabbrev mb1    g#[:：]\s*$# s#^#- # <Bar> :noh
" cabbrev mb2    g!/\(^#\)\\|\([:：]\s*$\)/ s#^#\* # <Bar> norm >> <Bar> :noh
" cabbrev mb2*   s/^\s*\(.\{-}\)\s*$/**\1**/g <Bar> :noh
" cabbrev mb2_   s/^\s*\(.\{-}\)\s*$/__\1__/g <Bar> :noh
" cabbrev mb2~   s/^\s*\(.\{-}\)\s*$/~~\1~~/g <Bar> :noh
" cabbrev mb+    s/^\s*\(.\{-}\)\s*$/\+ \1/g  <Bar> :noh
" cabbrev mb-    s/^\s*\(.\{-}\)\s*$/\- \1/g  <Bar> :noh
" cabbrev mb*    s/^\s*\(.\{-}\)\s*$/\* \1/g <Bar> :noh
" cabbrev mbi    let i=1 <Bar> '<,'>g#^# s#^\s*\d*\.\?\s*#\=i.'. '# <Bar> let i+=2 " delete '<,'> area
" cabbrev srs    SurroundString **

" cabbrev mbs    .g#^# s#^\s*[\+\-\*]*\s*#- # <Bar> :noh
" cabbrev mbse   g#^\a# s#^\s*[\+\-\*]*\s*#- # <Bar> :noh
" cabbrev mbsc   g#^[^\x00-\xff]# s#^\s*[\+\-\*]*\s*#- # <Bar> :noh
" cabbrev mbp    .g#^# s#^\s*[\+\-\*]*\s*#+ # <Bar> :noh <Bar> norm >>
" cabbrev mbpe   g#^\a# s#^\s*[\+\-\*]*\s*#+ # <Bar> :noh <Bar> norm >>
" cabbrev mbpc   g#^[^\x00-\xff]# s#^\s*[\+\-\*]*\s*#+ # <Bar> :noh <Bar> norm >>
" cabbrev mbm    .g#^# s#^\s*[\+\-\*]*\s*#* # <Bar> :noh <Bar> norm >>
" cabbrev mbme   g#^\e# s#^\s*[\+\-\*]*\s*#* # <Bar> :noh <Bar> norm >>
" cabbrev mbmc   g#^[^\x00-\xff]# s#^\s*[\+\-\*]*\s*#* # <Bar> :noh <Bar> norm >>
" cabbrev mbl1   g#:$# s#^\s*[\+\-\*]*\s*#- # <Bar> :noh
" cabbrev mbl2   g!#:$# s#^\s*[\+\-\*]*\s*#* # <Bar> :noh <Bar> norm >>
" cabbrev mbn0   s#^[>]*\s*##
" cabbrev mbn    s#^[^\x00-\xff]#> \0#
" cabbrev mbn2   s#^[^\x00-\xff]#>> \0#
" cabbrev mbt    g#^\s*\d# norm >>
" cabbrev mbc    s@^[\#\*\.+\-\_> 0-9]*\(\S\)@\[\] \1@g
" " cabbrev mh4     echo getline("'<") 最前行 getpos("'<")


" cabbrev n2f    e %:h/readme.md
" cabbrev snnum    set nornu  \|set nonu
" cabbrev snum    set nu  \|set rnu
" cabbrev snwrap    set nowrap
" cabbrev swrap    set nowrap
" cabbrev snlist    set nolist
" cabbrev slist    set list

" cabbrev smh    /#.*#\s*$

" cabbrev ldn    s#^\s*\d*\.\?\s*#1. #g <Bar> :noh
" cabbrev lds    s#^\(\s*\d\+\)\s\+\.#\1\.#g <Bar> :noh

" " bufonly %bd |e#
" " terminal
" cabbrev ter  set splitbelow \| terminal ++rows=3
" " fresh NERDTree
" cabbrev ntc  NERDTreeCWD <Bar> NERDTreeFocus <Bar> NERDTreeRefreshRoot <Bar> redraw!
" " NERDTree to current file
" cabbrev ntf  NERDTree %:p:h <Bar> redraw!
" cabbrev nth  let NERDTreeShowHidden=1

" cabbrev fresh redraw!
" " sort and move
" " g/method_name/exec "m ".i | let i+= 1
" " g/Pattern/exec i.",".i." co ."|let i+=1
" cabbrev sbc1   %!sort -t'\|' -k1,1r -k2,2n -u                                                            " sort
" cabbrev sbc2   %!sort -k2nr " This sorted by the second column (-k2), treats the text as a number (n) and then sorts in reverse (r), which results in.
" cabbrev scm   s/\([a-z]\)\([A-Z]\)/\1_\L\2/gc
" cabbrev sbn   s/\s\d[.、]/\r\0/gc
" cabbrev stb    'b,'e g/^KS/,/^KE/-1s/$/@@/ \| 'b,'e g/^KS/,/^KE/join \| 'b,'e !sort -r \| 'b,'e s/@@/^M/g " sort block
" cabbrev m2b    g/SYNTAX/.,/DESCRIPTION/-1 move /PARAMETERS/-1                                             " move block
" cabbrev mobo   g/Pattern/exec "1m."                                                            " sort
" cabbrev gpe    g/pat/+1.,/pat/-1 co$
" cabbrev m2l    g/name.*\n\v^((name)@!.)*$/j                                                               " connect not end with name

" cabbrev msg    messages
" cabbrev msgc   for n in range(200) <Bar> echom "" <Bar> endfor
" " exchange
" cabbrev e2h    r! xxd -u -p <(echo -n 'ABC')                                              " ASC to Hex
" cabbrev e2a    r! xxd -r -p <(echo 414243)                                                " Hex to ASC
" cabbrev tce    s/[^\x00-\xff]\+/\=trim(system('trans -b :en ' . submatch(0)))/                  " translate chinese to english 汉字
" cabbrev e2c    %s/.*/\U&/g                                                                " exchange Up or Lower
" cabbrev e2u    %s/_\(\l\)/\u\1/gc " set _a to A
" cabbrev e2u1   %s/\<./\u&/g	    " Sets first letter of each word to uppercase
" cabbrev e2u2   %s/\<./\l&/g	    " Sets first letter of each word to lowercase
" cabbrev e2u3   %s/.*/\u&	        " Sets first letter of each line to uppercase
" cabbrev e2u4   %s/.*/\l&	        " Sets first letter of each line to lowercase
" cabbrev d2d    %s/TODAY/\=strftime("%Y-%m-%d")/g
" cabbrev w2d    %s/TOWEEK\.\(\d\)/\=trim(system('date -d"last-sunday +' . submatch(1) .' day" +%Y-%m-%d'))/g
" " substitute
" " let c=0|g/^\d\+\ze\./let c+=1|s//\=c
" " ├─────┘ ├───────────┘├──────┘ ├─┘├─┘
" " │       │            │        │  └ with the current value of the counter (i.e. new number)
" " │       │            │        └ replace last used pattern (i.e. old number)
" " │       │            └ for every matched line, increment the counter
" " │       └ iterate over the lines starting with a number followed by a dot
" " └ initialize counter to 0
" " :%s/onward/forward/gi	Replace onward by forward, case unsensitive
" " /\<\d\d\d\d\>	Search exactly 4 digits
" cabbrev iniij  let i=0 \|let j=0
" cabbrev sabf   tabdo %s/foo/bar/g	                                                    " substitute all buffer
" cabbrev s2b    %s/\(　\)\\|\(\%ua0\)/ /g
" cabbrev s2sp   %s/\(　\)\\|\(\%ua0\)/ /g                                                " IDEOGRAPHIC SPACE(　) non-breaking spaceNBSP( ) to space
" cabbrev s2an   s/\(\d\+\)STR/\=(submatch(1)+1).'STR'/gc                                   " substitute number with number+1
" cabbrev s2in   let i=0 \| g/\(push\|pop\)/let i = i + 1\|put!='print \"DEBUG ' . i . '\"' " add string with serial number
" cabbrev s2sn   let i=1 \| 11,17g#index#s#index#\=printf('index%02d',i/3)#g \| let i= i+1  " substitute serial number
" cabbrev gpsn   let i=1 \| g#pattern\zs\d\+\ze# s##\=i# \| let i+=1                        " go pattern and subs with serial number
" cabbrev gpsn1  let i=1 \| g#pattern# s#\zs\d\+\ze#\=i# \| let i+=1                        " go pattern and subs with serial number
" cabbrev gpsn2  let i=1 \| g/pattern/execute "normal! I".printf("%02d ", i)\|let i = i+1   " go pattern and subs with serial number
" cabbrev gpsn3  let i=1 \| %s/pattern/\='REPLACE_'.i.execute('let i+=1')/g                 " go pattern and subs with serial number
" cabbrev gAnB   g/\(AAA\)\(.*BBB\)\@!/
" cabbrev rev    g/^/m0
" cabbrev s2sn1  let @r=1\| %s/abc/\='xyz_'.(@r+setreg('r',@r+1))/g                         " substitute serial number with register
" cabbrev ra     call setreg('a',@")
" cabbrev rb     call setreg('b',@")
" cabbrev rq     call setreg('q',@")
" cabbrev s2sn2  let n=[0]\|%s/Id="I"/\='Id="'.map(n,'v:val+1')[0].'"'/g                    " substitute serial number with register
" cabbrev s2ilz  let SI=MakeSearchIndex(-1) \| %s/^\d\+/\=SI(0,5).'_'.submatch(0)/gc        " substitute with index with leading 0000
" cabbrev snpf   let g:UltiSnipsSnippetDirectories = [ 'UltiSnips','UltiSnipsDC', ] <Bar> :call UltiSnips#RefreshSnippets()
" cabbrev snpl   let PS=PasteSnippets(0,0)
" cabbrev snpl1  let PS=PasteSnippets(0,1)
" cabbrev snpl2  let PS=PasteSnippets(0,2)
" cabbrev snpw   let PS=PasteSnippets(1,0)
" cabbrev snpw1  let PS=PasteSnippets(1,1)
" cabbrev snpw2  let PS=PasteSnippets(1,2)
" cabbrev s2iln  let S4I=MakeSearchIndex4(-1) \| %s/^\d\+/\=S4I(0,5).'_'.submatch(0)/gc    " substitute with index with leading 0000
" cabbrev v_2c    %s/\%V\([a-zA-Z0-9]\)_\([a-zA-Z0-9]\)/\1_\U\2/g
" cabbrev vb2c    %s/\%V\([a-zA-Z0-9]\)\s\+\([a-zA-Z0-9]\)/\1\U\2/g
" cabbrev vd2c    %s/\%V\([a-zA-Z0-9]\)-\([a-zA-Z0-9]\)/\1\U\2/g
" cabbrev vc2_    %s/\%V\([a-z]\)\([A-Z]\)/\1_\l\2/g
" cabbrev vc2b    %s/\%V\([a-z]\)\([A-Z]\)/\1 \l\2/g
" cabbrev vb2_    %s/\%V\s/_/g
" cabbrev vb2_    %s/\%V\s//g
" cabbrev v_2b    %s/\%V_/ /g
" cabbrev dcm     %s,/\*\_.\{-}\*/,,g \| %s#//.*$##g

" cabbrev s2s    %s/\(AAA.*\)\s\+\(.*BBB\)/\1\2/gc                                          " substitute a with b
" cabbrev sas    %s/{".*"}/\=substitute(submatch(0),'\s\+','","','g')/gc                    " substitute and then substitute
" cabbrev varh   %s#[ !"#$%&'()*+,-./:;<=>?@[\]^_`{\|}~]#_#gc
" cabbrev vara   %s#[　！＂＃＄％＆＇（）＊＋，－。／：；＜＝＞？＠［＼］＾＿｀｛｜｝～]#_#gc
" cabbrev varc   %s#[ ！“”#\%&‘’（）*+，\-。/：；《=》？@【、 】…—～\|」～]#_#gc
" cabbrev varhs  s#=var{\(.*\)}#\="=var{" . substitute(submatch(1),"[ !\"\#$%&'()*+,-./:;<=>?@[\\]\^_`{\|}~]","_","g") . "}"#gc
" cabbrev varas  s#=var{\(.*\)}#\='=var{' . substitute(submatch(1),'[　！＂＃＄％＆＇（）＊＋，－。／：；＜＝＞？＠［＼］＾＿｀｛｜｝～]','_','g') . '}'#gc
" cabbrev varcs  s#=var{\(.*\)}#\='=var{' . substitute(submatch(1),'[ ！“”\#\$\%&‘’（）*+，\-。/：；《=》？@【、 】…—～\|」～]','_','g') . '}'#gc
" cabbrev varrm  s#=var{\(.*\)}#\1#gc
" cabbrev to2h   %s/\d\+/\='%'.printf("0x%x",submatch(0))/g                                " translate oct to hex
" cabbrev th2o   %s/0[xX]\x\+/\=str2nr(submatch(0), 16)/g                                  " translate hex to oct
" cabbrev tf2c   %s/regex/\= function(submatch(1))/g                                       " translate function
" cabbrev talz   put =map(range(1,150), 'printf(''%04d'', v:val)')                          " add leading zero
" cabbrev s2reg  execute '%s/'.@o.'/'.@b.@n.@e.'/gc'                                        " substitute with register
" cabbrev spreg    let @b=substitute(@b,'\n','\\r','g') \| let @n=substitute(@o,'\n','\\r','g') \| let @e=substitute(@e,'\n','\\r','g') \| let @o=substitute(@o,'\n','\\n','g')

" " calculate
" cabbrev sum1   %!awk -F '\|' '{print; sum+=$6}; END {print("Total:",sum)}'                " add column value
" cabbrev sum2   r!awk '{sum+=$6} END {print("Total:",sum)}' %                              " add column value
" cabbrev calcexp s/.*/\=submatch(0).'='.CalcExp(submatch(0))/
" " create
" cabbrev addlinenum    %s/^/\=line('.')."\t"/                                                     " create line number
" cabbrev clnlz  g/^/exec 's/^/'.strpart(line('.').' ', 0, 4)                               " create line number
" cabbrev clnlz1 %s/^/\=strpart(line('.').' ', 0, 4)/g                                      " create line number
" cabbrev csn    for i in range(1,10) \| if i > 2 \| put ='192.168.0.'.i \| endif \| endfor " create serial number
" cabbrev crn    r! for i in $(seq 1 20); do echo -e -n "\# ${i} $((RANDOM\%10)), \n"; done " create random number
" cabbrev ctags  !ctags --recurse=yes --exclude=.git --exclude=BUILD --languages=java,python -o .tags .
" cabbrev mks   execute 'mksession! $HOME/.config/reg/' . fnamemodify(getcwd(), ':t') .strftime("_%y%m%d_%H%M%S", localtime()). '.session.vim'
" cabbrev mksl  execute 'mksession! session.vim'
" cabbrev figlet  r!figlet -w 90 -f big -c DC.Melo 2021/08/07
" cabbrev tcfile !touch %:p:h/name.java
" cabbrev tsfile !trash %:p:h/name.java
" cabbrev regc :for i in range(34,122) \| silent! call setreg(nr2char(i), []) \| endfor
" cabbrev CleanRegw call setreg('w', [])
" command!   -nargs=1 Mkfile    execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> execute('silent! !touch "<args>"') <Bar>  e <args> <Bar> redraw!
" command!   -nargs=1 MkDir     execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>
" command!   W :execute ':silent w !sudo tee % > /dev/null' | :edit!
" " command!   WQA :execute ':silent write! $HOME/.config/reg/fileb' <Bar> :execute ':silent write! >> $HOME/.config/reg/fileB' <Bar> :wqa
" command!   WQA :execute ':silent write! $HOME/.config/reg/fileb' <Bar> :call writefile(getline(1,'$'), $HOME.'/.config/reg/fileba', 'a')  <Bar> :wqa


" command!   CleanRegs for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" command!   CleanMsg  for i in range(200) | echom '' | endfor

" " 设置mark保存
" " set viminfo='1000,f1

" " let g:multi_cursor_use_default_mapping=0



" " Default mapping
" " let g:multi_cursor_start_word_key      = '<C-m>'
" " let g:multi_cursor_select_all_word_key = '<A-n>'
" " let g:multi_cursor_start_key           = 'g<C-n>'
" " let g:multi_cursor_select_all_key      = 'g<A-n>'
" " let g:multi_cursor_next_key            = '<C-m>' " def '<C-n>'
" " let g:multi_cursor_prev_key            = '<C-w>' " def'<C-p>'
" " let g:multi_cursor_skip_key            = '<C-x>'
" " let g:multi_cursor_quit_key            = '<Esc>'

" " https://vi.stackexchange.com/questions/3182/is-it-possible-to-make-a-numerically-prefixed-hotkey-run-a-function-that-many-ti
" " nnoremap <M-.> :<C-u>call ReadLines(v:count1)<cr>
" " nnoremap <C-l> :<C-u>exe v:count1 . 'ReadLines'<CR>
" " nnoremap <C-l> :call PS()<CR>
" nnoremap <C-l> :let next=PS()<CR>
" nnoremap <C-s> :<C-u>execute v:count1 . 'CopySnips' <Bar> let PS=PasteSnippets(1,0) <CR>
" "nnoremap <C-s> :<C-u>execute v:count1 . 'CopySnips'<CR> :let PS=PasteSnippets(1,0) <CR>
"




" " ========================

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set basic view
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nrformats+=alpha
" set relativenumber
" set nowrap
" set list
" set expandtab!
" set nrformats=alpha
" :lang zh_CN.UTF-8
" :language en_US.UTF-8


function! BatchCommand()

  let findList=[
  \" it('(未登录)首页P1用例 [TC]12.P1     ",
  \" it('(未登录)首页P1用例 [TC]13.P1     ",
  \" it('(未登录)首页P1用例 [TC]6.P1      ",
  \" it('(未登陆)导航栏全量用例 [TC]47.P1 ",
  \" it('(未登陆)导航栏全量用例 [TC]48.P1 ",
  \" it('(未登陆)导航栏全量用例 [TC]55.P1 ",
  \" it('(未登陆)导航栏全量用例 [TC]56.P1 ",
  \" it('(未登陆)导航栏全量用例 [TC]50.P1 ",
  \" it('(未登陆)导航栏全量用例 [TC]52.P1 ",
  \" it('(未登录)首页P1用例 [TC]18.P1     ",
  \" it('(未登陆)导航栏全量用例 [TC]54.P1 ",
  \" it('(未登陆)导航栏全量用例 [TC]51.P1 ",
  \" it('(未登陆)导航栏全量用例 [TC]16.P1 ",
  \" it('(未登陆)导航栏全量用例 [TC]53.P1 ",
  \" it('(未登录)首页P1用例 [TC]16.P1     ",
  \" it('(未登陆)导航栏全量用例 [TC]45.P1 ",
  \" it('(未登录)首页P1用例 [TC]38.P1     ",
  \" it('(未登录)首页P1用例 [TC]42.P1     ",
  \" it('(登陆态)首页P1用例 [TC]43.P1     ",
  \" it('(未登录)首页P1用例 [TC]36.P1     ",
  \" it('(未登录)首页P1用例 [TC]37.P1     ",
  \" it('(未登录)首页P1用例 [TC]6.P1      ",
        \  ]


  for item in findList
    echo item
    execute  'g/'.trim(item).'/ s/it/it.only'
  endfor


endfunction



function! OpenURL()
  let s:url = trim(matchstr(getline("."), '\[.*\](\zs.*\ze)'))
  " let s:url = matchstr(getline("."), '[a-z]*:\/\/[^ >,;()#|｜]*')
  " let s:file = matchstr(getline("."), 'docs\/media\/[^ >,;()|｜]*')
  if stridx(s:url, "://")  != -1
    echo "open " . s:url
    silent exec "!open '".s:url."'"
  elseif stridx(s:url, '.drawio.') != -1
    let l:commandString=join(split("/Applications/draw.io.app/Contents/MacOS/draw.io '".expand("%:p:h") ."/" . s:file."'"),' ')
    echo system(l:commandString)
  elseif stridx(s:url, '.png') != -1
    echo "!open '".expand("%:p:h") ."/" . s:url."'"
    silent exec "!open '".expand("%:p:h") ."/" . s:url."'"
  else
    echo "edit ".expand("%:p:h") ."/" . s:url
    silent exec "edit ".expand("%:p:h") ."/" . s:url
  endif
endfunction


function! SetDiffEnviron()
  set diff
  set scrollbind
  set scrollopt=ver,jump,hor
  set nowrap
  set fdm=diff
endfunction
:command! SetDiffEnviron call SetDiffEnviron()

" Switch off diff-mode of all currently open windows.
command! DiffOff call DiffOff()
function! DiffOff()
  windo set nodiff
  windo set noscrollbind
  " Reset, then restore the 'foldmethod' and 'foldcolumn' settings by
  " re-setting the filetype. This triggers the filetype-based folding to be
  " reactivated, and ( contrary to a simple :e!) works even on modified
  " buffers.
  windo set foldmethod=manual
  windo set foldcolumn=0
  windo unlet! b:did_ftplugin | let &filetype = &filetype
endfunction




cabbrev difffile   :sp <filename> <Bar> :windo diffthis



funct! DiffTwoTexts(text1, text2)
  " new /tmp/`uuidgen`
  vsplit /tmp/`uuidgen`
  put =a:text1
  normal ggdd
  diffthis
  :set wrap
  " new /tmp/`uuidgen`
  vsplit /tmp/`uuidgen`
  put =a:text2
  normal ggdd
  diffthis
  :set wrap
endfunct

funct! DiffTwoLines(nline)
  let l:line1=line('.')
  let l:line2=line('.')+a:nline
  let text1 = getline(l:line1,l:line2-1)
  let text2 = getline(l:line2,l:line2-1-l:line1+l:line2)
  call DiffTwoTexts(text1, text2)
endfunct



" @deprecate
function! TerminalOpen() abort
  let l:termListExist=filter(map(getbufinfo(), 'v:val.bufnr'), 'getbufvar(v:val, "&buftype") is# "terminal"')
  let l:termListOpen=uniq(map(filter(getwininfo(), 'v:val.terminal'), 'v:val.bufnr'))
  if len(termListExist) == 0
    execute "20 split | terminal"
  elseif  len(termListOpen) == 0
    execute "20 split | buffer " .  termListExist[0]
  else
    execute bufwinnr(termListExist[0]) 'wincmd q'
  endif
endfunction


"@deprcate"
function! TerminalDelete() abort
  let l:termList=filter(map(getbufinfo(), 'v:val.bufnr'), 'getbufvar(v:val, "&buftype") is# "terminal"')
    for i in termList
      execute i . "bdelete! "
    endfor
endfunction


function! Get_visual_selection()
  "get the position of left start visual selection
  let [line_start, column_start] = getpos("'<")[1:2]
  "get the position of right end visual selection
  let [line_end, column_end] = getpos("'>")[1:2]
  "gotta catch them all.
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  "edge cases and cleanup.
  let lines[-1] = lines[-1][: column_end - 2]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction

function Save_visually_selected_text_to_file()
  let selected_text = Get_visual_selection()
  call writefile(split(selected_text, "\n"), $HOME . "/.config/reg/filev")
endfunction

