getwd() # check your current directory 
setwd('C:/Users/Downi/Documents/GitHub/EAPS_310_R-ShortCourse/5-Visualization Options in R/') # ENTER YOUR OWN DIRECTORY
getwd()

# the file may be a txt but the IEM site noted that it was comma delimited, so read.csv is appropriate.
asos <- read.csv('LAF.txt', header=T, stringsAsFactors=F, na.strings='null')

# before we get into visualization, we need to clean up some of the column data types.
# the station and wxcodes should be factors
asos$station <- as.factor(asos$station)
asos$wxcodes <- as.factor(asos$wxcodes)
levels(asos$wxcodes)

# Now, lets get down to visualizing!

plot(asos$tmpf, asos$dwpf)
# We could have summarized the data but there wouldn't have been anything in the summary that would have told us
# that there was a linear relationship between temperature and dewpoint temperature.
# Let's clean up this figure a little more.

customColor <- rgb(red=1, green=0, blue=1, alpha=0.3) 
# if you want to specify a transparency to your points, the above is the only way in base graphics.

plot(asos$tmpf, asos$dwpf,
     pch=16, cex=0.8, col=customColor,
     main='Temperature Vs Dewpoint Temperature',
     xlab='Air Temperature (F)',
     ylab='Dewpoint Temperature (F)',
     xlim=c(0,70),
     ylim=c(0,70),
     )
# lets add a grid to make it a little clearer looking
grid()

# This is a major improvement! How about we add a linear model fit line . . .
linearModel <- lm(dwpf~tmpf, data=asos)
abline(linearModel, col='blue', lwd=2)

# Let's mark out the freezing point, since this is a relevant value that we may care about.
lines(x=c(32,32), y=c(-20, 100), col='#009999', lwd=2)
# The x vector has duplicate values in order to match the length of y. The values were chosen so that
# the line would extend beyond the boundaries of the plot.


# Histograms

hist(asos$tmpf)

# What about the histograms continous cousin? The density plot can be had with base R as well, it just takes
# an extra step.
distro <- density(asos$tmpf, na.rm=T)
plot(distro$x, distro$y, type='l', col='red') # line plot

# lets combine them!
hist(asos$tmpf)
lines(distro, type='l', col='red')

# Well, that didn't work at all! Why not? Notice the y-axis, it's frequency, not probability. We need to
# set the probability argument in histogram to be true.
hist(asos$tmpf, prob=T, ylim=c(0,0.09))
lines(distro, type='l', col='red')


# Box and Whisker Plots
# if you look at the boxplot documentation, you'll see that the first argument is a formula.
# This formula is no different than that of the lm function. Here it is a continous value ~ grouping variable
boxplot(tmpf~wxcodes, data=asos, las=3,
        xlab='Weather Codes',
        ylab='Air Temperature (F)',
        main='Boxplot of Temperature by Weather Code')

# The las argument used here rotates the tick labels.
# You might notice that weather codes are overlapping with the axis label.
# Despite spending a fair amount of time trying to sort out how to pad the axis, I failed to do so.
# This is a great place to add something to the course if you can find a solution!
