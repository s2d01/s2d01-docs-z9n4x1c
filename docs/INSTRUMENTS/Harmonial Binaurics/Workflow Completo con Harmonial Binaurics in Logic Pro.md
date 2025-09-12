# Workflow Completo con Harmonial Binaurics in Logic Pro

Guida operativa per ottenere il massimo da Harmonial Binaurics in Logic Pro, con configurazioni multi-out, resampling e trasformazione in strumenti suonabili.

---

## 1. Configurazione Multi-Out

1. Crea una traccia strumento software.  
2. Carica **Harmonial Binaurics (Multi Output, 8 Stereo)**.  
3. Nella Vista Mixer, clicca il simbolo `+` accanto al canale del plugin.  
4. Logic aggiunge 7 canali aux, ognuno con insert, send e routing indipendenti.  
5. Tutto l'audio di Harmonial esce dalle Out 1–2, ma i canali aux possono essere usati per routing creativi.  

---

## 2. Configurazioni Multi-Out

### 2.1 Processamento Parallelo
- Out 1–2 → Suono pulito (dry)  
- Aux 1 → Riverbero dedicato  
- Aux 2 → Delay dedicato  
- Aux 3 → Distorsione/Crusher  
- Aux 4 → Effetti di modulazione  

### 2.2 Separazione di Frequenze
Usando EQ o uno splitter multibanda:  
- Out 1–2 → Bassi (0–120 Hz)  
- Aux 1 → Medio-bassi (120–500 Hz)  
- Aux 2 → Medio-acuti (500–5 kHz)  
- Aux 3 → Acuti (5 kHz+)  

### 2.3 Resampling Multicanale
- Out 1–2 → Sorgente principale  
- Aux 1 → Traccia audio parallela  
- Aux 2 → Bus con FX granulari  
- Aux 3 → Bus con riverbero infinito  

### 2.4 Performance Live
- Out 1–2 → Suono principale  
- Aux 1 → Catena FX A (riverbero + delay)  
- Aux 2 → Catena FX B (distorsione + compressione)  
- Aux 3 → Catena FX C (phaser + chorus)  

---

## 3. Resampling Multicanale

1. Indirizza le uscite aux verso tracce audio.  
2. Arma tutte le tracce audio e registra in tempo reale.  
3. Cattura registrazioni parallele con diverse versioni del segnale.  
4. Salva i frammenti audio in cartelle dedicate per l'organizzazione dei campioni.  

---

## 4. Costruire Kit con Sampler

1. Aggiungi una traccia strumento software.  
2. Carica **Sampler**.  
3. Trascina i campioni registrati nella finestra di mappatura.  
4. Mappatura consigliata:  
   - Mapping Cromatico → un campione per tasto consecutivo  
   - One Shot → per glitch e colpi singoli  
5. Regola ADSR, filtri, pitch.  
6. Salva come patch (es. `Harmonial_Sampler_Kit01`).  

---

## 5. Costruire Kit con Drum Machine Designer (DMD)

1. Aggiungi una traccia strumento software.  
2. Carica **Drum Machine Designer**.  
3. Trascina i campioni sui pad.  
4. Ogni pad apre Quick Sampler con controlli indipendenti.  
5. Organizza i pad per categoria:  
   - Fila inferiore → drone e bassi  
   - Fila centrale → loop ritmici  
   - Fila superiore → glitch e texture  
6. Salva come patch (es. `Harmonial_DMD_Kit01`).  

---

## 6. Strategie di Manipolazione Creativa

### 6.1 Chopping
- Taglia in frammenti corti (1/16, 1/8).  
- Riorganizza per creare nuovi pattern.  
- Usa **Strip Silence** per separazione automatica.  

### 6.2 Granulare
- Importa in **Alchemy** in modalità Granular.  
- Sperimenta con densità e modulazione.  

### 6.3 Layering
- Duplica un campione, trasponi ±12 semitoni.  
- Pan sinistra/destra.  
- Applica FX diversi a ogni layer.  

### 6.4 Stretching
- Usa **Flex Time**.  
- Allunga/comprimi per adattare al tempo o creare glitch.  

### 6.5 Reverse
- Crea versioni invertite dei campioni.  
- Crossfade tra originale e inverso.  

### 6.6 Resampling Iterativo
1. Genera materiale da Harmonial.  
2. Bounce in Place e affetta.  
3. Carica campioni in Sampler/DMD.  
4. Suona nuovi pattern e registra.  
5. Ripeti il ciclo per costruire librerie sempre più complesse.  

---

## 7. Suggerimenti Pratici
- Usa codifica colori sui canali aux per distinguere le funzioni.  
- Salva il setup come Template o Patch per velocizzare il workflow.  
- Pensa a Harmonial come una sorgente grezza da scolpire tramite routing e processamento parallelo.  