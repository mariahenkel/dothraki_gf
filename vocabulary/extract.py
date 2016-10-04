# coding: utf-8

data = ""
with open("input_dot.txt", "r", encoding="utf-8") as input_dot:
    data = input_dot.read()

data = data.split('\n*')

output_org = []
output_eng = []
output_dict = []
data = data[1:]
type_lexicon = [
    ('adj.', 'A'),
    ('ni.', 'N'),
    ('na.', 'N'),
    ('v.', 'V'), # beides: V, V2 
    ('vtr.', 'V2'), # beides: V2, V3
    ('vin.', 'V')] 

def output_prep(w_type, gram_info, word, anim, trans):
    output_org.append(orig_str.format(w_type=w_type,
                                   gram_info=gram_info,
                                   word=word,
                                   anim=anim))
    output_eng.append(trans_str.format(trans=trans,
                                   trans2=trans.replace(' ', '_'),
                                   w_type=w_type))
    output_dict.append(dict_str.format(trans=trans.replace(' ', '_'),
                                   w_type=w_type,
                                   word=word))

def output_write(datafilename, outputlistname):
    with open(datafilename + '.txt', 'w', encoding="utf-8") as output_f:
        for line in outputlistname:
            output_f.write(line)
            output_f.write('\n')

orig_str = '{word}_{w_type} = mk{w_type} "{word}" {gram_info}{anim};'
trans_str = '{trans2}_{w_type} = mk{w_type} "{trans}";'
dict_str = '{word}_{w_type} = {trans}_{w_type};'

for datum in data:
    gram_info = ''
    anim = ''
    valid = False
    datum = datum.split('\n')
    if '<span id=' not in datum[0] or len(datum) == 1:
        continue
    datum[0] = datum[0].split('<span id="')[1].split('"></span>')[0]
    word = datum[0].strip()


    datum[1] = datum[1].replace(':\'\'', '')

    w_type, trans = datum[1].split("''", 1)

    trans = trans.split(',')[0].split('(')[0].strip()
    if trans.startswith('to '):
        trans = trans.replace('to ','', 1)
    
    for type_lex in type_lexicon:
        if type_lex[0] == w_type.strip():
            if type_lex[0] == 'na.':
                anim = 'animate'
            elif type_lex[0] == 'ni.':
                anim = 'inanimate'
            w_type = type_lex[1].strip()
            valid = True

    for dat in datum[2:]:
        if dat.startswith(':{{'):
            if not dat.startswith(':{{Quote'):
                dat = dat.split('|', 1)[1].replace('}}', '')
                gram_info = dat.strip()

    if valid:
        gram_info = '"' + gram_info + '" ' if gram_info else ''
        if w_type == "V":
            output_prep("V", gram_info, word, anim, trans)
            output_prep("V2", gram_info, word, anim, trans)
        elif w_type == "V2":
            output_prep("V2", gram_info, word, anim, trans)
            # output_prep("V3", gram_info, word, anim, trans)
        else:
            output_prep(w_type, gram_info, word, anim, trans)


output_write("outputDot", output_org)
output_write("outputEng", output_eng)
output_write("outputDict", output_dict)



