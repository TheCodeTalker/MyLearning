import sys
f  = open("/Users/techjini/Documents/MLTextFiles/bird.txt","r")
data = f.read()
f.close()
def count_word(data):
    words = data.split("\n")
    # print("The lines in the text are:")
    # print(words)
    # print("The number of lines is", len(words))
    for l in words:
        if not l:
            words.remove(l)
    return len(words)


# for i in range(5):
#     print(i)

print(sys.argv)




print("The number of lines is", count_word(data))