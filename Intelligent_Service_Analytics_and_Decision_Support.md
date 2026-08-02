<div class="hero">
# Intelligent Service Analytics & Decision Support

## Investigating SLA Risk, Escalation, Automation Opportunities and Customer Experience

### Applied Research & Data Analytics Project

---

## Abstract

This project investigates service-operation data to identify factors associated with Service Level Agreement (SLA) performance, customer experience, escalation, knowledge-base usage, workload, and automation opportunities.

The analysis was conducted on a merged dataset containing **120,000 service records and 40 variables** covering operational, customer-experience, workforce, escalation, automation, temporal, and financial dimensions of service delivery.

The project combines data preparation, exploratory data analysis, statistical investigation, business intelligence, and an initial machine-learning experiment to investigate whether operational characteristics can be used to identify and predict SLA-breach risk.

The analysis identified substantial differences in SLA performance across service channels, ticket characteristics, escalation status, knowledge-base requirements, and workload periods. An initial predictive modelling experiment also demonstrated that operational variables can provide useful information for distinguishing tickets associated with SLA-breach risk.

The project provides a foundation for further research into **machine learning, explainable AI, intelligent service management, predictive analytics, automation, and human-centred decision-support systems**.

**Research areas:** Machine Learning · Predictive Analytics · Intelligent Systems · Decision Support · Service Analytics · Explainable AI · Process Automation

---

# 1. Introduction

Modern service organisations generate large volumes of operational data through customer enquiries, support interactions, service requests, escalations, knowledge-base searches, and workforce activities.

These data provide an opportunity to move beyond retrospective reporting towards systems capable of identifying operational risks before they become significant service problems.

One important challenge in service operations is maintaining SLA performance while also maintaining customer satisfaction and controlling operational costs.

This project investigates whether service-operation data can be used to understand the factors associated with SLA breaches and whether those characteristics can support predictive and intelligent decision-making.

The project also investigates the relationship between service workload, escalation, knowledge requirements, repetitive enquiries, customer satisfaction, and potential automation opportunities.

---

# 2. Problem Statement

SLA breaches can negatively affect customer experience, operational efficiency, and service performance.

Traditional reporting can identify how many SLA breaches occurred, but it may provide limited insight into the operational characteristics associated with those breaches.

A more advanced analytical approach can investigate questions such as:

- Which service channels have the highest SLA-breach rates?
- Which types of enquiries require greater operational effort?
- Are escalated tickets more likely to breach SLA?
- Is knowledge-base searching associated with longer service interactions?
- How does workload vary across different periods?
- Are repetitive enquiries suitable candidates for automation?
- Can operational characteristics be used to predict SLA-breach risk?

The central problem investigated by this project is:

> **Can service-operation data be used to identify and predict factors associated with SLA-breach risk in order to support proactive service-management decisions?**

---

# 3. Research Motivation

The project was motivated by the opportunity to move from descriptive service reporting towards predictive and intelligent decision support.

Traditional reporting primarily answers:

> **What happened?**

Diagnostic analytics can investigate:

> **Why might it have happened?**

Predictive analytics can investigate:

> **What is likely to happen next?**

Decision-support systems can then investigate:

> **What action could be considered?**

This project therefore represents a progression from:

**Operational Data**

↓

**Descriptive Analytics**

↓

**Diagnostic Analysis**

↓

**Predictive Analytics**

↓

**Intelligent Decision Support**

---

# 4. Dataset

The analysis was conducted using a merged GrandStay service-operation dataset.

The final dataset contained:

- **120,000 service records**
- **40 variables**
- Four months of operational data
- 22 inquiry categories
- Four service channels
- Seven regions
- Six agent teams
- 50 agents
- Hourly and daily temporal information

The variables covered several dimensions of service delivery, including:

### Service Operations

- Ticket information
- Inquiry category
- Service channel
- Region
- Agent
- Team
- Handle time
- Response variance

### SLA Performance

- SLA-breach indicator
- SLA-related operational measures
- Peak-hour indicators

### Customer Experience

- CSAT score
- Abandonment rate

### Escalation

- Escalation indicator
- Escalation reason
- Escalation time

### Knowledge Management

- Knowledge-base search requirement
- Knowledge-base search time

### Automation

- Repetitive enquiry indicator
- Estimated time saved through automation

### Workforce

- Agent utilisation
- Overtime
- Training hours
- Agent turnover

### Financial / Commercial Measures

