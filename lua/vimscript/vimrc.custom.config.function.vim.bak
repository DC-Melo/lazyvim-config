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
" command!   -nargs=* FormatText2GifScript call FormatText2GifScript(<f-args>)
" command!   -nargs=* GenTemplateCode2File call GenTemplateCode2File(<f-args>)
" command!   -nargs=* GenFuncCode2File     call GenFuncCode2File(<f-args>)
" command!   -nargs=* LoadImage2Markdown : call LoadImage2Markdown(<f-args>)
" command!   -nargs=* CopyLinkFile2clipboard : call CopyLinkFile2clipboard(<f-args>)
" command!   -nargs=* CopyMarkdown2clipboard : call CopyMarkdown2clipboard(<f-args>)
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
" command!   AddTitle            : call AddTitle()
" command!   AddAuthor           : call AddAuthor()
" command!   UpdateTitle         : call UpdateTitle()
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
" function! GenTemplateCode2File(...)
"     " let c=a:0
"     let paras=a:000 "a:000 is an array («List»)
"     let filename  =  l:paras[0]
"     let head_beg  = str2nr(l:paras[1])
"     let table_beg = str2nr(l:paras[2])
"     let table_end = str2nr(l:paras[3])
"     let code_beg  = str2nr(l:paras[4])
"     let code_end  = str2nr(l:paras[5])
"     let head_list = Strip_list(split(getline(l:head_beg),"|"))
"     let col_type = index(head_list, "Type")
"     let case_list = getline(l:table_beg,l:table_end)
"     let case_vector = Mapped(function("Strip_list"),map(case_list,'split(v:val,"|")') )
"     let pattern_type  = '^\s*Type\s\+\(.*\){\s*$'
"     let pattern_block = '^\s*Block\s\+\(.*\){\s*$'
"     let comment = '//'

"     let type_beg = l:code_beg
"     if l:col_type >= 0
"         while !(getline(l:type_beg) =~ pattern_type) && (l:type_beg<l:code_end)
"           let type_beg += 1
"         endwhile
"     endif

"     while  l:type_beg < l:code_end 
"         if l:col_type >= 0
"             let type_name = substitute(getline(l:type_beg), pattern_type, '\1', '')
"         else
"             let type_name = "TypeNone"
"         endif
"         " :echom "find type:" l:type_name

"         if l:col_type >= 0
"             call cursor(l:type_beg, 0)
"             call cursor(l:type_beg, col('$'))
"             let type_end = searchpair('{', '', '}')
"         else
"             let type_end = l:code_end
"         endif
"         " :call writefile([getline(type_beg)], l:filename, "a")
"         let block_end = l:type_beg
"         let block_beg = l:block_end
"         while !(getline(l:block_beg) =~ pattern_block) && (l:block_beg < l:type_end)
"           let block_beg += 1
"         endwhile
"         while l:block_beg < l:type_end  
"             let block_name = substitute(getline(l:block_beg), pattern_block, '\1', '')
"             " :echom "find block:" l:block_name
"             call cursor(l:block_beg, 0)
"             call cursor(l:block_beg, col("$"))
"             let block_end = searchpair('{', '', '}')
"             :echom l:type_name l:type_beg l:type_end l:block_name l:block_beg l:block_end 
"             :call writefile([ l:comment . l:type_name . "_" . l:block_name . "_generated_code_begin{" ], l:filename, "a")
"             let index = -1
"             for case in case_vector
"                 if (l:col_type == -1) || (type_name == "All") || ((l:col_type >=0) && (type_name == case[col_type])) || ((l:col_type >=0) && (type_name == "TypeNone") && (case[col_type] != "")) 
"                 " if (l:col_type == -1) || ((l:col_type >=0) && (type_name == case[col_type])) || ((l:col_type >=0) && (type_name == "Not-Blank") &&  (strlen(case[col_])>0)) 
"                     let index += 1
"                     let block_str = join(getline(l:block_beg+1,l:block_end-1),"\n")
"                     let block_temp_str = l:block_str
"                     let i = 0
"                     for item in head_list
"                         let block_temp_str = substitute(block_temp_str, '\C__' . item, case[i], "g")
"                         " :echom l:item case[i]
"                         " :echom l:item case[i] l:block_temp_str
"                         let i += 1
"                     endfor
"                     let block_temp_str = substitute(block_temp_str, "__Index" , string(l:index), "g")
"                     let block_temp_list = split(block_temp_str ,"\n")
"                     :call writefile(l:block_temp_list, l:filename, "a")
"                 endif
"             endfor
"             :call writefile([ l:comment . l:type_name . "_" . l:block_name . "_generated_code_ended}" ], l:filename, "a")
"             let block_beg = l:block_end
"             while !(getline(l:block_beg) =~ pattern_block) && (l:block_beg < l:type_end)
"               let block_beg += 1
"             endwhile
"         endwhile

