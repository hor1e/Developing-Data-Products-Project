
Course Project: Plotting Iris with Shiny Application
========================================================
author: Tadashi Horie
date: 2016-07-12
autosize: true

Overview
========================================================

This slide describes the Web application that has been created by the R shiny, supports plotting Iris data.

The slide and the web application were built as a project of the "Developing Data Products" course in Coursera. 

- Shiny app https://inudaiskii.shinyapps.io/Project_Iris/
- Github https://github.com/hor1e/Developing-Data-Products-Project
- Coursera course https://www.coursera.org/learn/data-products


Data Description
========================================================

This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.


Source Data
========================================================

iris is a data frame with 150 cases (rows) and 5 variables (columns) named Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, and Species.


```r
head(iris)
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```


How it Works
========================================================

- Graph will be automatically plotted when you choose X and Y.
- The graph can be added fitted line by check box.

Thank you!