- Total cost
- Cost per contact
- Missed upsell opportunities
- Missed revenue

### Temporal Variables

- Date
- Month
- Day of week
- Hour
- Hourly inquiry volume
- Peak-period indicators

---

# 5. Data Preparation

The project involved merging operational datasets into a consolidated analytical dataset.

Data preparation was required to ensure that the resulting dataset could support consistent analysis across service, customer, workforce, and operational dimensions.

The preparation process included:

1. Data integration
2. Data validation
3. Variable inspection
4. Identification of different levels of data granularity
5. Preparation of analytical variables
6. Exploratory analysis
7. Dashboard development
8. Predictive modelling preparation

---

# 6. Data Granularity and Analytical Considerations

An important characteristic of the merged dataset is that not all variables operate at the same level of granularity.

Some variables represent individual ticket-level observations, while some workforce, financial, and operational variables represent monthly or aggregate information that is repeated across individual records.

Examples include variables relating to:

- Monthly inquiry volume
- Total monthly cost
- Missed revenue
- Overtime
- Training
- Agent utilisation
- Agent turnover

These variables were therefore treated carefully during analysis rather than being blindly aggregated across all 120,000 records.

This distinction is important because summing repeated monthly values at ticket level could produce misleading results.

The project therefore considered the analytical grain of variables when interpreting results.

---

# 7. Exploratory Data Analysis

Exploratory analysis was conducted to understand the structure and behaviour of the service-operation dataset.

The analysis examined:

- SLA performance
- Handle time
- Customer satisfaction
- Service channels
- Escalation
- Knowledge-base usage
- Repetitive enquiries
- Workload
- Temporal patterns
- Automation opportunities

The purpose was to identify patterns that could provide a foundation for further statistical and predictive analysis.

---

# 8. Overall SLA Performance

The dataset contains **120,000 service records**.

Of these:

- **86,290 tickets breached SLA**
- **33,710 tickets did not breach SLA**

This corresponds to an overall SLA-breach rate of approximately:

> **71.9%**

The result indicates that SLA performance represents a significant operational challenge within the analysed service environment.

The high breach rate provides a clear motivation for investigating the operational characteristics associated with SLA failure.

---

# 9. SLA Performance and Handle Time

A substantial difference was observed between tickets associated with SLA breaches and tickets without SLA breaches.

| SLA Outcome | Average Handle Time | Average CSAT |
|---|---:|---:|
| No SLA breach | 11.70 minutes | 3.42 / 5 |
| SLA breached | 17.33 minutes | 3.15 / 5 |

Tickets associated with SLA breaches had an average handling time approximately **48% higher** than tickets without SLA breaches.

The analysis also showed lower average CSAT among tickets associated with SLA breaches.

These findings demonstrate an association between SLA performance, handling time, and customer experience.

The analysis does not establish that longer handling time directly causes SLA breaches or that SLA breaches directly cause lower CSAT. Further causal investigation would be required to establish such relationships.

---

# 10. SLA Performance by Service Channel

Service channel demonstrated substantial differences in SLA performance.

| Channel | Tickets | SLA Breach Rate |
|---|---:|---:|
| Phone | 35,914 | 84.7% |
| Chat | 54,284 | 77.0% |
| Email | 18,116 | 52.3% |
| Front Desk | 11,686 | 39.2% |

Phone interactions recorded the highest SLA-breach rate at approximately **84.7%**, while Front Desk interactions recorded the lowest at approximately **39.2%**.

The difference between service channels raises an important research question concerning the relationship between service modality, workload, interaction complexity, and SLA performance.

---

# 11. SLA Performance and Repetitive Enquiries

The dataset contains an indicator identifying repetitive enquiries.

The analysis found:

| Ticket Type | Tickets | SLA Breach Rate | Average Handle Time | Average CSAT |
|---|---:|---:|---:|---:|
| Non-repetitive | 47,863 | 86.4% | 26.28 min | 2.75 |
| Repetitive | 72,137 | 62.3% | 8.76 min | 3.55 |

Repetitive enquiries represented a substantial proportion of the dataset and had considerably shorter handling times than non-repetitive enquiries.

They also showed lower SLA-breach rates and higher average CSAT.

This finding is particularly relevant to automation analysis because repetitive enquiries may represent opportunities for process standardisation or automation.

However, the analysis does not establish that automating repetitive enquiries would produce a specific reduction in SLA breaches.

