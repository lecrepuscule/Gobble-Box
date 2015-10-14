Gobble-Box

The app searches dishes that contribute towards your nutrient daily recommended values based on what have been eaten during a period.


How it works:

1. the app uses Edamam api for nutrient and recipe data

2. when a user searches a dish, the relevant data of the results returned for the first time will be recorded in the app's db

3. there are 5 tables in the db
![](https://cloud.githubusercontent.com/assets/13487694/10041170/207719a4-61da-11e5-8799-afeed9804527.png)

4. the app aggregates the nutrient values for each dish eaten by a user and show off the current intake status

5. it can also identify the nutrients with the least daily recommended value percentage according to what the user has already eaten, and search for dishes that contain those nutrients as suggestions for future meals



