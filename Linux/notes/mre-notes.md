# MRE Notes

## Summary

* Process Monitor -> Log.csv
* WinDump -> out.pcap
* ProcDot -> File Activity, Registry Activity, Network Activity, Process Activity

* Regshot Compare -> Registry Activity
* Autoruns Compare -> Registry Activity (autorun related)

* Kernel Detective -> Memory Dump
* Volatility (Remnux) -> Network Activity, Process Activity

* Process Hacker 2 -> DLLs List, Mutex
* API Monitor -> DLLs List
* Procexp -> Mutex

## Steps

### Pre-Analysis

* Remnux
    * Set to Host-Only
* WinXP Sandbox
    * Set to Host-Only
    * Gateway point to Remnux IP
    * DNS point to Remnux IP

### Malware Analysis

#### Preparation

1. Prepare Process Monitor
    * Stop monitor
    * Clear
    * Options > Uncheck "Show Resolved Network Addresses"
    * Options > Select Columns > Uncheck "Sequence Number" & Check "Thread ID"
2. Prepare WinDump
    * Cmd prompt
    * cd C:\Program Files\procdot
    * `WinDump.exe -w C:\out.pcap`
3. Prepare Regshot
4. Prepare Autoruns
5. Prepare Process Hacker 2 (just to view)
6. Prepare Remnux
    * `ircd start`
    * `httpd start`
    * `honeyd start`
    * `fakedns`
    * Wireshark
        * Prepare to capture

#### Capture

1. Start Autoruns
    * Refresh
    * Save > "pre.arn"
2. Start Regshot
    * Take 1st shot
3. Start Wireshark (Remnux)
4. Start WinDump
5. Start Process Monitor
6. Run malware
7. Wait 30 seconds
8. Terminate malware
9. Terminate all other programs

#### Primary Analysis

1. Analyze with regshot
    * Take 2nd shot
    * Compare
    * See changes in the registry
    * Save > "regshotres.txt"
2. Analyze with Autoruns
    * Refresh
    * File > Compare > "pre.arn"
    * Find green highlights to determine changes in the registry
    * Save > "post.arn"
3. Analyze with ProcDOT
    * Save Process Monitor > All Events & CSV > "Log.csv"
    * In ProcDOT, specify Log.csv and out.pcap
    * Check "dumb" and "compressed" and refresh
        * If graph is to big due to server nodes, unspecify out.pcap
        * Or create new filter > Session > Server Filter > New > Regex > "\d.+"
    * Analyze graph by looking at registry, file, process, network activity
4. Analyze with Wireshark
    * Analyze scan by looking at capture packets

#### Secondary Analysis

1. Start malware
2. Start Process Hacker 2
    * Right click malware > Properties > Modules (to reveal DLLs loaded)
    * Right click malware > Properties > Handles (to reveal whether malware is mutant)
3. Start Kernel Detective
    * Tools > Physical Memory Dumper > Dump All Physical Memory > "mem.dmp"
4. Copy "mem.dmp" over to Remnux
5. Analyze with volatility
    * `volatility -f [dump] pslist`
    * `volatility -f [dump] psscan`
    * `volatility -f [dump] psxview --physical-offset`
    * `volatility -f [dump] connscan`
    * `volatility -f [dump] connections`
    * `volatility -f [dump] sockscan`
    * `volatility -f [dump] -D [directory] -o [memory offset]`
    * `winscp remnux@[ip]:[extracted exe file path] ~/.`

#### Tertiary Analysis

1. Packer
    * PEID
        * ">>" > Entropy > "-"
    * Exeinfope
    * `upx -d [malware.exe]`
2. File Type and Subsystem
    * Exeinfope (file type only)
    * CFF Explorer > Optional Headers
3. MD5 (both packed and unpacked)
    * `md5sum [malware.exe]`
4. File Size (both packed and unpacked)
    * Right click > Properties
    * CFF Explorer