The automation opportunity therefore requires further experimental investigation.

---

# 12. Escalation Analysis

Escalation represents another important dimension of service performance.

Among the records containing escalation information, the analysis identified substantial differences between escalated and non-escalated interactions.

| Escalation Status | SLA Breach Rate | Average Handle Time | Average CSAT |
|---|---:|---:|---:|
| Not escalated | 66.2% | 12.57 min | 3.61 |
| Escalated | 83.0% | 21.71 min | 2.44 |

Escalated tickets had:

- Higher SLA-breach rates
- Longer handling times
- Lower customer satisfaction

The average handling time for escalated tickets was approximately **21.71 minutes**, compared with **12.57 minutes** for non-escalated tickets.

This represents a substantial operational difference.

---

# 13. Escalation as a Potential SLA-Risk Indicator

The strong relationship between escalation and SLA performance suggests that escalation characteristics may contain useful information for predictive analytics.

A potential intelligent service system could therefore investigate whether early indicators of escalation can be used to identify tickets at increased risk of SLA failure.

A conceptual approach is:

**Incoming Service Request**

↓

**Operational Characteristics**

↓

**Risk Assessment**

↓

**Potential SLA-Breach Risk**

↓

**Proactive Intervention**

The purpose would be to identify potential risk early enough for service teams to take appropriate action.

---

# 14. Knowledge-Base Analysis

Knowledge-base usage was also investigated.

Among records containing knowledge-base information:

| Knowledge-Base Search | SLA Breach Rate | Average Search Time |
|---|---:|---:|
| No | 64.4% | 0 minutes |
| Yes | 74.6% | 5.20 minutes |

Tickets requiring knowledge-base searches showed a higher SLA-breach rate.

The analysis also showed that knowledge-base searches introduced additional time into the service interaction.

This does not establish that knowledge-base searching causes SLA breaches.

Instead, it suggests that knowledge accessibility, information retrieval, or knowledge gaps may be relevant factors for further investigation.

This creates an opportunity for research into:

- Knowledge retrieval systems
- Intelligent search
- AI-assisted service agents
- Knowledge recommendation
- Retrieval-augmented service support

---

# 15. Workload and Temporal Analysis

Service workload varies across the day.

The dataset includes hourly inquiry volume and peak-period indicators.

The overall SLA-breach rate was approximately **71.9%**, while peak-hour records showed a breach rate of approximately **72.3%**, compared with approximately **38.6%** for non-peak records.

A Spearman correlation analysis between hourly inquiry volume and SLA-breach behaviour produced a correlation of approximately:

> **ρ = 0.28**

This indicates a positive association between workload and SLA-breach behaviour within the analysed data.

The relationship is not sufficiently strong to imply that workload alone determines SLA performance, but it provides evidence supporting further investigation of workload-aware service management.

---

# 16. Peak-Hour SLA Performance

Several high-volume periods demonstrated particularly high SLA-breach rates.

Examples include:

| Hour | SLA Breach Rate |
|---:|---:|
| 10:00 | 83.2% |
| 16:00 | 83.2% |
| 18:00 | 83.1% |
| 19:00 | 82.9% |

These patterns suggest that temporal workload characteristics may be useful features in an SLA-risk prediction system.

A future intelligent system could potentially incorporate real-time workload information when assessing service risk.

---

# 17. Automation Opportunity

The dataset contains information relating to repetitive enquiries and estimated time savings associated with automation.

The presence of a substantial volume of repetitive enquiries creates an opportunity to investigate process automation.

However, automation should not be viewed simply as a mechanism for reducing handling time.

An intelligent automation strategy should consider:

- Enquiry complexity
- Customer experience
- SLA requirements
- Escalation risk
- Knowledge requirements
- Human intervention requirements
- Potential operational savings

The objective should therefore be:

> **Automate appropriate service processes while preserving service quality and providing human escalation when required.**

---

# 18. Automation Decision Framework

A potential decision-support framework could be:

**Service Request**

↓

**Classify Request**

↓

**Assess Complexity**

↓

**Assess Repetition**

↓

**Assess Knowledge Requirement**

↓

**Estimate SLA Risk**

↓

**Determine Automation Suitability**

↓

**Automated Response / Human Agent**

↓

**Monitor Outcome**

This represents a potential future intelligent service-management architecture.

---

# 19. Initial Predictive Modelling Experiment

