# Common Packages in R
  It doesn't take long working in R before you either need to install your first package in R or load your first package in R. This section will provide details on loading and installing packages as well as some of the common packages you'll see out there.

## Installing and Loading Packages
  Getting packages installed in R is super simple! 
  `install.packages('NameOfPackage')`
  Fill in the name of the package you want installed and hit 'Enter'. R will take care of locating the package in question and get it all set up for you. If for some reason you're prompted as to whether or not you want to install the package in your own repository of packages (or something to that effect), saying yes will be fine. Now that you've got your package installed, you can load it into an R script like so `library(NameOfPackage)` (notice the lack of quote marks, you don't have to use quotations when you load a library but you do when installing). Once you do this, you'll have access to all of the funcitons in the associated package.

  The access to these other functions is precisely the power of R and why you'll want to leverage the packages available to you. Given R's prominence as a statistical programming language as well as in academia, many statistical methods have been packaged for use in R, even relatively new ones!

  NOTE: Sometimes you'll want acess to a single function (or maybe two) in a package but you don't want to load the entirety of that package (thus polluting your global environment with a bunch of stuff you don't plan on using). You can load a single package as follows `nameOfPackage::thatFunctionIwant(argument1, argument2, etc)`.

## Common Packages
  There are some packages that will come up again and again. For the purposes of this class, we don't have to use too many packages but you might find a few useful. If you've spent some time reading about R, it is very likely that you've come across the tidyverse. Packages following the tidyverse idealogy tend to do things a certain way in order to acheive what they call 'tidy' data analysis. The tidyverse is maintained by the creators of RStudio and is full of very high quality packages. I'll provide a quick rundown of packages you might find helpful.
  - dplyr (tidyverse)
    - An excellent package for data manipulation. I often times will find myself importing it for data wrangling tasks and for its convenient piping operator `%>%`. The pipe operator allows you to chain together commands like the following . . .
    `myData %>% select(variableIWant) %>% summarize(min=min(variableIWant), max=max(variableIWant), mean=mean(variableIWant)`
    The syntax is super easy to read and quite functional in its usage.
  - lubridate (tidyverse)
    - Lubridate makes working with dates significantly easier in R. R can work with dates with built in functions, lubridate is a helper to make things easier. NOTE: data.table, a package listed further down, has some of its own tooling for dealing with dates.
  - tidyr (tidyverse)
    - Super useful functions for tidying data up, filling missing values, etc.
  - ggplot2 (tidyverse)
    - If someone says anything about plotting in R, chances are that they'll be talking about ggplot2. This package is extremely popular in R and has many great articles about using it. It's a bit strange to use at first but with some work, you'll get there!
  - lattice
    - Another plotting option in R is lattice graphics. They may not be fancy looking and they may feel a little strange at first but once you get used to them, there isn't much that is faster than lattice for working with large datasets and splitting them appropriately. A companion packages is 'LatticeExtra', which provides extended functionality of the base package. You don't need to install lattice as it comes with R. Simply enter `library(lattice)` and you'll be able to start using lattice.
    - A companion to the lattice package is LatticeExtra. Further functionality has been added to make lattice even better.
  - data.table
    - This isn't a tidyverse package but if you're data sets are getting large, it quickly becomes a necessity. A 4gb csv file can be read in with this libraries accompanying fread function in a matter of 20 seconds or so.