"         " :call writefile([getline(type_end)], l:filename, "a")
"         let type_beg = l:type_end
"         if l:col_type >= 0
"             while !(getline(l:type_beg) =~ pattern_type) && (l:type_beg<l:code_end)
"               let type_beg += 1
"             endwhile
"         endif
"     endwhile
"     " :echom "type begin:" l:type_beg "code end:" l:code_end 
" endfunction
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
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " DC自定义函数
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! Mapped(fn, l)
"     let new_list = deepcopy(a:l)
"     call map(new_list, string(a:fn) . '(v:val)')
"     return new_list
" endfunction

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " DC自定义函数,对一个list 去空
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! Strip_list(l)
"     let new_list=[]
"     for item in a:l
"       let item_strip = substitute(item, '^\s*\(.\{-}\)\s*$', '\1', '')
"       if item_strip =~ "^="
"         " echom l:item_strip
"         let item_strip_exp = substitute(item_strip, '^=\(.*\)', '\1', '')
"         " echom l:item_strip_exp
"         let item_strip_value = eval(item_strip_exp)
"         call add(new_list,item_strip_value)
"       else
"         call add(new_list,item_strip)
"       endif
"     endfor
"     return new_list
" endfunction
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
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "  函数：添加代码描述
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! AddAuthor()
"     call append(0 ,'############################################################################')
"     call append(1 ,'#  _________     _                 _____   _____      __  __      _        #')
"     call append(2 ,'# |___   ___|   (_)  _________    |  __ \ / ____|    |  \/  |    | |       #')
"     call append(3 ,'#  ___| |___      _ |_________|   | |  | | |   ______| \  / | ___| | ___   #')
"     call append(4 ,'# |___   ___|    (_)    | |       | |  | | |  |______| |\/| |/ _ \ |/ _ \  #')
"     call append(5 ,'#  ___| |___    /|   ___| |___    | |__| | |____     | |  | |  __/ | (_) | #')
"     call append(6 ,'# |_________|  (_)  |_________|   |_____/ \_____|    |_|  |_|\___|_|\___/  #')
"     call append(7 ,'#                                                                          #')
"     call append(8 ,'############################################################################')
" endfunction