An initial machine-learning experiment was conducted to investigate whether operational characteristics could be used to predict SLA-breach risk.

The modelling approach deliberately avoided several variables that represent downstream outcomes or could introduce data leakage.

Instead, the predictive experiment focused on operational characteristics such as:

- Service channel
- Region
- Agent team
- Inquiry category
- Language
- Repetitive enquiry indicator
- Peak-hour indicators
- Hour of day
- Day of week
- Hourly inquiry volume
- Knowledge-base requirement

The objective was to investigate whether information available during service delivery could provide useful information about potential SLA-breach risk.

---

# 20. Initial Model Performance

The initial logistic-regression experiment produced approximately:

### ROC-AUC

**0.822**

### PR-AUC

**0.913**

These results indicate that the operational variables used in the initial experiment contained useful predictive information for distinguishing records associated with SLA-breach risk.

The result should be regarded as an **initial predictive experiment**, rather than a final production-ready model.

Further research would be required to establish model robustness, generalisation, calibration, feature importance, temporal stability, and performance across different operational conditions.

---

# 21. Why Predictive SLA Analytics Matters

Traditional service reporting identifies SLA breaches after they occur.

Predictive analytics provides the possibility of identifying risk before the breach occurs.

The conceptual progression is:

**Historical Service Data**

↓

**Operational Feature Engineering**

↓

**Predictive Model**

↓

**SLA Risk Score**

↓

**High-Risk Service Request**

↓

**Proactive Intervention**

↓

**Improved Service Management**

The potential benefit is therefore not simply prediction.

The ultimate objective is to support better operational decisions.

---

# 22. Intelligent Decision-Support System

The findings provide a foundation for an intelligent service decision-support system.

A conceptual system could operate as follows:

**Incoming Ticket**

↓

**Data & Context Collection**

↓

**Feature Extraction**

↓

**SLA Risk Prediction**

↓

**Risk Classification**

↓

**Explanation of Risk Factors**

↓

**Recommended Action**

↓

**Human Review / Automated Action**

↓

**Outcome Monitoring**

This architecture combines data analytics, machine learning, automation, and human decision-making.

---

# 23. Explainable AI Extension

Predicting SLA risk alone may not be sufficient for operational adoption.

A service manager may reasonably ask:

> **Why has this ticket been classified as high risk?**

An explainable AI layer could provide information about the characteristics contributing to a prediction.

For example:

**SLA Risk: HIGH**

Potential contributing factors could include:

- High workload period
- Service channel
- Inquiry category
- Knowledge requirement
- Escalation indicators
- Historical operational patterns

Future research could investigate explainability techniques such as SHAP to provide human-readable explanations of model predictions.

---

# 24. Human-in-the-Loop Decision Support

The proposed system is intended to support human decision-making rather than automatically replace service personnel.

A human-in-the-loop approach could operate as:

**Machine-Learning Prediction**

↓

**Risk Explanation**

↓

**Recommended Intervention**

↓

**Human Review**

↓

**Operational Action**

↓

**Outcome Feedback**

This approach could allow service managers to combine predictive information with organisational knowledge and contextual judgement.

---

# 25. Research Questions

The project provides several potential research questions.

### Primary Research Question

> **Can service-operation data be used to identify and predict factors associated with SLA-breach risk in order to support proactive service-management decisions?**

### Secondary Research Questions

**RQ1**

> What operational factors are associated with SLA-breach risk?

**RQ2**

> How are service channel, workload, escalation and knowledge-base requirements associated with SLA performance?

**RQ3**

> Can machine-learning models predict SLA-breach risk using operational characteristics available during service delivery?

**RQ4**

> Can predictive SLA-risk information be incorporated into an intelligent decision-support system for proactive intervention?

**RQ5**

> How can automation opportunities be identified while preserving customer experience and appropriate human oversight?

---

# 26. Research Hypotheses

Future empirical research could investigate the following hypotheses.

### H1

> Operational characteristics such as service channel, workload, inquiry category and knowledge requirements are significantly associated with SLA-breach risk.

### H2

> Machine-learning models can predict SLA-breach risk using operational characteristics available during service delivery.

### H3

> Incorporating predictive SLA-risk information into service-management workflows can improve proactive intervention compared with purely retrospective reporting.

### H4

> Intelligent identification of repetitive and suitable service requests can support process automation without reducing customer-experience outcomes.

These hypotheses would require controlled empirical evaluation.

---

# 27. Potential Experimental Design

