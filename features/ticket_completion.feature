Feature: Shell Completions
  As a user
  I want to generate shell completions
  So that I get tab-completion for ticket commands

  Scenario: Generate fish completions
    When I run "ticket completion fish"
    Then the command should succeed
    And the output should contain "complete -c"
    And the output should contain "__ticket_needs_command"
    And the output should contain "__ticket_ids"

  Scenario: Fish completions cover all subcommands
    When I run "ticket completion fish"
    Then the command should succeed
    And the output should contain "create"
    And the output should contain "start"
    And the output should contain "close"
    And the output should contain "reopen"
    And the output should contain "status"
    And the output should contain "dep"
    And the output should contain "undep"
    And the output should contain "link"
    And the output should contain "unlink"
    And the output should contain "ready"
    And the output should contain "blocked"
    And the output should contain "show"
    And the output should contain "edit"
    And the output should contain "add-note"
    And the output should contain "query"
    And the output should contain "completion"
    And the output should contain "help"

  Scenario: Fish completions register for both ticket and tk
    When I run "ticket completion fish"
    Then the command should succeed
    And the output should contain "for __ticket_cmd in ticket tk"

  Scenario: Completion with no shell argument shows usage
    When I run "ticket completion"
    Then the command should fail
    And the output should contain "Usage:"
    And the output should contain "fish"

  Scenario: Completion with unsupported shell shows error
    When I run "ticket completion zsh"
    Then the command should fail
    And the output should contain "Unsupported shell: zsh"
    And the output should contain "fish"

  Scenario: Help includes completion command
    When I run "ticket help"
    Then the command should succeed
    And the output should contain "completion"
