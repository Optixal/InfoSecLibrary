#!/usr/bin/python

import sys
from select import select

def write(data, sep="\n"):
    sys.stdout.write(data + sep)
    sys.stdout.flush()

def readline(prompt):
    timeout = 5
    write(prompt, sep="")
    rlist, _, _ = select([sys.stdin], [], [], timeout)
    if rlist:
        s = sys.stdin.readline()
        return s
    else:
        write("Times up!")
        exit()

def main():
    write("Hey there!")
    name = readline("What is your name?: ").strip()
    write("Oh hey %s!" % name)

if __name__ == "__main__":
    main()
