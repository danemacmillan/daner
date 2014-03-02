#!/bin/bash

# https://gist.github.com/panzi/5324263
 
family=`echo "$1"|tr ' ' '+'`
filename=`echo "$1"|sed 's/ //g'`
weight=$2
subset=$3
 
if [ "$weight" != "" ]; then
family="$family:$weight"
filename="$filename-$weight"
fi
 
if [ "$subset" != "" ]; then
family="$family&subset=$subset"
fi
 
function getfont () {
curl -s -A "$1" "http://fonts.googleapis.com/css?family=$family"| \
grep -io '\<http://[-+%:,/\._?&=#a-z0-9]*'|sort -u| \
while read url; do
mime=`curl -s -I "$url"|grep -io '^Content-Type:.*'|sed 's/Content-Type:\s*\([^;]*\)\(;.*\)\?\s*$/\1/I'|tr -d '\r'`
case "$mime" in
font/eot)
ext="eot"
;;
 
font/woff)
ext="woff"
;;
 
font/ttf)
ext="ttf"
;;
 
image/svg+xml)
ext="svg"
;;
 
*)
ext="bin"
;;
esac
echo "downloading $filename.$ext"
curl -s "$url" -o "$filename.$ext" || exit 1
done
}
 
getfont "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 7.1; Trident/5.0)"
getfont "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7"
getfont "Mozilla/6.0 (Windows NT 6.2; WOW64; rv:16.0.1) Gecko/20121011 Firefox/16.0.1"