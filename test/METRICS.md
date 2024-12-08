# METRICS.md
 HEART FRAMEWORK : https://docs.google.com/presentation/d/1UQHGmDsKVsWOH2w4CIWR0VUm2aDzqyeMmSYOKKqtI0w/edit?usp=sharing

### Metric 1: Net Promoter Score (NPS)

- **How we collect NPS data:**
  - At the end of the " Golden Path", users are presented with a feedback question: *"On a scale of 0 to 10, how likely are you to recommend this app to a friend or colleague?"*.
  - Users submit their responses, which are then recorded in our backend Firebase Firestore database.
  -  The data is stored with the user's ID and timestamp, allowing us to track and analyze trends overtime.
  -  NPS is calculated by classifying respondents as :
     - **Promoters** (9-10)
     - **Passives** (7-8)
     - **Detractors** (0-6)
  - We determine the overall Net Promoter Score basefd off a formula, essentially we find the difference between Promoters and Detractors and divide the difference by the Total number of respondents, which then we find the exact percent of our NPS.

### Metric 2: Adoption Rate:

- **How we collect Adoption Rate Data:**
  - Make use of the data provided by Google Play Store Analytics to determine how many new users start using the app. This data helps us detrmine how effective marketing strategies such as the trade show style presentation for the finals, and what changes need to be made.

### Metric 3: Daily Active Users

- **How we collect DAU data:**
  - Record the amount of times users login, open the app, or complete a task.
     - Track each user's unique login ID through Firebase and the timestamp.
  - Record the amount of users who used the app within 24 hours.
  - Record specific user actions.
     - Based on activity, like opening the app, adding a plant, or accessing any feature.
  -Use Firebase Analytics' automatic event tracking to log the requested data. 


### Metric 5: Task Success

- **How we collect NPS data:** 
  - Track the average time spent on each step of adding a plant and setting notifications. This data will be collected via Firebase Analytics by logging custom events when users start and complete each task step.
