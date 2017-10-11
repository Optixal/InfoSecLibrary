#!/usr/bin/python3
import sys, re
from shutil import copyfile

replacements = [
]

substitutions = [
    (r'"assets/([^"]*)"', r'''"{{ url_for('static', filename='\1') }}"'''),
]

insertions = [
]

if len(sys.argv) < 2:
    print('Usage: {} [htmlfile]'.format(sys.argv[0]))
    exit(1)
    
print('Backing up...')
backup = sys.argv[1] + '.bak'
copyfile(sys.argv[1], backup)
print('Backed up as {}'.format(backup))

with open(sys.argv[1], 'r') as f:
    data = f.read()

print('Replacing...')
for replacement in replacements:
    data = data.replace(replacement[0], replacement[1])

print('Substituting...')
datalines = data.split('\n')
for i in range(len(datalines)):
    for substitution in substitutions:
        datalines[i] = re.sub(substitution[0], substitution[1], datalines[i])

print('Inserting...')
for insertion in insertions:
    if insertion[1].split(' ')[0] in '\n'.join(datalines): continue
    i = [index for index, line in enumerate(datalines) if line.startswith(insertion[0])]
    if not i: continue
    datalines.insert(i[0] + 1, insertion[1])

with open(sys.argv[1], 'w') as f:
    for line in datalines:
        f.write(line + '\n')

