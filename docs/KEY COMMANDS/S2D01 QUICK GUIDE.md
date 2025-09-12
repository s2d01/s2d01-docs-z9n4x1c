
# S2D01 QUICK GUIDE

**Logic Pro + Superior Drummer 3**

---

## Key Commands Map

```
┌────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┐
| F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 | F10| F11| F12|
└────┴────┴────┴────┴────┴────┴────┴────┴────┴────┴────┴────┘
                       ↑    ↑    ↑    ↑
                       |    |    |    |
                       |    |    |    └── F8 = Toggle Bypass Sends
                       |    |    └────── F7 = Delete Channel Strip
                       |    └─────────── F6 = Bypass All Plug-ins
                       └──────────────── F5 = Create New Aux
```

**Tabella rapida**

- **F5** → Create New Aux (aggiungi bus FX → Light → Full)  
    
- **F6** → Bypass All Plug-ins (Aux selezionato in Light mode)  
    
- **F7** → Delete Selected Channel Strip (pulisci mixer)  
    
- **F8** → Toggle Bypass Sends (ON/OFF rapido dei send)  
    

**Extra utili**

- ⌥Click su Send → reset a –∞  
    
- Shift+⌥Drag → copia livello Send su più tracce  
    
- Ctrl+⌘+↑/↓ → scorri Input / Bus / Output  
    

---

## Template Light vs Full

**LIGHT (veloce, minimale)**

```
[Superior Drummer 3 Multi-Out]
   |-- Kick
   |-- Snare
   |-- HH
   |-- OH
   |-- Room
                   \
                    --> [Bus DRUMS] ---> [Master Out]
```

-> Solo Drums Bus + Master. Perfetto per sketch, idee rapide, CPU leggera.

---

**FULL (completo, modulare)**

```
[Superior Drummer 3 Multi-Out]
   |-- Kick
   |-- Snare
   |-- HH
   |-- OH
   |-- Room
                   \
                    --> [Bus DRUMS] ---> [Master Out]
                          |
                          |-- Send A --> [Bus Parallel Punchy]
                          |-- Send B --> [Bus Reverbs Ambient]
                          |-- Send C --> [Bus Textures Shimmer]
                          |-- Send D --> [Bus Texture Extra-Dark]
                          |-- Send E --> [Bus Vox TripHop Ambient]
```

-> Tutti i bus FX attivi: parallel, reverb, shimmer, texture dark, vox.

---

**Tabella comparativa**

- **Light** → Solo Drums Bus + Master → per scrivere, testare idee, lavorare leggero  
    
- **Full** → Tutti i bus FX attivi → per arrangiare, mixare, sound design  
    

**Procedura Lampo**

- Light → Full: F5 (nuovi Aux) → carica preset FX → attiva Send sul Bus Drums  
    
- Full → Light: F6 (bypass FX) o F7 (elimina Aux) → disattiva Send con ⌥Click  
    

---

# Con questo Quick Guide hai:

- Mappa tasti rapidi personalizzati (F5–F8)  
    
- Schema ASCII Light/Full  
    
- Tabelle di uso pratico  
    
- Procedura lampo per switchare workflow

---