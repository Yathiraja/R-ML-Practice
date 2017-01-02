
#Components of a function
formals(mean)
args(mean)
#Primitive functions dont have components #Part of only base package 
formals(sum)

#Mean function takes only 1 argument as input
mean(x=c(7L, 5L, 8L, 6L))
mean(c(5,10))
output<- mean(x=c(7L, 5L, 8L, 6L))

#Creating a function #Function Definition
GetTotalMarks <- function(quiz.marks, viva.marks) {
  total.marks <- quiz.marks + viva.marks
  total.marks
}

student.physics.quiz.marks <- c(70L, 75L, 80L, 85L)
student.physics.viva.marks <- c(7L, 5L, 8L, 6L)

#Calling a function with arguments
student.physics.total.marks <- GetTotalMarks(student.physics.quiz.marks,
                                             student.physics.viva.marks)
student.physics.total.marks
student.chemistry.quiz.marks <- c(60L, 70L, 85L, 70L)
student.chemistry.viva.marks <- c(8L, 4L, 7L, 9L)

#Calling the function with different arguments
student.chemistry.total.marks <- GetTotalMarks(student.chemistry.quiz.marks,
                                               student.chemistry.viva.marks)
student.chemistry.total.marks


#ARGUMENT WITH DEFAULT VALUE
GetTotalMarks <- function(quiz.marks, viva.marks, assignment.marks=5L) {
  total.marks <- quiz.marks + viva.marks + assignment.marks
  total.marks
}

#Calling the function without the assignment.marks argument
GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L), viva.marks = c(7L, 5L, 8L, 6L))

#Calling the function with the assignment.marks argument
GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L), viva.marks = c(7L, 5L, 8L, 6L), 
              assignment.marks = c(2L, 1L, 3L, 4L))


#Using Ellipsis
GetTotalMarks <- function(quiz.marks, viva.marks,...) {  
  total.marks <- quiz.marks + viva.marks +  sum(...) 
  total.marks
}

#Calling the function with multiple arguments
GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L), viva.marks = c(7L, 5L, 8L, 6L), 
              assignment.marks = c(2L, 1L, 3L, 4L))
GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L), viva.marks = c(7L, 5L, 8L, 6L), 
              assignment.marks = c(2L, 1L, 3L, 4L), creativity.marks = 2,
              attendence.marks = 3)


#Lazy Evaluation 
#The function checks the value of the argument inside the body
#then in the global environment to find the value
GetTotalMarks <- function(quiz.marks, viva.marks, extra.marks = average.viva.marks) {  
  average.viva.marks <- mean(viva.marks)
  total.marks <- quiz.marks + viva.marks + extra.marks
  total.marks
}

GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L), viva.marks = c(7L, 5L, 8L, 6L))


#Multiple Return Values
GetMarksSummary <- function(quiz.marks, viva.marks) {  
  total.marks <- quiz.marks + viva.marks 
  avg.marks <- mean(total.marks)
  (c(total = total.marks,average = avg.marks))
}

GetMarksSummary(quiz.marks = c(70L, 75L, 80L, 85L), viva.marks = c(7L, 5L, 8L, 6L))



#Functions AS OBJECT to a function
GetTotalMarks <- function(quiz.marks, viva.marks=5) { 
  total.marks <- quiz.marks + viva.marks  
  total.marks
}

#01 Look into them
GetTotalMarks  #return the function itself
formals(GetTotalMarks) #Access arguments
body(GetTotalMarks) #Access body

#02 Assign them
MyGetTotalMarks <- GetTotalMarks
MyGetTotalMarks

#03 Use them as arguments to another function
GetTotalMarks(quiz.marks = c(70L, 75L, 80L, 85L), viva.marks = c(7L, 5L, 8L, 6L)) 

#pass the function as argument in do.call function
do.call(GetTotalMarks,list(quiz.marks= c(10),viva.marks=c(20)))


#Complex function example
#Function definition
f <- function(y) {
  function(){
   y 
  } 
}

lf <- vector("list",5)
#Calling function inside the or loop
for (i in seq_along(lf)) 
  lf[[i]] <- f(i)
#Pulling out the value from the function 
lf[[6]]()

#QUICK REVISION 
#List is a vector 
#Generic vectos are atomic vectors

#vector ------- atomic vectors ----- 
a<- c(2,3)
is.vector(a)          
is.atomic(a)          
is.vector(lf)
is.atomic(lf)

