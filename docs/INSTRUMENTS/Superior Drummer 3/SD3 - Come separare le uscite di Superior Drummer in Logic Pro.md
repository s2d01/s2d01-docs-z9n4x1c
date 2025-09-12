
## Come separare le uscite di Superior Drummer in Logic Pro

### 1. Carica Superior come strumento Multi-Output

- Vai in **Pista → Nuova traccia strumento software**.
    
- Nella finestra che si apre, sotto **Tipo di traccia**, scegli:  
    **"Instrument" → "AU Instruments → Toontrack → Superior Drummer → Multi Output (16xStereo)"** (o 8xStereo se non ti servono troppe uscite).
    
- Clicca **Crea**.
    

---

### 2. Attiva le uscite in Logic

- Vai nel **Mixer di Logic** (tasto `X`).
    
- Trova la traccia di Superior Drummer.
    
- In basso, sul canale del plugin, vedrai un piccolo **“+”** (accanto al nome dello strumento).
    
- Clicca il “+” tante volte quante sono le uscite che ti servono (kick, snare, hat, toms, overheads, room...).
    
- Logic creerà automaticamente **canali aux** corrispondenti.
    

---

### 3. Assegna le uscite dentro Superior

- Apri Superior Drummer e vai nel **Mixer interno** del plugin.
    
- Per ogni canale (Kick, Snare Top, Snare Bottom, HH, Toms, OH, Room, ecc.) scegli un’uscita diversa:
    
    - Kick → Output 1 (stereo o mono a seconda della configurazione)
        
    - Snare Top → Output 2
        
    - Snare Bottom → Output 3
        
    - Hi-Hat → Output 4
        
    - … e così via.
        
- Ora Logic riceverà i segnali separati nei canali aux creati al punto 2.
    

---

### 4. Mix in Logic

- Ogni aux adesso è una traccia audio indipendente:
    
    - puoi inserire EQ, compressione, riverbero, delay…
        
    - puoi regolare i volumi separatamente, fare automazioni, ecc.
        

-> Il MIDI resta sempre **su un’unica traccia**, ma a livello audio hai la batteria completamente splittata.

## Dove compaiono le uscite separate in Logic

1. Vai nel **Mixer di Logic** (`X` sulla tastiera).
    
2. Trova la traccia di **Superior Drummer**. È l’**Instrument Channel Strip** (quello con il plugin caricato).
    
3. In basso sul canale, vedrai un piccolo **tasto “+”** accanto al fader.
    
    - Questo pulsante serve per **creare gli Aux Channels** corrispondenti alle uscite aggiuntive.
        
    - Clicca “+” tante volte quante sono le uscite che hai assegnato nel mixer interno di Superior (kick, snare, hi-hat, ecc.).
        
4. Appena clicchi, Logic aggiunge nuovi **canali Aux** a destra della traccia principale.
    
    - Es. Aux 1 = Snare, Aux 2 = Hi-Hat, Aux 3 = Toms, Aux 4 = Overheads… (dipende da come le hai mappate dentro Superior).
        
    - Questi canali hanno il loro **fader, insert, send, pan**, come qualsiasi traccia audio.
        

-> La traccia originale di Superior resta comunque la “traccia madre”: ospita il MIDI e di solito raccoglie la **Kick (Output 1)**. Tutte le altre parti invece arrivano sugli Aux.

## Tipico esempio in Mixer

Dopo aver attivato le uscite, nel Mixer di Logic potresti vedere qualcosa del genere:

- **Inst 1 – Superior Drummer (Instrument Channel)** → Kick
    
- **Aux 1** → Snare Top
    
- **Aux 2** → Snare Bottom
    
- **Aux 3** → Hi-Hat
    
- **Aux 4** → Toms
    
- **Aux 5** → Overheads
    
- **Aux 6** → Room
    

E così via.

## Routing consigliato (Multi-Output in Superior Drummer)

Dentro al **Mixer di Superior** assegna così:

- **Output 1-2 (Stereo principale / Inst Channel di Logic)** → **Kick**
    
- **Output 3-4** → **Snare (Top + Bottom, oppure tieni Top da solo se vuoi più controllo)**
    
- **Output 5-6** → **Hi-Hat**
    
- **Output 7-8** → **Toms** (puoi raggrupparli oppure fare uscite singole se vuoi un mix super dettagliato)
    
- **Output 9-10** → **Overheads (OH)**
    
- **Output 11-12** → **Room (Ambienti)**
    
- **Output 13-14** → **Percussioni extra** (shaker, clap, ecc., se presenti)
    

---

## Come si traduce in Logic

Quando clicchi il **“+”** nella traccia di Superior (nel Mixer di Logic), otterrai:

