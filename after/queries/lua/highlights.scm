; extends

((break_statement) @keyword.repeat
  (#set! priority 110))

("in" @keyword.repeat
  (#set! priority 110))

("goto" @keyword.conditional
  (#set! priority 110))

((identifier) @module.builtin
  (#eq? @module.builtin "coroutine")
  (#set! priority 110))

((variable_list
  name: (identifier) @constant
  .
  (attribute
    (identifier) @_attribute))
  (#eq? @_attribute "const")
  (#set! priority 110))

; LuaLS includes the brackets in its attribute token.
((attribute
  ["<" ">"] @punctuation.bracket)
  (#set! priority 130))

; LuaLS can emit a synthetic self token on the method separator.
((method_index_expression
  ":" @punctuation.delimiter)
  (#set! priority 130))

; Function-valued table fields are reported as properties by LuaLS.
((field
  name: (identifier) @function
  value: (function_definition))
  (#set! priority 130))
