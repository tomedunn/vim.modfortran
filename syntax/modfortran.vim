" Vim syntax file
" Language:	Fortran90
" Version:	0.0.1
" Last Change:	2015 August 16
" Maintainer:	Tom Dunn
" Usage:	For instructions, do :help fortran-syntax from Vim
" Credits:
"  To be addec
"
" Can find original syntax file in /usr/share/vim/vim73/syntax/fortran.vim

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

let b:include_fortran77 = 1
let b:include_fortran90 = 1
let b:include_fortran95 = 1
let b:include_fortran98 = 1
let b:include_fortran03 = 1
let b:include_fortran08 = 1



" Fortran 1977
if b:include_fortran77
  " constants
  syn match fortranConstantLogic "\.\s*\(true\|false\)\s*\."
  syn match fortranConstantNumeric "\v[\+\-]?(\d+)(_\w+)?"
  syn match fortranConstantNumeric "\v[\+\-]?(\d*\.\d+([de][\+\-]?\d+)?)(_\w+)?"
  syn match fortranConstantNumeric "\v[\+\-]?(\d+\.\d*([de][\+\-]?\d+)?)(_\w+)?"
  syn region fortranConstantString start=+'+ end=+'+ contains=fortranContinueMark
  syn region fortranConstantString start=+"+ end=+"+ contains=fortranContinueMark

  " operators
  syn match fortranOperator	"\(//\)"
  syn match fortranOperator	"\(+\|-\|/\|\*\*\|\*\)"
  syn match fortranOperator	"\.\s*\(and\|eq\|eqv\|le\|lt\|ge\|gt\|ne\|neqv\|not\|or\)\s*\."

  " program
  syn match fortranKeywordProgram "\<program\>" contained
  syn match fortranKeywordEndProgram "\<end\(\s*program\)\?\>" contained
  syn match fortranNameProgram "\(program\)\@<=\s\+\a\w*" contained
  syn region fortranProgram transparent keepend start="\<program\s\+\z(\a\w*\)\>" end="\<end\s*\(program\(\s\+\z1\>\)\=\|$\)" contains=fortranKeywordProgram,fortranKeywordEndProgram,fortranNameProgram,fortranContains

  " function
  syn match fortranKeywordFunction "\<function\>" contained
  syn match fortranKeywordEndFunction "\<end\(\s*function\)\?\>" contained
  syn match fortranNameFunction "\(function\)\@<=\s\+\a\w*" contained
  syn region fortranFunction transparent keepend extend start="\<function\s\+\z(\a\w*\)\>" end="\<end\s*\(function\(\s\+\z1\>\)\=\|$\)" contained contains=fortranKeywordFunction,fortranKeywordEndFunction,fortranNameFunction,fortranContains
  syn region fortranWrapperFunction transparent keepend start="\(.*\<function\)\@=" end="[!;\n]\@=" contains=fortranAttributeFunction,fortranFunction

  " subroutine
  syn match fortranKeywordSubroutine "\<subroutine\>" contained
  syn match fortranKeywordEndSubroutine "\<end\(\s*subroutine\)\?\>" contained
  syn match fortranNameSubroutine "\(subroutine\)\@<=\s\+\a\w*" contained
  syn region fortranSubroutine transparent keepend extend start="\<subroutine\s\+\z(\a\w*\)\>" end="\<end\s*\(subroutine\(\s\+\z1\>\)\=\|$\)" contained contains=fortranKeywordSubroutine,fortranKeywordEndSubroutine,fortranNameSubroutine,fortranContains
  syn region fortranWrapperSubroutine transparent keepend start="\(.*\<subroutine\)\@=" end="[!;\n]\@=" contains=fortranAttributeSubroutine,fortranSubroutine

  " contains
  syn match fortranKeywordContains "\<contains\>" contained
  syn region fortranContains transparent keepend start="\<contains\>" end="\(\s*\<end\)\@=" contains=fortranKeywordContains,fortranWrapperFunction,fortranWrapperSubroutine

  " control statements
  syn match fortranStatementCall "\<call\>"
  syn match fortranStatementContinue "\<continue\>"
  syn match fortranStatementEntry "\<entry\>"
  syn match fortranStatementGoTo "<go\s*to\>"
  syn match fortranStatementPause "\<pause\>"
  syn match fortranStatementReturn "\<return\>"
  syn match fortranStatementStop "\<stop\>"

  " IO statements
  syn match fortranStatementIO "\<\(backspace\|close\|endfile\|inquire\|open\|rewind\|write\)\>\(\s*(\)\@="
  syn match fortranStatementIO "\<\(format\|print\|read\)\>"

  " intrinsic functions
  syn match fortranIntrinsic "\<\([cdi]\?abs\|acos\|[ad]int\|[ad]nint\|aimag\|amax[01]\|amin[01]\|d\?asin\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(d\?atan\|d\?atan2\|char\|conjg\|[cd]\?cos\|d\?cosh\|cmplx\|dble\|i\?dim\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(dmax1\|dmin1\|dprod\|[cd]\?exp\|float\|ichar\|idint\|ifix\|index\|int\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(len\|lg[et]\|ll[et]\|[acd]\?log\|[ad]\?log10\|max[01]\?\|min[01]\?\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\([ad]\?mod\|nint\|idnint\|real\|[di]\?sign\|[cd]\?sin\|d\?sinh\|sngl\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\([cd]\?sqrt\|d\?tan\|d\?tanh\)\>\(\s*(\)\@="
