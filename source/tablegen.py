#!/usr/bin/env python3


import re
import sys

def main(args):
  pat = re.compile("^(\d+)\s.+\s(\d+)$")
  with open(args[1]) as file:
    for line in file:
      mat = pat.match(line.strip())
      barcode = mat.group(2)
      print("\t\t{} => [{},{},{},{},{},{}],".format(
        mat.group(1), barcode[0], barcode[1], barcode[2],
        barcode[3], barcode[4], barcode[5]
      ))

if __name__ == "__main__":
  main(sys.argv) 
  
