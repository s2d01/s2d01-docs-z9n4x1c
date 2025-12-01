
**Template Logic Pro -** ***Harmonial Resampling Station***.
## **1. Track Generator**
- **Type:** Software Instrument
- **Plugin loaded:** Harmonial Binauris.
- **Output:** → *Bus 1* (not "Stereo Out").
- Rename Track:**Harmonial

## **2. Audio Recorder Track**
- **Type:** Audio
- **Input:** *Bus 1*
- **Output:** Stereo Out
- Always arm this track for recording.
- Rename: Audio Capture

## **3. Manipulation Track**
- **Type:** Audio
- Use this to import or drag recorded bounces.
- Enable **Flex** (Polyphonic or Slicing, depends on what kind of editing you want to do).
- Rename: Audio FX / Flex

## **4. Creative Effects (Bus FX)**
Set 2-3 Aux to process quickly:
- **Bus 10 → Reverb** (e.g. *Chromaverb*).
- **Bus 11 → Delay** (Stereo Delay or Tape Delay).
- **Bus 12 → Crusher/Distortion**
All preconfigured sends (send) on the track <span style="font-size:16pt;"><b>Audio FX / Flex</b></span>.

## **5. Workflow ready**
1. Arm Audio Capture and press **R** → record on the fly what comes out of Harmonial.
2. Immediately drag the recorded file to the Audio FX / Flex track.
3. Apply Flex, chopping, strip silence, etc.
4. If you create something beautiful → **Ctrl+B (Bounce in Place)** and accumulate new clips ready to be reused.

## **6. Save Template**
- Go to **File → Save as Template...**
- Call it: *Harmonial Resampler*
- So you find it every time in the "New Project from Template" menu.

-> With this setup you basically use Harmonial as a **random generator of unique samples**, and in two clicks you are already ready to record, manipulate and layer without wasting time with tedious routing.

---