A future study could follow this workflow:

**Service Data**

↓

**Data Cleaning**

↓

**Feature Engineering**

↓

**Training / Validation / Test Data**

↓

**Baseline Statistical Model**

↓

**Machine-Learning Models**

↓

**Model Evaluation**

↓

**Feature Importance**

↓

**Explainability Analysis**

↓

**SLA Risk Classification**

↓

**Decision-Support Intervention**

↓

**Outcome Evaluation**

Potential machine-learning approaches could include:

- Logistic Regression
- Decision Trees
- Random Forest
- Gradient Boosting
- XGBoost

Model selection should be based on empirical performance, interpretability, robustness, and operational suitability.

---

# 28. Model Evaluation

Future predictive modelling should evaluate more than accuracy.

Potential metrics include:

- ROC-AUC
- PR-AUC
- Precision
- Recall
- F1-score
- Confusion Matrix
- Calibration
- Sensitivity
- Specificity

Because SLA breaches represent a significant class in this dataset, precision-recall analysis is particularly relevant.

Temporal validation should also be considered because service operations can change over time.

---

# 29. Potential Research Architecture

A future implementation could consist of the following components:

**Service Data Sources**

↓

**Data Integration**

↓

**Analytical Data Store**

↓

**Feature Engineering**

↓

**Machine-Learning Model**

↓

**SLA Risk Prediction**

↓

**Explainability Layer**

↓

**Decision-Support Dashboard**

↓

**Service Management Team**

↓

**Feedback / Outcome Data**

↓

**Model Improvement**

This architecture could support continuous learning and monitoring.

---

# 30. Potential Applications

The research direction could potentially be applied to:

- Customer service centres
- Healthcare support services
- IT service desks
- Enterprise support operations
- Public-sector service delivery
- Engineering support environments
- Hospitality operations

The underlying concept is transferable to any environment where service requests must be handled within defined performance targets.

---

# 31. Limitations

Several limitations should be recognised.

### Dataset limitation

The analysis is based on the supplied merged dataset and therefore reflects the characteristics of that dataset.

### Observational analysis

The analysis identifies associations rather than causal relationships.

For example, the relationship between SLA breaches and CSAT does not by itself establish that one directly causes the other.

### Predictive modelling limitation

The initial machine-learning experiment represents an exploratory predictive analysis rather than a production-ready model.

Additional validation is required before deployment.

### Data granularity

The dataset contains variables operating at different levels of granularity. Monthly and aggregate variables must therefore be interpreted differently from ticket-level variables.

### Intervention limitation

The analysis does not provide a controlled experiment demonstrating that automation would reduce SLA breaches by a specific percentage.

Similarly, projected improvements in SLA performance or CSAT should be treated as scenario-based estimates unless experimentally validated.

---

# 32. Interpretation of the 30% SLA and 20% CSAT Projections

Earlier project analysis identified potential opportunities associated with process improvement, knowledge management, and automation.

Where scenario modelling projected approximately:

- **30% potential reduction in SLA breaches**
- **20% potential improvement in CSAT**

these figures should be interpreted as **projected opportunities rather than experimentally demonstrated outcomes**.

The current dataset provides evidence of SLA and customer-experience patterns, but it does not contain a controlled intervention study demonstrating those exact improvements.

This distinction is important when translating an applied analytics project into research.

---

# 33. Future Research

The project provides several potential directions for further research.

### 1. Advanced SLA Prediction

Compare multiple machine-learning algorithms and investigate their generalisation across different service periods.

### 2. Explainable AI

Investigate methods for explaining why individual service requests receive particular SLA-risk predictions.

### 3. Real-Time SLA Risk Monitoring

Develop a system capable of updating SLA-risk predictions as new operational information becomes available.

### 4. Intelligent Workforce Allocation

Investigate whether predicted service demand and SLA risk can support dynamic resource allocation.

### 5. Intelligent Knowledge Retrieval

Investigate whether improved knowledge retrieval can reduce search time and improve service performance.

### 6. Intelligent Automation

Develop methods for identifying service requests that are appropriate for automation.

### 7. Human-AI Collaboration

Investigate how service personnel can use predictive analytics and AI recommendations while maintaining human oversight.

### 8. Fairness and Bias

Investigate whether predictive service systems produce systematically different outcomes across regions, channels, teams, or customer groups.

---

# 34. Research Significance

