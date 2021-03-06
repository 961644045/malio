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
��C_test.sh �V[OG~����A���� 4I[)R��O�Z�͒��ۓ��nwv1��I '�4�B
4����V
���xv�����������:;s��\�̌|�s��̋Q�JtZn��ޝW�>��ػ]q7~MD��Ʈ���>[�٢�"�;�w^m�{k=�-,{���g�kmz+��M����1U�&(Y�(㶬i�����4�Q�@l�Yj������b�$��ć+��8������©��-ʬP�����&z d&�S��@�zy��R.�42X�.�\h��w�}��M2���}��Bln��ۨ��7r2U��b����Edn�x뷀�]�������4&��|_��VvCN�c!���m� oʜ���ݹN�CrܔтY�k��(����x�{Q��=7���r�Km� .��gbc'ȰHgo�ݺ.�0ȴ%k���#H~j�v82���ĉ����8��Ǹp�R��!���`	�Jcb+�0E�
��,�&k'��;t�����2�U����&�u���x�MM.g�eG����s��0*���?�D��]�R=�/���վ��.�R��Q�ʇ���ƣ�6�礑�ޏ�v�ݯBQK�z��t��m����E'�oI|�B������$�e�ؒK0��TaV�e��L�Q�_�^k-4�}z��V���n@��AS��GΕ�/��{�K^m��PU�p�E�ї���ի_}�7�+�v��Ƹ�-qgK���Go:-oG�Cc�\���`w�3P��T+_3r	�9�Ӳ��iV,�a_6�;��_�x�R$������e�0C%���I~�҂�p��zq�c8B��ԅ�Q
C(N��)0k�@%y����d����x���Q48G���hx:��X��)8��S����'.��ӓ'�R����5���.g����hO_�҈h��G�?�^�_�,���Tj�i�t�蠤97��>�z���k2���Bav^����s�<�0����Fd"+����.��ǝ֯D< Y���P<l�������^�U��F8ʌ:E�2����ȌR���ό���:�1���dQ��>4{;��� ���c�;߫o{�E��8��@4dU��L��<�g��^O�`�o���E�"ܴܟ7�Ҿ��T�w^�jk��{oiYTpHӝ����]�v7:�-��uw���_|0~>$�{���lw��N{�;�$.Jip��O�k;��6��z��N_$@���|�G[�s�Y���5�
��v���W`�{���4���������,�  