" function! AddTitle()
"     let figletName=system('figlet -f big "DC-Melo"')
"     let figletTime=system('figlet -f big `date +%Y/%m/%d`')
"     let l:file_name = expand("%:e")
"     if  l:file_name == 'c' || l:file_name == 'cpp' || l:file_name == 'h' || l:file_name == 'java'
"         call append(0 ,"/*******************************************************************************")
"         call append(1 ,"* AUTHOR   : DC-Melo王江")
"         call append(2 ,"* MAIL     : melo.da.chor@gmail.com")
"         call append(3 ,"* GITHUB   : https://github.com/DC-Melo https://gitee.com/DC-Melo")
"         call append(4 ,"* BLOG     : www.dc-melo.com")
"         call append(5 ,"* FILE     : ".expand("%:t"))
"         call append(6 ,"* CREATED  : ".strftime("%Y-%m-%d %H:%M"))
"         call append(7 ,"* MODIFIED : ".strftime("%Y-%m-%d %H:%M"))
"         call append(8 ,"* VERSION  : V-0.0.1.".strftime("%y%m%d")."_a;")
"         call append(9 ,"* DESCRIB  : ")
"         call append(10,"* NOTICES  : ")
"         call append(11,"* ".l:figletName)
"         call append(12,"* ".l:figletTime)
"         call append(13,"********************************************************************************/")
"         call append(14,"")
"         execute '1,16 s/[\x0]/\r* /g'
"         echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
"     elseif l:file_name == 'py'
"         call append(2 ,"################################################################################")
"         call append(3 ,"# AUTHOR   : DC-Melo王江")
"         call append(4 ,"# MAIL     : melo.da.chor@gmail.com")
"         call append(5 ,"# GITHUB   : https://github.com/DC-Melo https://gitee.com/DC-Melo")
"         call append(6 ,"# BLOG     : www.dc-melo.com")
"         call append(7 ,"# FILE     : ".expand("%:t"))
"         call append(8 ,"# CREATED  : ".strftime("%Y-%m-%d %H:%M"))
"         call append(9 ,"# MODIFIED : ".strftime("%Y-%m-%d %H:%M"))
"         call append(10,"# VERSION  : V-0.0.1.".strftime("%y%m%d")."_a;")
"         call append(11,"# DESCRIB  : ")
"         call append(12,"# NOTICES  : ")
"         call append(13,"# ".l:figletName)
"         call append(14,"# ".l:figletTime)
"         call append(15,"################################################################################")
"         call append(16,"")
"         execute '1,16 s/[\x0]/\r* /g'
"         echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
"     else 
"         call append(1 ,"################################################################################")
"         call append(2 ,"# AUTHOR   : DC-Melo王江")
"         call append(3 ,"# MAIL     : melo.da.chor@gmail.com")
"         call append(4 ,"# GITHUB   : https://github.com/DC-Melo https://gitee.com/DC-Melo")
"         call append(5 ,"# BLOG     : www.dc-melo.com")
"         call append(6 ,"# FILE     : ".expand("%:t"))
"         call append(7 ,"# CREATED  : ".strftime("%Y-%m-%d %H:%M"))
"         call append(8 ,"# MODIFIED : ".strftime("%Y-%m-%d %H:%M"))
"         call append(9 ,"# VERSION  : V-0.0.1.".strftime("%y%m%d")."_a;")
"         call append(10,"# DESCRIB  : ")
"         call append(11,"# NOTICES  : ")
"         call append(12,"# ".l:figletName)
"         call append(13,"# ".l:figletTime)
"         call append(14,"################################################################################")
"         call append(15,"")
"         execute '1,16 s/[\x0]/\r# /g'
"         echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
"     endif
" endfunction
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "  函数：更新版本信息
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! UpdateTitle()
"     execute '%s/\(FILE\s\+:\s\+\)[a-zA-Z0-9_\-\.]\+/\=submatch(1).expand("%:t")/gc'
"     execute '%s/\(MODIFIED\s\+:\s\+\)\d\d\d\d-\d\d-\d\d\s\d\d:\d\d/\=submatch(1).strftime("%Y-%m-%d %H:%M")/gc'
"     execute '%s/\(VERSION\s\+:\s\+\)V-\(\d\)\.\(\d\)\.\(\d\)\.\(\d\d\d\d\d\d\)_\([a-z];\)/\=submatch(1)."V-".submatch(2).".".submatch(3).".".(submatch(4)+1).".".strftime("%y%m%d")."_".submatch(6)'
"     " normal m'
"     " normal ''
"     " normal m'
"     " normal ''
"     " normal mk
"     " execute '/FILE/s@:.*$@\=": ".expand("%:t")@'
"     " execute "noh"
"     " normal 'k
"     " execute 'g/VERSION/s@\(#\sVERSION\s*:\sV\)-\(\d*\.\d*\)\.\(\d*\)\.\(\d*\)_\([a-z]\):\(.*\)@\=submatch(1)."-".submatch(2).".".(submatch(3)+1).".".strftime("%y%m%d")."_".submatch(5).": ;V-".submatch(2).".".submatch(3).".".submatch(4)."_".submatch(5).":".submatch(6)@'
"     echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
" endfunction
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
"         silent! call writefile([g:the_register_raw], $HOME . "/.tmp/register_".a:fileName .string(i) )
"     endfor
" endfunction

