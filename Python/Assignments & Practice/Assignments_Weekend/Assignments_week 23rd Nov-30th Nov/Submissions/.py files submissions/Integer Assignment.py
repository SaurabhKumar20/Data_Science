#!/usr/bin/env python
# coding: utf-8

# ### Q. Declare an int value and store it in a variable.
# ###  Check the type and print the id of the same.

# In[1]:


a=200
print(a)
print(type(a))
print(id(a))


# ### Q. Take one int value between 0 - 256.
# ### Assign it to two different variables.
# ### Check the id of both the variables. It should come the same. Check why?

# In[2]:


a=150
b=150
print(a)
print(id(a))
print()
print(b)
print(id(b))
# Ids of these two numbers should come same because the Interning for integers is defined only for integers lying from 
# 0 to 256. The Object Reusability Concept is valid for this integer range. So, any two variables which are assigned same 
# value in this integer range, will be pointing to the ID of the same assigned object. 


# ### Q. Take one int value either less than -5 or greater than 256.
# ### Assign it to two different variables.
# ### Check the id of both the variables. It should come different.Check why?

# In[3]:


a=350
b=350
print(a)
print(id(a))
print()
print(b)
print(id(b))
# Ids of these two numbers should be different because the Interning for integers is only defined only for integers lying 
# from 0 to 256. So, any two variables which are assigned same value outside this integer range, will be pointing to 
# different IDs.


# ## Q. Arithmetic Operations on integers
# #### Take two different integer values.
# #### Store them in two different variables.
# #### Do below operations on them:-
# #### Find sum of both numbers
# #### Find difference between them
# #### Find the product of both numbers.
# #### Find value after dividing first num with second number
# #### Find the remainder after dividing first number with second number
# #### Find the quotient after dividing first number with second number
# #### Find the result of the first num to the power of the second number.

# In[4]:


