
# S2D01 QUICK GUIDE

**Logic Pro + Superior Drummer 3**

---

## Key Commands Map

```
┌────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┐
| F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 | F10 | F11| F12|
└────┴────┴────┴────┴────┴────┴────┴────┴────┴────┴────┴────┘
                       ↑ ↑ ↑ ↑
                       | | | |
                       | | | | └── F8 = Toggle Bypass Sends
                       | | | └────── F7 = Delete Channel Strip
                       | └─────────── F6 = Bypass All Plug-ins.
                       └──────────────── F5 = Create New Aux
```

**Quick Table**

- **F5** → Create New Aux (add FX bus → Light → Full).
    
- **F6** → Bypass All Plug-ins (Aux selected in Light mode).
    
- **F7** → Delete Selected Channel Strip (clean up mixer).
    
- **F8** → Toggle Bypass Sends (rapid on/off of sends)
    

**Extra useful**

- ⌥Click on Send → reset to -∞
    
- Shift+⌥Drag → copy Send level to multiple tracks
    
- Ctrl+⌘+↑/↓ → scroll Input / Bus / Output
    

---

## Template Light vs. Full

**LIGHT (fast, minimal)**

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

-> Drums Bus + Master Only. Perfect for sketches, quick ideas, light CPU.

---

**FULL (complete, modular)**

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
                          |-- Send D --> [Bus Textures Extra-Dark]
                          |-- Send E --> [Bus Vox TripHop Ambient]
```

-> All active FX buses: parallel, reverb, shimmer, texture dark, vox.

---

**Comparison table**

- **Light** → Solo Drums Bus + Master → for writing, testing ideas, light work
    
- **Full** → All active FX bus → for arranging, mixing, sound design
    

**Flash Procedure**

- Light → Full: F5 (new Aux) → load FX presets → activate Send on Drums Bus
    
- Full → Light: F6 (bypass FX) or F7 (delete Aux) → disable Send with ⌥Click
    

---

# With this Quick Guide you have:

- Map custom hotkeys (F5-F8)
    
- ASCII Light/Full Pattern
    
- Practical use tables
    
- Lightning procedure for switching workflows

---