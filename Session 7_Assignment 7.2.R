# 1.	Write a program to create barplots for all the categorical columns in mtcars.

mtcars %>%
  keep(is.numeric) %>%
  gather() %>%
  ggplot(aes(value)) +
  facet_wrap( ~ key, scales = "free") +
  geom_bar()


# 2.	Create a scatterplot matrix by gear types in mtcars dataset.

library(lattice)
attach(mtcars)
table(mtcars$gear)
splom(
  mtcars[c(1, 2, 4, 6, 8, 10)],
  groups = gear,
  data = mtcars,
  panel = panel.superpose,
  key = list(
    title = "Three Gears",
    columns = 3,
    text = list(c("3 gear", "4 gear", "5 gear"))
  )
)

# 3.	Write a program to create a plot density by class variable.

head(mtcars)
str(mtcars)

# Method 1
ggplot(mtcars) + geom_density(aes(x = mpg, color = cyl))

# Method 2
d <- density(mtcars$mpg)
plot(d, main="Density of MPG")
polygon(d, col="red", border="blue")


