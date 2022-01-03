#!/usr/bin/env python
# coding: utf-8

# ## Q. W. A P. which takes one number from 0 to 9 from the user and prints
# #### it in the word. And if the word is not from 0 to 9 then
# #### it should print that number is outside of the range and program should exit.
# #### For exapmple:-
# #### input = 1
# #### output = one

# In[15]:


num=int(input("Enter a number from 0 to 9: "))
if num==0:
    print("Zero")
elif num==1:
    print("One")
elif num==2:
    print("Two")
elif num==3:
    print("Three")
elif num==4:
    print("Four")
elif num==5:
    print("Five")
elif num==6:
    print("Six")
elif num==7:
    print("Seven")
elif num==8:
    print("Eight")
elif num==9:
    print("Nine")
else:
    print("Number is not in the range 0-9")


# ## Q. W. A P. to implement calculator but the operation to be done and two numbers will be taken as input from user:-
# ## Operation console should show below:-
# #### Please select any one operation from below:-
# #### * To add enter 1
# #### * to subtract enter 2
# #### * To multiply enter 3
# #### * To divide enter 4
# #### * To divide and find quotient enter 5
# #### * To divide and find remainder enter 6
# #### * To divide and find num1 to the power of num2 enter 7
# #### * To come out of the program enter 8

# In[40]:


num1=int(input("Enter the first number: "))
num2=int(input("Enter the second number: "))
print("""Please select any one operation from below:-
* To add enter 1
* to subtract enter 2
* To multiply enter 3
* To divide enter 4
* To divide and find quotient enter 5
* To divide and find remainder enter 6
* To divide and find num1 to the power of num2 enter 7
* To come out of the program enter 8""")
print()
Operation=int(input("Enter the operation that needs to be done: "))
if Operation==1:
    print(num1+num2)
elif Operation==2:
    print(num1-num2)
elif Operation==3:
    print(num1*num2)
elif Operation==4:
    print(num1/num2)
