
## How to separate the outputs of Superior Drummer in Logic Pro.

### 1. Load Superior as a Multi-Output instrument.

- Go to **Track → New Software Instrument Track**.
    
- In the window that opens, under **Track Type**, choose:
    **"Instrument" → "AU Instruments → Toontrack → Superior Drummer → Multi Output (16xStereo) "** (or 8xStereo if you don't need too many outputs).
    
- Click **Create**.
    

---

### 2. Activate the outputs in Logic.

- Go to the **Mixer in Logic** (`X` key).
    
- Find the Superior Drummer track.
    
- At the bottom, on the plugin channel, you will see a little **"+"** (next to the instrument name).
    
- Click the "+" as many times as the outputs you need (kick, snare, hat, toms, overheads, room...).
    
- Logic will automatically create **corresponding aux channels**.
    

---

### 3. Assigns the outputs inside Superior

- Open Superior Drummer and go into the **Internal Mixer** of the plugin.
    
- For each channel (Kick, Snare Top, Snare Bottom, HH, Toms, OH, Room, etc.) choose a different output:
    
    - Kick → Output 1 (stereo or mono depending on configuration)
        
    - Snare Top → Output 2
        
    - Snare Bottom → Output 3
        
    - Hi-Hat → Output 4
        
    - ... and so on.
        
- Now Logic will receive the separate signals in the aux channels created in step 2.
    

---

### 4. Mix in Logic

- Each aux is now an independent audio track:
    
    - You can insert EQ, compression, reverb, delay, etc.
        
    - you can adjust volumes separately, do automations, etc.
        

-> The MIDI always remains **on one track**, but at the audio level you have the drums completely split.

## Where the split outputs appear in Logic.

1. Go to the **Mixer in Logic** (`X` on the keyboard).
    
2. Find the **Superior Drummer** track. It is the **Instrument Channel Strip** (the one with the plugin loaded).
    
3. At the bottom of the channel, you will see a small **"+"**button next to the fader.
    
    - This button is used to **create the Aux Channels** corresponding to the additional outputs.
        
    - Click "+" as many times as there are outputs you have assigned in Superior's internal mixer (kick, snare, hi-hat, etc.).
        
4. As soon as you click, Logic adds new **Aux Channels** to the right of the main track.
    
    - E.g. Aux 1 = Snare, Aux 2 = Hi-Hat, Aux 3 = Toms, Aux 4 = Overheads... (depends on how you mapped them inside Superior).
        
    - These channels have their own **fader, insert, send, pan**, like any audio track.
        

-> Superior's original track still remains the "mother track": it houses the MIDI and usually picks up the **Kick (Output 1)**. All other parts instead come on the auxes.

## Typical example in Mixer.

After activating the outputs, in Logic's Mixer you might see something like this:

- **Inst 1 - Superior Drummer (Instrument Channel)** → Kick
    
- **Aux 1** → Snare Top
    
- **Aux 2** → Snare Bottom
    
- **Aux 3** → Hi-Hat
    
- **Aux 4** → Toms
    
- **Aux 5** → Overheads
    
- **Aux 6** → Room
    

And so on.

## Recommended Routing (Multi-Output in Superior Drummer).

Inside Superior's **Mixer** assigns like this:

- **Output 1-2 (Main Stereo / Logic's Inst Channel)** → **Kick**
    
- **Output 3-4** → **Snare (Top + Bottom, or keep Top alone if you want more control)**
    
- **Output 5-6** → **Hi-Hat**
    
- **Outputs 7-8** → **Toms** (you can group them together or make individual outputs if you want a super detailed mix)
    
- **Outputs 9-10** → **Overheads (OH)**
    
- **Outputs 11-12** → **Room (Environments)**
    
- **Outputs 13-14** → **Extra percussions** (shakers, claps, etc., if any)
    

---

## How it translates into Logic

When you click the **"+"** in the Superior track (in Logic's Mixer), you will get:

- **Inst 1** (Superior Drummer - Kick)
    
- **Aux 1** (Snare)
    
- **Aux 2** (Hi-Hat)
    
- **Aux 3** (Toms)
    
- **Aux 4** (Overheads)
    
- **Aux 5** (Room)
    
- **Aux 6** (Extra Percussion)
    

---

## Advantages

- Separate Kick and Snare: you can EQ them and compress them as you like.
    
- Hi-Hat on its own channel: useful for handling reverb and treble.
    
- Separate Overheads and Room: total control of "air" and spaciousness.
    
- Toms: you can keep them together or split them into multiple outputs if you want to treat each tom individually.

-> I recommend saving this setup as **preset of Superior's mixer**, so every time you open the plugin you already have the routing ready.

## How to better orient yourself

1. Rename the Aux channels in Logic (e.g. "Snare", "Hi-Hat", "Toms"...) so you don't get confused with numbers.
    
    - Just click on the channel name below the fader and type in the name.
        
2. In Superior Drummer, match the outputs:
    
    - Snare → Out 3/4
        
    - Hi-Hat → Out 5/6
        
    - etc.
        
3. Then in Logic, the first aux you created (even though it's called Aux 18) will correspond to Out 3/4, the second to Out 5/6, etc.
    

---

-> Basically: don't worry about the number (18, 19, 20...), they're just labels. The important thing is that each audio output of Superior has its own dedicated Aux.

---

## What to check in Superior Drummer.

1. Open **Superior Drummer** and go into the **Internal Mixer** of the plugin.
    
2. Look at the channel strips (Kick, Snare Top, Snare Bottom, Hi-Hat, etc.).
    
3. At the bottom of each channel strip is a drop-down menu that says the output (usually by default it is "Out 1/2").
    
4. Change the Snare (or what you want to separate) from **Out 1/2 → Out 3/4**.
    
5. Now on Logic, Aux 18 will receive the signal.
    

---

## Quick check

- Play the MIDI track (or tap a Snare pad in Superior).
    
- You should see the meter move to Aux 18.
    
- Now you can enter plugins, EQ, compression, automations, etc.
    

---

-> Summarizing: **routing must be done twice**

- in Superior Drummer → assign each piece of kit to a different output.
    
- in Logic → create the corresponding auxes with the "+".
---

## How cymbals work in Superior

- Cymbals are recorded **in the Overheads (OH)** and **Room/Ambience** microphones.
    
- You will almost never find them as a separate "Crash 1" or "Ride" channel, because in a real studio, cymbals are not miked individually (except in special cases).
    
- So:
    
    - if you move the **OH** to an output, you'll hear all the cymbals in there.
        
    - the **Rooms/Environments** always contain the dishes as well (in addition to all the kit).
        

---

## What you can do if you want more control

1. **Adjust the balance in Superior's mixer**.
    
    - Inside Superior you can often lower the "Bleed" (the amount of cymbals going into the Room, Snare, etc. mics).
        
    - You can also manage how much each individual cymbal goes into the OHs.
        
2. **Separate Ride or Crash (when possible)**
    
    - In some Superior libraries there are spot mics dedicated at least to Ride (important cymbal in the mix).
        
    - If your library provides them, you can send them on a separate output.
        
3. **Alternative trick**
    
    - If you need even more surgical control (like different compression for Ride and Crash), you can duplicate the MIDI:
        
        - On one track you keep only the Ride,
            
        - on another just the Crash,
            
        - and you load two instances of Superior with different routings.
            
    - It is a little more CPU heavy, but gives you more freedom.
        

---

-> Basically: dishes "live" on the **Overheads and Room**, not as individual channels.

---

## Typical routing (multi-out in Superior Drummer → Logic Pro).

- **Kick** → Out 1/2 (stays on the main channel of Superior)
    
- **Snare (Top + Bottom)** → Out 3/4
    
- **Hi-Hat** → Out 5/6
    
- **Toms (all together, or separate if you want more control)** → Out 7/8
    
- **Overheads (all cymbals)** → Out 9/10
    
- **Room/Ambience** → Out 11/12
    

-> This is the "basic package" you need to mix well.

---

## Because it works like this

- **Kick and Snare**: individually mic'd → it pays to treat them with dedicated EQ and compression.
    
- **Hi-Hat**: dedicated spot mic, useful for adjusting reverb and controlling treble.
    
- **Toms**: you can keep them together (Out 7/8) or split them (Tom 1 → 7/8, Tom 2 → 9/10, etc.) if you want more surgical mix.
    
- **Overheads**: here you hear the whole kit, but especially the cymbals. You can control brightness and stereo.
    
- **Room**: adds depth and realistic "air" → you can compress hard for more punch.
    

---

## Practical tip

Once this routing is set up:

1. Rename the auxes to Logic (Kick, Snare, HH, Toms, OH, Room).
    
2. Save everything as a **preset in Superior Drummer** and also as a **patch in Logic** → so when you open a new project you are ready without redoing the setup.

---

## How to save routing as a preset in Superior Drummer.

1. **Open the Internal Mixer** of Superior Drummer.
    
2. Assign the outputs as I told you (typical example):
    
    - Kick → Out 1/2
        
    - Snare (Top+Bottom) → Out 3/4
        
    - Hi-Hat → Out 5/6
        
    - Toms → Out 7/8
        
    - Overheads → Out 9/10
        
    - Room → Out 11/12
        
3. Once everything sounds and the meters in Logic move correctly:
    
    - Go to the top right of the Superior Drummer window.
        
    - Open the **Presets** menu.
        
    - Choose **Save Mixer Preset** (in SD3 it is called that).
        
    - Give it a name like: _Logic MultiOut Routing_.
        

---

## How to call it back after

- Whenever you open a new instance of Superior Drummer:
    
    1. Load the kit you want.
        
    2. Go to the Presets menu → **Load Mixer Preset**.
        
    3. Select _Logic MultiOut Routing_.
        
- Boom!!!  You already have all the outputs assigned, without redoing anything.
    

---

-> Extra Tip:
You can also save directly in Logic a **Channel Strip Setting** or even a **Project Template** with Superior already in Multi-Output mode and the Auxes renamed. That way you always start with the setup ready.

---

## Where to save the routing (SD3).

1. Go to the **Internal Mixer** in Superior Drummer.
    
2. At the top left of the Mixer you will see a small drop-down menu (icon with an arrow).
    
    - There you will find options like:
        
        - _Reset Mixer_
            
        - _Save Mixer Preset_
            
        - _Load Mixer Preset_
            
3. Choose **Save Mixer Preset**.
    
    - You will be asked for a name → write, for example, _Logic MultiOut_.
        

---

## Then to reload it

- When you open a new project and load SD3:
    
    - Go back to the Mixer → same menu → **Load Mixer Preset** → choose _Logic MultiOut_.
        
- The routing assignments to the outputs (Out 1/2, Out 3/4, etc.) return immediately as you had saved them.
    

---

-> Note: If you don't see it right away, make sure you are in the **Mixer tab** of SD3 (not in Drums, Grooves, etc.). The menu is right above the channel strips.

---

## 1. **Channel Strip Setting** (the one you find at the top of the Logic strip).

- If you save only the **main instrument** (the "Superior Drummer" track), Logic remembers the plugin, its presets and internal routings **on that track only**.
    
- It doesn't also automatically recall your **linked auxes** (the ones created with the "+"), though. Those have to be recreated every time.  
    -> So: **not enough** if you want to call up the whole multi-output setup already expanded.
    

---

## 2. **Track Stack (Summing Stack)** + saving as **Patch**.

- If you put Superior's track + all Aux inside a **Summing Stack**:
    
    1. select the track of SD3 + all its Aux.
        
    2. Menu **Track → Create Track Stack** → choose **Summing Stack**.
        
    3. Rename the stack, such as _Superior MultiOut_.
        
- Now go to the Browser on the left (Inspector → Patch Library) and click on **Save...**.
    
- This saves a complete **Patch**, with in it:
    
    - the tool (SD3),
        
    - the Auxes already created and connected,
        
    - all plugins on the auxes,
        
    - names and routing.
        

-> When you call it up in a new project, it recreates **the whole group**: instrument + Aux + routing mixer.

---

## 3. **Project template** (the "ultimate" method).

- If you always use that setup, the most convenient is to do:
    
    1. Open an empty project, put SD3 in Multi-Output, create the Auxes, put everything in Track Stack.
        
    2. Go to **File → Save as Template**.
        
    3. When you open Logic, it will show up in your initial templates → click and you're up and running.
        

---

-> Summarizing:

- **Channel Strip Setting** = saves only the main track (not the Aux).
    
- **Track Stack saved as Patch** = recall everything, including Aux and routing.
    
- **Project Template** = even better if you always want to have that setup ready to go.

---

## Save your Track Stack as a Patch.

1. Select the **Track Stack** (the Summing Stack with SD3 and all the Auxes in it).
    
2. With the Library open (left), you see a **Save...** button at the top.
    
3. Click **Save** → give it a name (e.g. _Superior MultiOut_).
    
4. Now your patch appears under **User Patches**.
    

-> When in a new project you open the Library (**Y** key) you can recall it in one click: it recreates your whole SD3 + Aux + routing group.

---

## Recall the Superior Drummer Multi-Out Patch.

1. **Create a new software instrument track** (even empty).
    
    - It can be an empty MIDI track, it doesn't matter.
        
2. With that track selected, press **Y** to open the **Library** (left column).
    
3. Go to **User Patches** → you will find your saved patch (_Superior MultiOut_ or whatever you called it).
    
4. Click on it → Logic loads automatically:
    
    - Superior Drummer in Multi-Output mode
        
    - All **Aux** already ready and renamed
        
    - Routing the same as you had saved it
        
5. Now just drag in the MIDI region of the drum kit (or record directly) and you're up and running.
    

---

-> Little tip: If you often open projects where you need that patch right away, consider making a **Project Template** with the track already in it → that way you don't even have to go through the Library.

### Here are some **veteran tricks** that may come in handy with Superior Drummer + Logic Pro:

---

## 1. Rename the aux right away.

As soon as you create the Auxes (Kick, Snare, OH, Room...), rename them in the Mixer (`⌘` + click on the name) → so even in automations and effects you always know what you are dealing with.

---

## 2. Color the tracks.

Assign different colors (e.g., red = kick/snare, blue = cymbals, green = toms, purple = ambience). It helps so much at a glance when you have so many tracks.

---

## 3. Folder Track for cleaning.

If you don't want to use a Stack, you can put all the Aux inside a **Folder Track** → so you close/open the folder and they don't clog up your project.

---

## 4. fast stem bounces.

When you're satisfied with the routing, you can **Bounce in Place** each Aux → you get your audio tracks already printed (useful for archiving light projects or sending tracks to an outside sound engineer).

---

## 5. Use Internal Buses

- Create a **Bus Drums** and send all the Aux there.
    
- On that bus put parallel compression, saturation or a global reverb.  
    -> So you have both control over the individual pieces and a "glue" on the kit.
    

---

## 6. Save multiple versions

You can make **multiple different patches**:

- a "clean" one with only routing,
    
- one with already basic EQ and compressors,
    
- one more "ambient/dark" with reverb ready.  
    In one click you take your whole style with you.
    

---

💡 Bonus: If you often use **the same kit as SD3**, save it directly as **User Preset inside Superior** → so you recall both sounds and routing without touching anything in Logic.

---
