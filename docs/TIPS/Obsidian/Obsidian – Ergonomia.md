
# Obsidian – Ergonomia

## 1. Navigazione rapida
- **Pin delle note importanti**: quando hai una nota che usi spesso (es. `00_INDEX`), aprila e clicca la **puntina in alto a destra** → resta sempre fissa.
- **Sidebar ON/OFF**: puoi nascondere/aprire le sidebar con un click sulle icone oppure assegnare hotkeys in `Settings → Hotkeys`:
  - Toggle left sidebar = scorciatoia tua scelta
  - Toggle right sidebar = scorciatoia tua scelta

## 2. Formattazione minima in Markdown
- `# Titolo` → titolo grande
- `## Sottotitolo` → titolo medio
- `- Elenco` → lista puntata
- `[NomeNota](NomeNota.md)` → link ad altra nota

*(Niente altro serve davvero!)*

## 3. Copertine di sezione
Per ogni cartella importante (es. Harmonial, Superior Drummer 3) crea una **nota-copertina** con lo stesso nome.
Dentro metti i link alle sottosezioni:

## 4. Ricerca globale
- Usa la lente 🔍 a sinistra per trovare subito qualsiasi testo o titolo.
- Ti salva la vita quando ti ricordi un dettaglio ma non dove l’hai scritto.

## 5. Note preferite
- Puoi marcare come “Starred” le note più usate (serve il plugin core **Starred**).
- Così tieni sempre a portata di mano DRUMS, MASTER, FX, ecc.

---
** Regola d’oro: *una cartella = una nota-copertina principale*.  
Il resto sono sottocapitoli. Così non ti perdi mai.

---

### Caso 1 – Nota singola (semplice)

```
INSTRUMENTS
├── Harmonial.md
```

Indice:

```
## INSTRUMENTS
- [Harmonial](Harmonial.md)
```

** Funziona subito perché `[Harmonial](Harmonial.md)` trova la nota `Harmonial.md`.

---

### Caso 2 – Cartella con più note (serve copertina)

```
INSTRUMENTS
├── Superior Drummer 3
│   ├── Superior Drummer 3.md   ← nota-copertina
│   ├── Come separare le uscite.md
│   └── Preset Trip-Hop.md
```

Indice:

```
## INSTRUMENTS
- [Superior Drummer 3](Superior Drummer 3.md)
```

** Qui senza la copertina non funziona (Obsidian non sa aprire una cartella).  
La nota-copertina `Superior Drummer 3.md` fa da porta di ingresso e linka alle altre note dentro la cartella.

---

 Regola finale:

- Se vuoi linkare **una singola nota** → niente copertina.
    
- Se vuoi linkare **una cartella intera** → serve la **nota-copertina**.
    

---

# [NOME SEZIONE]

Questa è la nota principale della sezione **[NOME SEZIONE]**.  
Da qui puoi navigare ai capitoli e agli appunti salvati nella cartella.

---

## Capitoli principali
- [Capitolo 1](Capitolo 1.md)
- [Capitolo 2](Capitolo 2.md)
- [Capitolo 3](Capitolo 3.md)

---

## Workflow / Tips
- [Workflow specifico](Workflow specifico.md)
- [Trucchi e Appunti](Trucchi e Appunti.md)

---

## Extra (se serve)
- [Risorse esterne](Risorse esterne.md)
- [Checklist rapida](Checklist rapida.md)

---

-> Come usarlo:

1. Crea la nota-copertina con lo stesso nome della cartella (es. `Superior Drummer 3.md`).
    
2. Incolla dentro lo scheletro.
    
3. Sostituisci `[NOME SEZIONE]` e i `[link](link.md)` con i nomi reali delle note dentro la cartella.
    

** Così ogni cartella “grossa” (SD3, Harmonial, FX, ecc.) ha la sua porta di ingresso pulita e coerente.