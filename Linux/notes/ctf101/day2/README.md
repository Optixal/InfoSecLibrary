# CTF101 Day 2 - OS Exploits

## Commands
* readelf -a a.out # useful information about a binary - entry point, section header addresses
* strace # see what is being executed
* hexdump -d a.out
* gdb
  * x/1d $ebp-0x18 # eXamine 1 Decimal at address (local variable)

## Compiling
* gcc -save-temps hello.c

hello.c
    |
Preprocessor
    |
hello.i (sort of a copy and paste)
    |
Compiler
    |
hello.s (assembly code)
    |
Assembler
    |
hello.o (ELF relocatable, cannot run because its not linked)
    |
Linker
    |
a.out (Assembler.out, the final binary)

## Reversing Tips

### Overwrite Vars
exploit string (buffer size) + variable

### Overwrite EIP
pattern create 200
pattern search

exploit string (offset) + new EIP

After pattern search, when creating exploit string, fuzz the offsets:
'A' + exploitstr
'AA' + exploitstr
'AAA' + exploitstr

### ASLR
Address Space Location Randomisation
Randomizes memory addresses
To bypass, use NOP sled
Point EIP to a range within NOP sled, based on randomness, it will take a while
The NOP sled does nothing and will continue to say shellcode

echo 0 | sudo tee /proc/sys/kernel/randomize_va_space # Disable ASLR
ldd ./seashells # Check if ASLR is on
If ASLR is OFF, addressess should remain constant

env - gdb ./seashells
env - ./seashells

Avoid picking addresses and shellcode with 0x0a or 0x0b!!!!!

### Stack Canary
A variable to check whether stack has changed before returning, on by default when compiling

### NX / DEP
* readelf -a a.out

Thank you for participating in CTF101 !
We hope we have helped you grow your interest in Information Security.
Therese are some resources you can use to explore the world of security:
Practice Sites:

http://overthewire.org/wargames/
https://exploit-exercises.com/ (protostar)

Defeating Security Mitigations:

https://security.stackexchange.com/a/20502
(Use this to figure out what u have to learn)


Tools:
https://github.com/Gallopsled/pwntools
https://github.com/hugsy/gef
https://binary.ninja/

Reminder! NUS Greyhats is recruiting core team members. Head over to nusgreyhats.org/core to register your interest =)
