


import sys

if len(sys.argv) <= 1:
    print "[] - Add your string as the first argument."
    print "[] - Example: python reverse-string.py MyString "
    sys.exit(0)


input = sys.argv[1]

print 'String length: ' + str(len(input))

stringList = [input[i:i+4] for i in range(0, len(input),4)]

for item in stringList[::-1] :
    print item[::-1] + ' : ' + str(item[::-1].encode('hex'))



#code = sys.argv[1]

#code = code[::-1].encode('hex')

#print "String: " + sys.argv[1]
#print "Length: " + str(len(code))
#print "String in hex: " + "0x" + str(code)






