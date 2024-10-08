##########Data Transformation in R##################
################################################

###Making Wide Datasets Long with pivot_wider()

# Load the tidyverse
library(tidyverse)

# Read in the Pew dataset
pew <- read_csv("http://594442.youcanlearnit.net/pew.csv")

# Let's take a look at what we have
pew

# This looks to be a gathering problem.  Our dataset is wide and we want it to be long.
# The gather function can take care of that for us
pew.long <- pivot_longer(pew, !religion, names_to='income', values_to='freq')

# And what did we get?
pew.long

### Making Long Datasets Wide with pivot_wider()

# Read the dataset
weather <- read_csv("http://594442.youcanlearnit.net//mexicanweather.csv")

# Let's look at what we have
weather

# And use spread() to make it wider
weather.wide <- pivot_wider(weather, names_from=element, values_from=value)

# Where are we now?
weather.wide

### Converting Data Types

# Let's say that we have a vector of numbers representing the number of foul shots made
# by a team of basketball players

foulshots <- c(18, 22, 15, 13, 5)

# I can use the sum() function to total them up

sum(foulshots)

# But what if they are read in as strings?

foulshot_strings <- c("18", "22", "15", "13", "5")
sum(foulshot_strings)
class(foulshot_strings)

# We can fix it with as.numeric

foulshot_converted <- as.numeric(foulshot_strings)
class(foulshot_converted)
sum(foulshot_converted)

# There are also tests to help us determine whether 

is.numeric(foulshots)
is.character(foulshots)

is.numeric(foulshot_strings)
is.character(foulshot_strings)

# Let's look at a tibble containing the names of players and their team numbers

names <- c("Mike", "Rae", "Dennis", "Sally", "Ian", "Sue")
teams <- c(1,1,1,2,2,2)
assignments <- tibble(names, teams)
assignments

# That's not really correct, because team isn't a numeric value, it's a factor

assignments$teams <- as.factor(assignments$teams)
assignments

# And there is an is.factor function to test them

is.factor(assignments$names)
is.factor(assignments$teams)

### Dates and Times in R

# Load the lubridate
library(lubridate)

# We can use lubridate functions to extract elements of the date
weather <- weather %>%
  mutate(year=year(date), month=month(date), day=day(date))

weather

# We can also extract some derived values such as the weekday
wday("2018-04-01")

# or day of the year
yday("2018-04-01")

# We can also use lubridate to create date values out of different strings

mdy("04/01/2018")
mdy("04/01/18")
dmy("04/01/18")
ymd("2018-04-01")


# And we can include times

ymd_hms("2018-04-01 08:00:00")

# Let's force that to eastern time

ymd_hms("2018-04-01 08:00:00", tz='EST')
