# 🚀 ProjectFetch

> A stylish terminal dashboard for your projects — auto-triggered on every `cd`.

Inspired by `neofetch`, **ProjectFetch** displays smart, visual summaries for any developer project you open: tech stack, repo info, structure, and a beautiful ASCII logo per language.

---

## ✨ Features

- 🔍 **Auto-detects** project type (Node.js, Symfony, Python, Rust, etc.)
- 🧠 Displays **structure, README presence, Git remote & last commit**
- 🎨 Uses **ASCII art + NerdFont icons** to stylize output
- ⚡ **Runs automatically** on each `cd` via shell hook
- 🧩 **Modular & lightweight** (pure Bash, zero dependencies)

---

## 📦 Installation

### ✅ Quick Setup

```bash
git clone https://github.com/yourusername/projectfetch.git
cd projectfetch
./install.sh
```

This will:
- Copy ASCII logos to `~/.config/projectfetch/ascii`
- Add the `projectfetch` command globally
- Suggest adding the auto-run hook to your shell

---

## 🔄 Autoload on `cd`

To run `projectfetch` automatically whenever you enter a project folder, add this to your `~/.zshrc` or `~/.bashrc`:

```bash
autoload -U add-zsh-hook
project_cd() { builtin cd "$@" && projectfetch; }
add-zsh-hook chpwd project_cd
project_cd "$PWD"
```

> ✅ This ensures ProjectFetch runs once when you open your shell and on each directory change.

---

## 🧠 What it Detects

| Stack         | Detection Files                          |
| ------------- | ---------------------------------------- |
| Node.js       | `package.json`                           |
| PHP / Symfony | `composer.json`, `.php` files            |
| Python        | `pyproject.toml`, `requirements.txt`     |
| C / C++       | `.c`, `.cpp`, `Makefile`                 |
| Rust          | `Cargo.toml`                             |
| Java          | `pom.xml`, `.java` files                 |
| Shell scripts | `.sh` files                              |
| Git           | `.git` folder                            |
| Web frontend  | `index.html`, `vite.config.js`, etc.     |

---

## 🧪 Ideas & Roadmap

- [ ] Per-project `.projectfetchrc` (override output per repo)
- [ ] Smart script listing (e.g. `npm run`, `symfony console`)
- [ ] Silent mode for automation pipelines
- [ ] Modular display styles (ASCII / flat / emoji-only)
- [ ] Custom themes (e.g. dark/light, monochrome, icons off)

---

## 📸 Screenshot

![Screen afichage terminal](/Data/screenTerminal.png)

---

## 🧑‍💻 Contributing

Feel free to fork and PR! If you'd like to add ASCII logos for more languages/tools, contribute to the `ascii/` folder.

---

## 📄 License

This project is licensed under the MIT License — see [LICENSE](./LICENSE) for details.
