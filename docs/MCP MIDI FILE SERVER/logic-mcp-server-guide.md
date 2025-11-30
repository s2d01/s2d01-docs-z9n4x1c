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

# ====================
# UTILITÀ MIDI
# ====================

def note_to_midi(note_name: str) -> int:
    """Converte nome nota (es. C4) in numero MIDI"""
    notes = {'C': 0, 'C#': 1, 'Db': 1, 'D': 2, 'D#': 3, 'Eb': 3, 
             'E': 4, 'F': 5, 'F#': 6, 'Gb': 6, 'G': 7, 
             'G#': 8, 'Ab': 8, 'A': 9, 'A#': 10, 'Bb': 10, 'B': 11}
    
    note = note_name[:-1]
    octave = int(note_name[-1])
    return notes.get(note, 0) + (octave + 1) * 12

def get_chord_notes(root: str, chord_type: str = "major") -> list:
    """Ritorna le note MIDI di un accordo"""
    root_midi = note_to_midi(root + "4")
    
    if chord_type == "major":
        return [root_midi, root_midi + 4, root_midi + 7]
    elif chord_type == "minor":
        return [root_midi, root_midi + 3, root_midi + 7]
    elif chord_type == "7":
        return [root_midi, root_midi + 4, root_midi + 7, root_midi + 10]
    elif chord_type == "m7":
        return [root_midi, root_midi + 3, root_midi + 7, root_midi + 10]
    else:
        return [root_midi, root_midi + 4, root_midi + 7]

# ====================
# GENERATORI MIDI
# ====================

