# clean-clone

Clone a git repo to a sandbox directory with clean working tree (no uncommitted changes) and copy `.env` file.

## Install

```bash
curl -o ~/.local/bin/clean-clone https://raw.githubusercontent.com/MandavkarPranjal/clean-clone/main/clean-clone
chmod +x ~/.local/bin/clean-clone
```

Or manually:

```bash
git clone https://github.com/MandavkarPranjal/clean-clone.git
cd clean-clone
chmod +x clean-clone
sudo mv clean-clone /usr/local/bin/clean-clone
```

## Usage

Run from any git repo directory:

```bash
clean-clone
```

Creates clone at `~/sandbox/{repo-name}-{random-hash}/`.

### Options

- First argument: custom destination directory (default: `~/sandbox`)

```bash
clean-clone ~/my-custom-dir
```

## What it does

1. Clones the current repo (without checking out files)
2. Checks out only committed files (`HEAD`) - uncommitted changes are excluded
3. Copies `.env` from original repo (if exists)
4. Creates destination as `{repo-name}-{random-hash}` to ensure fresh clone
5. Copies `cd <path>` to clipboard
