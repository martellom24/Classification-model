# Classification-model
Web Mining final project - R programming

1. The dataset that will be used for the project. (An overview of what the dataset contains.)
Group 4 will use the dataset, ‘Banking Dataset - Marketing Targets’ found on Kaggle (Banking Dataset - Marketing Targets | Kaggle). 
The dataset contains demographics about clients of a financial institution.The attributes are listed below:

age (numeric)
job : type of job (categorical: "admin.","unknown","unemployed","management","housemaid","entrepreneur","student",
"blue-collar","self-employed","retired","technician","services")
marital : marital status (categorical: "married","divorced","single"; note: "divorced" means divorced or widowed)
education (categorical: "unknown","secondary","primary","tertiary")
default: has credit in default? (binary: "yes","no")
 balance: average yearly balance, in euros (numeric)
housing: has housing loan? (binary: "yes","no")
loan: has personal loan? (binary: "yes","no")
# related with the last contact of the current campaign:
contact: contact communication type (categorical: "unknown","telephone","cellular")
day: last contact day of the month (numeric)
month: last contact month of year (categorical: "jan", "feb", "mar", …, "nov", "dec")
duration: last contact duration, in seconds (numeric)

# other attributes:
campaign: number of contacts performed during this campaign and for this client (numeric, includes last contact)
pdays: number of days that passed by after the client was last contacted from a previous campaign (numeric, -1 means client was not previously contacted)
previous: number of contacts performed before this campaign and for this client (numeric)
outcome: outcome of the previous marketing campaign (categorical: "unknown","other","failure","success")
# output variable (desired target):
y - has the client subscribed a term deposit? (binary: "yes","no")

2. What type of analysis you will be performing on the dataset.
This information was gathered for a marketing effort. Based on the attributes in the dataset, the financial institution wants to know which 
consumers are likely to place a term deposit. Term deposits are a source of revenue for financial institutions. A term deposit is a cash 
investment held at a bank. Your money is invested for a set period of time, or term, at a set rate of interest. The bank uses a variety of 
methods to reach out to consumers in order to offer term deposits, including email marketing, ads, telephonic marketing, and digital marketing. 
The group will perform a classification study to determine which consumers are most likely to convert.

3. Which of the topics in class your project will incorporate.
This project will be a supervised learning classification. The group will attempt different algorithm types discussed in this course and see 
which produces the best result (kNN, Naive-Bayes, SVM). 
