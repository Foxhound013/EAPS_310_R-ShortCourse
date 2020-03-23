# Visualization in R
  Visualization is the cornerstone to understanding your data. Without visualization, any analysis you do will be blind. Good and effective visualizations are key to understanding your data and to telling others about your data. Luckily, R has plenty of good visualization libraries that make the job of effectively plotting data, much easier.

  There are three main options for visualization in R; base graphics, lattice graphics, and ggplot2. We aren't going to cover all three of these in deep detail but we'll cover the basics of how to use each one. There are other plotting libraries out there like highcharter or plotly that make 3d interactive graphs available in R but these are outside the scope of our class.

  Three R files will be included in this section, one for each graphics option. The data used for this section can be found at https://mesonet.agron.iastate.edu/request/download.phtml?network=IN_ASOS.

## Base Graphics
  R base graphics are built in to R and you won't need to import anything to use these. They can be quite effective and pretty customizable. They're pretty quick and handle larger datasets pretty well to an extent. I'm linking a short tutorial on base graphics that you may find useful, https://rpubs.com/SusanEJohnston/7953. Another great resource can be found here, https://dcgerard.github.io/stat234/base_r_cheatsheet.html.

  The basic plots of R's base graphics are as follows;
  - plot: Useful for scatterplots or line plots.
  - hist: Useful for generating histograms.
  - boxplot: Exactly what it looks like, this command is for generating box and whisker plots.
  - barplot: Like boxplot, its what it sounds like. barplot generates a barplot for you.
  - lines: Sometimes you want to add a trend line or emphasize a point, like the 0 line. This is the command you'd use.
  - points: Sometimes, you'll want to add points to a figure from another dataset. This command will add to the current plot.

  I'd highly recommend spending some time reading over the documentation for these plotting commands to get a feel for what all arguments you have access to. Some of the common parameters that most of these have are as follows;
  - main: This controls the plot title.
  - xlab: The x axis label.
  - ylab: The y axis label.
  - col: Controls the color of points or lines on the figure.
  - pch: I believe this stands for point character. It controls what shape is used for plotting. pch=16 is a filled in circle. For a complete list of valid pch values see http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r
  - lwd: Controls the line width.
  - lty: Control the line type. For a complete list of line types see http://www.sthda.com/english/wiki/line-types-in-r-lty
  - cex: Controls the sizing of points in the plot. To this day, I have yet to figure out what cex actually stands for. While it is somewhat confusing, the default value is 1. If you enter a value less than 1 the text gets smaller and if you enter a value larger than 1 it gets larger. It tends to take some experimenting to get this how you'd like it since the value feels somewhat arbitrary.
  - xlim: Set the limits of the x axis values.
  - ylim: Set the limits of the y axis values.

  As your graphical needs get more complex, base graphics become more difficult to work with. Fortunately, other options are available.

## Lattice Graphics
  If you're working with multivariate datasets (large or small), lattice may be an excellent choice. Lattice is built into R, although you still have to call it with `library(lattice)`. You can produce some extremely informative and powerful graphics with Lattice. The plots produced with base graphics can also be produced in Lattice but Lattice's real power comes from the ability to condition and group variables by panel. What I mean by this will be more clear when we get into the code and actually produce a few visuals. A great resource for further reading can be found at http://www.sthda.com/english/wiki/lattice-graphs.

  The parameters written about in the base graphics section also apply to lattice (mostly).

## Ggplot2
  Ggplot2 may be one of the most popular options for plotting in R as it is part of the tidyverse. Some wonderfully elegant and simple plots can be produced using ggplot2. The multi-panel conditioning and grouping options of lattice are available to ggplot as well. When it comes to larger datasets, ggplot2 can be a fair bit slower than lattice graphics.
  
   Of the options in this tutorial, I have the least experience working with ggplot but we'll go over the basics.