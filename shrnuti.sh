#!/bin/bash

# zobrazeni url adresy zadané na vstupu
echo "Zadej URL adresu:"
read url
echo "Zadana URL adresa: $url"

# načtení HTML dokumentu ze zadané adresy
wget $url -O webpage.html

# vybrání všech odstavců uzavřených v tagu <p parametry>text</p>
p_tags=$(grep -oP '<p [^>]*>\K.*?(?=</p>)' webpage.html)

# vypsání vybraných odstavců v terminálu
echo "$p_tags"

# uložení vybraných odstavců do souboru
echo "$p_tags" > paragraphs.txt

# gzip archivace souboru s odstavci
gzip paragraphs.txt

echo "Hotovo!"
