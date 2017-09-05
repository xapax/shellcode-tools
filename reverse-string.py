


import sys

if len(sys.argv) <= 1:
    print "[] - Add your string as the first argument."
    print "[] - Example: python reverse-string.py MyString "
    sys.exit(0)
    

code = sys.argv[1]

code = code[::-1].encode('hex')

print "String: " + sys.argv[1]
print "Length: " + str(len(code))
print "String in hex: " + "0x" + str(code)