- **Inst 1** (Superior Drummer – Kick)
    
- **Aux 1** (Snare)
    
- **Aux 2** (Hi-Hat)
    
- **Aux 3** (Toms)
    
- **Aux 4** (Overheads)
    
- **Aux 5** (Room)
    
- **Aux 6** (Percussioni extra)
    

---

## Vantaggi

- Kick e Snare separati: puoi EQarli e comprimerli a piacere.
    
- Hi-Hat su un canale suo: utile per gestire i riverberi e gli alti.
    
- Overheads e Room separati: controllo totale dell’“aria” e della spazialità.
    
- Toms: puoi tenerli insieme o splittarli in più uscite se vuoi trattare ogni tom singolarmente.

-> Ti consiglio di salvare questo setup come **preset del mixer di Superior**, così ogni volta che apri il plugin hai già il routing pronto.

## Come orientarti meglio

1. Rinomina i canali Aux in Logic (es. “Snare”, “Hi-Hat”, “Toms”…) così non ti confondi con i numeri.
    
    - Basta cliccare sul nome del canale sotto al fader e scrivere il nome.
        
2. In Superior Drummer, fai corrispondere le uscite:
    
    - Snare → Out 3/4
        
    - Hi-Hat → Out 5/6
        
    - ecc.
        
3. Poi in Logic, la prima aux che hai creato (anche se si chiama Aux 18) corrisponderà a Out 3/4, la seconda a Out 5/6, ecc.
    

---

-> In pratica: non ti preoccupare del numero (18, 19, 20…), sono solo etichette. L’importante è che ogni uscita audio di Superior abbia un suo Aux dedicato.

---

## Cosa controllare in Superior Drummer

1. Apri **Superior Drummer** e vai nel **Mixer interno** del plugin.
    
2. Guarda i channel strips (Kick, Snare Top, Snare Bottom, Hi-Hat, ecc.).
    
3. In basso a ciascun channel strip c’è un menù a tendina con scritto l’uscita (di solito di default è “Out 1/2”).
    
4. Cambia la Snare (o quello che vuoi separare) da **Out 1/2 → Out 3/4**.
    
5. Ora su Logic, Aux 18 riceverà il segnale.
    

---

## Verifica rapida

- Suona la traccia MIDI (o picchia un pad della Snare in Superior).
    
- Dovresti vedere il meter muoversi su Aux 18.
    
- Ora puoi inserire plugin, EQ, compressione, automazioni, ecc.
    

---

-> Riassumendo: **il routing va fatto due volte**

- in Superior Drummer → assegnare ogni pezzo del kit a un’uscita diversa.
    
- in Logic → creare gli Aux corrispondenti con il “+”.
---

## Come funzionano i piatti in Superior

- I piatti vengono registrati **nei microfoni Overheads (OH)** e **Room/Ambienti**.
    
- Non li troverai quasi mai come canale “Crash 1” o “Ride” separato, perché in uno studio reale i piatti non si microfonano singolarmente (a parte casi speciali).
    
- Quindi:
    
    - se sposti i **OH** su un’uscita, lì dentro sentirai tutti i piatti.
        
    - i **Room/Ambienti** contengono sempre anche i piatti (oltre a tutto il kit).
        

---

## Cosa puoi fare se vuoi più controllo

1. **Regolare il bilanciamento nel mixer di Superior**
    
    - Dentro Superior spesso puoi abbassare i “Bleed” (la quantità di piatti che entra nei microfoni di Room, Snare, ecc.).
        
    - Puoi anche gestire quanto ogni singolo piatto va negli OH.
        
2. **Separare Ride o Crash (quando possibile)**
    
    - In alcune librerie di Superior ci sono microfoni spot dedicati almeno al Ride (piatto importante nel mix).
        
    - Se la tua libreria li prevede, puoi mandarli su un’uscita separata.
        
3. **Trucco alternativo**
    
    - Se ti serve un controllo ancora più chirurgico (tipo compressione diversa per Ride e Crash), puoi duplicare il MIDI:
        
        - su una traccia tieni solo il Ride,
            
        - su un’altra solo i Crash,
            
        - e carichi due istanze di Superior con routing diversi.
            
    - È un po’ più pesante per la CPU, ma ti dà più libertà.
        

---

-> In pratica: i piatti “vivono” sugli **Overheads e Room**, non come canali singoli.

---

## Routing tipico (multi-out in Superior Drummer → Logic Pro)

- **Kick** → Out 1/2 (rimane sul canale principale di Superior)
    
- **Snare (Top + Bottom)** → Out 3/4
    
- **Hi-Hat** → Out 5/6
    
