# Seoul-Bike-Sharing-Prediction
The objective of this work is to predict the trip duration of rental bikes in the Seoul Bike sharing system. The data used include weather information (Temperature, Humidity, Windspeed, Visibility, Dewpoint, Solar radiation, Snowfall, Rainfall), the number of bikes rented per hour and date information.

Currently Rental bikes are introduced in many urban cities for the enhancement of mobility comfort. It is important to make the rental bike available and accessible to the public at the right time as it lessens the waiting time. Eventually, providing the city with a stable supply of rental bikes becomes a major concern. The crucial part is the prediction of bike count required at each hour for the stable supply of rental bikes. The main objective is to make a predictive model, which could help them in predicting the bike demands proactively. This will help them in stable supply of bike wherever needed.

Feature engineering is done to extract additional features from the data. Four statistical models are used to predict the trip duration.

(a) Linear regression
(b) Decision Tree
(c) Random Forest (RF).
(d) Gradient boosting machines
(e) Extreme Gradient Boosting (XGBoost)
Methodology
EDA The dataset exploration and visualization resulted in very important insights about the data, including: 1- Boxplot of weather features shows minimal outliers in some features. 2- Data distribution using Histogram shows that 'Visibility', 'Solar radiation', 'Rainfall', and 'Snowfall' are skewed

Preprocessing
All preprocessing steps and feature engineering are combined and implemented in the DataPrep() function with comments explanation for each step.

1- Renaming features with unknown characters.
2- Convert Date column type to datetime type.
3- Feature engineering:
4- Categorical features encoding:
Binary encode 'Functioning Day' and 'Holiday' features. Target-based encoding for 'dow', 'month', 'Seasons' and 'Hour' columns.

5- Feature Scaling:
Based on the data distribution we noticed that some features follow normal distribution, some are left or right skewed, so we will apply different scaling techniques based on the feature nature and by several trials these scaling techniques gave best results: Min-Max scaling left skewed cols (Snowfall and Rainfall). Log transform wind speed, humidity and Solar radiation. Reciprocal transformation for Visibility feature. Calculate Average Rent per hour and day with log-transformation for training data only and then MAP the values to the test set according to each hour or day. Model Training The data is splitted to train and validation sets with 90%-10% ratio. Due to multicolinearity after adding several features, 'Snowfall','Hour' and 'Dew point temperature' are dropped and this improved the model. XGBoost and CatBoost models are both trained on the dataset and the average of the their predictions is considered as the final prediction. Results The used metrics are RMSLE, RMSE and R2-score.

Conclusion
Predicting the number of bikes rented per hour in Seoul, South Korea. Performed EDA on the dataset and found features 'Hour', 'Temp.' and 'Season' to be most important. Also performed Feature Engineering to extract some features. Used many regression algorithms for predicting the number of bikes like Linear Regression, Decision Tree, Random Forest and XGBoost etc. Also performed hyperparameter tuning on models to improve them further. Best performing models after tuning, R2-score of Random Forest: 92.25%, XGBoost: 94.53%, CatBoost: 94.46%.

The analysis is done with Seoul Bike data. Six regression techniques Linear Regression, Polynomial regression, Decision Tree, Random Forest, Gradient Boosting, XGB are used to predict the trip duration.This statistical data analysis shows interesting outcomes in prediction methods and also in an exploratory analysis.

The experimental results prove that the XGB model predicts best the trip duration with the highest R2 and with less error rate compared to Linear Regression, Decision Tree, Random Forest, Gradient Boosting.
