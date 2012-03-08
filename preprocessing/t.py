import re
import json
import copy
import pdb

def chapters_for_sections(sections):
    prev_num = 0
    chapter = 0

    chapters = []

    num = 0
    prev_num = 0

    for section in sections:
        if section == '': continue

        section = re.sub(r'\xd5', "'", section)

        try:
            json.dumps(section)
        except:
            pass

        section_dict = {
            'statement': "",
            'references': "",
        }

        match = re.match('^\d+(?=\. \w)', section)

        if match is not None:
            num_str = match.group()
            num = int(num_str)

            if num <= prev_num:
                chapter += 1

            while chapter >= len(chapters):
                chapters.append([])

            section_dict['statement'] = section.strip()

            chapters[-1].append(section_dict)

            prev_num = num
        elif re.search(';', section) is not None:
            chapters[chapter-1][-1]['references'] = section.strip()
            continue
        else:
            continue

    return chapters

f = open('testimony.txt', 'r')
line = f.read()
f.close()
testimony_sections = line.split('^M')[0].split('\r')
testimony_chapters = chapters_for_sections(testimony_sections)

f = open('confession.txt', 'r')
line = f.read()
f.close()
confession_sections = line.split('^M')[0].split('\r')
confession_chapters = chapters_for_sections(confession_sections)

chapter_dict = {
    'chapter_title': "",
    'chapter_subtitle': "",
    'confession': [],
    'testimony': [],
}

c_and_t = {
    'introduction': testimony_chapters[0],
    'chapters': [],
}

testimony_chapters = testimony_chapters[1:]

for i in range(33):
    cd = copy.deepcopy(chapter_dict)
    cd['confession'] = confession_chapters[i]
    cd['testimony'] = testimony_chapters[i]

    c_and_t['chapters'].append(cd)

print json.dumps(c_and_t, indent=4)
