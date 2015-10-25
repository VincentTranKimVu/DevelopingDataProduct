---
title       : Data Search Application
subtitle    : This is for Developing Data Product Course Project
author      : Vu Tran - Oct 2015
job         : Engineer
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---


## Introduction

- This is a Shiny Application developed for exploring a dataset.
- This presentation will give some keys information for users to understand the application.

--- .class #id 

## Dataset introduction
* The dataset is downloaded from http://rebrickable.com/downloads
* The data contains below information:
  - Fields: set id, year, num pieces, theme, description
  - Have total arround 10500 records (need to access realtime to know exactly the total records)
* Data illustrations

```r
require(data.table)
data <- fread("./data/sets.csv")
head(data,3)
```

```
##    set_id year pieces       t1                      descr
## 1:   00-1 1970    471 Legoland            Weetabix Castle
## 2: 0011-2 1978     12     Town          Town Mini-Figures
## 3: 0011-3 1987      2   Castle Castle 2 for 1 Bonus Offer
```

--- .class #id 

## Application requirements
The application must include the following:
- Some form of input (widget: textbox, radio button, checkbox, ...)
- Some operation on the ui input in sever.R
- Some reactive output displayed as a result of server calculations
- You must also include enough documentation so that a novice user could use your application.
- The documentation should be at the Shiny website itself. Do not post to an external link.

--- .class #id 

## Results
* Completed functions
  - Sliders for timeline and Pieces
  - Themes checkbox list for selection
  - Data list displayed with search function

* Publishes
  - Application: https://vincenttrankimvu.shinyapps.io/DDP_CourseProject 
  - Source code: https://github.com/VincentTranKimVu/DevelopingDataProduct 
  
### End
