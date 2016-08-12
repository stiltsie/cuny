install.packages(hflights)

# I first created a new version of the datase without any of the fields with NA values.

revflights <- hflights[complete.cases(hflights),]

# I was interested in looking at the relationships between some of the taxiing variables and the delay variables.
# First I looked at summary data for each variable.

summary(revflights$ArrDelay)
summary(revflights$DepDelay)
summary(revflights$TaxiIn)
summary(revflights$TaxiOut)

# Next I developed a few derivative values to adjust taxiing time and delays by distance but was not happy with how they turned out.

revflights$taxi_in_prop <- revflights$TaxiIn/revflights$Distance
revflights$taxi_out_prop <- revflights$TaxiOut/revflights$Distance
revflights$arrival_delay_prop <- revflights$ArrDelay/revflights$Distance

# I next developed some histograms and scatterplots to characterize taxiing and delays and the relationships between them - focusing on taxiing out and arrival delay.

library(ggplot2)
h <- ggplot(revflights, aes(x=TaxiOut, y=ArrDelay)) 
h + geom_point() + geom_smooth()
h2 <- ggplot(revflights, aes(x=TaxiOut, y=DepDelay))
h2 + geom_point() + geom_smooth()

ggplot(revflights, aes(x=ArrDelay)) + geom_histogram(binwidth = 10)
ggplot(revflights, aes(x=DepDelay)) + geom_histogram(binwidth = 10)
h + geom_point() + facet_wrap(~ UniqueCarrier) + geom_smooth()
h2 + geom_point(aes(color=UniqueCarrier)) + facet_wrap(~ UniqueCarrier) + geom_smooth()

# I looked at correlations across the variables.

cor(revflights$ArrDelay, revflights$TaxiOut)
cor(revflights$DepDelay, revflights$TaxiOut)
cor(revflights$ArrDelay, revflights$TaxiIn)
cor(revflights$DepDelay, revflights$TaxiIn)

# No correlation was particularly strong - 0.22 was the highest correlation - between taxiing out and arrival delay.

# I next conducted t-tests from 

revflights2 <- subset(revflights, revflights$UniqueCarrier == 'AA' | revflights$UniqueCarrier == 'DL')
ansari.test(revflights2$ArrDelay ~ revflights2$UniqueCarrier, revflights2)
ggplot(revflights2, aes(x=revflights2$ArrDelay,fill=revflights2$UniqueCarrier)) + geom_histogram(binwidth = 10)
t.test(revflights2$ArrDelay ~ revflights2$UniqueCarrier, data = revflights2, var.equal = FALSE)



ggplot(revflights, aes(x=revflights$ArrDelay)) + geom_histogram() + facet_wrap(~ UniqueCarrier)

revflights3 <- subset(revflights, revflights$UniqueCarrier == 'UA' | revflights$UniqueCarrier == 'US')
ansari.test(revflights3$ArrDelay ~ revflights3$UniqueCarrier, revflights3)
t.test(revflights3$ArrDelay ~ revflights3$UniqueCarrier, data = revflights3, var.equal = FALSE)


