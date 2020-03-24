library(ggplot2)

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
# ggplot's syntax is super strange to get used to at first but it becomes more intuitive as you use it.
# Ggplot is all about slowly building up your figure piece by piece.

# Let's try this out with a scatterplot so you can get a feel for the syntax.

ggplot(data=asos, mapping=aes(x=tmpf, y=dwpf))
# no dice. Let's go over what we've entered so far.
# ggplot lays the groundwork for building a plot but doesn't actually do any plotting.
# the data argument intitializes what data to handle and the mapping maps an x and y value.
# aes stands for aesthetic and is the standard way for defining the mapping.

# in order to get some points plotted, we'll need to add some points to the figure. And I do literally
# mean add points.
ggplot(data=asos, mapping=aes(x=tmpf, y=dwpf)) + geom_point(size=1, na.rm=T)
# note the default size is not 1 like cex is. There is no cex argument here, its replaced by size

# Let's clean this figure up some more.
customColor <- rgb(red=1, green=0, blue=1) 
ggplot(data=asos, mapping=aes(x=tmpf, y=dwpf)) + 
  geom_point(size=1, na.rm=T, alpha=0.3, col=customColor) +
  xlab('Air Temperature (F)') + ylab('Dewpoint Temperature (F)') +
  ggtitle('Air Temperature Vs Dewpoint Temperature')
ggsave('./figures/ggplot1.png', dpi=220, width=8.5, height=6)

# How can we reproduce our first figure?
linearModel <- lm(dwpf~tmpf, data=asos)
abline(linearModel, col='blue', lwd=2)

linearModel$coefficients # we can see our intercept and slope with this

ggplot(data=asos, mapping=aes(x=tmpf, y=dwpf)) + 
  geom_point(size=1, na.rm=T, alpha=0.3, col=customColor) +
  geom_vline(xintercept=32, col='red', size=1) +
  geom_abline(intercept=linearModel$coefficients[[1]], linearModel$coefficients[[2]], col='blue') +
  coord_cartesian(xlim=c(-5,65), ylim=c(-5,65)) +
  xlab('Air Temperature (F)') + ylab('Dewpoint Temperature (F)') +
  ggtitle('Air Temperature Vs Dewpoint Temperature')
ggsave('./figures/ggplot2.png', dpi=220, width=8.5, height=6)

# The warning is nothing to worry about it. It's just trying to make us aware that we could be doing something
# we didn't intend to do.