- **Toms (tutti insieme, o separati se vuoi più controllo)** → Out 7/8
    
- **Overheads (tutti i piatti)** → Out 9/10
    
- **Room/Ambienti** → Out 11/12
    

-> Questo è il “pacchetto base” che ti serve per mixare bene.

---

## Perché funziona così

- **Kick e Snare**: microfonati singolarmente → conviene trattarli con EQ e compressione dedicata.
    
- **Hi-Hat**: microfono spot dedicato, utile per regolare i riverberi e controllare gli acuti.
    
- **Toms**: puoi tenerli insieme (Out 7/8) o splittarli (Tom 1 → 7/8, Tom 2 → 9/10, ecc.) se vuoi mix più chirurgico.
    
- **Overheads**: qui senti tutto il kit, ma soprattutto i piatti. Puoi controllare brillantezza e stereo.
    
- **Room**: aggiunge profondità e “aria” realistica → puoi comprimere forte per avere più punch.
    

---

## Suggerimento pratico

Una volta impostato questo routing:

1. Rinomina le Aux in Logic (Kick, Snare, HH, Toms, OH, Room).
    
2. Salva il tutto come **preset in Superior Drummer** e anche come **patch in Logic** → così quando apri un nuovo progetto sei già pronto senza rifare il setup.

---

## Come salvare il routing come preset in Superior Drummer

1. **Apri il Mixer interno** di Superior Drummer.
    
2. Assegna le uscite come ti dicevo (esempio tipico):
    
    - Kick → Out 1/2
        
    - Snare (Top+Bottom) → Out 3/4
        
    - Hi-Hat → Out 5/6
        
    - Toms → Out 7/8
        
    - Overheads → Out 9/10
        
    - Room → Out 11/12
        
3. Una volta che tutto suona e i meter in Logic si muovono correttamente:
    
    - Vai in alto a destra nella finestra di Superior Drummer.
        
    - Apri il menu **Presets**.
        
    - Scegli **Save Mixer Preset** (in SD3 si chiama proprio così).
        
    - Dai un nome tipo: _Logic MultiOut Routing_.
        

---

## Come richiamarlo dopo

- Ogni volta che apri una nuova istanza di Superior Drummer:
    
    1. Carichi il kit che vuoi.
        
    2. Vai nel menu Presets → **Load Mixer Preset**.
        
    3. Seleziona _Logic MultiOut Routing_.
        
- Boom!!  Hai già tutte le uscite assegnate, senza rifare niente.
    

---

-> Consiglio extra:  
Puoi anche salvare direttamente in Logic una **Channel Strip Setting** o addirittura un **Template di progetto** con Superior già in modalità Multi-Output e gli Aux rinominati. Così parti sempre col setup pronto.

---

## Dove salvare il routing (SD3)

1. Vai nel **Mixer interno** di Superior Drummer.
    
2. In alto a sinistra del Mixer vedrai un piccolo menù a tendina (icona con una freccetta).
    
    - Lì trovi le opzioni tipo:
        
        - _Reset Mixer_
            
        - _Save Mixer Preset_
            
        - _Load Mixer Preset_
            
3. Scegli **Save Mixer Preset**.
    
    - Ti verrà chiesto un nome → scrivi ad esempio _Logic MultiOut_.
        

---

## Poi per ricaricarlo

- Quando apri un nuovo progetto e carichi SD3:
    
    - Vai di nuovo nel Mixer → stesso menu → **Load Mixer Preset** → scegli _Logic MultiOut_.
        
- Le assegnazioni di routing alle uscite (Out 1/2, Out 3/4, ecc.) tornano subito come le avevi salvate.
    

---

-> Nota: se non lo vedi subito, assicurati di essere nella **scheda Mixer** di SD3 (non in Drums, Grooves, ecc.). Il menu è proprio sopra i channel strip.

---

## 1. **Channel Strip Setting** (quello che trovi in alto nello strip di Logic)

- Se salvi solo lo **strumento principale** (la traccia “Superior Drummer”), Logic si ricorda il plugin, i suoi preset e i routing interni **solo su quella traccia**.
    
- Però non ti richiama automaticamente anche le **Aux collegate** (quelle create col “+”). Quelle vanno ricreate ogni volta.  
    -> Quindi: **non è sufficiente** se vuoi richiamare l’intero setup multi-output già espanso.
    

---

## 2. **Track Stack (Summing Stack)** + salvataggio come **Patch**

- Se metti la traccia di Superior + tutte le Aux dentro una **Summing Stack**:
    
    1. Seleziona la traccia di SD3 + tutte le sue Aux.
        
    2. Menu **Track → Create Track Stack** → scegli **Summing Stack**.
        
    3. Rinomina la stack, tipo _Superior MultiOut_.
        
