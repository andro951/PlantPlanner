# METRICS.md
 HEART FRAMEWORK : https://docs.google.com/presentation/d/1UQHGmDsKVsWOH2w4CIWR0VUm2aDzqyeMmSYOKKqtI0w/edit?usp=sharing

### Metric 1: Net Promoter Score (NPS)

- ** How we collect NPS data:**
  - At the end of the " Golden Path", users are presented with a feedback question: *"On a scale of 0 to 10, how likely are you to recommend this app to a friend or colleague?"*.
  - Users submit their responses, which are then recorded in our backend Firebase Firestore database.
  -  The data is stored with the user's ID and timestamp, allowing us to track and analyze trends overtime.
  -  NPS is calculated by classifying respondents as :
     - **Promoters** (9-10)
     - **Passives** (7-8)
     - **Detractors** (0-6)
  - We determine the overall Net Promoter Score basefd off a formula, essentially we find the difference between Promoters and Detractors and divide the difference by the Total number of respondents, which then we find the exact percent of our NPS.
