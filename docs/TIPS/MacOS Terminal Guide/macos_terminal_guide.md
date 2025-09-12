# Guida Completa ai Comandi Terminal per Musicisti Mac

## Indice

1. [Analisi dello Spazio Disco](#analisi-dello-spazio-disco)
2. [Pulizia del Sistema](#pulizia-del-sistema)
3. [Gestione Cache e File Temporanei](#gestione-cache-e-file-temporanei)
4. [Diagnostica Sistema e Processi](#diagnostica-sistema-e-processi)
5. [Ricerca e Gestione File](#ricerca-e-gestione-file)
6. [Manutenzione Audio e Plugin](#manutenzione-audio-e-plugin)
7. [Monitoraggio Performance](#monitoraggio-performance)
8. [Backup e Sicurezza](#backup-e-sicurezza)
9. [Comandi di Emergenza](#comandi-di-emergenza)
10. [Legenda Livelli di Sicurezza](#legenda-livelli-di-sicurezza)

---

## Analisi dello Spazio Disco

### Stato Generale del Disco
```bash
# Visualizza spazio disponibile su tutti i volumi
df -h

# Spazio dettagliato del disco principale
df -h /

# Lista tutti i dischi collegati
diskutil list

# Informazioni dettagliate su un disco specifico
diskutil info disk0
```

### Analisi Utilizzo Spazio
```bash
# Dimensione cartelle nella home (ordinato per dimensione)
du -sh ~/* | sort -hr | head -10

# Analisi directory specifica
du -sh /percorso/cartella

# Trova le 10 cartelle più grosse nel sistema (LENTO - usa con cautela)
sudo du -sh /* 2>/dev/null | sort -hr | head -10

# Analisi ricorsiva di una cartella
du -ah ~/Desktop | sort -hr | head -20
```
**Livello:** SICURO

---

## Pulizia del Sistema

### Cache Utente
```bash
# Visualizza dimensione cache utente
du -sh ~/Library/Caches/

# Pulizia cache utente (SICURO - le app le ricreeranno)
rm -rf ~/Library/Caches/*

# Cache specifiche per browser
rm -rf ~/Library/Caches/com.google.Chrome/
rm -rf ~/Library/Caches/com.operasoftware.Opera/
rm -rf ~/Library/Caches/com.apple.Safari/
```
**Livello:** SICURO

### Log di Sistema
```bash
# Dimensione log utente
du -sh ~/Library/Logs/

# Pulizia log utente
rm -rf ~/Library/Logs/*

# Log di sistema (richiede sudo)
sudo du -sh /var/log/
sudo rm -rf /var/log/*.log
```
**Livello:** SICURO

### Cestino e File Temporanei
```bash
# Dimensione cestino utente
du -sh ~/.Trash/

# Svuota cestino
rm -rf ~/.Trash/*

# Cestino di sistema (amministratori)
sudo rm -rf /System/Volumes/Data/.Trashes/*

# File temporanei di sistema
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*
```
**Livello:** SICURO

---

## Gestione Cache e File Temporanei

### Cache App Specifiche
```bash
# Cache Containers (app sandboxed)
du -sh ~/Library/Containers/*/Data/Library/Caches/

# Pulizia cache Containers
find ~/Library/Containers -name "Caches" -type d -exec rm -rf {} + 2>/dev/null

# Cache Group Containers
du -sh ~/Library/Group\ Containers/

# Cache di Homebrew (se installato)
du -sh ~/Library/Caches/Homebrew/
rm -rf ~/Library/Caches/Homebrew/*
```
**Livello:** SICURO

### File Temporanei Specifici
```bash
# File temporanei messaggi (spesso molto grossi)
du -sh ~/Library/Containers/com.apple.MobileSMS/Data/tmp/
rm -rf ~/Library/Containers/com.apple.MobileSMS/Data/tmp/*

# Cache aggiornamenti sistema
sudo du -sh /Library/Updates/
sudo rm -rf /Library/Updates/*

# Cache font
sudo atsutil databases -remove
```
**Livello:** SICURO

---

## Diagnostica Sistema e Processi

### Monitoraggio Processi
```bash
# Processi ordinati per uso CPU
top -o cpu

# Processi ordinati per uso memoria
top -o mem

# Processi che scrivono su disco
sudo fs_usage | head -20

# Processi specifici di un utente
ps aux | grep nome_utente

# Termina processo per PID
sudo kill PID_numero

# Termina processo per nome (ATTENZIONE)
sudo killall nome_processo
```
**Livello:** ATTENZIONE (kill/killall)

### Stato Sistema
```bash
# Uso memoria dettagliato
vm_stat

# Informazioni CPU
sysctl -n machdep.cpu.brand_string

# Temperatura CPU (se supportato)
sudo powermetrics -n 1 -s cpu_power | grep "CPU die temperature"

# Controllo integrità disco
diskutil verifyVolume /
```
**Livello:** SICURO

---

## Ricerca e Gestione File

### Ricerca File Grossi
```bash
# File più grossi di 500MB nella home
find ~ -size +500M -type f -exec ls -lh {} \; 2>/dev/null

# File più grossi di 1GB nel sistema
sudo find / -size +1G -type f -exec ls -lh {} \; 2>/dev/null

# File modificati negli ultimi 7 giorni più grossi di 100MB
find ~ -mtime -7 -size +100M -type f -exec ls -lh {} \;

# Cerca file duplicati per nome
find ~ -type f -exec basename {} \; | sort | uniq -d
```
**Livello:** SICURO

### Gestione Permessi
```bash
# Visualizza permessi dettagliati
ls -la /percorso/file

# Cambia proprietario (ATTENZIONE)
sudo chown utente:gruppo file

# Ripristina permessi utente
sudo chown -R $(whoami) ~/percorso/

# Reset permessi disco utente
diskutil resetUserPermissions / `id -u`
```
**Livello:** ATTENZIONE (chown)

---

## Manutenzione Audio e Plugin

### Analisi Librerie Audio
```bash
# Dimensione librerie Logic Pro
du -sh ~/Library/Audio/Apple\ Loops/
du -sh ~/Library/Application\ Support/Logic/

# Cache Logic Pro
du -sh ~/Library/Caches/com.apple.logic*
rm -rf ~/Library/Caches/com.apple.logic*

# Librerie Kontakt/Native Instruments
du -sh ~/Library/Application\ Support/Native\ Instruments/
du -sh ~/Documents/Native\ Instruments/

# Dimensione plugin VST/AU
du -sh ~/Library/Audio/Plug-Ins/VST/
du -sh ~/Library/Audio/Plug-Ins/Components/
du -sh /Library/Audio/Plug-Ins/
```
**Livello:** SICURO (solo visualizzazione)

### Gestione Plugin
```bash
# Lista plugin VST installati
ls -la ~/Library/Audio/Plug-Ins/VST/

# Lista plugin Audio Units
ls -la ~/Library/Audio/Plug-Ins/Components/

# Scansione plugin AU
auval -a

# Reset cache Audio Units (risolve problemi plugin)
sudo rm -rf ~/Library/Caches/AudioUnitCache/
```
**Livello:** SICURO

### Core Audio e Sistema Audio
```bash
# Riavvia Core Audio (risolve problemi audio)
sudo launchctl stop com.apple.audio.coreaudiod
sudo launchctl start com.apple.audio.coreaudiod

# Reset PRAM audio (al riavvio)
# Comando da eseguire: Tieni premuto Cmd+Option+P+R durante l'avvio

# Lista dispositivi audio
system_profiler SPAudioDataType
```
**Livello:** SICURO

---

## Monitoraggio Performance

### Memoria e Swap
```bash
# Stato memoria virtuale
vm_stat

# Pressione memoria
memory_pressure

# Pulizia memoria (forza rilascio cache)
sudo purge

# Swap files attivi
ls -lah /var/vm/swapfile*
```
**Livello:** SICURO

### Rete e Connessioni
```bash
# Connessioni di rete attive
lsof -i

# Statistiche traffico di rete
nettop -m route

# Test velocità DNS
dig google.com

# Flush cache DNS
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
```
**Livello:** SICURO

---

## Backup e Sicurezza

### Time Machine
```bash
# Stato Time Machine
tmutil status

# Lista backup disponibili
tmutil listbackups

# Avvia backup manuale
tmutil startbackup

# Dimensione backup Time Machine
tmutil calculatedrift
```
**Livello:** SICURO

### Backup Manuali
```bash
# Copia con preservazione attributi
cp -a origine destinazione

# Sincronizzazione directory
rsync -av --progress origine/ destinazione/

# Backup incrementale
rsync -av --progress --delete origine/ destinazione/

# Verifica integrità con checksum
shasum -a 256 file.txt
```
**Livello:** SICURO

---

## Comandi di Emergenza

### Sistema Bloccato
```bash
# Forza quit applicazione
sudo killall -9 nome_app

# Riavvia Finder
sudo killall Finder

# Riavvia Dock
sudo killall Dock

# Logout forzato utente
sudo launchctl bootout user/$(id -u nome_utente)
```
**Livello:** NUCLEARE

### Recovery Sistema
```bash
# Verifica e ripara permessi disco
diskutil verifyVolume /
diskutil repairVolume /

# First Aid su disco (da Recovery Mode)
diskutil verifyDisk disk0
diskutil repairDisk disk0

# Reset SMC (System Management Controller)
# MacBook: Shift+Control+Option+Power per 10 secondi
# Mac desktop: Scollega alimentazione per 15 secondi

# Reset NVRAM
# Al riavvio: Cmd+Option+P+R fino al secondo suono di avvio
```
**Livello:** NUCLEARE

### Pulizia Emergenza Spazio
```bash
# Eliminazione cache di sistema aggressiva
sudo rm -rf /System/Library/Caches/*
sudo rm -rf /var/folders/*/*/C/*

# Pulizia log sistema completa
sudo rm -rf /private/var/log/*

# Eliminazione download cache
rm -rf ~/Library/Caches/com.apple.Safari/Downloads/*

# Svuotamento completo cestini
sudo rm -rf ~/.Trash/*
sudo rm -rf /Volumes/*/.Trashes/*
```
**Livello:** NUCLEARE

---

## Legenda Livelli di Sicurezza

### SICURO
Comandi che non danneggiano il sistema. Cache e log vengono ricreati automaticamente dalle applicazioni quando necessario.

### ATTENZIONE  
Comandi che modificano impostazioni di sistema o terminano processi. Usare con cautela e sapere cosa si sta facendo.

### NUCLEARE
Comandi potenzialmente pericolosi che possono causare perdita di dati o instabilità del sistema. Usare solo in situazioni di emergenza o con backup completo.

---

## Note Finali

- Sempre fare backup prima di operazioni massive
- I file cache vengono ricreati automaticamente dalle app
- Su SSD moderni la frammentazione non è un problema
- Time Machine è essenziale per musicisti (progetti e librerie audio)
- Testare sempre su sistema non critico prima della produzione
- In caso di dubbi, consultare documentazione ufficiale Apple

---

**Versione:** 1.0  
**Ultimo aggiornamento:** Settembre 2025  
**Compatibilità:** macOS 10.15+ (Catalina e successivi)