# Fish plugin to update brew packages and casks

## Usage

Execute command `up` or `brew_update_packages` to update all installed brew stuff.
`up` is an alias for `brew_update_packages`.

## Install

```fish
fisher install kulynyak/fish.plugin-brew
```

Just in case you are using `HOMEBREW_GITHUB_API_TOKEN` — add the following code
to your `config.fish`:

```fish
set -gx HOMEBREW_GITHUB_API_TOKEN "your homebrew github api token"
```

Execute `man brew` to read about `HOMEBREW_GITHUB_API_TOKEN`.
