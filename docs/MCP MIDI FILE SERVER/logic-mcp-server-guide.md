# Guida Installazione: Logic Pro MCP Server per macOS Sequoia

## Panoramica

Questo server MCP (Model Context Protocol) permette a Claude di generare file MIDI per Logic Pro X, inclusi:
- Progressioni di accordi
- Pattern di batteria (house, techno, trap)
- Linee di basso
- Melodie
- Arrangement completi

**Compatibilità:** macOS Sequoia 15.7.2 o superiore

**Nota importante:** A causa di limitazioni di AppleScript in macOS Sequoia, questo server genera solo file MIDI che devono essere importati manualmente in Logic Pro. Non può controllare Logic direttamente.

---

## Prerequisiti

- macOS Sequoia 15.7.2 o superiore
- Python 3.10 o superiore
- Claude Desktop installato ([scarica qui](https://claude.ai/download))
- Logic Pro X

---

## Installazione Passo per Passo

### 1. Verifica Python

Apri il Terminale e verifica la versione di Python:

```bash
python3 --version
```

Se non hai Python installato:
```bash
# Installa Homebrew (se non ce l'hai)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installa Python
brew install python3
```

### 2. Crea la Cartella del Progetto

```bash
mkdir ~/logic-mcp-server
cd ~/logic-mcp-server
```

### 3. Crea il File del Server

Crea il file `logic_mcp_server.py`:

```bash
nano logic_mcp_server.py
```

Incolla il seguente codice:

```python
#!/usr/bin/env python3
"""
Logic Pro MCP Server - MIDI Generation Version
Genera file MIDI completi che possono essere importati in Logic Pro
"""

import asyncio
import json
import os
from pathlib import Path
from typing import Any, Sequence
from datetime import datetime

try:
    from mcp.server import Server
    from mcp.types import Tool, TextContent, ImageContent, EmbeddedResource
    from mido import MidiFile, MidiTrack, Message, MetaMessage
except ImportError:
    print("Installare: pip3 install mcp mido")
    exit(1)

# Inizializza il server MCP
app = Server("logic-pro-midi-generator")

# Cartella di output per i file MIDI
MIDI_OUTPUT_DIR = Path.home() / "Music" / "Logic" / "Claude_MIDI"
MIDI_OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

print(f"📁 File MIDI salvati in: {MIDI_OUTPUT_DIR}")

# [... resto del codice dal server completo ...]
```

**Nota:** Per il codice completo, vedi l'Appendice A alla fine di questa guida.

Salva il file:
- Premi `Ctrl+O` per salvare
- Premi `Invio` per confermare
- Premi `Ctrl+X` per uscire

### 4. Installa le Dipendenze Python

```bash
pip3 install mcp mido
```

Verifica l'installazione:
```bash
pip3 show mido
pip3 show mcp
```

### 5. Testa il Server

```bash
cd ~/logic-mcp-server
python3 logic_mcp_server.py
```

Dovresti vedere:
```
📁 File MIDI salvati in: /Users/TUO_USERNAME/Music/Logic/Claude_MIDI
🎵 Logic Pro MIDI Generator - Server MCP avviato!
```

Premi `Ctrl+C` per fermarlo.

### 6. Configura Claude Desktop

Apri il file di configurazione di Claude Desktop:

```bash
nano ~/Library/Application\ Support/Claude/claude_desktop_config.json
```

Aggiungi questa configurazione (sostituisci `TUO_USERNAME` con il tuo username):

```json
{
  "mcpServers": {
    "logic-pro": {
      "command": "python3",
      "args": ["/Users/TUO_USERNAME/logic-mcp-server/logic_mcp_server.py"]
    }
  }
}
```

**Per trovare il tuo username:**
```bash
whoami
```

Salva il file (`Ctrl+O`, `Invio`, `Ctrl+X`).

### 7. Riavvia Claude Desktop

1. Chiudi completamente Claude Desktop (`Cmd+Q`)
2. Aspetta 3-5 secondi
3. Riapri Claude Desktop

---

## Verifica Installazione

### Test tramite Claude Desktop

Apri una conversazione con Claude e prova:

```
Crea una progressione di accordi in Do maggiore
```

Claude dovrebbe generare un file MIDI e rispondere con il percorso del file.

### Controllo Log (Opzionale)

Per verificare che il server sia caricato correttamente:

```bash
cat ~/Library/Logs/Claude/mcp*.log
```

Dovresti vedere messaggi come:
```
[logic-pro] [info] Server started and connected successfully
```

---

## Comandi Disponibili

### 1. Generare Progressioni di Accordi

```
Crea accordi in Re minore
Genera una progressione I-V-vi-IV in Sol maggiore a 140 BPM
Fammi 8 battute di accordi C - F - Am - G
```

**Parametri:**
- `key`: Tonalità (es. "C", "Am", "F#")
- `progression`: Array di accordi
- `tempo`: BPM (default: 120)
- `bars`: Numero di battute (default: 4)

### 2. Generare Pattern di Batteria

```
Genera un pattern house a 128 BPM
Crea 16 battute di batteria techno a 135 BPM
Fammi un pattern trap veloce
```

**Parametri:**
- `pattern_type`: "house", "techno", "trap"
- `tempo`: BPM (default: 120)
- `bars`: Numero di battute (default: 4)

### 3. Generare Linee di Basso

```
Crea un basso steady in La minore
Genera un basso sincopato in Do a 125 BPM
Fammi 8 battute di walking bass in Fa
```

**Parametri:**
- `key`: Tonalità
- `pattern`: "steady", "syncopated", "walking"
- `tempo`: BPM (default: 120)
- `bars`: Numero di battute (default: 4)

### 4. Generare Melodie

```
Genera una melodia pentatonica in La minore
Crea una melodia in scala maggiore di Do
Fammi 8 battute di melodia minor in Mi
```

**Parametri:**
- `scale`: "major", "minor", "pentatonic"
- `key`: Tonalità
- `tempo`: BPM (default: 120)
- `bars`: Numero di battute (default: 4)

### 5. Creare Arrangement Completo

```
Crea un arrangement house completo in Do maggiore a 128 BPM
Genera una base techno in La minore
Fammi 16 battute di trap in Sol maggiore a 140 BPM
```

**Parametri:**
- `key`: Tonalità
- `genre`: "house", "techno", "trap"
- `tempo`: BPM (default: 120)
- `bars`: Numero di battute (default: 8)

**Output:** Genera 3 file MIDI (accordi, batteria, basso)

---

## Importare i File MIDI in Logic Pro

### Metodo 1: Drag & Drop

1. Apri Finder e vai a `~/Music/Logic/Claude_MIDI/`
2. Trascina i file MIDI direttamente nella timeline di Logic Pro
3. Logic creerà automaticamente nuove tracce

### Metodo 2: Import Menu

1. In Logic Pro, vai su **File > Import > MIDI File**
2. Naviga a `~/Music/Logic/Claude_MIDI/`
3. Seleziona uno o più file MIDI
4. Clicca **Open**

### Assegnare Strumenti

Per ogni traccia importata:

- **Accordi** → Piano elettrico, Synth Pad, Rhodes, Organ
- **Batteria** → Drum Kit, Ultrabeat, Drummer
- **Basso** → Synth Bass, Electric Bass, Sub Bass
- **Melodia** → Lead Synth, Keys, Guitar

---

## Troubleshooting

### Il server non parte

**Problema:** Errore "ModuleNotFoundError: No module named 'mcp'"

**Soluzione:**
```bash
pip3 install --upgrade mcp mido
```

### Claude non vede il server

**Problema:** Claude risponde "No result received from client-side tool execution"

**Soluzione:**
1. Verifica il percorso nel file di configurazione
2. Controlla i log:
   ```bash
   cat ~/Library/Logs/Claude/mcp*.log
   ```
3. Riavvia completamente Claude Desktop (`Cmd+Q` e riapri)

### Permessi negati

**Problema:** "Permission denied" quando si avvia il server

**Soluzione:**
```bash
chmod +x ~/logic-mcp-server/logic_mcp_server.py
```

### File MIDI non si sentono in Logic

**Problema:** I file MIDI sono silenziosi

**Soluzione:**
- Assicurati di aver assegnato uno strumento alla traccia
- Verifica che il volume della traccia non sia a zero
- Controlla che la traccia non sia in mute

### Errori nei log

**Problema:** Vedi errori tipo "'enumerate' object is not subscriptable"

**Soluzione:** Assicurati di avere l'ultima versione del codice (vedi Appendice A)

---

## Limitazioni Conosciute

### Cosa NON può fare (a causa di limitazioni macOS Sequoia):

❌ Controllare play/stop di Logic Pro  
❌ Creare tracce automaticamente  
❌ Leggere il tempo del progetto corrente  
❌ Importare automaticamente i file MIDI  
❌ Manipolare plugin o effetti

### Cosa PUÒ fare:

✅ Generare file MIDI di alta qualità  
✅ Creare progressioni di accordi  
✅ Generare pattern ritmici  
✅ Creare linee di basso  
✅ Generare melodie  
✅ Produrre arrangement completi

---

## Disinstallazione

Per rimuovere completamente il server:

```bash
# Rimuovi la cartella del server
rm -rf ~/logic-mcp-server

# Rimuovi i file MIDI generati (opzionale)
rm -rf ~/Music/Logic/Claude_MIDI

# Rimuovi le dipendenze Python (opzionale)
pip3 uninstall mcp mido

# Rimuovi la configurazione da Claude Desktop
nano ~/Library/Application\ Support/Claude/claude_desktop_config.json
# Rimuovi la sezione "logic-pro" dal JSON
```

Riavvia Claude Desktop.

---

## FAQ

### Posso usare questo server con altre DAW?

Sì! I file MIDI generati sono standard e possono essere importati in:
- Ableton Live
- FL Studio
- Cubase
- Pro Tools
- Reaper
- Qualsiasi DAW che supporti MIDI

### Posso modificare i pattern generati?

Assolutamente sì! I file MIDI sono completamente editabili in Logic Pro o qualsiasi editor MIDI.

### Quanto spazio occupano i file MIDI?

Pochissimo! Un file MIDI tipico è di pochi KB (3-20 KB).

### Posso creare pattern personalizzati?

Sì, puoi modificare il codice Python per aggiungere nuovi pattern, scale, progressioni, ecc.

### Il server funziona offline?

Il server stesso funziona offline, ma hai bisogno di connessione internet per comunicare con Claude Desktop.

### Posso usare tonalità con diesis/bemolle?

Sì! Usa notazioni come "F#", "Bb", "C#", "Eb", ecc.

---

## Prossimi Sviluppi

Funzionalità pianificate per versioni future:

- [ ] Supporto per time signature diverse da 4/4
- [ ] Pattern di batteria più complessi
- [ ] Generazione di arpeggi
- [ ] Supporto per accordi estesi (9th, 11th, 13th)
- [ ] Export in formato diversi (MusicXML)
- [ ] Integrazione con librerie di AI music generation

---

## Supporto e Contributi

Per bug report, feature request o contributi:

- **Documentazione:** [s2d01.github.io](https://s2d01.github.io/s2d01-docs-z9n4x1c/)
- **Contatti:** [jabeabsi2004@yahoo.com]

---

## Licenza

MIT License - Sentiti libero di modificare e distribuire.

---

## Changelog

### v1.0.0 (30 Novembre 2024)
- Release iniziale
- Supporto per generazione accordi, batteria, basso, melodie
- 3 generi: house, techno, trap
- Export in formato MIDI standard

---

Il codice include:
- Sistema di generazione MIDI ottimizzato
- Gestione errori robusta
- Supporto per multiple scale e progressioni
- Pattern ritmici per diversi generi
- Sistema di timing MIDI preciso

---

## Credits

Sviluppato da S2D01  
Powered by Anthropic Claude & Model Context Protocol  
Built with Python, mido, and lots of ☕

---

*Ultima modifica: 30 Novembre 2024*
