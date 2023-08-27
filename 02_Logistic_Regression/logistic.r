eq <- read.table(file = "2_Logistic_Regression\\data\\earthquake.txt", header = TRUE)
eq[eq$popn == "equake", "popn"] <- 1
eq[eq$popn == "explosn", "popn"] <- 0
eq$popn <- as.numeric(eq$popn)

model <- glm(formula = popn ~ body + surface, family = "binomial", data = eq)
summary(model)

heart <- read.table("2_Logistic_Regression\\data\\SAheart.data", header = TRUE, sep = ",")
heart <- subset(heart, select = -1)
head(heart)
heart[heart$famhist == "Present", "famhist"] <- 1
heart[heart$famhist == "Absent", "famhist"] <- 0
heart$famhist <- as.numeric(heart$famhist)

model <- glm(formula = chd ~ ., family = "binomial", data = heart)
summary(model)
