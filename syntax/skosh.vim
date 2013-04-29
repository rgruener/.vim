" Vim syntax file
" Language:	Skosh template
" Maintainer: Robert Gruener
" Last Change:	2012 July 23

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

" Mark illegal characters
syn match djangoError "}|$\|}}\|--}\$"

" Django template built-in tags and parameters
" 'comment' doesn't appear here because it gets special treatment
" FIXME ==, !=, <, >, <=, and >= should be djangoStatements:
" syn keyword djangoStatement contained == != < > <= >=
syn keyword djangoStatement contained and as or not in
syn keyword djangoStatement contained IF ELSE ENDIF ELIF INCLUDE DEF ENDDEF
syn keyword djangoStatement contained FOR ENDFOR

" Django templete built-in filters
syn keyword djangoFilter contained add addslashes capfirst center cut date
syn keyword djangoFilter contained default default_if_none dictsort
syn keyword djangoFilter contained dictsortreversed divisibleby escape escapejs
syn keyword djangoFilter contained filesizeformat first fix_ampersands
syn keyword djangoFilter contained floatformat get_digit join last length length_is
syn keyword djangoFilter contained linebreaks linebreaksbr linenumbers ljust
syn keyword djangoFilter contained lower make_list phone2numeric pluralize
syn keyword djangoFilter contained pprint random removetags rjust slice slugify
syn keyword djangoFilter contained safe safeseq stringformat striptags
syn keyword djangoFilter contained time timesince timeuntil title truncatechars
syn keyword djangoFilter contained truncatewords truncatewords_html unordered_list upper urlencode
syn keyword djangoFilter contained urlize urlizetrunc wordcount wordwrap yesno

" Keywords to highlight within comments
syn keyword djangoTodo contained TODO FIXME XXX

" Django template constants (always surrounded by double quotes)
syn region djangoArgument contained start=/"/ skip=/\\"/ end=/"/

" Mark illegal characters within tag and variables blocks
syn match djangoTagError contained "#}\|{{\|[^%]}}\|[&#]"
syn match djangoVarError contained "#}\|{%\|%}\|[<>!&#%]"

" Django template tag and variable blocks
syn region djangoTagBlock start="\${" end="}\$" contains=djangoStatement,djangoFilter,djangoArgument,djangoTagError display
syn region djangoVarBlock start="\$" end="\$" contains=djangoFilter,djangoArgument,djangoVarError display

" Django template 'comment' tag and comment block
syn region djangoComment start="\${-" end="}\$" contains=djangoTodo
syn region djangoComBlock start="\${--" end="--}\$" contains=djangoTodo

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_django_syn_inits")
  if version < 508
    let did_django_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink djangoTagBlock PreProc
  HiLink djangoVarBlock PreProc
  HiLink djangoStatement Statement
  HiLink djangoFilter Identifier
  HiLink djangoArgument Constant
  HiLink djangoTagError Error
  HiLink djangoVarError Error
  HiLink djangoError Error
  HiLink djangoComment Comment
  HiLink djangoComBlock Comment
  HiLink djangoTodo Todo

  delcommand HiLink
endif

let b:current_syntax = "skosh"
