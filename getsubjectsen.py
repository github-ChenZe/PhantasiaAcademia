import re
import json

in_string = raw_input()
print(in_string)
args = json.loads(in_string)

print args

current_sub = args['subsection'].strip()
current_ssub = args['subsubsection'].strip()

subjects_file = open('/Users/zechen/Documents/PhantasiaAcademia/subjectsen', 'r')
subjects_out  = open('subjects.tex', 'w')
sections_out  = open('sections.tex', 'w')
subs_out  = open('subs.tex', 'w')

subject_dir = ''

for line in subjects_file:
    particles = line.split()
    abbr, title, path = particles[0], ' '.join(particles[1:-1]), particles[-1]
    if abbr == args['subject'].strip():
        subjects_out.write('\\node[anchor=west] {\\upshape\\arial\\small\\color{linkblue!100!white}\\textsf{$\\blacktriangleright$%s}}; \\\\'%title)
        subject_dir = path
    else:
        subjects_out.write('\\node[anchor=west] {\\upshape\\arial\\small\\color{linkblue!66!white}\\textsf{%s}}; \\\\'%title)

subjects_out.write('[.5em]')
subjects_out.close()

if subject_dir:
    sections_file = open('/Users/zechen/Documents/PhantasiaAcademia/' + subject_dir + '/sections', 'r')
    for line in sections_file:
        abbr, title, path = line.split()
        if abbr == args['section'].strip():
            sections_out.write('\\node[anchor=west] {\\upshape\\arial\\small\\color{linkblue!100!white}\\textsf{$\\blacktriangleright$%s}}; \\\\'%title)
        else:
            sections_out.write('\\node[anchor=west] {\\upshape\\arial\\small\\color{linkblue!66!white}\\textsf{%s}}; \\\\'%title)

sections_out.write('[.5em]')
sections_out.close()

job_file = open(args['filename'].strip(), 'r')
sub_pattern = re.compile(r"^\\subsection{(.*)}")
ssub_pattern = re.compile(r"^\\subsubsection{(.*)}")
msub_pattern = re.compile(r"^\\mathsubsection{(.*)}{(.*)}{(.*)}{(.*)}")
mssub_pattern = re.compile(r"^\\mathsubsubsection{(.*)}{(.*)}{(.*)}{(.*)}")

def format_this_sub(_title):
    return '\\node[text width=3cm, anchor=west] {\\upshape\\arial\\small\\color{linkblue!100!white}\\textsf{$\\blacktriangleright$%s}}; \\\\'%_title

def format_sub(_title):
    return '\\node[text width=3cm, anchor=west] {\\upshape\\arial\\small\\color{linkblue!66!white}\\textsf{%s}}; \\\\'%_title

def format_this_ssub(_title):
    return '\\node[text width=3cm, anchor=west] {\\upshape\\arial\\footnotesize\\color{linkblue!100!white}\\textsf{\\quad$\\blacktriangleright$%s}}; \\\\'%_title

def format_ssub(_title):
    return '\\node[text width=3cm, anchor=west] {\\upshape\\arial\\footnotesize\\color{linkblue!66!white}\\textsf{\\quad %s}}; \\\\'%_title

for line in job_file:
    sub_matches = sub_pattern.finditer(line)
    for sub_match in sub_matches:
        title = sub_match.group(1)
        if title == current_sub:
            if len(title.decode('utf-8')) > 12:
                title = title.decode('utf-8')[:12].encode('utf-8') + '...'
            subs_out.write(format_this_sub(title))
        else:
            if len(title.decode('utf-8')) > 12:
                title = title.decode('utf-8')[:12].encode('utf-8') + '...'
            subs_out.write(format_sub(title))

    ssub_matches = ssub_pattern.finditer(line)
    for ssub_match in ssub_matches:
        title = ssub_match.group(1)
        if title == current_ssub:
            if len(title.decode('utf-8')) > 12:
                title = title.decode('utf-8')[:12].encode('utf-8') + '...'
            subs_out.write(format_this_ssub(title))
        else:
            if len(title.decode('utf-8')) > 12:
                title = title.decode('utf-8')[:12].encode('utf-8') + '...'
            subs_out.write(format_ssub(title))

    msub_matches = msub_pattern.finditer(line)
    for msub_match in msub_matches:
        title_id = msub_match.group(1)
        if title_id == current_sub:
            subs_out.write(format_this_sub(msub_match.group(2)))
        else:
            subs_out.write(format_sub(msub_match.group(2)))

    mssub_matches = mssub_pattern.finditer(line)
    for mssub_match in mssub_matches:
        title_id = mssub_match.group(1)
        if title_id == current_ssub:
            subs_out.write(format_this_ssub(mssub_match.group(2)))
        else:
            subs_out.write(format_ssub(mssub_match.group(2)))

subs_out.close()


