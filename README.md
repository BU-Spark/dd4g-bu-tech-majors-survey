# DEI Student Survey Shiny App

<!-- badges: start -->
![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)

<!-- badges: end -->

## Project Description 
The DEI in Tech Climate Survey was motivated by the need to better understand student experiences in tech related departments at BU in an effort to inform areas for change and improvement. The biannual DEI in Tech Climate Survey initiatives aim to evaluate the environment within tech departments at Boston University and address the existing data gap. This application was developed to provide a user-friendly interface for the survey data, and to allow for easy visualization and analysis of the survey results.

### Team Member Contributions (2024)
- **Project Manager/Team Lead/Data Visualization**: [Naomy Bopela](Nbopela@bu.edu)
- **Shiny Development**: [Anush Veeranala](Jun@bu.edu)
- **Shiny Development**: [Stella Zhai](zhstella@bu.edu)
- **Shiny Development**: [Jack Campbell](https://www.linkedin.com/in/jack-campbell-a392191a1/)
- **Data Cleaning/Visualization/Team Lead**: [Riya Parikh](Riyapar@bu.edu)
- **Data Cleaning/Visualization**: [Bohan Wang](Wbh@bu.edu)
- **Data Cleaning/Visualization**: [Ryan Ko](Rko@bu.edu)

## Installation
### Prerequisites

Ensure you have R installed on your system. You can download and install R from [The Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/).

### Installing Required Packages

Open R or RStudio, and run the following commands in the console. These commands will install the necessary packages for the application.

```r
install.packages("shiny")
install.packages("ggplot2")
install.packages("shinyjs")
install.packages("shinyBS")
install.packages("shinyalert")
install.packages("gt")
install.packages("dplyr")
install.packages("readr")
install.packages("tidyverse")
install.packages("scales")
```

## Running the Application (locally)
1. Clone the repository to your local machine.
2. Open R or RStudio, and set the working directory to the location of the 'R' folder.
3. Install required packages (if not already installed).
4. Open the app.R file and run.

## Dataset Locations
- The datasets used for this project is located in the 'data-raw' folder of the Github repository.

## Blockers

### Data Cleaning

- string data with the multi-select options are hard to deal with when creating visuals
- Unsure if excluding survey results that were unfinished impact accuracy of the results of our data analysis

### Solution
- fixed with identifying each individual string value with commas and then splitting on this delimiter thought about simply not including those unfinished surveysquestioned needs of stakeholders decided to use NaN in place of unfinished results within surveys; to preserve integrity of survey/ unsure of needs of stakeholder

## Software

### understanding the web application development process
- figuring out how to clean data to be applied to filters in shiny application as a result of gaps in the provided survey data 
- ran into version control issues

### Solution
- merged the changes manually to resolve this.
- merged the data from both 2022 and 2024, applied filters, and adjusted the graphs to accurately depict comparison

## Code of Conduct
Please note that the DEI in Tech Climate Survey Project is released with a
[Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
