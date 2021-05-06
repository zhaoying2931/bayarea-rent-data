library(ggplot2)
library(ggridges)

apts = readRDS(url("https://www.stat.berkeley.edu/users/nolan/data/apts202010.rds"))

dim(apts[duplicated(apts$text),])

dim(apts[duplicated(apts$title),])

dim(apts[duplicated(apts$title) & duplicated(apts$text), ])

apst_new = apts[duplicated(apts$title) == FALSE & duplicated(apts$text) == FALSE, ]

city_drop = apst_new[(apst_new$city == "San Francisco") | (apst_new$city == "San Jose") | (apst_new$city == "Oakland") | (apst_new$city == "Los Angeles") & (!is.na(apst_new$city)), ]

quantile(city_drop$sqft, 0.99, na.rm = TRUE)

ggplot(city_drop,aes(sqft, city,  fill = city)) +
  scale_x_continuous(limits = c(0, 2105.76), name = "Square Footage") +
  geom_density_ridges2(alpha = 0.5, color = "white") +
  ggtitle("Square Footage Distribution in Four Cities in CA")