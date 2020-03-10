# Data Types in R
  There are a variety of data types in R. This section will serve as a very quick overview and is in no way intended to be an exhaustive explanation of each of the data types. The point here is to give you the basics.
  
  Some of the most common data types in R are as follows:
  - integer
    - These are simply whole numbers like 1, 16, -14, etc.
  - numeric 
    - Numeric data in R is the default data type. If you come from other programming backgroudnds, this is your typical float. If you haven't taken programming before, a numeric is simply a number with some decimal places.
  - character
    - Again, if you're from other programming backgrounds, this is simply a string. If you haven't taken programming before, a character is just letters. Some examples are 'Dog' or "Cat". Notice that in those two examples, the single quote and double quote were both used. You can use either in R. It makes little difference, you just have to make sure to match them up.
  - logical
    - These are your boolean values or TRUE/FALSE values.

# Data Structures in R
  There are a variety of data structures in R. How do these differ from data types in R? A data structure is intended to hold a group of data. In some cases the data will be of various types and in others they will all be the same type.

  The common structures in R are as follows:
  - vector
    - A collection of items that all have the same data type. If you do try to mix types in a vector, R will carry out what is called implicit coercion if possible. This means that R will convert some of your data in the vector to a common data type. For example if you have a vector with numbers and characters in it, they'll all be converted to characters (since characters can not easily be converted to numbers necessarily).
  - list
    - Lists in R are a lot like containers. Lists are not restricted to a single data type being contained in them. 
  - matrix
    - The matrix is somewhat like a vector with multiple dimensions. You can have a 2x3 matrix, which would indicate 2 rows, 3 columns. All elements of a matrix must be of the same type.
  - data frame
    - The data frame can be thought of much like an excel sheet. It's a grouping of columns and rows where each column is a variable. Each
    column has its own data type but a single dataframe can have columns of multiple data types. A data frame is really a special type of a list.
    - When working with data frames, typically your columns will be labeled. You can access the columns a couple of ways but the typical way of accessing them is by using the `$` operator. With this operator you can reference the column of interest as follows `dataframe$column`.
  - factor
    - A factor can be thought of as categorical variables (perhaps day of week; Sunday, Monday, Tuesday, etc) or they could be logical values (True or False). 

  If you want to investigate your data, the following commands will be helpful.

  - `str(variableName)`: str stands for structure and will provide information about the structure of the variable you feed to it. This can be helpful to get an idea of what you're looking at.
  - `dim(variableName)`: dim stands for dimension and will tell you the dimensions of your data set. If you're working with a matrix or dataframe it will give you the number of rows x number of columns.
  - `summary(variableName)`: This will provide some summary statistic information of your data handed to it. If this is done with a data frame, each column will be sammarized for you and returned.
  - `length(variableName)`: It will vary what you'll get when doing this. If you pass a data frame to length, you may be very confused (like I was), when it spits back a length of 1. You know good and well that your data frame has more rows than that. Here's the thing, a data frame is a special type of list. That lists length is 1, it has 1 object in it (the data frame)! If you insist on using length for knowing the number of rows in your data frame, use `length(variableName$columnName)`. 
    - There is a special command for finding out the rows, it is `nrow(variableName)`. There is a column equivalent `ncol(variableName)`.
  
# Quick Introduction to Bracket Notation
  In R, there is a bracket notation that can be somewhat difficult to adjust to at first. Instead of trying to summarize it, I've linked an excellent tutorial that you may find of some use in understanding R's bracket notation: https://rpubs.com/tomhopper/brackets. 