This project demonstrates how an operational analytics problem can be developed into a broader Computing Science research problem.

The work connects:

**Data Engineering**

→ **Data Analytics**

→ **Machine Learning**

→ **Predictive Modelling**

→ **Explainable AI**

→ **Intelligent Decision Support**

The project therefore provides a practical foundation for investigating how artificial intelligence can support complex service-management decisions.

---

# 35. Technologies and Methods

### Data & Analytics

- Excel
- SQL
- Python
- Power BI

### Data Engineering

- Data integration
- Data preparation
- Data validation
- Feature engineering

### Analytical Methods

- Exploratory data analysis
- Descriptive statistics
- Correlation analysis
- Segmentation
- Operational analysis

### Machine Learning

- Logistic Regression
- Predictive classification
- ROC-AUC
- PR-AUC

### Future Research Technologies

Potential future implementation could investigate:

- Python
- Scikit-learn
- XGBoost
- SHAP
- Azure
- Databricks
- Apache Spark

---

# 36. Project Contribution

The project demonstrates practical experience in transforming a large operational dataset into actionable analytical insights.

The analysis involved:

- **120,000 service records**
- **40 variables**
- SLA performance analysis
- Customer-experience analysis
- Escalation analysis
- Knowledge-base analysis
- Workload analysis
- Automation opportunity analysis
- Predictive SLA-risk modelling

The project also demonstrates how an applied industry analytics problem can generate research questions relating to machine learning, explainable AI, automation, and intelligent decision support.

---

# 37. Key Findings

The principal findings from the analysis include:

- The overall SLA-breach rate was approximately **71.9%**.
- Tickets associated with SLA breaches had substantially longer average handling times.
- Average CSAT was lower among tickets associated with SLA breaches.
- Phone interactions had the highest observed SLA-breach rate among the analysed channels.
- Repetitive enquiries represented a substantial proportion of service requests and had considerably shorter handling times.
- Escalated tickets showed substantially higher SLA-breach rates and longer handling times.
- Tickets requiring knowledge-base searches showed higher SLA-breach rates.
- Peak periods demonstrated higher SLA-breach rates than non-peak periods.
- Workload showed a positive association with SLA-breach behaviour.
- An initial predictive modelling experiment achieved approximately **0.822 ROC-AUC** and **0.913 PR-AUC**.

These findings provide evidence that service-operation data contains useful information for investigating SLA risk and intelligent service management.

---

# 38. Project Status

**Status: Applied analytics project with an initial predictive modelling experiment and proposed intelligent decision-support extensions.**

The completed work includes data integration, exploratory analysis, business intelligence, operational investigation, and an initial predictive modelling experiment.

Future work will focus on model comparison, explainability, temporal validation, intelligent intervention, automation, and evaluation of human-AI decision-support systems.

---

# 39. Conclusion

This project demonstrates how large-scale operational service data can be transformed into insights that support both practical decision-making and future Computing Science research.

The analysis identified substantial variation in SLA performance across service channels, escalation status, knowledge-base requirements, repetitive enquiries, and workload periods.

The initial predictive modelling experiment further demonstrated that operational characteristics contain useful information for identifying SLA-breach risk.

The project therefore provides a foundation for moving from retrospective service reporting towards **predictive, explainable, and intelligent service-management systems**.

The longer-term research objective is to investigate how machine learning, data engineering, explainable AI, and human-centred decision support can be combined to improve service operations while maintaining appropriate human oversight.

---

## Dashboard Visualisations

### Executive Service Analytics Dashboard

<img src="assets/energy/grandstay-executive-dashboard1.png" alt="GrandStay Executive Service Analytics Dashboard" width="850">

### Escalation Analysis Dashboard

<img src="assets/energy/grandstay-escalations-dashboard2.png" alt="GrandStay Escalation Analysis Dashboard" width="850">

### Agent Performance and Customer Experience Dashboard

<img src="assets/energy/agents-performance-&-cx-dashboard" alt="GrandStay Agent Performance and Customer Experience Dashboard" width="850">

---

## Project Classification

**Applied Research · Data Analytics · Machine Learning · Predictive Analytics · Intelligent Systems · Decision Support**

---

## Keywords

`Machine Learning` · `Predictive Analytics` · `SLA Prediction` · `Service Analytics` · `Intelligent Systems` · `Decision Support` · `Explainable AI` · `Automation` · `Customer Experience` · `Data Engineering` · `Operational Analytics`
