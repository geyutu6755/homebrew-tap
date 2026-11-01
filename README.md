# homebrew-tap

Homebrew tap for [shipsmoke](https://github.com/geyutu6755/shipsmoke) —
verify that release artifacts (zip, tar.gz, binaries) actually extract and
run on the target OS.

```bash
brew install geyutu6755/tap/shipsmoke
shipsmoke version
```

The formula is updated with every shipsmoke release; an Actions workflow in
this repository installs the formula on macOS (arm64) and Linux and runs the
built-in test on every push, so what is here has been installed successfully.