elif Operation==5:
    print(num1//num2)
elif Operation==6:
    print(num1%num2)
elif Operation==7:
    print(num1**num2)
elif Operation==8:
    print("Out of Program")
else:
    print("Number entered is not in the range 1-8")


# ## Q. W A P to check whether a year entered by user is an leap year or not ?
# #### Check with below input:-
# #### leap year:- 2012 , 1968 , 2004 , 1200 , 1600 , 2400
# #### Non-lear year:- 1971 , 2006 , 1700 , 1800 , 1900

# In[39]:


year=int(input("Enter a year: "))
if year%400==0:
    print(f'{year} is a leap year')
elif year%100==0 and year%400!=0:
    print(f'{year} is a non-leap year')
elif year%100!=0 and year%4==0:
    print(f'{year} is a leap year')
else:
    print(f'{year} is a non-leap year')      
              


# ## Q. W A P which takes one number from the user and checks whether it is an even or odd number?, If it even then prints number is even number else prints that number is odd number.

# In[74]:


num=int(input("Enter an integer: "))
if(num%2==0):
    print(f'{num} is an even number')
else:
    print(f'{num} is an odd number')


# ## Q. W A P which takes two numbers from the user and prints below output:-
# #### 1 . num1 is greater than num2 if num1 is greater than num2
# #### 2 . num1 is smaller than num2 if num1 is smaller than num2
# #### 3 . num1 is equal to num2 if num1 and num2 are equal
# #### Note:- 1 . Do this problem using if - else
# #### 2 . Do this using ternary operator

# In[48]:


num1=int(input("Enter the first number: "))
num2=int(input("Enter the second number: "))
if num1>num2:
    print("num1 is greater than num2")
elif num1<num2:
    print("num1 is smaller than num2")
elif num1==num2:
    print("num1 is equal to num2")


# ## Q. W A P which takes three numbers from the user and prints below output:-
# #### 1 . num1 is greater than num2 and num3 if num1 is greater than num2 and num3
# #### 2 . num2 is greater than num1 and num3 if num2 is greater than num1 and num3
# #### 3 . num3 is greater than num1 and num2 if num3 is greater than num1 and num2
# #### Note:- 1 . Do this problem using if - elif - else 
# ####        2 . Do this using ternary operator a = a if a>b else b

# In[42]:


num1=int(input("Enter the first number: "))
num2=int(input("Enter the second number: "))
num3=int(input("Enter the third number: "))
if num1>num2 and num1>num3:
    print(f'{num1} is greater than {num2} and {num3}')
elif num2>num1 and num2>num3:
    print(f'{num2} is greater than {num1} and {num3}')
elif num3>num1 and num3>num2:
    print(f'{num3} is greater than {num1} and {num2}')


# # Loops - for loop, while loop

# ## Q. Write a Python program to find the length of the my_str using loop:-

# In[26]:


my_str=str(input("Enter a string: "))
counter=0
for i in my_str:
    counter+=1
print(counter)


# ## Q. Write a Python program to find the total number of times letter 'p' is appeared in the below string using loop:-

# In[27]:


my_str=str(input("Enter a string: "))
i=0
count=0
for i in my_str:
    if i=='p' or i=='P':
        count+=1
    else:
        continue
print(count)


# ## Q. Write a Python Program, to print all the indexes of all occurences of letter 'p' appeared in the string using loop:-

# In[1]:


my_str=str(input("Enter a string: "))
i=0
j=0
count=0
for i in my_str:
    if i=='p' or i=='P':
        count+=1
        print(j)
        j+=1
    else:
        j+=1


# ## Q. Write a python program to find below output using loop:-

# #### Input:- 'peter piper picked a peck of pickled peppers.'
# #### Output:- [ 'peter' , 'piper' , 'picked' , 'a' , 'peck' , 'of' , 'pickled' , 'peppers' ]

# In[24]:


lst=[]
word=''
my_str=str(input("Enter a string: "))
count=0
for i in my_str:
    if i!=' ':
        word=word+i        
    else:
        lst.append(word)
        word=''
lst.append(word)    
print(lst)        


# ## Q. Write a python program to find below output using loop:-

# #### Input:- 'peter piper picked a peck of pickled peppers.'
# #### Output:- 'peppers pickled of peck a picked piper peter'

# In[37]:


lst=[]
j=0
word=''
my_str=str(input("Enter a string: "))
count=0
for i in my_str:
    if i!=' ':
        word=word+i        
    else:
        lst.append(word)
        word=''
lst.append(word)

my_str=''
lst.reverse()

for i in lst:
    my_str=my_str+lst[j]+' '
    j+=1
print(my_str)


# ## Q. Write a python program to find below output using loop:-

# #### Input:- 'peter piper picked a peck of pickled peppers.'
# #### Output:- '.sreppep delkcip fo kcep a dekcip repip retep'

# In[48]:


string=''
my_str=str(input("Enter a string: "))
# for i in my_str:

l=len(my_str)

while l!=0:
    string=string+my_str[l-1]
    l-=1

print(string)


# ## Q. Write a python program to find below output using loop:-

# #### Input:- 'peter piper picked a peck of pickled peppers.'
# #### Output:- 'retep repip dekcip a kcep fo delkcip sreppep'

# In[50]:


string=''
my_str=str(input("Enter a string: "))
# for i in my_str:

l=len(my_str)

while l!=0:
    string=string+my_str[l-1]
    l-=1

# print(string)

lst=[]
j=0
word=''
my_str=string
count=0
for i in my_str:
    if i!=' ':
        word=word+i        
    else:
        lst.append(word)
        word=''
lst.append(word)

my_str=''
lst.reverse()

for i in lst:
    my_str=my_str+lst[j]+' '
    j+=1
print(my_str)


# ## Q. Write a python program to find below output using loop:-

# #### Input:- 'peter piper picked a peck of pickled peppers.'
# #### Output:- 'Peter Piper Picked A Peck Of Pickled Peppers'

# In[73]:


my_str=str(input("Enter a string: "))
i=0
a=""
j=0
lst=[]
lst.append(my_str)

count=0
for i in my_str:
    if i==' ':
        j+=1
        my_str=my_str.replace(my_str[j], chr(ord(my_str[j])).upper(),1)
#       lst[j]=chr(ord(lst[j])-32)
    else:
        j+=1
# my_str=str(lst)        
print(my_str)
# chr(ord(my_str[j])-32)


# ## Q. Write a python program to find below output using loop:-
# #### Input:- 'Peter Piper Picked A Peck Of Pickled Peppers.'
# #### Output:- 'Peter piper picked a peck of pickled peppers'

# In[38]:


my_str=str(input("Enter a string: "))
# my_str1=my_str.lower()

i=0

j=0
count=0
for i in my_str:
    if ord(i)>=65 and ord(i)<91:       
        my_str=my_str.replace(my_str[j],chr(ord(i)+32))
        j+=1
    else:
        j+=1
my_str=my_str.replace(my_str[0],chr(ord(my_str[0])-32),1)
print(my_str)

# word.replace(letter,"!")
# my_str[j]=i
# my_str1.capitalize()Peter Piper Picked A Peck Of Pickled Peppers


# ## Q. Write a python program to implement index method using loop. If sub_str is found in my_str then it will print the index of first occurrence of first character of matching string in my_str:-
# #### Input:- my_str = 'Peter Piper Picked A Peck Of Pickled Peppers.' ,
# #### sub_str = 'Pickl'
# #### Output:- 29

# In[1]:


my_str=str(input("Enter a string: "))
# for i in my_str:
word=str(input("Enter a word: "))

j=0
n=0
count=0

# my_str.find(word)

for i in range(len(my_str)-len(word)+1):
    if word in my_str and my_str[j]==word[0]:
        for t in word:
            if t==my_str[j+n]:
                count+=1
                n+=1
            else:
                n+=1
        if count==len(word):
            print(j)
            n=0
        else:
            j+=1
            count=0
            n=0
    else:
        j+=1
        count=0
        n=0
        
if word not in my_str:
    print("The word doesn't exist in the string")
else:
    n=0


# ## Q. Write a python program to implement replace method using loop. If sub_str is found in my_str then it will replace the first occurrence of sub_str with new_str else it will will print sub_str not found:-
# #### Input:- my_str = 'Peter Piper Picked A Peck Of Pickled Peppers.' ,
# #### sub_str = 'Peck' , new_str = 'Pack'
# #### Output:- 'Peter Piper Picked A Pack Of Pickled Peppers.'

# In[16]:


my_str=str(input("Enter a sentence: "))
sub_str=str(input("Enter a string to be changed: "))
new_str=str(input("Enter a new string to replace the above string: "))

if sub_str in my_str:
    my_str=my_str.replace(sub_str,new_str,1)
else:
    print("sub_str not found")

print(my_str)
    


# ## Q. Write a python program to find below output (implements rjust and ljust) using loop:-
# #### Input:- 'Peter Piper Picked A Peck Of Pickled Peppers.' , sub_str ='Peck' ,
# #### Output:-  *********************Peck********************

# In[29]:


my_str=str(input("Enter a sentence: "))
word=str(input("Enter a string to be changed: "))

# Code to first find the position of the first alphabet of the sub string entered
j=0
n=0
count=0
pos=0

# my_str.find(word)

for i in range(len(my_str)-len(word)+1):
    if word in my_str and my_str[j]==word[0]:
        for t in word:
            if t==my_str[j+n]:
                count+=1
                n+=1
            else:
                n+=1
        if count==len(word):
            pos=j
            n=0
        else:
            j+=1
            count=0
            n=0
    else:
        j+=1
        count=0
        n=0

#Code to finally right adjust and left adjust the strings with '*'        
if word not in my_str:
    print("The word doesn't exist in the string")
else:
    str1=word.rjust(pos+len(word),'*')
    str2=str1.ljust(len(my_str),'*')
    print(str2)


# ## Q. Write a python program to find below output using loop:-
# #### Input:- 'This is Python class' , sep = ' is' ,
# #### Output:- [ 'This' , 'is' , 'Python class' ]

# In[36]:


my_str=str(input("Enter a sentence: "))
sep=str(input("Enter a seperator word: "))

lst=[]
pos=0

word=sep

if word not in my_str:
    print("The word doesn't exist in the string")
else:
    # Code to first find the position of the first alphabet of the sub string entered
    j=0
    n=0
    count=0
    pos=0

    # my_str.find(word)

    for i in range(len(my_str)-len(word)+1):
        if word in my_str and my_str[j]==word[0]:
            for t in word:
                if t==my_str[j+n]:
                    count+=1
                    n+=1
                else:
                    n+=1
            if count==len(word):
                pos=j
                n=0
            else:
                j+=1
                count=0
                n=0
        else:
            j+=1
            count=0
            n=0
    lst.append(my_str[:pos]) 
    lst.append(sep)
    lst.append(my_str[len(sep)+pos:])
    print(lst)    
    

