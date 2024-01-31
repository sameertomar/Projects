LoanTap is an online platform committed to delivering customized loan products to millennials. They innovate in an otherwise dull loan segment, to deliver instant, flexible loans on consumer friendly terms to salaried professionals and businessmen.

The data science team at LoanTap is building an underwriting layer to determine the creditworthiness of MSMEs as well as individuals.

Problem Statement: Given a set of attributes for an Individual, determine if a credit line should be extended to them. The main challenge is to minimise the risk of NPAs by flagging defaulters while maximising opportunity to earn interest by disbursing loans to as many customers as possible.

Data dictionary:

loan_amnt : The listed amount of the loan applied for by the borrower. If at some point in time, the credit department reduces the loan amount, then it will be reflected in this value.
term : The number of payments on the loan. Values are in months and can be either 36 or 60.
int_rate : Interest Rate on the loan
installment : The monthly payment owed by the borrower if the loan originates.
grade : LoanTap assigned loan grade
sub_grade : LoanTap assigned loan subgrade
emp_title :The job title supplied by the Borrower when applying for the loan.
emp_length : Employment length in years. Possible values are between 0 and 10 where 0 means less than one year and 10 means ten or more years.
home_ownership : The home ownership status provided by the borrower during registration or obtained from the credit report.
annual_inc : The self-reported annual income provided by the borrower during registration.
verification_status : Indicates if income was verified by LoanTap, not verified, or if the income source was verified
issue_d : The month which the loan was funded
loan_status : Current status of the loan - Target Variable
purpose : A category provided by the borrower for the loan request.
title : The loan title provided by the borrower
dti : A ratio calculated using the borrower’s total monthly debt payments on the total debt obligations, excluding mortgage and the requested LoanTap loan, divided by the borrower’s self-reported monthly income.
earliest_cr_line :The month the borrower's earliest reported credit line was opened
open_acc : The number of open credit lines in the borrower's credit file.
pub_rec : Number of derogatory public records
revol_bal : Total credit revolving balance
revol_util : Revolving line utilization rate, or the amount of credit the borrower is using relative to all available revolving credit.
total_acc : The total number of credit lines currently in the borrower's credit file
initial_list_status : The initial listing status of the loan. Possible values are – W, F
application_type : Indicates whether the loan is an individual application or a joint application with two co-borrowers
mort_acc : Number of mortgage accounts.
pub_rec_bankruptcies : Number of public record bankruptcies
Address: Address of the individual


Insights

Impact of Categorical Attributes on loan_status (target variable):
The % of defaulters is much higher for longer (60-month) term
As expected, grade/sub-grade has the maximum impact on loan_status with highest grade having maximum defaulters
Zip codes such as 11650, 86630 and 93700 have 100% defaulters
We can remove initial_list_status and state as they have no impact on loan_status
Direct pay application type has higher default rate compared to individual/joint
Loan taken for the purpose of small business has the highest rate of default
Impact of Numerical Attributes on loan_status (target variable):
It can be observed that the mean loan_amnt, int_rate, dti, open_acc and revol_util are higher for defaulters
The mean annual income is lower for defaulters
A Logistic Regression model (trained after upsampling the data to balance the target variable) performed well, rendering accuracy of 80%.
The model had a precision score of 95%, recall score of 80%, and f1 score of 87% on the negative class
The model had a precision score of 49%, recall score of 81%, and f1 score of 61% on the positive class
The ROC plot shows that the area under ROC curve is 0.91, which signifies that the model is able to differentiate well between both classes
The area under Precision Recall curve is 0.78 (can be improved using hyperparameter tuning/increasing model complexity)

Recommendations

The optimal strategy to achieve the objective of balancing the risk of increasing NPAs by disbursing loans to defaulters with the opportunity to earn interest by disbursing loans to as many worthy customers as possible: maximise the F1 score along with the area under Precision Recall Curve (precision-recall trade-off)
More complex classifiers like random forest would give better results compared to logistic regression because they are not restricted by the linearity of decision boundary
