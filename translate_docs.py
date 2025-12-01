import os
import json
from pathlib import Path

import deepl


BASE_DIR = Path(__file__).parent
AUTH_FILE = BASE_DIR / "auth_key.json"
SRC_DIR = BASE_DIR / "docs"
DST_DIR = BASE_DIR / "docs-en"

def load_deepl_key():
    if not AUTH_FILE.exists():
        raise SystemExit(f"auth_key.json non trovato in {AUTH_FILE}")
    with AUTH_FILE.open("r", encoding="utf-8") as f:
        data = json.load(f)
    key = data.get("deepl")
    if not key:
        raise SystemExit("Chiave 'deepl' mancante in auth_key.json")
    return key

def translate_all():
    auth_key = load_deepl_key()
    translator = deepl.Translator(auth_key)

    print(f"Cartella sorgente: {SRC_DIR}")
    print(f"Cartella destinazione: {DST_DIR}")
    DST_DIR.mkdir(parents=True, exist_ok=True)

    for src_path in SRC_DIR.rglob("*.md"):
        rel = src_path.relative_to(SRC_DIR)
        dst_path = DST_DIR / rel
        dst_path.parent.mkdir(parents=True, exist_ok=True)

        text = src_path.read_text(encoding="utf-8")
        if not text.strip():
            print(f"[SKIP] Vuoto: {rel}")
            continue

        print(f"[TRADUCO] {rel} -> {dst_path.relative_to(BASE_DIR)}")

        result = translator.translate_text(
            text,
            source_lang="IT",
            target_lang="EN-US"
        )

        dst_path.write_text(result.text, encoding="utf-8")

    print("✅ Traduzione completata.")

if __name__ == "__main__":
    translate_all()
