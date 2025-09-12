# Template Logic Pro – _S2D01 Studio Template_

### 1. Drum Stack (Superior Drummer 3)

- Traccia **Instrument** → SD3 (Multi-Out).  
    
- Routing interno → Aux separati (Kick, Snare, Toms, HH, OH, Room).  
    
- Tutte dentro un **Drum Summing Stack** → uscita verso _Bus Drums_.  
    

---

### 2. Bus Drums (genitore)

- Aux → _S2D01_DrumsBus_Ambient_ (Channel Strip Setting).  
    
- Secondo Aux opzionale → _S2D01_DrumsBus_Punchy_.  
    
- Send → Bus Parallel Punchy, Bus Ambient, Bus Texture.  
    

---

### 3. FX Bus

- **Bus Reverbs Ambient** → Aux con _S2D01_Reverbs_Ambient_.  
    
- **Bus Textures Shimmer** → Aux con _S2D01_Textures_Shimmer_.  
    

---

### 4. FX Texture

- **Bus Texture Extra-Dark** → Aux con _S2D01_Texture_ExtraDark_.  
    

---

### 5. FX Vox

- **Bus Vox TripHop Ambient** → Aux con _S2D01_Vox_TripHopAmbient_.  
    

---

### 6. Master

- **Output Stereo Out** → carica _S2D01_Master_Ambient_ come base.  
    
- Copia una seconda versione con _S2D01_Master_Punchy_ (puoi bypassare/attivare).  
    

---

# Come crearlo passo-passo

1. Apri Logic → nuovo progetto vuoto.
2. Crea traccia **SD3 Multi-Out** + aux routing.
3. Aggiungi gli Aux per i bus sopra e carica i tuoi Channel Strip Settings (quelli già salvati).
4. Sistema sends/routing.
5. Vai su **File → Save as Template…** → nome: _S2D01 Studio Template_.

---

-> Da quel momento, quando apri Logic:

- schermata iniziale → Template → _S2D01 Studio Template_.  
    
- Hai già tutti i bus/aux/stack pronti, solo da suonare.  
    

---

# Schema Routing S2D01 Studio Template

```
[Superior Drummer 3 Multi-Out]
   |-- Kick  --->  
   |-- Snare --->  
   |-- Toms  --->  
   |-- HH    --->  
   |-- OH    --->  
   |-- Room  --->  
                   \
                    --> [Bus DRUMS] ---> [Master Out]
                          |
                          |-- Send A --> [Bus Parallel Punchy]
                          |-- Send B --> [Bus Reverbs Ambient]
                          |-- Send C --> [Bus Textures Shimmer]
                          |-- Send D --> [Bus Texture Extra-Dark]
                          |-- Send E --> [Bus Vox TripHop Ambient]
```

---

# Struttura Bus / Aux

- **Bus DRUMS (genitore)**
    - Preset: Ambient o Punchy  
        
    - Funzione: colla + routing  
        
- **Bus Parallel Punchy**
    - Preset: Parallel Punchy  
        
    - Funzione: aggressività / saturazione  
        
- **Bus Reverbs Ambient**
    - Preset: Reverbs Ambient  
        
    - Funzione: plate + hall scuri  
        
- **Bus Textures Shimmer**
    - Preset: Textures Shimmer  
        
    - Funzione: coda luminosa (o dark variant)  
        
- **Bus Texture Extra-Dark**
    - Preset: Texture Extra-Dark  
        
    - Funzione: tappeti cupi / sporchi  
        
- **Bus Vox TripHop Ambient**
    - Preset: Vox TripHop Ambient  
        
    - Funzione: voce / campioni / frasi AI  
        
- **Master Out**
    - Preset: Master Ambient o Master Punchy  
        

---

-> Così hai una vera **pipeline modulare**:

- SD3 → Drums Bus → FX Bus/Texture/Vox → Master.  
    
- Ogni parte ha il suo Channel Strip Setting salvato.  
    