" function! LoadRegisters(fileName)
"     for i in range(34,122)
"         let filelines = readfile($HOME . '/.tmp/register_'.a:fileName .string(i))
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
"     execute 'mksession! ' .  $HOME . '/.tmp/'. fnamemodify(getcwd(), ':t') .strftime("_%y%m%d_%H%M%S", localtime()) . '.session.vim'
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
"     execute 'r! sed -n ' . a:begin . 'p ' . $HOME . '/.tmp/files'
" endfunction
" function! CopySnips(begin)
"     let l:ext_name = expand("%:e")
"     if  l:ext_name == 'java'
"         :call system('sed -n "' . a:begin .',/endsnippet/p" ' .$HOME . '/.vim/plugged/vim-snippets/UltiSnipsDC/java.snippets > '. $HOME . '/.tmp/files')
"     elseif l:ext_name == 'py'
"         :call system('sed -n "' . a:begin .',/endsnippet/p" ' .$HOME . '/.vim/plugged/vim-snippets/UltiSnipsDC/python.snippets > '.$HOME . '/.tmp/files')
"     else
"     " if  l:ext_name == 'c' || l:ext_name == 'cpp' || l:ext_name == 'h'
"         :call system('sed -n "' . a:begin .',/endsnippet/p" ' .$HOME . '/.vim/plugged/vim-snippets/UltiSnipsDC/cpp.snippets > '. $HOME .'/.tmp/files')
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
"     let filelines = readfile($HOME .'/.tmp/files')
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
"                 " execute 'r! sed -n ' . l:lineIndex . 'p ' . $HOME .'/.tmp/files'
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

" function! FormatText2GifScript(...)
"     " let paras=a:000 "a:000 is an array («List»)
"     let splitNum  =  a:000[0]%10
"     let upperCharKeep = nr2char(l:splitNum+64) "D-keep
"     let lowerCharKeep = nr2char(l:splitNum+96) "a-c keep
"     let maxNum  =  a:000[0]/10
"     execute  'write! $HOME/.tmp/fileb'
"     " execute  'write! >> $HOME/.tmp/fileba'
"     call writefile(getline(1,'$'), $HOME.'/.tmp/fileba', 'a')

"     set noignorecase
"     execute  '%s/^\(\s*\)#[0-'.maxNum.']\s\?/\1/g'
"     execute  'g/^\(\s*\)#\d/d'

"     if l:upperCharKeep =='@'
"         execute  'g/^\(\s*\)#!@/d'
"     else
"         execute  '%s/^\(\s*\)#!@\s\?/\1/g'
"     endif

"     execute  '%s/^\(\s*\)#[a-'.lowerCharKeep.']\s\?/\1/g'
"     execute  'g/^\s*#['.lowerCharKeep.'-z]/d'
"     execute  '%s/^\(\s*\)#['.upperCharKeep.'-Z]\s\?/\1/g'
"     execute  'g/^\s*#[A-'.upperCharKeep.']/d'
"     execute  'g/^\s*#\s/d'
"     set ignorecase
"     echom l:lowerCharKeep
"     echom l:upperCharKeep
"     echom l:maxNum

"     " execute  'wqa'
" endfunction

" function! LoadImage2Markdown(...)
"     let paras=a:000 "a:000 is an array («List»)
"     let l:name=""
"     if len(l:paras)>0
"         let l:name  =  l:paras[0] 
"     endif
"     let l:timestamp=strftime('%y%m%d%H%M%S')
"     let l:fileName  =  l:name . l:timestamp
"     let l:index="-1"
"     if len(l:paras)>1
"         let l:index=l:paras[1]
"     endif

"     call system('rename "s/ /_/g" $HOME/Documents/Screenshots/*')
"     let l:fileDir = expand('%:p:h')
"     let l:copyFileName = system("ls -ptrah ~/Documents/Screenshots/ | grep -v / |tail ".l:index ." | head -1")
"     let l:extName=trim(fnamemodify(l:copyFileName, ":e"))
"     let l:fileNamePath=$HOME .'/Documents/Screenshots/'.l:copyFileName
"     let l:lnFileNamePath=l:fileDir.'/docs/media/'.l:fileName. '.'.l:extName

