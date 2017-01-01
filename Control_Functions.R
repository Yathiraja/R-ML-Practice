#IF STATEMENT

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Examine the if statement for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
}

# Write the if statement for num_views
if (num_views > 15) {
  print("You're popular!")
}


# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else {
  print("Try to be more visible!")
}


# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 & num_views > 10) {
  print("You are getting there !!!")  
} else {
  print("Try to be more visible!")
}




#FOR LOOP
#Squaring the values of a randomly generated vector
set.seed(1)
a <- rnorm(20,10,1)       #random number generation of 20 values with Mean=10 and SD=1
mean(a)

asq1 <- 1
for(i in 1:length(a)) 
{
  asq1[i]<- a[i]*a[i]
}
#Print the values
asq1

#Another way to do the same thing
asq1 <- 0
for(i in seq(1,length(a),1))
{
  #asq1<- a[i]*a[i]
  asq1 <- c(asq1,a[i]*a[i])
}
print(asq1)

#Easiest way to do it
a<- a*a

#Quick revision
#Matrix multiplication in R
mymat1= matrix(c(1,2,3,4), nrow=2, ncol=2, byrow=TRUE)
mymat2= matrix(c(5,6,7,8), nrow=2, ncol=2, byrow=TRUE)
compo_wise_result <- mymat1*mymat2
Mat_mul_result <- mymat1%*%mymat2

#NESTED FOR LOOP
mymat= matrix(nrow=2, ncol=3)
class(dim(mymat))[1]
dim(mymat)[2]

#How to calculate a matrix whose each component is the multiplication of its rows and columns
for(i in 1:dim(mymat)[1])
{
  for(j in 1:3)
  {
    mymat[i,j]=i*j
  }
}


#WHILE LOOP
# Initialize the speed variable
speed <- 64

# Code the while loop
while (speed > 30) {
  print("Slow down!")
  speed <- speed - 7
}

# Print out the speed variable
speed


# Initialize the speed variable
speed <- 64

# Extend/adapt the while loop
while (speed > 30) {
  print(paste("Your speed is",speed))
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}


# Initialize the speed variable
speed <- 88

while (speed > 30) {
  print(paste("Your speed is", speed))
  
  # Break the while loop when speed exceeds 80
  if (speed > 80) {
    break
  }
  
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}



#REPEAT
readinteger <- function()
{
  n <- readline(prompt="Please, enter  ANSWER: ")
}
repeat
{
  response<-as.integer(readinteger());
  if (response==40)
  {
    print("Well done!");
    break
  } else print("Sorry, the answer to whaterver the question MUST be 40");
}

mymat
for(i in 1:nrow(mymat))
  mymat[i,1:i]<- 1

#BREAK

# make a lower triangular matrix (zeroes in upper right corner)
m=4; n=4;
ctr=0;   # used to count the assignemnt
mymat = matrix(0,m,n) # create a 10 x 10 matrix with zeroes
for(i in 1:m) {
  for(j in 1:n)
  {
    if(i<j)
    {
      break;
    } else
    {
      mymat[i,j] = 1   # we assign the values only when i<>j
    }
  }
}
print(mymat)
print(ctr)  # print how many matrix cells were assigned


#NEXT
m=20;
for (k in 1:m)
{
  if (!(k %% 2))
    next
  print(k)
}


