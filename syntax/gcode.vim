" Vim syntax file
" Language: RS274/NGC
" Original Creator: Gary Fixler <gfixler.emc@gmail.com>
" Modifications: Greg Jurman <jurman.greg@gmail.com>
" Last Change: 2014 Apr 15

if exists("b:current_syntax")
    finish
endif

syn case ignore

syntax match gcodeConstant /\(\-\=[.0-9]*\)/
syntax keyword gcodeConditional if else endif
syntax keyword gcodeRepeat do while endwhile break continue end goto
syntax keyword gcodeFunction sub endsub call return
syntax keyword gcodeOperator EQ NE GT GE LT LE ABS ACOS ASIN ATAN COS EXP FIX FUP LN ROUND SIN SQRT TAN MOD AND OR
syntax match gcodeOperatorPunc "[%\-+*/\[\]]"
syntax match gcodeFileBlock /^%$/
syntax match gcodeProgramID /\(O[0-9][0-9]*\|:[0-9][0-9]*\)/
syntax match gcodeIdentifier /#<*[A-Z_0-9]*>*/
syntax match gcodeLineNumbers /\(n[0-9][0-9]*\)/
syntax keyword gcodeTodo TODO FIXME XXX contained
syntax match gcodeComment /(.*)/ contains=gcodeTodo
syntax match gcodeMessage /(\s*MSG\s*,.*)/ contains=gcodeIdentifier
syntax match gcodeLogOpen /(\s*LOGOPEN\s*,.*)/
syntax match gcodeLogClose /(\s*LOGCLOSE\s*)/
syntax match gcodeLog /(\s*LOG\s*,.*)/ contains=gcodeIdentifier
syntax match gcodePrint /(\s*PRINT\s*,.*)/ contains=gcodeIdentifier
syntax match gcodeDebug /(\s*DEBUG\s*,.*)/ contains=gcodeIdentifier
syntax match gcodeGCodes /\s*\(g[0-9][0-9]*\)/
syntax match gcodeGCodesAlt /\s*\(g[0-9][0-9]*\.[0-9]\)/
syntax match gcodeMCodes /\s*\(m[0-9][0-9]*\)/
syntax match gcodeAxes /\s*\([abc][-#]*[0-9.][.]*[0-9]*\)/ contains=gcodeIdentifier
syntax match gcodeXAxis /\s*\([xui][-#]*[0-9.][.]*[0-9]*\)/ contains=gcodeIdentifier
syntax match gcodeYAxis /\s*\([yvj][-#]*[0-9.][.]*[0-9]*\)/ contains=gcodeIdentifier
syntax match gcodeZAxis /\s*\([zwk][-#]*[0-9.][.]*[0-9]*\)/ contains=gcodeIdentifier
syntax match gcodeSpecials /\s*\(,[c][#-]*[0-9.][.]*[0-9]*\|[relpqds][-#]*[0-9.][.]*[0-9]*\)\s*/ contains=gcodeIdentifier
syntax match gcodeFeed /\s*\([f][0-9.][.]*[0-9]*\)/
syntax match gcodeTool /[ht][0-9][0-9]*/
syntax match gcodeBlockSkip /^\/.*/

highlight gcodeFileBlock ctermfg=White ctermbg=Red cterm=bold
highlight gcodeProgramID ctermfg=White cterm=bold
highlight gcodeXAxis ctermfg=34
highlight gcodeYAxis ctermfg=20
highlight gcodeZAxis ctermfg=124
highlight gcodeAxes ctermfg=102
highlight gcodeSpecials ctermfg=101
highlight gcodeBlockSkip ctermfg=White cterm=bold
highlight link gcodeConstant Constant
highlight link gcodeConditional Conditional
highlight link gcodeRepeat Repeat
highlight link gcodeFunction Function
highlight link gcodeOperator Operator
highlight link gcodeOperatorPunc Operator
highlight link gcodeIdentifier Identifier
highlight link gcodeLabel Label
highlight link gcodeLineNumbers Label
highlight link gcodeTodo Todo
highlight link gcodeComment Comment
highlight link gcodeMessage SpecialComment
highlight link gcodeLogOpen SpecialComment
highlight link gcodeLogClose SpecialComment
highlight link gcodeLog SpecialComment
highlight link gcodePrint SpecialComment
highlight link gcodeDebug Debug
highlight link gcodeGCodes Keyword
highlight link gcodeGCodesAlt Keyword
highlight link gcodeMCodes Keyword
highlight link gcodeAxes SpecialChar
highlight gcodeFeed ctermfg=89
highlight gcodeTool ctermfg=94

let b:current_syntax = "gcode"
