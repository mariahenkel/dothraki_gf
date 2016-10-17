# coding: utf-8

# read filter from DictEng.gf

filter = set()
with open("../simpleenglish/DictSimpleEng.gf", "r") as input_filter:
    for line in input_filter.readlines():
        # only get the definitions
        if line.startswith('lin '):
            # only get the words
            filter.add(line.split("=")[0].replace(
                "lin ", "").replace("\n", "").strip())

# read input
data = ""
with open("input_dot.txt", "r", encoding="utf-8") as input_dot:
    data = input_dot.read()

data = data.split('\n*')

output_dictabs = ["abstract DictDotAbs = CatSimple ** {","fun"]
output_dictdot = ["concrete DictDot of DictDotAbs = CatSimpleDot ** open ParadigmsSimpleDot in {","lin"]
output_lexabs = ["abstract BigLexicon = CatSimple ** {","fun"]
output_lexeng = ["concrete BigLexiconEng of BigLexicon = CatSimpleEng ** open DictSimpleEng in {","lin"]
output_lexdot = ["concrete BigLexiconDot of BigLexicon = CatSimpleDot ** open DictDot in {","lin"]

# data = data[1:]
type_lexicon = [
    ('adj.', 'A'),
    ('ni.', 'N'),
    ('na.', 'N'),
    ('v.', 'V'),  # beides: V, V2
    ('vtr', 'V2'),  # beides: V2, V3
    ('vin.', 'V')]

dictabs_str = '{wordident}_{w_type} : {w_type};'
dictdot_str = '{wordident}_{w_type} = mk{w_type} "{word}" {gram_info};'
lexabs_str = '{trans}_{w_type} : {w_type};'
lexeng_str = '{trans}_{w_type} = DictSimpleEng.{trans}_{w_type};'
lexdot_str = '{trans}_{w_type} = DictDot.{word}_{w_type};'

dictabs = set()

def output_prep(w_type, gram_info, word, trans):
    wordid = word + "_" + w_type
    if wordid in dictabs:
        return
    dictabs.add(wordid)
    output_dictabs.append(dictabs_str.format(wordident=word,
                                             w_type=w_type))
    output_dictdot.append(dictdot_str.format(wordident=word,
                                             w_type=w_type,
                                             word=word,
                                             gram_info=gram_info))
    # apply the defined filter (DictEng.gf)
    transid = "{0}_{1}".format(trans.replace(' ', '_'), w_type)
    if transid not in filter:
        # finish function call without appending to output_XY
        return
    filter.remove(transid)
    output_lexabs.append(lexabs_str.format(trans=trans,
                                           w_type=w_type))
    output_lexeng.append(lexeng_str.format(trans=trans,
                                           w_type=w_type))
    output_lexdot.append(lexdot_str.format(trans=trans,
                                           w_type=w_type,
                                           word=word))


def output_write(datafilename, outputlistname):
    with open(datafilename, 'w', encoding="utf-8") as output_f:
        for line in outputlistname:
            output_f.write(line)
            output_f.write('\n')


for datum in data:
    gram_info = ''
    anim = ''
    valid = False
    datum = datum.split('\n')
    if '<span id=' not in datum[0] or len(datum) == 1:
        continue
    datum[0] = datum[0].split('<span id="')[1].split('"></span>')[0]
    word = datum[0].strip()
    if ' ' in word:
        continue

    datum[1] = datum[1].replace(":''", '')

    w_type, trans = datum[1].split("''", 1)

    transls = trans.split(',')
    for type_lex in type_lexicon:
        w_type = w_type.strip()
        if w_type.startswith(type_lex[0]):
            if type_lex[0] == 'na.':
                gram_info = 'animate'
            elif type_lex[0] == 'ni.':
                gram_info = 'inanimate'
            elif type_lex[0] == 'vtr':
                if "&rarr;" in w_type:
                    gram_info = {
                        "gen.":"genitive ",
                        "all.":"allative ",
                        "abl.":"ablative ",
                        "acc.":"accusative "
                    }[w_type.split("&rarr;")[1]]
            w_type = type_lex[1].strip()
            valid = True

    for dat in datum[2:]:
        if dat.startswith(':{{'):
            if not dat.startswith(':{{Quote'):
                dat = dat.split('|', 1)[1].replace('}}', '')
                gram_info = '"' + dat.strip() + '" ' + gram_info

    if valid:
        for t in transls:
            t = t.strip()
            if t.startswith('to '):
                t = t[3:]
            if "(" in t:
                t = t.split("(")[0]
            t.replace("something","")
            t.replace("someone","")
            t = t.strip()
            # break
            if w_type == "V":
                output_prep("V", gram_info, word, t)
                output_prep("V2", gram_info, word, t)
            #elif w_type == "V2":
                #output_prep("V2", gram_info, word, trans)
                # output_prep("V3", gram_info, word, anim, trans)
            else:
                output_prep(w_type, gram_info, word, t)

output_dictabs.append("}")
output_dictdot.append("}")
output_lexabs.append("}")
output_lexeng.append("}")
output_lexdot.append("}")

output_write("DictDotAbs.gf", output_dictabs)
output_write("DictDot.gf", output_dictdot)
output_write("BigLexicon.gf", output_lexabs)
output_write("BigLexiconEng.gf", output_lexeng)
output_write("BigLexiconDot.gf", output_lexdot)
