
# Obsidian - Ergonomics

## 1. Quick navigation.
- **Important note pins**: when you have a note that you use often (e.g. `00_INDEX`), open it and click the **highkey in the upper right corner** → it always stays fixed.
- **Sidebar ON/OFF**: you can hide/open sidebars by clicking icons or assign hotkeys in `Settings → Hotkeys`:
  - Toggle left sidebar = shortcut of your choice
  - Toggle right sidebar = shortcut of your choice

## 2. Minimal formatting in Markdown.
- `# Title` → large title
- `## Subtitle` → medium title
- `- List` → bulleted list
- `[NameNote](NameNote.md)` → link to other note

*(Nothing else is really needed!)*

## 3. Section covers.
For each important folder (e.g., Harmonial, Superior Drummer 3) create a **note-cover page** with the same name.
Inside put links to the subsections:

## 4. Global search
- Use the 🔍 lens on the left to find any text or title right away.
- It saves your life when you remember a detail but not where you wrote it.

## 5. Starred Notes
- You can mark your most used notes as "Starred" (you need the **Starred** core plugin).
- So you always keep DRUMS, MASTER, FX, etc. at hand.

---
**Golden Rule: *one folder = one main note-cover*.  
The rest are subchapters. That way you never get lost.

---

### Case 1 - Single note (simple).

```
INSTRUMENTS
├── Harmonial.md
```

Index:

```
## INSTRUMENTS.
- [Harmonial](Harmonial.md)
```

** It works right away because `[Harmonial](Harmonial.md)` finds the note `Harmonial.md`.

---

### Case 2 - Folder with multiple notes (need cover page).

```
INSTRUMENTS
├── Superior Drummer 3
│ ├─── Superior Drummer 3.md ← note-cover
│ ├─── How to separate outputs.md
│ └── Preset Trip-Hop.md
```

Index:

```
## INSTRUMENTS.
- [Superior Drummer 3](Superior Drummer 3.md)
```

** Here without the cover doesn't work (Obsidian can't open a folder).  
The note-cover `Superior Drummer 3.md` acts as a gateway and links to the other notes inside the folder.

---

 Final rule:

- If you want to link **a single note** → no cover.
    
- If you want to link **a whole folder** → you need the **cover note**.
    

---

# [SECTION NAME]

This is the main note of the section **[SECTION NAME]**.  
From here you can navigate to the chapters and notes saved in the folder.

---

## Main chapters.
- [Chapter 1](Chapter 1.md)
- [Chapter 2](Chapter 2.md)
- [Chapter 3](Chapter 3.md)

---

## Workflow / Tips.
- [Specific Workflow](Specific Workflow.md)
- [Tips and Tricks](Tips and Tricks.md)

---

## Extras (if needed)
- [External Resources](External Resources.md)
- [Quick checklist](Quick checklist.md)

---

-> How to use it:

1. Create the note-cover with the same name as the folder (e.g. `Superior Drummer 3.md`).
    
2. Paste inside the skeleton.
    
3. Replace `[SECTION NAME]` and the `[links](link.md)` with the actual names of the notes inside the folder.
    

** This way each "big" folder (SD3, Harmonial, FX, etc.) has its own clean and consistent input port.