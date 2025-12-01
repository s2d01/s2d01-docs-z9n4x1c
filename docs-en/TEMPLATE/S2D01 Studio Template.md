# Logic Pro Template - _S2D01 Studio Template_

### 1. Drum Stack (Superior Drummer 3)

- Track **Instrument** → SD3 (Multi-Out).  
    
- Internal routing → Separate auxes (Kick, Snare, Toms, HH, OH, Room).  
    
- All within a **Drum Summing Stack** → output to _Bus Drums_.  
    

---

### 2. Bus Drums (parent)

- Aux → _S2D01_DrumsBus_Ambient_ (Channel Strip Setting).  
    
- Optional Second Aux → _S2D01_DrumsBus_Punchy_.  
    
- Send → Bus Parallel Punchy, Bus Ambient, Bus Texture.  
    

---

### 3. FX Bus

- **Bus Reverbs Ambient** → Aux with _S2D01_Reverbs_Ambient_.  
    
- **Bus Textures Shimmer** → Aux with _S2D01_Textures_Shimmer_.  
    

---

### 4. FX Texture

- **Bus Texture Extra-Dark** → Aux with _S2D01_Texture_ExtraDark_.  
    

---

### 5. FX Vox

- **Bus Vox TripHop Ambient** → Aux with _S2D01_Vox_TripHopAmbient_.  
    

---

### 6. Master

- **Output Stereo Out** → loads _S2D01_Master_Ambient_ as the base.  
    
- Copy a second version with _S2D01_Master_Punchy_ (you can bypass/activate).  
    

---

# How to create it step-by-step

1. Open Logic → new empty project.
2. Create **SD3 Multi-Out** track + aux routing.
3. Add Auxes for the buses above and load your Channel Strip Settings (those already saved).
4. System sends/routing.
5. Go to **File → Save as Template...** → name: _S2D01 Studio Template_.

---

-> From then on, when you open Logic:

- Home screen → Template → _S2D01 Studio Template_.  
    
- You already have all the buses/aux/stacks ready, just to play.  
    

---

# Schema Routing S2D01 Studio Template

```
[Superior Drummer 3 Multi-Out]
   |-- Kick --->
   |-- Snare --->
   |-- Toms --->
   |-- HH --->
   |-- OH --->
   |-- Room --->
                   \
                    --> [Bus DRUMS] ---> [Master Out]
                          |
                          |-- Send A --> [Bus Parallel Punchy]
                          |-- Send B --> [Bus Reverbs Ambient]
                          |-- Send C --> [Bus Textures Shimmer]
                          |-- Send D --> [Bus Textures Extra-Dark]
                          |-- Send E --> [Bus Vox TripHop Ambient]
```

---

# Bus / Aux Structure

- **Bus DRUMS (parent)**
    - Preset: Ambient or Punchy
        
    - Function: glue + routing
        
- **Parallel Punchy bus**
    - Preset: Parallel Punchy
        
    - Function: aggressiveness/saturation
        
- **Bus Ambient Reverbs**
    - Preset: Ambient Reverbs
        
    - Function: plate + dark halls
        
- **Bus Textures Shimmer**
    - Preset: Textures Shimmer
        
    - Function: bright tail (or dark variant)
        
- **Bus Texture Extra-Dark**
    - Preset: Texture Extra-Dark
        
    - Function: dark/dirty carpets
        
- **Bus Vox TripHop Ambient**
    - Preset: Vox TripHop Ambient
        
    - Function: voice / samples / AI phrases
        
- **Master Out**
    - Preset: Master Ambient or Master Punchy
        

---

-> So you have a true **modular pipeline**:

- SD3 → Drums Bus → FX Bus/Texture/Vox → Master.  
    
- Each part has its Channel Strip Setting saved.  
    
