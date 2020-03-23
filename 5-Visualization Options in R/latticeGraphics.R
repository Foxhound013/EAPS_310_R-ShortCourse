library(lattice)
library(latticeExtra) # many other options are enabled by latticeExtra, but we're using it for the grid here.

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
# Lattice relies pretty heavily on the formula system like you would use in lm.
# Let's get started with a basic scatterplot
xyplot(dwpf~tmpf, data=asos, pch=16, alpha=0.3,
       xlim=c(-5,65), ylim=c(-5,65),
       grid=T,
       main='Air Temperature Vs Dewpoint Temperature',
       xlab='Air Temperature (F)',
       ylab='Dewpoint Temperature (F)')

# In some ways, this figure was easier to produce but what if we want to look at the relationship by group?
# maybe by weather code?
xyplot(dwpf~tmpf, data=asos, groups=wxcodes,
       pch=16, alpha=0.3,
       xlim=c(-5,65), ylim=c(-5,65),
       grid=T,
       auto.key=T,
       main='Air Temperature Vs Dewpoint Temperature',
       xlab='Air Temperature (F)',
       ylab='Dewpoint Temperature (F)')
# This isn't great given how many categories (groups) there are. How about we try paneling!

# png, jpg, pdf, and other commands like these are used for writing to file figures.
png('./figures/sampleXyPlot%02d.png', units='in', res=220, width=8.5, height=6)
xyplot(dwpf~tmpf | wxcodes, data=asos,
       pch=16, alpha=0.3,
       xlim=c(-5,65), ylim=c(-5,65),
       grid=T,
       auto.key=T,
       layout=c(3,2), # the layout argument is columns by rows and specifies the panels.
       main='Air Temperature Vs Dewpoint Temperature',
       xlab='Air Temperature (F)',
       ylab='Dewpoint Temperature (F)')
dev.off()

# notice the %02d at the end of the file path. That ensures that the different plots are saved with a number
# at the end so they don't overwrite each other.

# So much more can be done with lattice graphics but we'll stop here. It takes a lot of time to get used to
# lattice but it is definitely worthwhile to learn. I've included an example figure from my thesis in the
# figures folder that shows what can be done with lattice in a reasearch setting.