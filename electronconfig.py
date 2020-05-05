import re

formula = raw_input()

filled_re = re.compile(r"\[[A-Za-z]+\]")
orbit_re  = re.compile(r"([0-9]+[a-z])([0-9]*)")

filled = ''
orbits = []

matches_filled = filled_re.finditer(formula)
for match in matches_filled:
    filled = match.group(0)

if filled:
    filled += '\\,'

matches_orbit = orbit_re.finditer(formula)
for match in matches_orbit:
    if match.group(2):
        orbits += [match.group(1) + '^{' + match.group(2) + '}']
    else:
        orbits += [match.group(1)]

print '$\\mathrm{' + filled + '\\ '.join(orbits) + '}$%'