; extends

; Labels (including local .labels omitted by upstream queries)
((label
  [
    (ident)
    (word)
    (meta_ident)
  ] @label)
  (#set! priority 120))

; Dot-prefixed assembler directives (.code, .data, .section, .globl, .allocstack, etc.)
((meta
  kind: (_) @keyword.directive)
  (#set! priority 120))

((meta
  kind: (meta_ident) @keyword.conditional)
  (#any-of? @keyword.conditional
    ".if" ".IF" ".else" ".ELSE" ".elseif" ".ELSEIF" ".elsif" ".ELSIF" ".endif" ".ENDIF")
  (#set! priority 130))

((meta
  kind: (meta_ident) @keyword.repeat)
  (#any-of? @keyword.repeat
    ".while" ".WHILE" ".endw" ".ENDW" ".repeat" ".REPEAT"
    ".until" ".UNTIL" ".untilcxz" ".UNTILCXZ" ".break" ".BREAK" ".continue" ".CONTINUE")
  (#set! priority 130))

((meta
  kind: (meta_ident) @keyword.return)
  (#any-of? @keyword.return ".exit" ".EXIT")
  (#set! priority 130))

; Size specifiers in pointer expressions
([
  "byte"
  "word"
  "dword"
  "qword"
] @type.builtin
  (#set! priority 120))

; General instructions (ISA built-in operations)
((instruction
  kind: (_) @function.builtin)
  (#set! priority 110))

; tree-sitter-asm wraps plain word operands in (reg (word)) and places
; space-separated MASM tokens (e.g. `OFFSET msg`) in (ERROR (word));
; default general words/identifiers to @variable so only real registers
; get @variable.builtin.
((word) @variable
  (#set! priority 105))

((ident) @variable
  (#set! priority 105))

; All-caps identifiers default to constants unless overridden by an instruction/directive/type/register rule
((word) @constant
  (#lua-match? @constant "^[A-Z][A-Z0-9_]*$")
  (#set! priority 108))

; Hardware registers (GAS %-prefixed, x86/x64, ARM/AArch64, RISC-V)
((reg) @variable.builtin
  (#lua-match? @variable.builtin "^%%[a-zA-Z0-9]+$")
  (#set! priority 115))

((word) @variable.builtin
  (#any-of? @variable.builtin
    ; x86 / x86_64 general purpose
    "al" "ah" "bl" "bh" "cl" "ch" "dl" "dh" "sil" "dil" "bpl" "spl"
    "AL" "AH" "BL" "BH" "CL" "CH" "DL" "DH" "SIL" "DIL" "BPL" "SPL"
    "ax" "bx" "cx" "dx" "si" "di" "bp" "sp" "ip" "flags"
    "AX" "BX" "CX" "DX" "SI" "DI" "BP" "SP" "IP" "FLAGS"
    "eax" "ebx" "ecx" "edx" "esi" "edi" "ebp" "esp" "eip" "eflags"
    "EAX" "EBX" "ECX" "EDX" "ESI" "EDI" "EBP" "ESP" "EIP" "EFLAGS"
    "rax" "rbx" "rcx" "rdx" "rsi" "rdi" "rbp" "rsp" "rip" "rflags"
    "RAX" "RBX" "RCX" "RDX" "RSI" "RDI" "RBP" "RSP" "RIP" "RFLAGS"
    "r8" "r9" "r10" "r11" "r12" "r13" "r14" "r15"
    "R8" "R9" "R10" "R11" "R12" "R13" "R14" "R15"
    "r8b" "r9b" "r10b" "r11b" "r12b" "r13b" "r14b" "r15b"
    "R8B" "R9B" "R10B" "R11B" "R12B" "R13B" "R14B" "R15B"
    "r8w" "r9w" "r10w" "r11w" "r12w" "r13w" "r14w" "r15w"
    "R8W" "R9W" "R10W" "R11W" "R12W" "R13W" "R14W" "R15W"
    "r8d" "r9d" "r10d" "r11d" "r12d" "r13d" "r14d" "r15d"
    "R8D" "R9D" "R10D" "R11D" "R12D" "R13D" "R14D" "R15D"
    ; x86 segment, control, debug, MMX, FPU, mask
    "cs" "ds" "es" "fs" "gs" "ss" "CS" "DS" "ES" "FS" "GS" "SS"
    "cr0" "cr2" "cr3" "cr4" "cr8" "CR0" "CR2" "CR3" "CR4" "CR8"
    "dr0" "dr1" "dr2" "dr3" "dr6" "dr7" "DR0" "DR1" "DR2" "DR3" "DR6" "DR7"
    "mm0" "mm1" "mm2" "mm3" "mm4" "mm5" "mm6" "mm7"
    "MM0" "MM1" "MM2" "MM3" "MM4" "MM5" "MM6" "MM7"
    "st0" "st1" "st2" "st3" "st4" "st5" "st6" "st7"
    "ST0" "ST1" "ST2" "ST3" "ST4" "ST5" "ST6" "ST7"
    "k0" "k1" "k2" "k3" "k4" "k5" "k6" "k7"
    "K0" "K1" "K2" "K3" "K4" "K5" "K6" "K7"
    ; ARM / AArch64 / RISC-V Special
    "lr" "pc" "fp" "xzr" "wzr" "cpsr" "spsr" "fpsr" "fpcr"
    "LR" "PC" "FP" "XZR" "WZR" "CPSR" "SPSR" "FPSR" "FPCR"
    "zero" "ra" "gp" "tp" "s0" "s1" "a0" "a1" "a2" "a3" "a4" "a5" "a6" "a7"
    "t0" "t1" "t2" "t3" "t4" "t5" "t6")
  (#set! priority 115))

((word) @variable.builtin
  (#lua-match? @variable.builtin "^[xXyYzZ][mM][mM][0-9]+$")
  (#set! priority 115))

((word) @variable.builtin
  (#lua-match? @variable.builtin "^[wWxXvVqQdDsShHbB][0-9]+$")
  (#set! priority 115))

; Return instructions
((instruction
  kind: (word) @keyword.return)
  (#any-of? @keyword.return
    "ret" "retn" "retf" "retq" "iret" "iretw" "iretd" "iretq"
    "sysret" "sysretq" "sysexit" "eret" "mret" "sret" "uret" "exitm"
    "RET" "RETN" "RETF" "RETQ" "IRET" "IRETW" "IRETD" "IRETQ"
    "SYSRET" "SYSRETQ" "SYSEXIT" "ERET" "MRET" "SRET" "URET" "EXITM")
  (#set! priority 130))

; Loop instructions & directives
((instruction
  kind: (word) @keyword.repeat)
  (#any-of? @keyword.repeat
    "loop" "loope" "loopne" "loopz" "loopnz"
    "repeat" "rept" "while" "for" "forc" "irp" "irpc"
    "LOOP" "LOOPE" "LOOPNE" "LOOPZ" "LOOPNZ"
    "REPEAT" "REPT" "WHILE" "FOR" "FORC" "IRP" "IRPC")
  (#set! priority 130))

; Branch, jump, call, and interrupt instructions
((instruction
  kind: (word) @keyword.conditional)
  (#any-of? @keyword.conditional
    "jmp" "ljmp" "je" "jne" "jz" "jnz" "jg" "jge" "jl" "jle"
    "ja" "jae" "jb" "jbe" "jc" "jnc" "jo" "jno" "js" "jns"
    "jp" "jnp" "jpe" "jpo" "jcxz" "jecxz" "jrcxz"
    "JMP" "LJMP" "JE" "JNE" "JZ" "JNZ" "JG" "JGE" "JL" "JLE"
    "JA" "JAE" "JB" "JBE" "JC" "JNC" "JO" "JNO" "JS" "JNS"
    "JP" "JNP" "JPE" "JPO" "JCXZ" "JECXZ" "JRCXZ"
    "b" "bl" "bx" "blx" "beq" "bne" "bgt" "blt" "bge" "ble"
    "bhi" "blo" "bhs" "bls" "bpl" "bmi" "bvs" "bvc" "bal"
    "cbz" "cbnz" "tbz" "tbnz" "bltu" "bgeu" "beqz" "bnez"
    "B" "BL" "BX" "BLX" "BEQ" "BNE" "BGT" "BLT" "BGE" "BLE"
    "BHI" "BLO" "BHS" "BLS" "BPL" "BMI" "BVS" "BVC" "BAL"
    "CBZ" "CBNZ" "TBZ" "TBNZ" "BLTU" "BGEU" "BEQZ" "BNEZ"
    "j" "jr" "jal" "jalr" "call" "callq" "lcall" "invoke" "goto"
    "J" "JR" "JAL" "JALR" "CALL" "CALLQ" "LCALL" "INVOKE" "GOTO"
    "syscall" "sysenter" "int" "into" "int3" "svc" "hvc" "smc" "ecall" "ebreak"
    "SYSCALL" "SYSENTER" "INT" "INTO" "INT3" "SVC" "HVC" "SMC" "ECALL" "EBREAK"
    "if" "ife" "ifb" "ifnb" "ifdef" "ifndef" "ifdif" "ifdifi" "ifidn" "ifidni"
    "if1" "if2" "else" "elseif" "elseif1" "elseif2" "elseifb" "elseifnb" "endif"
    "IF" "IFE" "IFB" "IFNB" "IFDEF" "IFNDEF" "IFDIF" "IFDIFI" "IFIDN" "IFIDNI"
    "IF1" "IF2" "ELSE" "ELSEIF" "ELSEIF1" "ELSEIF2" "ELSEIFB" "ELSEIFNB" "ENDIF")
  (#set! priority 130))

; Call / invoke / jump target operands
((instruction
  kind: (word) @_op
  .
  (ident) @function.call)
  (#any-of? @_op
    "call" "callq" "lcall" "bl" "jal" "invoke"
    "CALL" "CALLQ" "LCALL" "BL" "JAL" "INVOKE")
  (#set! priority 112))

((instruction
  kind: (word) @_op
  .
  (ident) @label)
  (#any-of? @_op
    "jmp" "ljmp" "je" "jne" "jz" "jnz" "jg" "jge" "jl" "jle"
    "ja" "jae" "jb" "jbe" "jc" "jnc" "jo" "jno" "js" "jns"
    "jp" "jnp" "jpe" "jpo" "jcxz" "jecxz" "jrcxz"
    "loop" "loope" "loopne" "loopz" "loopnz"
    "JMP" "LJMP" "JE" "JNE" "JZ" "JNZ" "JG" "JGE" "JL" "JLE"
    "JA" "JAE" "JB" "JBE" "JC" "JNC" "JO" "JNO" "JS" "JNS"
    "JP" "JNP" "JPE" "JPO" "JCXZ" "JECXZ" "JRCXZ"
    "LOOP" "LOOPE" "LOOPNE" "LOOPZ" "LOOPNZ"
    "b" "beq" "bne" "bgt" "blt" "bge" "ble" "bhi" "blo" "bhs" "bls"
    "j" "beqz" "bnez" "goto"
    "B" "BEQ" "BNE" "BGT" "BLT" "BGE" "BLE" "BHI" "BLO" "BHS" "BLS"
    "J" "BEQZ" "BNEZ" "GOTO")
  (#set! priority 112))

; Non-dot assembler directives (MASM / NASM / GAS)
((instruction
  kind: (word) @keyword.directive)
  (#any-of? @keyword.directive
    "section" "segment" "ends" "end" "global" "globl" "extern" "extrn" "externdef"
    "public" "common" "comm" "include" "includelib" "incbin" "option" "assume"
    "align" "even" "org" "equ" "textequ" "catstr" "instr" "sizestr" "substr"
    "macro" "endm" "local" "purge" "alias" "comment" "echo" "title" "subtitle"
    "subttl" "page" "pushcontext" "popcontext" "group" "default" "bits" "use16" "use32" "use64"
    "SECTION" "SEGMENT" "ENDS" "END" "GLOBAL" "GLOBL" "EXTERN" "EXTRN" "EXTERNDEF"
    "PUBLIC" "COMMON" "COMM" "INCLUDE" "INCLUDELIB" "INCBIN" "OPTION" "ASSUME"
    "ALIGN" "EVEN" "ORG" "EQU" "TEXTEQU" "CATSTR" "INSTR" "SIZESTR" "SUBSTR"
    "MACRO" "ENDM" "LOCAL" "PURGE" "ALIAS" "COMMENT" "ECHO" "TITLE" "SUBTITLE"
    "SUBTTL" "PAGE" "PUSHCONTEXT" "POPCONTEXT" "GROUP" "DEFAULT" "BITS" "USE16" "USE32" "USE64")
  (#set! priority 130))

; MASM procedure declarations: `name PROC` / `name ENDP` / `name PROTO`
((instruction
  kind: (word) @function
  .
  (ident
    (reg
      (word) @keyword.function)))
  (#any-of? @keyword.function "proc" "endp" "proto" "PROC" "ENDP" "PROTO")
  (#set! priority 130))

; MASM constant definitions: `NAME EQU expr` / `NAME TEXTEQU expr`
((instruction
  kind: (word) @constant
  .
  (ident
    (reg
      (word) @keyword.directive.define)))
  (#any-of? @keyword.directive.define "equ" "textequ" "EQU" "TEXTEQU")
  (#set! priority 130))

; MASM macro / segment definitions: `name MACRO` / `name SEGMENT` / `name ENDS`
((instruction
  kind: (word) @function.macro
  .
  (ident
    (reg
      (word) @keyword.directive)))
  (#any-of? @keyword.directive "macro" "segment" "ends" "MACRO" "SEGMENT" "ENDS")
  (#set! priority 130))

; MASM type definitions: `name STRUCT` / `name UNION` / `name RECORD` / `name TYPEDEF`
((instruction
  kind: (word) @type
  .
  (ident
    (reg
      (word) @keyword.type)))
  (#any-of? @keyword.type
    "struct" "struc" "union" "record" "typedef"
    "STRUCT" "STRUC" "UNION" "RECORD" "TYPEDEF")
  (#set! priority 130))

; Data allocation & size specifiers (standalone or `var BYTE ...`)
((instruction
  kind: (word) @type.builtin)
  (#any-of? @type.builtin
    "db" "dw" "dd" "df" "dq" "dt" "do" "dy" "dz"
    "resb" "resw" "resd" "resq" "rest" "reso" "resy" "resz"
    "byte" "sbyte" "word" "sword" "dword" "sdword" "fword" "qword" "sqword"
    "tbyte" "tword" "oword" "mmword" "xmmword" "ymmword" "yword" "zmmword" "zword"
    "real4" "real8" "real10" "boolean" "hwnd"
    "DB" "DW" "DD" "DF" "DQ" "DT" "DO" "DY" "DZ"
    "RESB" "RESW" "RESD" "RESQ" "REST" "RESO" "RESY" "RESZ"
    "BYTE" "SBYTE" "WORD" "SWORD" "DWORD" "SDWORD" "FWORD" "QWORD" "SQWORD"
    "TBYTE" "TWORD" "OWORD" "MMWORD" "XMMWORD" "YMMWORD" "YWORD" "ZMMWORD" "ZWORD"
    "REAL4" "REAL8" "REAL10" "BOOLEAN" "HWND")
  (#set! priority 130))

((instruction
  kind: (word) @variable
  .
  (ident
    (reg
      (word) @type.builtin)))
  (#any-of? @type.builtin
    "db" "dw" "dd" "df" "dq" "dt" "do" "dy" "dz"
    "resb" "resw" "resd" "resq" "rest" "reso" "resy" "resz"
    "byte" "sbyte" "word" "sword" "dword" "sdword" "fword" "qword" "sqword"
    "tbyte" "tword" "oword" "mmword" "xmmword" "ymmword" "yword" "zmmword" "zword"
    "real4" "real8" "real10" "boolean" "hwnd"
    "DB" "DW" "DD" "DF" "DQ" "DT" "DO" "DY" "DZ"
    "RESB" "RESW" "RESD" "RESQ" "REST" "RESO" "RESY" "RESZ"
    "BYTE" "SBYTE" "WORD" "SWORD" "DWORD" "SDWORD" "FWORD" "QWORD" "SQWORD"
    "TBYTE" "TWORD" "OWORD" "MMWORD" "XMMWORD" "YMMWORD" "YWORD" "ZMMWORD" "ZWORD"
    "REAL4" "REAL8" "REAL10" "BOOLEAN" "HWND")
  (#set! priority 130))

((word) @type.builtin
  (#any-of? @type.builtin
    "byte" "sbyte" "word" "sword" "dword" "sdword" "fword" "qword" "sqword"
    "tbyte" "tword" "oword" "mmword" "xmmword" "ymmword" "yword" "zmmword" "zword"
    "real4" "real8" "real10" "boolean" "hwnd"
    "BYTE" "SBYTE" "WORD" "SWORD" "DWORD" "SDWORD" "FWORD" "QWORD" "SQWORD"
    "TBYTE" "TWORD" "OWORD" "MMWORD" "XMMWORD" "YMMWORD" "YWORD" "ZMMWORD" "ZWORD"
    "REAL4" "REAL8" "REAL10" "BOOLEAN" "HWND")
  (#set! priority 125))

; Assembly operators & qualifiers (PTR, OFFSET, ADDR, DUP, FRAME, SHORT, etc.)
((word) @keyword
  (#any-of? @keyword
    "ptr" "rel" "offset" "addr" "short" "near" "far" "flat" "uses" "frame"
    "dup" "times" "sizeof" "lengthof" "type" "opattr"
    "low" "high" "lowword" "highword" "low32" "high32"
    "imagerel" "sectionrel" "lroffset" "seg" "this" "mask" "width" "proc"
    "PTR" "REL" "OFFSET" "ADDR" "SHORT" "NEAR" "FAR" "FLAT" "USES" "FRAME"
    "DUP" "TIMES" "SIZEOF" "LENGTHOF" "TYPE" "OPATTR"
    "LOW" "HIGH" "LOWWORD" "HIGHWORD" "LOW32" "HIGH32"
    "IMAGEREL" "SECTIONREL" "LROFFSET" "SEG" "THIS" "MASK" "WIDTH" "PROC")
  (#set! priority 120))
