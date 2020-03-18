# Loading Data in R

library(data.table)

# There are three methods built in to R for loading data; read.csv, read.delim, and read.table. You might notice that 
# there is a read.csv2 and read.delim2. The differences are minor and not that important for your purposes at the moment.
# 
# For this tutorial, we're going to focus on two datasets. The first will be a local dataset included in the Tutorial 4
# directory so you can get practice loading local data in this way (this will be the most typical way in which you'll 
# load data). The second dataset will be a co2 dataset from 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_weekly_mlo.txt'.
# Loading data in this fashion is less common but is sometimes necessary (although you can download it as well).
# 
# Let's start with understanding the differences between these three functions. They really aren't different functions
# (surprisingly enough). read.csv and read.delim call read.table, the differences are the default arguments provided
# to read.table, i.e. read.csv and read.delim are just convenient wrappers around the read.table function.
# 
# That being said, let's go over some of the arguments in these three that you'll interact with most. This won't be
# an exhaustive run through of the arguments listed because most of the time, you'll only need to tweak a few of them.
# 
# The most common arguments you're going to interact with are as follows:
#   file - The file location you want to read. This is a character string.
#   header - Is there a header row? This will be True or False
#   sep - This stands for seperator. Is your file comma seperated (i.e. a csv) or tab delimited (i.e. '\t').
#         This is where you would specify how your data is seperated in your file.
#   row.names - Does your data have row names? This is where you would provide a vector of row names.
#         For example, row.names=c('First', 'Second', 'Third').
#   col.names - This one is far more commonly used. This is exactly like row.names except for the columns.
#         If your data doesn't have a header row or for some reason it's not being read properly, this is where you
#         specify the column names.
#   na.strings - Sometimes you'll have NA values in your dataset. In atmospheric science, -9999 is a common NA value
#         to use. If you know that, you can enter -9999 here to automatically convert those values to NA when they're
#         read in.
#   colClasses - R will do its best to decide the data type as the data is read in but you can make your code more
#         efficient if you specify here. You'll provide a vector of classes, i.e. c('integer', 'character', ...)
#   skip - Sometimes, as is the case with our ftp Manau Lao data, there are comments at the top of our data file.
#         We'll need to skip over those. If you know the number of lines of comments, you can put that here
#         and the data read function will skip the number of lines your provide to this argument.
#         
#         
#   ------------------------------------------------------------------------------------------------------------------      
#   There are many more arguments to check out but these are the major ones. With that being said, let's get to reading 
#   some data in!
#   
#   Let's start with reading our data in from a local directory. First things first, you're going to need to set your
#   working directory so you can access the files. You're path that you use for setwd will be different from mine.
#   
#   NOTE: If you open this project with the EAPS_310_R-ShortCourse.Rproj file, you're work directory is by default
#   in the EAPS_310_R-ShortCourse directory. To access tutorial 4 from the directory you can just do the following
#   './4-Loading Data/' The . at the beginning indicates the current directory.


getwd() # check your current directory 
setwd('C:/Users/Downi/Documents/GitHub/EAPS_310_R-ShortCourse/4-Loading Data/') # ENTER YOUR OWN DIRECTORY
getwd()

manau.lao <- read.csv('co2-mm-mlo_csv.csv') 
# Notice how it figured out the column names and sort of figured out the column data types?
# The only column that it didn't handle properly was the dat column, which it treated as a factor.
# Since handling dates and times isn't the goal of this tutorial, we'll leave that to another time.

# Let's try a different function
manau.lao_delim <- read.delim('co2-mm-mlo_csv.csv')
# Uh-oh, that didn't quite work. The problem is the defaults in read.delim are not set up to handle this
# we can tinker with the arguments to make it work but why when we can just use read.csv. To prove that it's
# possible, I've included the corrected read.delim function below
manau.lao_delim <- read.delim('co2-mm-mlo_csv.csv', header=T, sep=',')

# What about read.table?
manau.lao_table <- read.table('co2-mm-mlo_csv.csv')
# Yep, that fails too. A quick adjustment to some of the arguments will get us up and going again.
manau.lao_table <- read.table('co2-mm-mlo_csv.csv', header=T, sep=',')

# Now, let's try loading data from online. This is a different manau lao dataset, but very similar.
# 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_weekly_mlo.txt'
# We'll try all three read functions again but read.table will work the most readily here.
# You may want to visit this link yourself so you can interact with the file and get a feel for its layout.
# You'll notice there are definitely some lines to skip here.

manau.lao_onlineTable <- read.table('ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_weekly_mlo.txt')
# That works but look at the column names, it failed to get them from the file. No wonder, when you look
# at the file, the column header is somewhat difficult to read as is. You'll need to enter this manually.
manau.lao_onlineTable <- read.table('ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_weekly_mlo.txt',
                                    col.names = c('year','month','day','decimal', 'ppm', 'days', 
                                                  'one_years', 'ten_years', 'since1800')
                                    )
# That did the trick! Let's try reading with the delim function. I'm going to skip the csv function since
# this obviously isn't a csv.
manau.lao_onlineDelim <- read.delim('ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_weekly_mlo.txt')
# Yep, that didn't work at all. Notice the one variable it pulled. Let's try skipping a few lines
# and specifying column names.
manau.lao_onlineCsv <- read.delim('ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_weekly_mlo.txt',
                                  skip=49, header=F, sep='\t',
                                  col.names=c('year','month','day','decimal', 'ppm', 'days', 
                                              'one_years', 'ten_years', 'since1800')
                                  )
# If you look at the file, the header is kind of a mess, that's why we're manually handling it here.
# Despite our attempts, the data still isn't working out for reading it this way. If you want, keep trying different
# things and if you get it sorted out we'll arrange a pull request so that you can be a contributor to this
# repository! Having code or projects you've contributed can make a big difference in job interviews.


# I mentioned that we're going to use data.table to read data in. I'm not going to go in depth on how to use it
# like we did with the base functions but I'll include how to read your file with data.table as a start and
# leave reading the documentation as an exercise for you.

manau.lao_dataTable <- fread('co2-mm-mlo_csv.csv')
# simple as can be, but remember, you can specify the seperator, the column names, and pretty much
# every other argument in the base functions here as well as some others unique to fread.

