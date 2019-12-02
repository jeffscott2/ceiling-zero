#get some data
## this is open data from online- like calling an API:
#data2 = read.csv(url("http://stat.columbia.edu/~rachel/datasets/nyt1.csv"))
## this is data we have been using: 
data1 = read.csv("/Users/user1/Downloads/kc_house_data.csv") #why doesn't think work? 
data1 = read.csv("/Users/user1/Documents/kc_house_data.csv")

#explore the data
head(data1)
tail(data1)
summary(data1)
str(data1)
##plots to see the data better 
attach(data1)
hist(sqft_living)
hist(price)
##try some on your own and try to summarize [in words] what learned about the data from each.  

# Analyze whether square footage CAUSES a house's price to be higher on average.
##use a linear regression
##plot the relationship
plot(sqft_living, price)
##dress up the plot
plot(sqft_living, price, col="red") #change the color of the dots
plot(sqft_living, price, col="red", xlab="Square Footage", ylab="Price") # Make the variable names more readable
##run a linear regression
model = lm(price~sqft_living)
model  #see the results of your model
summary(model)  #this is the MOST IMPORTANT line of code- it tells you the detailed results of your model
## Estimate: Tell you the estimated relationship between your x and y variables. 
## the stars: Tells you if the Estimate is "statistically significant". 
### if there are stars: it is statistically significant. 
### if there are no stars, the Estimate is effectively 0. The relationship between x and y is not "statistically significant". 
###The interpretation of these coefficients is: 
####The estimate: for every additional square foot of living space in a house, the estimated price of the house increases by $280 on average, all else equal.
#### The intercept: is the predicted value when all the other variables are set to 0. 

## Let's graph the linear model so its easier to understand the estimated relationship in reality. 
coefs = coef(model)
coefs #you can type the variable anytime to see its contents display, just like every other programming language
##plot the line you just estimated on your graph
plot(sqft_living, price, col="red", xlab="Square Footage", ylab="Price") # Make the variable names more readable
abline(coefs[1], coefs[2])

## improve your linear model with control variables
modelwithcontrols = lm(price~., data = data1)
modelwithcontrols
summary(modelwithcontrols)
summary(model)  #compare the results. What differences did this make? why? 


# PREDICT housing prices
##get the library that wrote the prediction algorithm for you. 
install.packages("randomForest")  #say no when it asks if you want to compile. 
library(randomForest)
## Predicting technically requires training and testing on different data. 
### Split into Train and Validation sets
### Training Set : Validation Set = 70 : 30 (random)
set.seed(100)
train <- sample(nrow(data1), 0.7*nrow(data1), replace = FALSE)
TrainSet <- data1[train,]
ValidSet <- data1[-train,]
summary(TrainSet)
summary(ValidSet)
## Now you can actually run the model on training data - eg "train the model". 
modelrf <- randomForest(price ~ ., data = TrainSet, importance = TRUE)  #note that this will take a few minutes to run. 
modelrf  #view the results of your model on your screen
print(modelrf)  # if you wanted to create a report of these results, you can print it out to a new file with this command.
round(importance(modelrf),2)
# Review how well your model does agains the actual data. 
predTrain <- predict(modelrf, TrainSet, type = "class")
head(predTrain) #look at the first five predictions
tail(predTrain) #look at the last five predictions
summary(predTrain)
summary(TrainSet$price)
#Plot the predictions against the actual for a visual comparison. The closer to the line, the better the model. 
plot(predict(modelrf), TrainSet$price, xlab="predicted",ylab="actual")
abline(a=0,b=1)

## Use this model to predict housing prices on the Validation (out of sample) set. 
predValid <- predict(modelrf, ValidSet, type = "class")
### And then evaluate how well this model did on the out of sample data. This is the real predictive value of your model. 
head(predValid)
tail(predValid)
summary(predValid)
summary(ValidSet$price)
plot(predValid, ValidSet$price, xlab="predicted", ylab="actual")
abline(a=0,b=1)


# Lets try predicting something else. 
model1 <- randomForest(grade ~ ., data = TrainSet, importance = TRUE)
model1  #view the results of your model on your screen
print(model1)  # if you wanted to create a report of these results, you can print it out to a new file with this command.

## look at how important each variable was in your predictive model. How does this differ from causation? 
round(importance(model1),2)
?randomForest  # you can always use this ? command to look at the library you called and get all the commands built into it.
##improve the model 
model2 <- randomForest(grade ~ ., data = TrainSet, ntree = 500, mtry = 6, importance = TRUE)  
model2
model1 #compare with model2 for initial performance evaluation of model. Not that much different. How can you tell? 
## Once the model is settling without improvement by adding trees, mtrys, we can create predictions and evaluate that way.
predTrain1 <- predict(model1, TrainSet, type = "class")
predValid1 <- predict(model1, ValidSet, type = "class")
plot(predValid1, ValidSet$grade, xlab="predicted", ylab="actual")  #Why does this plot look different? Because the variables were in categories. The graph can be interpreted the same way as the other plots. 
abline(a=0,b=1)


#Ignore below. 
# convert predictor to a binary variable
data1$binary_grade = if(data1$grade>1) {1} else {0}
model2 <- randomForest(binary_grade ~ ., data = TrainSet, ntree = 500, mtry = 6, importance = TRUE)  
## Checking classification accuracy
mean(predValid == ValidSet$grade)                    
table(predValid,ValidSet$grade)
## To check important variables
importance(model2)        
varImpPlot(model2)
