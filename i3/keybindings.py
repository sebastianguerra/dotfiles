#! /usr/bin/env python3

def elemMenorQue(elem1, elem2):
    letra1 = elem1[1][-1]
    letra2 = elem2[1][-1]
    if len(letra1) == 1 or len(letra2) == 1:
        if len(letra1) == 1 and len(letra2) == 1:
            return letra1<letra2
        return len(letra1) == 1
    else:
        return letra1<letra2

def sortList(lista):
    if len(lista) == 0:
        return []
    if len(lista) == 1:
        return lista
    if len(lista) == 2:
        res = lista if elemMenorQue(lista[0], lista[1]) else [lista[1],lista[0]]
        return res
    pivote = lista[0]
    rlista1 = []
    rlista2 = []
    for elem in lista[1:]:
        if elemMenorQue(elem, pivote):
            rlista1.append(elem)
        else:
            rlista2.append(elem)
    return sortList(rlista1)+[pivote]+sortList(rlista2)


atajos = {}
lista = []
modos = [("default",0)]
stackKeys = 0

with open("config") as f:
    lineas = f.readlines()
    for linea in lineas:
        for letra in linea:
            if letra == "{":
                stackKeys+=1
            elif letra == "}":
                if stackKeys == modos[-1][1]:
                    modos = modos [:-1]
                stackKeys-=1
        #print(modos[-1][0],stackKeys, linea, end="")
        linea = linea.strip().split("#")[0]
        if linea.split(" ")[0] == "mode":
            modos.append((linea.split(" ")[1][1:-1], stackKeys))
        if linea.split(" ")[0] == "bindsym":
            cuantosEspaciosUsaLaKeyword = 1
            if linea.split(" ")[1].startswith("-"):
                cuantosEspaciosUsaLaKeyword += 1
            comb    = linea.split(" ")[cuantosEspaciosUsaLaKeyword]
            command = " ".join(linea.split(" ")[cuantosEspaciosUsaLaKeyword+1:])
            lista.append((modos[-1][0], comb.split("+"), command))

sortedList = sortList(lista)
for elem in sortedList:
    mode, keys, cmd = elem
    print(f"{'in '+mode+': ' if mode != 'default' else ''}{' + '.join(keys) }: \t {cmd}")