a=250
b=230
print(a+b)
print(a-b)
print(a*b)
print(a/b)
print(a%b)
print(a//b)
print(a**b)


# ## Q. Comparison Operators on integers
# #### Take two different integer values.
# #### Store them in two different variables.
# #### Do below operations on them:-
# #### Compare the two numbers with below operator:-
# #### Greater than, '>'
# #### Smaller than, '<'
# #### Greater than or equal to, '>='
# #### Less than or equal to, '<='
# #### Observe their output(return type should be boolean)

# In[5]:


a=250
b=230
print(a>b)
print(a<b)
print(a>=b)
print(a<=b)


# ## Q. Equality Operator
# #### Take two different integer values.
# #### Store them in two different variables.
# #### Equate them using equality operators (==, !=)
# #### Observe the output(return type should be boolean)

# In[6]:


a=250
b=230
print(a==b)
print(a!=b)


# ## Q. Logical operators
# #### Observe the output of below code
# #### Cross check the output manually
# #### print ( 10 and 20 )
# #### #----------------------------------------->Output is 20
# #### print ( 0 and 20 )
# #### #----------------------------------------->Output is 0
# #### print ( 20 and 0 )
# #### #----------------------------------------->Output is 0
# #### print ( 0 and 0 )
# #### #----------------------------------------->Output is 0
# #### print ( 10 or 20 )
# #### #----------------------------------------->Output is 10
# #### print ( 0 or 20 )
# #### #----------------------------------------->Output is 20
# #### print ( 20 or 0 )
# #### #----------------------------------------->Output is 20
# #### print ( 0 or 0 )
# #### #----------------------------------------->Output is 0
# #### print ( not 10 )
# #### #----------------------------------------->Output is False
# #### print ( not 0 )
# #### #----------------------------------------->Output is True

# In[7]:


print ( 10 and 20 )
#----------------------------------------->Output is 20
print ( 0 and 20 )
#----------------------------------------->Output is 0
print ( 20 and 0 )
#----------------------------------------->Output is 0
print ( 0 and 0 )
#----------------------------------------->Output is 0
print ( 10 or 20 )
#----------------------------------------->Output is 10
print ( 0 or 20 )
#----------------------------------------->Output is 20
print ( 20 or 0 )
#----------------------------------------->Output is 20
print ( 0 or 0 )
#----------------------------------------->Output is 0
print ( not 10 )
#----------------------------------------->Output is False
print ( not 0 )
#----------------------------------------->Output is True


# ## Q. Bitwise Operators
# #### Do below operations on the values provided below:-
# #### Bitwise and(&) -----------------------------------------> 10, 20
# #### -------> Output is 0
# #### Bitwise or(|) -----------------------------------------> 10, 20
# #### -------> Output is 30
# #### Bitwise(^) -----------------------------------------> 10, 20
# #### -------> Output is 30
# #### Bitwise negation(~) ------------------------------------> 10
# #### -------> Output is -11
# #### Bitwise left shift ------------------------------------> 10,2
# #### -------> Output is 40
# #### Bitwise right shift ------------------------------------> 10,2
# #### -------> Output is 2
# #### Cross check the output manually

# In[8]:


print(10 & 20)     #Bitwise and(&)
print(10 | 20)     #Bitwise or(|)
print(10 ^ 20)     #Bitwise xor(^)
print(~10)         #Bitwise negation(~)
print(10<<2)       #Bitwise leftshift (10,2)
print(10>>2)       #Bitwise Rightshift (10,2)


# ### Verification for the previous question

# In[10]:


# print(bin(10))
# print(bin(20))
# #0000000000000000000000000000000000000000000000000000000000101000
# #0000000000000000000000000000000000000000000000000000000000000010
# print(int(0b101000))
# print(int(0b10))


# ## Q. What is the output of expression inside print statement. Cross check before running the program.

# In[11]:


a = 10
b = 10
print(a is b) #True or False?               is & is not compare the Ids of the numbers
print(a is not b) #True or False?
a = 1000
b = 1000
print(a is b) #True or False?               Here, both a & b lies outside the range, so they have different Ids
print(a is not b) #True or False?


# ## Q. What is the output of expression inside print statement. Cross check before running the program.

# In[12]:


print ( 10 +( 10 * 32 )// 2 ** 5 & 20 +(~( -10 ))<< 2 )


# In[13]:


# STEP-BY-STEP Execution

# print ( 10 +( 10 * 32 )// 2 ** 5 & 20 +(~( -10 ))<< 2 )
# print ( 10 +( 10 * 32 )// 2 ** 5 & 20 +9 << 2 )
# print ( 10 +( 10 * 32 )// 2 ** 5 & 29 << 2 )
# print ( 10 +( 10 * 32 )// 2 ** 5 & 116 )
# print ( 10 +320// 32 & 116 )
# print ( 20 & 116 )
# 20

# bin(20)  # 0b0010100
# bin(56)  # 0b1110100


# ## Q. Membership operation
# #### in, not in are two membership operators and it returns boolean value

# In[14]:


print ( '2' in 'Python2.7.8' )
print ( 10 in [ 10 , 10.20 , 10 + 20j , 'Python' ])
print ( 10 in ( 10 , 10.20 , 10 + 20j , 'Python' ))
print ( 2 in { 1 , 2 , 3 })
print ( 3 in { 1 : 100 , 2 : 200 , 3 : 300 })
print ( 10 in range ( 20 ))


# ## Q. An integer can be represented in binary, octal or hexadecimal form.
# #### Declare one binary, one octal and one hexadecimal value and store them in three different variables.
# #### Convert 9876 to its binary, octal and hexadecimal equivalent and print their corresponding value.

# In[15]:


a= 0b1000100
b= 0o5734
c= 0x563cd
print(bin(9876)) 
print(oct(9876))
print(hex(9876))


# ## Q. What will be the output of following:-

# In[16]:


a = 0b1010000
print (a)
b = 0o7436
print (b)
c = 0xfade
print (c)
print ( bin ( 80 ))
print ( oct ( 3870 ))
print ( hex ( 64222 ))
print ( bin ( 0b1010000))
print ( bin ( 0xfade ))
print ( oct ( 0xfade ))
print ( oct ( 0o7436))
print ( hex ( 0b1010000))
print ( hex ( 0xfade ))

