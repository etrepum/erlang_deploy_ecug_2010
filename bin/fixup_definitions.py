#!/usr/bin/env python
import sys

def main():
    fn = sys.argv[1]
    f = open(fn, 'rb')
    txt = f.read()
    f.close()
    txt = txt.replace(
        '<th class="field-name" colspan="2">',
        '<th class="field-name">').replace(
        '</tr>\n<tr><td>&nbsp;</td><td class="field-body"></td>',
        '<td class="field-body"></td>')
    f = open(fn, 'wb')
    f.write(txt)
    f.close()


if __name__ == '__main__':
    main()