endif

" Fortran 1990
if b:include_fortran90
  " comments
  syn region fortranComment start="!" end="\n\@="

  " operators
  syn match fortranOperator	"\(=\|==\|\\=\|<\|<=\|>\|>=\)"
  syn match fortranOperator	"=>"
  syn match fortranOperator	"\.\s*[a-z]*\s*\."

  " control statements
  syn match fortranStatementCycle "\<cycle\>"
  syn match fortranStatementExit "\<exit\>"
  syn match fortranStatementResult "\<result\>\(\s*(\)\@="

  " function
  syn match fortranAttributeFunction "\<\(elemental\|module\|pure\|recursive\)\>" contained

  " subroutine
  syn match fortranAttributeSubroutine "\<\(elemental\|module\|non_recursive\|pure\|recursive\)\>" contained

  " module
  syn match fortranKeywordModule "\<module\>" contained
  syn match fortranKeywordEndModule "\<end\(\s*module\)\?\>" contained
  syn match fortranNameModule "\(module\)\@<=\s\+\a\w*" contained
  syn region fortranModule transparent keepend start="\<module\s\+\z(\a\w*\)\>" end="\<end\s*\(module\(\s\+\z1\>\)\=\|$\)" contains=fortranKeywordModule,fortranKeywordEndModule,fortranNameModule,fortranContains

  " execution statements
  syn match fortranStatementExecution "\<\(allocate\|deallocate\|nullify\)\>\(\s*(\)\@="

  " intrinsic functions
  syn match fortranIntrinsic "\<\(achar\|adjust[lr]\|all\|allocated\|associated\|any\|bit_size\|btest\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(ceiling\|count\|cshift\|digits\|dot_product\|eoshift\|epsilon\|exponent\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(floor\|fraction\|huge\|iachar\|iand\|ibclr\|ibits\|ibset\|ieor\|ior\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(ishftc\?\|kind\|lbound\|len_trim\|logical\|matmul\|maxexponent\|maxloc\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(maxval\|merge\|min\(exponent\|loc\|val\)\|modulo\|nearest\|not\|pack\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(precision\|present\|product\|radix\|range\|repeat\|reshape\|rrspacing\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(scale\|scan\|selected_\(int\|real\)_kind\|set_exponent\|shape\|size\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(spacing\|spread\|sum\|tiny\|transfer\|transpose\|trim\|ubound\|unpack\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(verify\)\>\(\s*(\)\@="
endif


" Fortran 1995
if b:include_fortran95
  " operators
  syn match fortranOperator	"%"

  " intrinsic functions
  syn match fortranIntrinsic "\<\(null\)\>\(\s*(\)\@="
endif

" Fortran 2003
if b:include_fortran03
  " IO statements
  syn match fortranStatementIO "\<\(flush\|wait\)\>\(\s*(\)\@="

  " intrinsic functions
  syn match fortranIntrinsic "\<\(command_argument_count\|extends_type_of\|is_iostat_\(end\|eor\)\|new_line\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(same_type_as\|selected_char_kind\)\>\(\s*(\)\@="
  " IEEE_ARITHMETIC functions
  syn match fortranIntrinsic "\<\(ieee_\(class\|copy_sign\|is_\(finite\|nan\|normal\)\|logb\|next_after\)\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(ieee_\(rem\|rint\|scalb\|selected_real_kind\)\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(ieee_support_\(datatype\|denormal\|divide\|inf\|io\|nan\)\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(ieee_support_\(rounding\|sqrt\|standard\|underflow_control\)\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(ieee_\(unordered\|value\)\)\>\(\s*(\)\@="
  " IEEE_EXCEPTIONS functions
  syn match fortranIntrinsic "\<\(ieee_support_\(flag\|halting\)\)\>\(\s*(\)\@="
  " ISO_C_BINDING functions
  syn match fortranIntrinsic "\<\(c_\(associated\|funloc\|loc\|sizeof\)\)\>\(\s*(\)\@="
  " ISO_FORTRAN_ENV functions
  syn match fortranIntrinsic "\<\(compiler_\(options\|version\)\)\>\(\s*(\)\@="
