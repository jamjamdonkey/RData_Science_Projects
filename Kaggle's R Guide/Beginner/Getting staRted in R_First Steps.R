# This is a chunk with code. You'll notice that in code chunks, when I have something
# to say that I don't want R to treat as code, I'll put a # symbol in front of it.
# These non-code bits are called "comments", and they're helpful when you want to
# describe what's going on in your code. Use them often!

# To run a chunk, you can hit the blue "play" arrow to the left, or put your cursor inside
# the chunk and then hit CTRL + ENTER (CMD + ENTER on a Mac)
# R 코딩 연습의 시작. Since MAY 12 2025
print("Welcome to R!")

print("I'm coding in R")

# running this block will pull up the documentation page for the print() function
# ?함수() 블럭 실행시 해당 함수에 대한 설명페이지 튀어나온다.
?print()

# in R, you can store data in a variable by using either "=" or "<-". You can name a 
# variable anything you want as long as it's not already the name of something else.
# I find that a short phrase (without spaces) is generally best.
# R에서는 <- 이용해서 데이터 변수 저장가능하고, 변수의 이름은 기존에 있던 패키지가 아니라면 자유롭다. 
textToPrint <- "this is some text to print"
 
textToPrint

# note that capitalization does matter! This line will generate an error becuase 
# there is nothing called "texttoprint"
# 변수 이름은 대소문자를 구분해서 아래를 실행하면 Error 발생!
texttoprint

# Your turn! Create a variable named "aSentence" and store a sentence in it
aSentence <- "Um Jun Sik is still alive"

# our old friend print()
print(textToPrint)

# the nchar() function tells you the number of characters in a variable
# nchar() 함수는 그 해당 변수의 공백 포함 글자수를 알려준다.
nchar(textToPrint)

# the c() function concatenates (strings together) all its arguments
# c() 함수는 모든 인수를 문자열로 연결한다.
c(textToPrint, textToPrint, textToPrint)

# Your turn! Try the following three exercises on your own. Remember: it's prefectly 
# ok to copy code and then modify it.

# print your variable "aSentence" you made above
print(aSentence)
# find out the number of characters in "aSentence"
nchar(aSentence)
# concatenate the "textToPrint" and "aSentence" variables
c(textToPrint, aSentence)

# R에는 텍스트 문자열 말고도 다양한 데이터가 존재한다.
# What we've seen so far are characters. This is the type of data you'll use for text
anExampleOfCharacters <- "someText"
# we can check the data type of a variable using the function str() (like "structure")
# 
str(anExampleOfCharacters)

# Your turn! 
# Check the data type of the "aSentence" variable you made above.
str(aSentence)

# 세상의 모든 데이터가 텍스트인건 아니다. 숫자도 있다.
# 숫자의 경우 주변에 "" 넣으면 숫자가 아닌 문자로 인식.
# let's create some numeric variables
hoursPerDay <- 24
daysPerWeek <- 7
# we can check to make sure that these actually are numeric
class(hoursPerDay)
class(daysPerWeek)

# since this is numeric data, we can do math with it! 
# "*" is the symbol for multiplication(곱하기 기호)
hoursPerWeek <- hoursPerDay * daysPerWeek
hoursPerWeek

# Create a numeric variable "minutesPerHour" and use it to calcuate a new variable called
# "minutesPerWeek" that has the number of minutes per week in it
minutesPerHour <- 60
minutesPerWeek <- minutesPerHour * hoursPerWeek
minutesPerWeek

# 11번 예제까지 끝냄 5/12


