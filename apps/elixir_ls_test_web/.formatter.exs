# This can be called from either the root umbrella folder or this folder.
# Need to be able to match files no matter which root directory.
cwd = File.cwd!()
app = "elixir_ls_test_web"

app_directory =
  if String.ends_with?(cwd, app) do
    cwd
  else
    "#{cwd}/apps/#{app}/"
  end

[
  import_deps: [:phoenix],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs:
    (Enum.flat_map(
       ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}"],
       &Path.wildcard(Path.expand(&1, app_directory), match_dot: true)
     ) --
       Enum.map(
         ["lib/elixir_ls_test_web/router.ex"],
         &Path.expand(&1, app_directory)
       ))
    |> Enum.map(&String.trim_leading(&1, app_directory))
]
