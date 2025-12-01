# S2D01 Manual

This repository contains the official documentation of the **S2D01** project in the form of an online technical manual, built with **MkDocs + Material Theme** and published via **GitHub Pages**.

The manual is designed as a structured archive covering:
- DRUMS  
- FX  
- INSTRUMENTS  
- KEY COMMANDS  
- MASTER  
- MCP MIDI FILE SERVER  
- TEMPLATE  
- TIPS  

All main content is written in **Italian**.  
An **English version** of the manual is also available and maintained in a separate folder.

---

## 🌍 Available Versions

- Italian version (main):  
  https://s2d01.github.io/s2d01-docs-z9n4x1c/

- English version:  
  https://s2d01.github.io/s2d01-docs-z9n4x1c/en/

The language switch is visible **at the top right of the site header**.

---

## 📁 Project Structure

```text
S2D01-Manual/
├── docs/              # Original Italian documentation (sources)
├── docs-en/           # English version of the content (translated)
├── site/              # Final build of the Italian site
│   └── en/            # Final build of the English site
├── overrides/         # Material theme HTML/CSS overrides
├── mkdocs.yml         # Italian site configuration
├── mkdocs-en.yml      # English site configuration
├── build_all.sh       # IT + EN build script (no automatic translation)
├── publish_all.sh     # GitHub Pages publishing script
└── .venv/             # Python virtual environment
