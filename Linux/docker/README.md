# Docker Notes

Python docker server requires "requirements.txt" to be in working directory.

Python scripts running on python docker container will require multithreading capabitlities programmed into the script.

Python scripts running as a service using xinetd on an OS like Ubuntu will not need multithreading capabilities.

Python scripts will require the use of sys.stdout.write and flush in place of print:
```python
def write(data, sep="\n"):
    sys.stdout.write(data + sep)
    sys.stdout.flush()
```

C programs will require the following statements to be made
```c
setvbuf(stdin, NULL, _IONBF, 0);
setvbuf(stdout, NULL, _IONBF, 0);
```

For SSH containers, add this to the Dockerfile for login fix. Otherwise user is kicked off after login
`RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd`
