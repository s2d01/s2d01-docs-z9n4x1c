#!/bin/bash

echo "======================================="
echo " S2D01 - BUILD AUTOMATICO IT + EN"
echo "======================================="

# 1. Vai nella cartella del progetto
cd "$(dirname "$0")" || exit 1

# 2. Attiva ambiente virtuale
if [ ! -d ".venv" ]; then
  echo "❌ Ambiente virtuale .venv non trovato!"
  exit 1
fi

source .venv/bin/activate

# 3. (TEMP) Salta traduzione automatica (quota DeepL finita)
echo ""
echo "⚠️  Salto la traduzione automatica (quota DeepL esaurita)."
echo "    Uso le traduzioni già presenti in docs-en/."

# 4. Build sito IT -> site/
echo ""
echo "🏗  Build sito IT..."
python3 -m mkdocs build
if [ $? -ne 0 ]; then
  echo "❌ Errore build IT"
  exit 1
fi

# 5. Build sito EN -> site/en/
echo ""
echo "🏗  Build sito EN..."
python3 -m mkdocs build -f mkdocs-en.yml -d site/en
if [ $? -ne 0 ]; then
  echo "❌ Errore build EN"
  exit 1
fi

echo ""
echo "✅ TUTTO COMPLETATO CON SUCCESSO!"
echo " - Sito IT: site/"
echo " - Sito EN: site/en/"
echo ""
