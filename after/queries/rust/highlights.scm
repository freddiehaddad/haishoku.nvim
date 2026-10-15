; extends

; Error propagation is an exit, not an ordinary operator.
((try_expression
  "?" @keyword.return)
  (#set! priority 130))

; async declares a future; await is the control-flow operation.
("async" @keyword
  (#set! priority 110))

((lifetime) @type
  (#set! priority 110))

((lifetime) @type.builtin
  (#any-of? @type.builtin "'static" "'_")
  (#set! priority 130))

((const_parameter
  name: (identifier) @constant)
  (#set! priority 110))

((static_item
  name: (identifier) @variable)
  (#set! priority 110))

((macro_definition
  name: (identifier) @function.macro)
  (#set! priority 130))

; Macros are definitions, including panic!, assert*! and dbg!.
((macro_invocation
  macro: [
    (identifier) @function.macro
    (scoped_identifier
      name: (identifier) @function.macro)
  ]
  "!" @function.macro)
  (#set! priority 130))

((attribute
  (identifier) @_attribute
  arguments: (token_tree
    (identifier) @function.macro))
  (#eq? @_attribute "derive")
  (#set! priority 130))
