# 🚀 ProjectFetch

> A stylish project info dashboard for your terminal — triggered on every `cd`.

Inspired by `neofetch`, `projectfetch` displays relevant project details whenever you enter a project directory.

## ✨ Features

- Detects project type (Node.js, Symfony, Python, Rust, etc.)
- Shows project structure, README, git remote and last commit
- Uses NerdFont icons and ASCII art per tech
- Auto-runs on `cd` (via shell hook)
- Fast and lightweight (pure Bash)

## 📦 Installation

### With install script

```bash
git clone https://github.com/yourusername/projectfetch.git
cd projectfetch
./install.sh
```

## 🔍 Techs detected
| Stack       | Detection Files                      |
| ----------- | ------------------------------------ |
| Node.js     | `package.json`                       |
| PHP/Symfony | `composer.json`                      |
| Python      | `pyproject.toml`, `requirements.txt` |
| Rust        | `Cargo.toml`                         |
| Git         | optional (shows remote & commit)     |


## 🧪 Dev ideas (coming soon)

- .projectfetchrc per project

- detection of available scripts (npm, symfony, etc.)

- optional silent mode (for scripts)

- plugable output styles (ASCII art, flat, emoji only)
