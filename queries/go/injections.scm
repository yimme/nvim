; extends

((call_expression
  function: (selector_expression
    field: (field_identifier) @_method)
  arguments: (argument_list
    (raw_string_literal) @injection.content))
  (#match? @_method "^(Exec|Query|QueryRow|QueryContext|ExecContext|QueryRowContext|Prepare|PrepareContext)$")
  (#set! injection.language "sql"))
