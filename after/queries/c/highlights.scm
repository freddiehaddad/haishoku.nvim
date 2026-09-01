; extends

((call_expression
   function: (field_expression
     field: (field_identifier) @function.call))
 (#set! priority 200))

([(null) (true) (false)] @constant.builtin (#set! priority 200))
