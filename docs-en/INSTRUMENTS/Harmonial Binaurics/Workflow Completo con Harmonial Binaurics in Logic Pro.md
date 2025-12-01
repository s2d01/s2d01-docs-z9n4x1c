# Complete Workflow with Harmonial Binaurics in Logic Pro.

Workflow guide for getting the most out of Harmonial Binaurics in Logic Pro, including multi-out configurations, resampling, and transformation into playable instruments.

---

## 1. Multi-Out Configuration

1. Create a software instrument track.  
2. Load **Harmonial Binaurics (Multi Output, 8 Stereo)**.  
3. In the Mixer View, click the `+` symbol next to the plugin channel.  
4. Logic adds 7 aux channels, each with independent insert, send, and routing.  
5. All audio from Harmonial comes out of Out 1-2, but the aux channels can be used for creative routing.  

---

## 2. Multi-Out Configurations

### 2.1 Parallel Processing
- Out 1-2 → Clean (dry) sound
- Aux 1 → Dedicated reverb
- Aux 2 → Dedicated delay
- Aux 3 → Distortion/Crusher
- Aux 4 → Modulation effects

### 2.2 Frequency Separation.
Using EQ or a multiband splitter:
- Out 1-2 → Bass (0-120 Hz)
- Aux 1 → Mid-bass (120-500 Hz)
- Aux 2 → Medium-high (500-5 kHz)
- Aux 3 → Treble (5 kHz+)

### 2.3 Multichannel Resampling
- Out 1-2 → Main source
- Aux 1 → Parallel audio track
- Aux 2 → Bus with granular FX
- Aux 3 → Bus with infinite reverb

### 2.4 Live Performance
- Out 1-2 → Main sound
- Aux 1 → FX Chain A (reverb + delay)
- Aux 2 → FX Chain B (distortion + compression)
- Aux 3 → FX Chain C (phaser + chorus)

---

## 3. Multichannel Resampling

1. Routes aux outputs to audio tracks.  
2. Arms all audio tracks and records in real time.  
3. Capture parallel recordings with different versions of the signal.  
4. Saves audio fragments in dedicated folders for sample organization.  

---

## 4. Building Kits with Sampler

1. Add a software instrument track.  
2. Load **Sampler**.  
3. Drag the recorded samples to the mapping window.  
4. Recommended mapping:
   - Chromatic Mapping → one sample per consecutive key
   - One Shot → for glitches and single shots
5. Adjust ADSR, filters, pitch.  
6. Save as patch (e.g. `Harmonial_Sampler_Kit01`).  

---

## 5. Building Kits with Drum Machine Designer (DMD)

1. Add a software instrument track.  
2. Load **Drum Machine Designer**.  
3. Drag the samples onto the pads.  
4. Each pad opens Quick Sampler with independent controls.  
5. Organize the pads by category:
   - Bottom row → drone and bass
   - Middle row → rhythm loops
   - Top row → glitches and textures
6. Save as a patch (e.g. `Harmonial_DMD_Kit01`).  

---

## 6. Creative Manipulation Strategies.

### 6.1 Chopping
- Cut into short fragments (1/16, 1/8).  
- Rearrange to create new patterns.  
- Use **Strip Silence** for automatic separation.  

### 6.2 Granular
- Import into **Alchemy** in Granular mode.  
- Experiment with density and modulation.  

### 6.3 Layering
- Duplicate a sample, transpose ±12 semitones.  
- Pan left/right.  
- Apply different FX to each layer.  

### 6.4 Stretching
- Use **Flex Time**.  
- Stretch/compress to adapt to time or create glitches.  

### 6.5 Reverse
- Creates inverted versions of samples.  
- Crossfade between original and reverse.  

### 6.6 Iterative Resampling.
1. Generates material from Harmonial.  
2. Bounce in Place and slice.  
3. Load samples into Sampler/DMD.  
4. Play new patterns and record.  
5. Repeat the cycle to build increasingly complex libraries.  

---

## 7. Practical Tips
- Use color coding on aux channels to distinguish functions.  
- Save the setup as a Template or Patch to speed up the workflow.  
- Think of Harmonial as a raw source to be sculpted by routing and parallel processing.  