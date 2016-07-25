## i first created a function for running a factorial

> fact7 <- function(x)
  + if (x == 0) {
    print(1) } else {print(prod(1:x))
    }

## I then created a function in the console for running the choose command

> choosecalc <- function(x,y)
  + print(fact7(x) / (fact7(x-y) * fact7(y)))

## i then ran the following tests in the console (and copied the results I obtained below)

choosecalc(5,3)
[1] 120
[1] 6
[1] 20

choosecalc(4,0)
[1] 24
[1] 1
[1] 24