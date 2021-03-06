#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�MY_maliobanquan.sh �OoA��|�u�$���֖C-�v	�t7^�ϸ;�ː��.$4�cM�[b�H�iM��F��tw�_�E�1ܚ�`�0�7��>�_���|�qfXa�d��V���������?���`�,x��z=����\�8،�!E�F�Kĥ͌)%� ȯ.��5�ZEK��[j<gH����B*}+Wp���T��Q+˛�.�j��H�Vf^�j���B21�E��a*��.Vʺ��ty=������o\��l֚7��b�ω�<�k\�.Ŋ���@�K;r��J�\UKR�k��J�AS���`�l��/&���lA�ƒM��6>gWg�xaƈY��3�"T�K�����Y��PjS��c��>��C f�:���TT�c�h���Ovl�1�+�����=zU&�EX���=��6*����iPr���s'J��u�_����Q��������`�?|u:�	��u��}�?�ߵ�������c���x��w?������a�oN�����ɛ�Ƀ���o��Wo�;��ާ#�_���X	  