- Ora vai nel Browser a sinistra (Inspector → Patch Library) e clicca su **Save...**.
    
- Questo salva una **Patch** completa, con dentro:
    
    - lo strumento (SD3),
        
    - le Aux già create e collegate,
        
    - tutti i plugin sugli Aux,
        
    - nomi e routing.
        

-> Quando la richiami in un nuovo progetto, ti ricrea **tutto il gruppo**: strumento + Aux + mixer routing.

---

## 3. **Template di progetto** (il metodo “definitivo”)

- Se usi sempre quel setup, il più comodo è fare:
    
    1. Apri un progetto vuoto, metti SD3 in Multi-Output, crea gli Aux, metti tutto in Track Stack.
        
    2. Vai su **File → Save as Template**.
        
    3. Quando apri Logic, ti comparirà tra i template iniziali → clicchi e sei subito operativo.
        

---

-> Riassumendo:

- **Channel Strip Setting** = salva solo la traccia principale (non le Aux).
    
- **Track Stack salvata come Patch** = richiama tutto, anche Aux e routing.
    
- **Template di progetto** = ancora meglio se vuoi avere sempre quel setup pronto all’avvio.

---

## Salvare la tua Track Stack come Patch

1. Seleziona la **Track Stack** (la Summing Stack con dentro SD3 e tutte le Aux).
    
2. Con la Library aperta (a sinistra), in alto vedi un pulsante **Save…**.
    
3. Clicca **Save** → dai un nome (es. _Superior MultiOut_).
    
4. Adesso la tua patch compare sotto **User Patches**.
    

-> Quando in un nuovo progetto apri la Library (tasto **Y**) puoi richiamarla in un click: ti ricrea tutto il gruppo SD3 + Aux + routing.

---

## Richiamare la Patch di Superior Drummer Multi-Out

1. **Crea una nuova traccia strumento software** (anche vuota).
    
    - Può essere una traccia MIDI vuota, non importa.
        
2. Con quella traccia selezionata, premi **Y** per aprire la **Library** (colonna a sinistra).
    
3. Vai su **User Patches** → troverai la tua patch salvata (_Superior MultiOut_ o come l’hai chiamata).
    
4. Cliccala → Logic carica automaticamente:
    
    - Superior Drummer in modalità Multi-Output
        
    - Tutti gli **Aux** già pronti e rinominati
        
    - Routing uguale a come l’avevi salvato
        
5. A questo punto basta trascinare dentro la regione MIDI della batteria (o registrare direttamente) e sei operativo.
    

---

-> Piccolo tip: se apri spesso progetti dove ti serve subito quella patch, valuta di farti un **Template di progetto** con già la traccia dentro → così non devi neanche passare dalla Library.

### Ecco qualche **trucchetto da veterano** che può tornarti utile con Superior Drummer + Logic Pro:

---

## 1. Rinominare subito gli Aux

Appena crei gli Aux (Kick, Snare, OH, Room…), rinominali nel Mixer (`⌘` + clic sul nome) → così anche nelle automazioni e negli effetti sai sempre cosa stai trattando.

---

## 2. Colora le tracce

Assegna colori diversi (es. rosso = kick/snare, blu = piatti, verde = toms, viola = ambienti). Aiuta tantissimo a colpo d’occhio quando hai tante tracce.

---

## 3. Folder Track per pulizia

Se non vuoi usare una Stack, puoi mettere tutti gli Aux dentro una **Folder Track** → così chiudi/apri la cartella e non ti intasano il progetto.

---

## 4. Bounce stem veloci

Quando sei soddisfatto del routing, puoi fare **Bounce in Place** di ogni Aux → ti ritrovi le tracce audio già stampate (utile per archiviare progetti leggeri o mandare le tracce a un fonico esterno).

---

## 5. Usa i Bus interni

- Crea un **Bus Drums** e manda lì tutti gli Aux.
    
- Su quel bus metti compressione parallela, saturazione o un riverbero globale.  
    -> Così hai sia controllo sui singoli pezzi, sia un “collante” sul kit.
    

---

## 6. Salva più versioni

Puoi farti **più Patch diverse**:

- una “pulita” con solo routing,
    
- una con già EQ e compressori base,
    
- una più “ambient/dark” col riverbero pronto.  
    In un click ti porti dietro tutto il tuo stile.
    

---

💡 Bonus: se usi spesso **lo stesso kit di SD3**, salvalo direttamente come **User Preset dentro Superior** → così richiami sia suoni sia routing senza toccare niente in Logic.

---
