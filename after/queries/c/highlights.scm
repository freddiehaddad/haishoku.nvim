; extends

((call_expression
   function: (identifier) @function.call)
 (#set! priority 130))

((call_expression
   function: (field_expression
     field: (field_identifier) @function.call))
 (#set! priority 130))

([(null) (true) (false)] @constant.builtin (#set! priority 130))
