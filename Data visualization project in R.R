#This is a Data Visualization project in R.
#ggplot2 is a visualization package built by Hadley Wickham
#it uses 3 basic elements to construct a ggplot -> dataset, aesthetic mapping, geom element

#Lets get into our 1st data visualization project to get a hands-on experience of creating visualizations for analysis

#libraries needed
install.packages(c("tidyr", "ggplot2","dplyr"))
library(tidyr)
library(ggplot2)
library(dplyr)


##Download and read Rodent species dataset
download.file("http://datacarpentry.github.io/dc_zurich/data/portal_data_joined.csv",
              "data/portal_data_joined.csv")
surveys_complete <- read.csv(file = "D:/Rstudio workspace/R Beginner/R beginner/portal_data_joined.csv")

#Generate a basic scatter plot to see how our data is spread out
scatplt1 <-  ggplot(surveys_complete, aes(x = weight, y = hindfoot_length)) + geom_point()
scatplt1


#Add a little noise to datapoints to reduce overplotting with geom_jitter() or use position_jitter() argument
scatplt2_1 <- scatplt1+ geom_jitter()
#or
scatplt2_2 <- ggplot(surveys_complete, aes(x = weight, y = hindfoot_length)) +
  geom_point(position = position_jitter())

#Create a plot based on species_id abnd visualuize them based on colour
scatplt3 <- ggplot(surveys_complete, aes(x = weight, y = hindfoot_length, colour = species_id)) +
  geom_point(position = position_jitter())
scatplt3

#We can make the points more transparent so we can assess the overplotting
scatplt4 <-  ggplot(surveys_complete, aes(x = weight, y = hindfoot_length, colour = species_id)) +
  geom_point(alpha = 0.3,  position = position_jitter())
scatplt4

#Now we use plot_id variable to further differentiate among species_id
scatplt5 <- ggplot(surveys_complete, aes(x = weight, y = hindfoot_length, colour = species_id, shape = as.factor(plot_id))) +
  geom_point(alpha = 0.3,  position = position_jitter())
scatplt5

#ggplot2 also allows you to calculate directly some statistical. stat_smooth() or geom_smooth() argument uses various regression to gie a smooth plot
scatplt6_1 <- ggplot(surveys_complete, aes(x = weight, y = hindfoot_length, colour = species_id)) +
  geom_point(alpha = 0.3,  position = position_jitter()) + stat_smooth(method = "lm")
scatplt6_1

scatplt6_2 <- ggplot(surveys_complete, aes(x = weight, y = hindfoot_length, colour = species_id)) +
  geom_point(alpha = 0.3,  position = position_jitter()) + geom_smooth(method = "lm")
scatplt6_2

