# Complete Guide to Terminal Commands for Mac Musicians

## Index

1. [Disk Space Analysis](#analysis-of-disk-space)
2. [System cleanup](#cleanup-of-system)
3. [Managing Cache and Temporary Files](#manage-cache-and-temporary-files)
4. [System and Process Diagnostics](#diagnostics-system-and-processes)
5. [Search and File Management](#search-and-manage-files)
6. [Audio and Plugin Maintenance](#maintenance-audio-and-plugin)
7. [Performance Monitoring](#performance-monitoring)
8. [Backup and Security](#backup-and-security)
9. [Emergency commands](#emergency-commands)
10. [Security Levels Legend](#legend-security-levels)

---

## Disk Space Analysis.

### General Disk Status
```bash
## View available space on all volumes
df -h

# Detailed space on the main disk
df -h /

# List all connected disks
diskutil list

# Detailed information about a specific disk
diskutil info disk0
```

### Space Utilization Analysis
```bash
# Size of folders in home (sorted by size)
du -sh ~/* | sort -hr | head -10

# Specific directory analysis
du -sh /path/directory

# Find the 10 largest directories in the system (SLOW - use with caution)
sudo du -sh /* 2>/dev/null | sort -hr | head -10

# Recursive analysis of a folder
du -ah ~/Desktop | sort -hr | head -20
```
**Level:** SAFE

---

## System Cleanup

### User Cache
```bash
## View user cache size
du -sh ~/Library/Caches/

# Clean user caches (SAFE - apps will recreate them)
rm -rf ~/Library/Caches/*

# Browser-specific caches
rm -rf ~/Library/Caches/com.google.Chrome/
rm -rf ~/Library/Caches/com.operasoftware.Opera/
rm -rf ~/Library/Caches/com.apple.Safari/
```
**Level:** SAFE

### System Log
````bash
# User log size
du -sh ~/Library/Logs/

# User log cleanup
rm -rf ~/Library/Logs/*

# System logs (requires sudo)
sudo du -sh /var/log/
sudo rm -rf /var/log/*.log
```
**Level:** SAFE

### Trash and Temporary Files
```bash
# User trash size
du -sh ~/.Trash/

# Empty Trash
rm -rf ~/.Trash/*

# System Trash (administrators)
sudo rm -rf /System/Volumes/Data/.Trash/*

# System temporary files
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*
```
**Level:** SAFE

---

## Cache and Temporary File Management.

### Cache App Specifications
```bash
## Cache Containers (sandboxed app)
du -sh ~/Library/Containers/*/Data/Library/Caches/

# Cleanup Cache Containers
find ~/Library/Containers -name "Caches" -type d -exec rm -rf {} + 2>/dev/null

# Cache Group Containers
du -sh ~/Library/Group\ Containers/

# Cache of Homebrew (if installed)
du -sh ~/Library/Caches/Homebrew/
rm -rf ~/Library/Caches/Homebrew/*
```
**Level:** SAFE

### Specific Temporary Files
```bash
# Temporary message files (often very large).
du -sh ~/Library/Containers/com.apple.MobileSMS/Data/tmp/
rm -rf ~/Library/Containers/com.apple.MobileSMS/Data/tmp/*

# Cache system updates
sudo du -sh /Library/Updates/
sudo rm -rf /Library/Updates/*

# Cache fonts
sudo atsutil databases -remove
```
**Level:** SAFE

---

## System and Process Diagnostics

### Monitoring Processes
```bash
## Processes sorted by CPU usage
top -o cpu

# Processes sorted by memory usage
top -o mem

# Processes that write to disk
sudo fs_usage | head -20

# User-specific processes
ps aux | grep user_name

# End process for PID
sudo kill PID_number

# kill process by name (WARNING)
sudo killall process_name
```
**Level:** WARNING (kill/killall)

### System Status
```bash
# Detailed memory usage
vm_stat

# CPU information
sysctl -n machdep.cpu.brand_string

# CPU temperature (if supported)
sudo powermetrics -n 1 -s cpu_power | grep "CPU die temperature"

# Disk integrity check
diskutil verifyVolume /
```
**Level:** SAFE

---

## File Search and Management

### Searching for Large Files
```bash
## Files larger than 500MB in the home
find ~ -size +500M -type f -exec ls -lh {} \; 2>/dev/null

# Files larger than 1GB in the system
sudo find / -size +1G -type f -exec ls -lh {} \; 2>/dev/null

# Files modified in the last 7 days larger than 100MB
find ~ -mtime -7 -size +100M -type f -exec ls -lh {} \;

# Search for duplicate files by name
find ~ -type f -exec basename {} \; | sort | uniq -d
```
**Level:** SAFE

### Permission Management
```bash
# View detailed permissions
ls -la /path/file

# Change owner (WARNING)
sudo chown user:file group

# Restore user permissions
sudo chown -R $(whoami) ~/path/

# reset user disk permissions
diskutil resetUserPermissions / `id -u`
```
**Level:** WARNING (chown).

---

## Audio and Plugin Maintenance

### Audio Library Analysis
```bash
## Logic Pro library size
du -sh ~/Library/Audio/Apple\ Loops/
du -sh ~/Library/Application\ Support/Logic/

# Cache Logic Pro
du -sh ~/Library/Caches/com.apple.logic*
rm -rf ~/Library/Caches/com.apple.logic*.

# Kontakt/Native Instruments libraries
du -sh ~/Library/Application\ Support/Native Instruments/
du -sh ~/Documents/Native Instruments/

# VST/AU plugin size
du -sh ~/Library/Audio/Plug-Ins/VST/
du -sh ~/Library/Audio/Plug-Ins/Components/
du -sh //Library/Audio/Plug-Ins/
```
**Level:** SAFE (display only)

### Plugin Management
```bash
# List of installed VST plugins
ls -la ~/Library/Audio/Plug-Ins/VST/

# Audio Units plugin list
ls -la ~/Library/Audio/Plug-Ins/Components/

# AU plugin scan
auval -a

# Reset Audio Units cache (resolves plugin issues).
sudo rm -rf ~/Library/Caches/AudioUnitCache/
```
**Level:** SAFE

### Audio Core and Audio System
```bash
# Restart Core Audio (fixes audio problems)
sudo launchctl stop com.apple.audio.coreaudiod
sudo launchctl start com.apple.audio.coreaudiod

# Reset PRAM audio (on reboot)
# Command to execute: Hold down Cmd+Option+P+R during startup.

# Audio device list
system_profiler SPAudioDataType
```
**Level:** SAFE

---

## Performance Monitoring

### Memory and Swap
```bash
## Virtual memory status
vm_stat

# Memory pressure
memory_pressure

# Memory purge (force cache release)
sudo purge

# Swap active files
ls -lah /var/vm/swapfile*
```
**Level:** SAFE

### Network and Connections
```bash
# Active network connections
lsof -i

# Network traffic statistics
nettop -m route

# DNS speed test
dig google.com

# Flush DNS cache
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
```
**Level:** SECURE

---

## Backup and Security

### Time Machine
```bash.
## Time Machine status
tmutil status

# List of available backups
tmutil listbackups

# Start manual backups
tmutil startbackups

# Time Machine backup size
tmutil calculatedrift
```
**Level:** SAFE

### Manual Backups
```bash
# Copy with attribute preservation
cp -a source destination

# Directory synchronization
rsync -av --progress origin/ destination/

# Incremental backup
rsync -av --progress --delete origin/ destination/

# Integrity check with checksum
shasum -a 256 file.txt
```
**Level:** SECURE

---

## Emergency Commands

### Locked System
```bash
## Force quit application
sudo killall -9 app_name

# Restart Finder
sudo killall Finder

# Restart Dock
sudo killall Dock

# Forced user logout
sudo launchctl bootout user/$(id -u user_name)
```
**Level:** NUCLEAR

### Recovery System
```bash
# Verify and repair disk permissions
diskutil verifyVolume /
diskutil repairVolume /

# First Aid on disk (from Recovery Mode)
diskutil verifyDisk disk0
diskutil repairDisk disk0

# Reset SMC (System Management Controller)
# MacBook: Shift+Control+Option+Power for 10 seconds
# Mac desktop: Unplug power for 15 seconds

# Reset NVRAM
# On reboot: Cmd+Option+P+R until second boot sound
```
**Level:** NUCLEAR

### Cleanup Emergency Space
```bash
# Aggressive system cache deletion
sudo rm -rf /System/Library/Caches/*
sudo rm -rf /var/folders/*/*/C/*

# Complete system log cleanup
sudo rm -rf /private/var/log/*

# Delete download cache
rm -rf ~/Library/Caches/com.apple.Safari/Downloads/*

# Complete emptying of baskets
sudo rm -rf ~/.Trash/*
sudo rm -rf /Volumes/*/.Trash/*
```
**Level:** NUCLEAR

---

## Legend Security Levels.

### SAFE.
Commands that do not harm the system. Cache and logs are automatically recreated by applications when needed.

### CAUTION.
Commands that change system settings or terminate processes. Use with caution and know what you are doing.

### NUCLEAR.
Potentially dangerous commands that can cause data loss or system instability. Use only in emergency situations or with full backup.

---

## Final Notes.

- Always make backups before massive operations
- Cache files are automatically recreated by apps
- On modern SSDs, fragmentation is not a problem
- Time Machine is essential for musicians (projects and audio libraries)
- Always test on non-critical system before production
- If in doubt, consult official Apple documentation

---

**Version:** 1.0
**Last Update:** September 2025
**Compatibility:** macOS 10.15+ (Catalina and later).