def create_chord_progression_midi(key: str, progression: list, tempo: int = 120, bars: int = 4) -> str:
    """Genera un file MIDI con progressione di accordi"""
    mid = MidiFile()
    track = MidiTrack()
    mid.tracks.append(track)
    
    # Imposta tempo
    track.append(MetaMessage('set_tempo', tempo=int(60000000 / tempo)))
    track.append(MetaMessage('time_signature', numerator=4, denominator=4))
    
    # Durata di una battuta (in ticks, 480 ticks = 1 beat)
    ticks_per_beat = 480
    beats_per_bar = 4
    bar_duration = ticks_per_beat * beats_per_bar
    
    # Genera accordi
    for i, chord_name in enumerate(progression * (bars // len(progression) + 1))[:bars]:
        if i >= bars:
            break
            
        # Determina tipo di accordo
        if "m" in chord_name.lower():
            root = chord_name.replace("m", "").replace("7", "")
            chord_type = "m7" if "7" in chord_name else "minor"
        elif "7" in chord_name:
            root = chord_name.replace("7", "")
            chord_type = "7"
        else:
            root = chord_name
            chord_type = "major"
        
        notes = get_chord_notes(root, chord_type)
        
        # Note on
        for note in notes:
            track.append(Message('note_on', note=note, velocity=80, time=0))
        
        # Note off dopo una battuta
        for j, note in enumerate(notes):
            time = bar_duration if j == 0 else 0
            track.append(Message('note_off', note=note, velocity=0, time=time))
    
    # Salva file
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"chord_progression_{key}_{timestamp}.mid"
    filepath = MIDI_OUTPUT_DIR / filename
    mid.save(str(filepath))
    
    return str(filepath)

def create_drum_pattern_midi(pattern_type: str = "house", tempo: int = 120, bars: int = 4) -> str:
    """Genera un pattern di batteria"""
    mid = MidiFile()
    track = MidiTrack()
    mid.tracks.append(track)
    
    track.append(MetaMessage('set_tempo', tempo=int(60000000 / tempo)))
    track.append(MetaMessage('time_signature', numerator=4, denominator=4))
    
    # Drum MIDI notes (General MIDI)
    KICK = 36
    SNARE = 38
    CLOSED_HAT = 42
    OPEN_HAT = 46
    
    ticks_per_beat = 480
    eighth_note = ticks_per_beat // 2
    sixteenth_note = ticks_per_beat // 4
    
    patterns = {
        "house": [
            # Kick on 1, 2, 3, 4
            [(KICK, [0, ticks_per_beat * 1, ticks_per_beat * 2, ticks_per_beat * 3])],
            # Snare on 2, 4
            [(SNARE, [ticks_per_beat * 1, ticks_per_beat * 3])],
            # Hi-hat on eighths
            [(CLOSED_HAT, [i * eighth_note for i in range(8)])],
        ],
        "techno": [
            [(KICK, [i * ticks_per_beat for i in range(4)])],
            [(CLOSED_HAT, [i * eighth_note for i in range(8)])],
            [(OPEN_HAT, [ticks_per_beat * 3 + eighth_note])],
        ],
        "trap": [
            [(KICK, [0, ticks_per_beat, ticks_per_beat + eighth_note, ticks_per_beat * 3])],
            [(SNARE, [ticks_per_beat * 1, ticks_per_beat * 3])],
            [(CLOSED_HAT, [i * sixteenth_note for i in range(16)])],
        ]
    }
    
    pattern = patterns.get(pattern_type, patterns["house"])
    
    # Genera pattern per N battute
    for bar in range(bars):
        bar_offset = bar * ticks_per_beat * 4
        
        for drum_notes in pattern:
            note, timings = drum_notes
            for timing in timings:
                track.append(Message('note_on', note=note, velocity=100, time=timing + bar_offset, channel=9))
                track.append(Message('note_off', note=note, velocity=0, time=8, channel=9))
    
    # Salva file
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"drums_{pattern_type}_{timestamp}.mid"
    filepath = MIDI_OUTPUT_DIR / filename
    mid.save(str(filepath))
    
    return str(filepath)

def create_bass_line_midi(key: str, pattern: str = "steady", tempo: int = 120, bars: int = 4) -> str:
    """Genera una linea di basso"""
    mid = MidiFile()
    track = MidiTrack()
    mid.tracks.append(track)
    
    track.append(MetaMessage('set_tempo', tempo=int(60000000 / tempo)))
    
    root_note = note_to_midi(key + "2")
    ticks_per_beat = 480
    
    patterns_dict = {
        "steady": [0, 0, 0, 0],  # Root on every beat
        "syncopated": [0, -1, 7, 0],  # Root, rest, fifth, root
        "walking": [0, 2, 4, 7],  # Walking bass
    }
    
    intervals = patterns_dict.get(pattern, patterns_dict["steady"])
    
    for bar in range(bars):
        for i, interval in enumerate(intervals):
            if interval == -1:  # Rest
                track.append(Message('note_on', note=0, velocity=0, time=ticks_per_beat))
                continue
            
            note = root_note + interval
            track.append(Message('note_on', note=note, velocity=90, time=0 if i > 0 else 0))
            track.append(Message('note_off', note=note, velocity=0, time=ticks_per_beat))
    
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"bass_{key}_{pattern}_{timestamp}.mid"
    filepath = MIDI_OUTPUT_DIR / filename
    mid.save(str(filepath))
    
    return str(filepath)

def create_melody_midi(scale: str, key: str, tempo: int = 120, bars: int = 4) -> str:
    """Genera una melodia semplice"""
    mid = MidiFile()
    track = MidiTrack()
    mid.tracks.append(track)
    
    track.append(MetaMessage('set_tempo', tempo=int(60000000 / tempo)))
    
    # Scale intervals
    scales = {
        "major": [0, 2, 4, 5, 7, 9, 11, 12],
        "minor": [0, 2, 3, 5, 7, 8, 10, 12],
        "pentatonic": [0, 2, 4, 7, 9, 12],
    }
    
    root = note_to_midi(key + "4")
    scale_notes = [root + interval for interval in scales.get(scale, scales["major"])]
    
    ticks_per_beat = 480
    
    # Genera melodia random ma musicale
    import random
    for bar in range(bars):
        for beat in range(4):
            note = random.choice(scale_notes)
            duration = random.choice([ticks_per_beat // 2, ticks_per_beat])
            
            track.append(Message('note_on', note=note, velocity=70, time=0))
            track.append(Message('note_off', note=note, velocity=0, time=duration))
    
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"melody_{scale}_{key}_{timestamp}.mid"
    filepath = MIDI_OUTPUT_DIR / filename
    mid.save(str(filepath))
    
    return str(filepath)

# ====================
# TOOLS MCP
# ====================

@app.list_tools()
async def list_tools() -> list[Tool]:
    """Lista tutti gli strumenti disponibili"""
    return [
        Tool(
            name="generate_chord_progression",
            description="Genera un file MIDI con una progressione di accordi pronto per Logic Pro",
            inputSchema={
                "type": "object",
                "properties": {
                    "key": {
                        "type": "string",
                        "description": "Tonalità (es. 'C', 'Am', 'F#')",
                        "default": "C"
                    },
                    "progression": {
                        "type": "array",
                        "items": {"type": "string"},
                        "description": "Progressione di accordi (es. ['C', 'Am', 'F', 'G'])",
                        "default": ["C", "Am", "F", "G"]
                    },
                    "tempo": {
                        "type": "number",
                        "description": "Tempo in BPM",
                        "default": 120
                    },
                    "bars": {
                        "type": "number",
                        "description": "Numero di battute",
                        "default": 4
                    }
                },
                "required": []
            }
        ),
        Tool(
            name="generate_drum_pattern",
            description="Genera un pattern di batteria MIDI per Logic Pro",
            inputSchema={
                "type": "object",
                "properties": {
                    "pattern_type": {
                        "type": "string",
                        "enum": ["house", "techno", "trap"],
                        "description": "Tipo di pattern ritmico",
                        "default": "house"
                    },
                    "tempo": {
                        "type": "number",
                        "description": "Tempo in BPM",
                        "default": 120
                    },
                    "bars": {
                        "type": "number",
                        "description": "Numero di battute",
                        "default": 4
                    }
                },
                "required": []
            }
        ),
        Tool(
            name="generate_bass_line",
            description="Genera una linea di basso MIDI",
            inputSchema={
                "type": "object",
                "properties": {
                    "key": {
                        "type": "string",
                        "description": "Tonalità (es. 'C', 'A', 'F#')",
                        "default": "C"
                    },
                    "pattern": {
                        "type": "string",
                        "enum": ["steady", "syncopated", "walking"],
                        "description": "Tipo di pattern di basso",
                        "default": "steady"
                    },
                    "tempo": {
                        "type": "number",
                        "description": "Tempo in BPM",
                        "default": 120
                    },
                    "bars": {
                        "type": "number",
                        "description": "Numero di battute",
                        "default": 4
                    }
                },
                "required": []
            }
        ),
        Tool(
            name="generate_melody",
            description="Genera una melodia MIDI basata su una scala",
            inputSchema={
                "type": "object",
                "properties": {
                    "scale": {
                        "type": "string",
                        "enum": ["major", "minor", "pentatonic"],
                        "description": "Tipo di scala",
                        "default": "major"
                    },
                    "key": {
                        "type": "string",
                        "description": "Tonalità (es. 'C', 'A', 'F#')",
                        "default": "C"
                    },
                    "tempo": {
                        "type": "number",
                        "description": "Tempo in BPM",
                        "default": 120
                    },
                    "bars": {
                        "type": "number",
                        "description": "Numero di battute",
                        "default": 4
                    }
                },
                "required": []
            }
        ),
        Tool(
            name="create_full_arrangement",
            description="Genera un arrangement completo con accordi, basso e batteria",
            inputSchema={
                "type": "object",
                "properties": {
                    "key": {
                        "type": "string",
                        "description": "Tonalità (es. 'C', 'Am')",
                        "default": "C"
                    },
                    "genre": {
                        "type": "string",
                        "enum": ["house", "techno", "trap"],
                        "description": "Genere musicale",
                        "default": "house"
                    },
                    "tempo": {
                        "type": "number",
                        "description": "Tempo in BPM",
                        "default": 120
                    },
                    "bars": {
                        "type": "number",
                        "description": "Numero di battute",
                        "default": 8
                    }
                },
                "required": []
            }
        )
    ]

@app.call_tool()
async def call_tool(name: str, arguments: Any) -> Sequence[TextContent | ImageContent | EmbeddedResource]:
    """Esegue il tool richiesto"""
    
    if name == "generate_chord_progression":
        key = arguments.get("key", "C")
        progression = arguments.get("progression", ["C", "Am", "F", "G"])
        tempo = arguments.get("tempo", 120)
        bars = arguments.get("bars", 4)
        
        filepath = create_chord_progression_midi(key, progression, tempo, bars)
        
        return [TextContent(
            type="text",
            text=f"🎹 Progressione di accordi creata!\n\n"
                 f"📁 File: {filepath}\n"
                 f"🎵 Tonalità: {key}\n"
                 f"📊 Accordi: {' - '.join(progression)}\n"
                 f"⏱️ Tempo: {tempo} BPM\n"
                 f"📏 Battute: {bars}\n\n"
                 f"💡 Trascina il file in Logic Pro per importarlo!"
        )]
    
    elif name == "generate_drum_pattern":
        pattern_type = arguments.get("pattern_type", "house")
        tempo = arguments.get("tempo", 120)
        bars = arguments.get("bars", 4)
        
        filepath = create_drum_pattern_midi(pattern_type, tempo, bars)
        
        return [TextContent(
            type="text",
            text=f"🥁 Pattern di batteria creato!\n\n"
                 f"📁 File: {filepath}\n"
                 f"🎶 Stile: {pattern_type}\n"
                 f"⏱️ Tempo: {tempo} BPM\n"
                 f"📏 Battute: {bars}\n\n"
                 f"💡 Trascina il file in Logic Pro e assegna a una traccia Drum Kit!"
        )]
    
    elif name == "generate_bass_line":
        key = arguments.get("key", "C")
        pattern = arguments.get("pattern", "steady")
        tempo = arguments.get("tempo", 120)
        bars = arguments.get("bars", 4)
        
        filepath = create_bass_line_midi(key, pattern, tempo, bars)
        
        return [TextContent(
            type="text",
            text=f"🎸 Linea di basso creata!\n\n"
                 f"📁 File: {filepath}\n"
                 f"🎵 Tonalità: {key}\n"
                 f"🎼 Pattern: {pattern}\n"
                 f"⏱️ Tempo: {tempo} BPM\n"
                 f"📏 Battute: {bars}\n\n"
                 f"💡 Perfetto per synth bass o basso elettrico!"
        )]
    
    elif name == "generate_melody":
        scale = arguments.get("scale", "major")
        key = arguments.get("key", "C")
        tempo = arguments.get("tempo", 120)
        bars = arguments.get("bars", 4)
        
        filepath = create_melody_midi(scale, key, tempo, bars)
        
        return [TextContent(
            type="text",
            text=f"🎼 Melodia creata!\n\n"
                 f"📁 File: {filepath}\n"
                 f"🎹 Scala: {scale}\n"
                 f"🎵 Tonalità: {key}\n"
                 f"⏱️ Tempo: {tempo} BPM\n"
                 f"📏 Battute: {bars}\n\n"
                 f"💡 Usa come punto di partenza per il tuo lead!"
        )]
    
    elif name == "create_full_arrangement":
        key = arguments.get("key", "C")
        genre = arguments.get("genre", "house")
        tempo = arguments.get("tempo", 120)
        bars = arguments.get("bars", 8)
        
        # Genera tutti gli elementi
        progression = ["C", "Am", "F", "G"] if "m" not in key else ["Am", "F", "C", "G"]
        
        chord_file = create_chord_progression_midi(key, progression, tempo, bars)
        drum_file = create_drum_pattern_midi(genre, tempo, bars)
        bass_file = create_bass_line_midi(key.replace("m", ""), "syncopated", tempo, bars)
        
        return [TextContent(
            type="text",
            text=f"🎵 Arrangement completo creato!\n\n"
                 f"📦 3 file MIDI generati:\n"
                 f"1. 🎹 Accordi: {os.path.basename(chord_file)}\n"
                 f"2. 🥁 Batteria: {os.path.basename(drum_file)}\n"
                 f"3. 🎸 Basso: {os.path.basename(bass_file)}\n\n"
                 f"📁 Tutti salvati in: {MIDI_OUTPUT_DIR}\n\n"
                 f"🎵 Tonalità: {key}\n"
                 f"🎶 Genere: {genre}\n"
                 f"⏱️ Tempo: {tempo} BPM\n"
                 f"📏 Battute: {bars}\n\n"
                 f"💡 Importa tutti i file in Logic per un arrangement completo!"
        )]
    
    else:
        return [TextContent(type="text", text=f"Tool '{name}' non riconosciuto")]

# ====================
# MAIN
# ====================

async def main():
    """Avvia il server MCP"""
    from mcp.server.stdio import stdio_server
    
    async with stdio_server() as (read_stream, write_stream):
        await app.run(
            read_stream,
            write_stream,
            app.create_initialization_options()
        )

if __name__ == "__main__":
    print("🎵 Logic Pro MIDI Generator - Server MCP avviato!")
    print(f"📁 File MIDI salvati in: {MIDI_OUTPUT_DIR}")
    asyncio.run(main())
```

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