"     " let l:copyFileName = substitute(l:copyFileName, ' ', '\\ ', 'g')
"     " echom l:fileDir."/docs/media/"
"     :call mkdir(l:fileDir."/docs/media/", "p")
"     let l:commandString=join(split('ln '. l:fileNamePath.' '.l:lnFileNamePath),' ')
"     :call system(l:commandString)
"     " 当参数大于三个会显示
"     if len(l:paras) >2
"         echom l:commandString
"         let l:commandString=join(split('open ' .l:lnFileNamePath),' ')
"         echom l:commandString
"         :call system(l:commandString)
"     endif
"     :call append(line('.')-1, ['!['.l:name.'](docs/media/'.l:fileName.'.'.l:extName.')'])
" endfunction

" function! CopyLinkFile2clipboard(...)
"     let paras=a:000 "a:000 is an array («List»)
"   " call system("osascript -e 'set the clipboard to (read (POSIX file "'"'"/Users/bj00173ml/Desktop/test.png"'"'") as JPEG picture)'")
"     let imagePath = substitute(getline('.'), '.*(\(.*\)).*', '\1', '')
"     let fileDir = expand('%:p:h')
"     let filePath=fileDir.'/'.imagePath
"     let l:extName=trim(fnamemodify(l:filePath, ":e"))
"     " let commandString  = join(split("osascript -e " . "'set the clipboard to (read (POSIX file ".'"'.fileDir.'/'.imagePath.'"'. ") as JPEG picture)'")," ")
"     let commandString  = join(split("osascript -e " . "'tell app \"Finder\" to set the clipboard to ( POSIX file \"" . l:filePath. "\" )'")," ")
"     
"     echom commandString
"     call system(commandString)
"     if len(l:paras)>0
"         let commandString=join(split('open '.l:filePath)," ")
"         echom commandString
"         call system(commandString)
"     endif
" endfunction

" function! CopyMarkdown2clipboard(...)
"     let paras=a:000 "a:000 is an array («List»)
"     let fileDir = expand('%:p:h')
"     let markdownText=getreg('"',1,1)
"     " let markdownText=getreg('"')
"     for i in range(0,len(markdownText)-1)
"         " 删除<>备注
"         " let markdownText[i] = substitute(markdownText[i], '<!--.*-->', '\1', 'g')
"         let markdownText[i] = substitute(markdownText[i], '<.\{-}>', '\1', 'g')
"         " 处理图片
"         let markdownText[i] = substitute(markdownText[i], '\!\[.*\](\(.*\))', '[【如图】]('.fileDir . '/\1)', 'g')
"     endfor
"     if len(l:paras)>0
"         echom markdownText
"     endif
"     call setreg('+',l:markdownText[0:-1])
" " execute 's/:/' . escape(getreg('0'), '/')
" endfunction

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

