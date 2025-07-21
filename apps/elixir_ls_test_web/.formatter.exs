[
  import_deps: [:phoenix],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs:
    Enum.flat_map(
      ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}"],
      &Path.wildcard(&1, match_dot: true)
    ) -- ["lib/elixir_ls_test_web/router.ex"]
]