endif

" Fortran 2008
if b:include_fortran08
  " submodule
  syn match fortranKeywordSubmodule "\<submodule\>" contained
  syn match fortranKeywordEndSubmodule "\<end\(\s*submodule\)\?\>" contained
  syn match fortranNameSubmodule "\(submodule\)\@<=\s\+\a\w*" contained
  syn region fortranSubmodule transparent keepend start="\<submodule\s*(\s*\a\w*\s*)\s*\z(\a\w*\)\>" end="\<end\s*\(submodule\(\s\+\z1\>\)\=\|$\)" contains=fortranKeywordSubmodule,fortranKeywordEndSubmodule,fortranNameSubmodule,fortranContains

  " statements
  syn match fortranStatementErrorStop "\<error\s+stop\>"

  " intrinsic functions
  syn match fortranIntrinsic "\<\(acosh\|asinh\|atanh\|b[gl][et]\|dshift[lr]\|findloc\|hypot\|iall\|iany\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(image_index\|iparity\|is_contiguous\|lcobound\|leadz\|mask[lr]\|merge_bits\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(norm2\|num_images\|parity\|popcnt\|poppar\|shift[alr]\|storage_size\)\>\(\s*(\)\@="
  syn match fortranIntrinsic "\<\(this_image\|trailz\|ucobound\)\>\(\s*(\)\@="
  " FORTRAN_SPECIAL_FUNCTIONS functions
  syn match fortranIntrinsic "\<\(bessel_\(j[01n]\|y[01n]\)\|erf\(c\|c_scaled\)\?\|gamma\|log_gamma\)\>\(\s*(\)\@="
endif

syn match fortranDummyVariable "\<[a-z]\w*\>\(\s*=\)\@=" contained

syn region fortranParentheses start="(" end=")" contains=fortranDummyVariable,fortranConstant




command -nargs=+ HiLink hi def link <args>
" comments
HiLink fortranComment Comment

" Link constants
HiLink fortranConstantLogic fortranConstant
HiLink fortranConstantNumeric fortranConstant
HiLink fortranConstantString fortranConstant
HiLink fortranConstantLogic Boolean
HiLink fortranConstantNumeric Float
HiLink fortranConstantString String

" Link operators
HiLink fortranOperator Operator

" Link program units
HiLink fortranNameProgram Keyword
HiLink fortranKeywordProgram PreCondit
HiLink fortranKeywordEndProgram PreCondit

HiLink fortranNameModule Keyword
HiLink fortranKeywordModule PreCondit
HiLink fortranKeywordEndModule PreCondit

HiLink fortranNameSubmodule Keyword
HiLink fortranKeywordSubmodule PreCondit
HiLink fortranKeywordEndSubmodule PreCondit

HiLink fortranNameFunction Keyword
HiLink fortranKeywordFunction PreCondit
HiLink fortranKeywordEndFunction PreCondit
HiLink fortranAttributeFunction Keyword

HiLink fortranNameSubroutine Keyword
HiLink fortranKeywordSubroutine PreCondit
HiLink fortranKeywordEndSubroutine PreCondit
HiLink fortranAttributeSubroutine Keyword

HiLink fortranKeywordContains PreCondit


" Link control statements
HiLink fortranStatementCall Statement
HiLink fortranStatementContinue Statement
HiLink fortranStatementCycle Statement
HiLink fortranStatementDeallocate Statement
HiLink fortranStatementEntry Statement
HiLink fortranStatementErrorStop Statement
HiLink fortranStatementExit Statement
HiLink fortranStatementGoTo Statement
HiLink fortranStatementPause Statement
HiLink fortranStatementResult Statement
HiLink fortranStatementReturn Statement
HiLink fortranStatementStop Statement

" Link execution statements
HiLink fortranStatementExecution Statement
HiLink fortranStatementIO Statement

" Link functions
HiLink fortranIntrinsic Function

" Link Other
HiLink fortranDummyVariable Keyword

delcommand HiLink


let b:current_syntax = "modfortran"