" function! SurroundString(surround)
"     execute "normal! \<esc>\<esc>gvd"
"     let the_register_raw = getreg('"')
"     let line = getline('.')
"     silent! call setline('.', strpart(line, 0, col('.') - 1). a:surround . the_register_raw . a:surround . strpart(line, col('.') - 1))
" endfunction

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
"     " execute  'write! >> $HOME/.tmp/fileba'
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
" " cabbrev yyy   call writefile(getreg('"', 1, 1), $HOME.'/.tmp/filey') \| call setreg('q',@")
" cabbrev yyy  call writefile(getreg('"', 1, 1), $HOME."/.tmp/filer")  \| call setreg('+',getline('.')) \| call setreg('l',getline('.')) \| call writefile([getline('.')], $HOME.'/.tmp/filel')  \| write! $HOME/.tmp/filef 
" cabbrev yyy1 call writefile(getreg('"', 1, 1), $HOME."/.tmp/filer1") \| call setreg('+',getline('.')) \| call setreg('l',getline('.')) \| call writefile([getline('.')], $HOME.'/.tmp/filel1') \| write! $HOME/.tmp/filef1 
" " cabbrev swq  :execute('write! $HOME/.tmp/fileb') \| execute('g/^[\s\t]*#/d') \| execute('wqa')
" cabbrev sw  :write! $HOME/.tmp/fileb \| g/^\s*#/d
" cabbrev y4l  call writefile([getline('.')], $HOME.'/.tmp/filel') \| call setreg('+',getline('.')) \| call setreg('l',getline('.'))
" cabbrev y4r  call writefile(getreg('"', 1, 1), $HOME.'/.tmp/fileu')                                     
" cabbrev yfp   call writefile([expand("%:p")],   $HOME."/.tmp/filep") <Bar> call system('printf "'. expand("%:p") . '" \|pbcopy \|xsel -i -b ') 
" cabbrev yfd   call writefile([expand("%:p:h")], $HOME."/.tmp/filep") <Bar> call system('printf "'. expand("%:p") . '" \|pbcopy \|xsel -i -b ') 
" cabbrev ypwd  call writefile([getcwd()], $HOME."/.tmp/filep")
" cabbrev y2r  call system('xsel -i -b ', @")                           
" cabbrev y2x  .write !xsel -i -b    
" cabbrev y2y  .write! $HOME/.tmp/filey
" cabbrev y2f  write! $HOME/.tmp/filef
" cabbrev y2f2  write! $HOME/.tmp/filef2
" cabbrev y2l  .write! $HOME/.tmp/filel
" cabbrev y2u  .write! $HOME/.tmp/fileu
" cabbrev y2i  .write! $HOME/.tmp/filei
" cabbrev y2o  .write! $HOME/.tmp/fileo
" cabbrev y2s  .write! $HOME/.tmp/files
" cabbrev a2y  write! >> $HOME/.tmp/filey
" cabbrev a2f  write! >> $HOME/.tmp/filef
" cabbrev a2f2 write! >> $HOME/.tmp/filef2
" cabbrev a2l  write! >> $HOME/.tmp/filel
" cabbrev a2u  write! >> $HOME/.tmp/fileu
" cabbrev a2i  write! >> $HOME/.tmp/filei
" cabbrev a2o  write! >> $HOME/.tmp/fileo
" cabbrev a2s  write! >> $HOME/.tmp/files
" " past ctrl+r a:past register in command line
" cabbrev ppp  normal "+p
" cabbrev p4b  r $HOME/.tmp/fileb
" cabbrev p4B  r $HOME/.tmp/fileB
" cabbrev p4d  r $HOME/Desktop/tmp.md
" cabbrev p4y  r $HOME/.tmp/filey
" cabbrev p4u  r $HOME/.tmp/fileu
" cabbrev p4i  r $HOME/.tmp/filei
" cabbrev p4p  r $HOME/.tmp/filep
" cabbrev p4f  r $HOME/.tmp/filef
" cabbrev p4l  r $HOME/.tmp/filel
" cabbrev p4r  r $HOME/.tmp/filer
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
" cabbrev tce    s/[^\x00-\xff]\+/\=trim(system('trans -b :en ' . submatch(0)))/                  " translate chinese to english
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
" cabbrev mks   execute 'mksession! $HOME/.tmp/' . fnamemodify(getcwd(), ':t') .strftime("_%y%m%d_%H%M%S", localtime()). '.session.vim'
" cabbrev mksl  execute 'mksession! session.vim'
" cabbrev figlet  r!figlet -w 90 -f big -c DC.Melo 2021/08/07
" cabbrev tcfile !touch %:p:h/name.java
" cabbrev tsfile !trash %:p:h/name.java
" cabbrev regc :for i in range(34,122) \| silent! call setreg(nr2char(i), []) \| endfor
" cabbrev CleanRegw call setreg('w', [])
" command!   -nargs=1 Mkfile    execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> execute('silent! !touch "<args>"') <Bar>  e <args> <Bar> redraw!
" command!   -nargs=1 MkDir     execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>
" command!   W :execute ':silent w !sudo tee % > /dev/null' | :edit!
" " command!   WQA :execute ':silent write! $HOME/.tmp/fileb' <Bar> :execute ':silent write! >> $HOME/.tmp/fileB' <Bar> :wqa
" command!   WQA :execute ':silent write! $HOME/.tmp/fileb' <Bar> :call writefile(getline(1,'$'), $HOME.'/.tmp/fileba', 'a')  <Bar> :wqa


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
