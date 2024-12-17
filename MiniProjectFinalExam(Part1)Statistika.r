> dataset <- read.csv(file.choose())
> str(dataset)
'data.frame':	639 obs. of  10 variables:
 $ Year            : int  2000 2000 2000 2000 2000 2000 2000 2000 2000 2000 ...
 $ MAKE            : chr  "ACURA" "ACURA" "ACURA" "ACURA" ...
 $ MODEL           : chr  "1.6EL" "1.6EL" "3.2TL" "3.5RL" ...
 $ VEHICLE.CLASS   : chr  "COMPACT" "COMPACT" "MID-SIZE" "MID-SIZE" ...
 $ ENGINE.SIZE     : num  1.6 1.6 3.2 3.5 1.8 1.8 1.8 3 3.2 1.8 ...
 $ CYLINDERS       : int  4 4 6 6 4 4 4 6 6 4 ...
 $ TRANSMISSION    : chr  "A4" "M5" "AS5" "A4" ...
 $ FUEL            : chr  "X" "X" "Z" "Z" ...
 $ FUEL.CONSUMPTION: num  10.5 9.8 13.7 15 11.4 10.6 10.8 15.2 15.4 12.9 ...
 $ COEMISSIONS     : int  216 205 265 301 230 219 223 306 306 251 ...
> colnames(dataset) <- trimws(colnames(dataset))
> dataset$ENGINE.SIZE <- as.numeric(dataset$ENGINE.SIZE)
> dataset$CYLINDERS <- as.numeric(dataset$CYLINDERS)
> dataset$FUEL.CONSUMPTION <- as.numeric(dataset$FUEL.CONSUMPTION)
> dataset$COEMISSIONS <- as.numeric(dataset$COEMISSIONS)
> hist(dataset$ENGINE.SIZE, main = "Histogram of Engine Size", xlab = "Engine Size", col = "lightblue")
> hist(dataset$CYLINDERS, main = "Histogram of Cylinders", xlab = "Cylinders", col = "lightblue")
> hist(dataset$FUEL.CONSUMPTION, main = "Histogram of Fuel Consumption", xlab = "Fuel Consumption", col = "lightblue")
> hist(dataset$COEMISSIONS, main = "Histogram of CO Emissions", xlab = "CO Emissions", col = "lightblue")
> plot(dataset$ENGINE.SIZE, dataset$COEMISSIONS, 
+ main = "Engine Size vs CO Emissions", 
+ xlab = "Engine Size", 
+ ylab = "CO Emissions", 
+ pch = 16, col = "blue")
> plot(dataset$CYLINDERS, dataset$COEMISSIONS, 
+ main = "Cylinders vs CO Emissions", 
+ xlab = "Cylinders", 
+ ylab = "CO Emissions", 
+ pch = 16, col = "blue")
> plot(dataset$FUEL.CONSUMPTION, dataset$COEMISSIONS, 
+ main = "Fuel Consumption vs CO Emissions", 
+ xlab = "Fuel Consumption", 
+ ylab = "CO Emissions", 
+ pch = 16, col = "blue")
> cat("Penjelasan Korelasi:\n")
Penjelasan Korelasi:
> cat("- Scatter plot 'Engine Size vs CO Emissions' menunjukkan korelasi positif kuat. Semakin besar ukuran mesin, semakin tinggi emisi CO.\n")
- Scatter plot 'Engine Size vs CO Emissions' menunjukkan korelasi positif kuat. Semakin besar ukuran mesin, semakin tinggi emisi CO.
> cat("- Scatter plot 'Cylinders vs CO Emissions' menunjukkan korelasi positif sedang. Peningkatan jumlah silinder umumnya meningkatkan emisi CO.\n")
- Scatter plot 'Cylinders vs CO Emissions' menunjukkan korelasi positif sedang. Peningkatan jumlah silinder umumnya meningkatkan emisi CO.
> cat("- Scatter plot 'Fuel Consumption vs CO Emissions' menunjukkan korelasi positif sangat kuat. Konsumsi bahan bakar yang lebih tinggi hampir selalu berbanding lurus dengan emisi CO.\n")
- Scatter plot 'Fuel Consumption vs CO Emissions' menunjukkan korelasi positif sangat kuat. Konsumsi bahan bakar yang lebih tinggi hampir selalu berbanding lurus dengan emisi CO.
> cor_matrix <- cor(dataset[, c("ENGINE.SIZE", "CYLINDERS", "FUEL.CONSUMPTION", "COEMISSIONS")])
> print(cor_matrix)
                 ENGINE.SIZE CYLINDERS FUEL.CONSUMPTION COEMISSIONS
ENGINE.SIZE        1.0000000 0.8938187        0.8581696   0.8497138
CYLINDERS          0.8938187 1.0000000        0.8257840   0.7984473
FUEL.CONSUMPTION   0.8581696 0.8257840        1.0000000   0.9832316
COEMISSIONS        0.8497138 0.7984473        0.9832316   1.0000000
> model <- lm(COEMISSIONS ~ ENGINE.SIZE + CYLINDERS + FUEL.CONSUMPTION, data = dataset)
> summary(model)

Call:
lm(formula = COEMISSIONS ~ ENGINE.SIZE + CYLINDERS + FUEL.CONSUMPTION, 
    data = dataset)

Residuals:
     Min       1Q   Median       3Q      Max 
-128.063   -4.909   -0.838    5.448   27.646 

Coefficients:
                 Estimate Std. Error t value Pr(>|t|)    
(Intercept)       16.3820     2.4691   6.635 6.96e-11 ***
ENGINE.SIZE        4.7098     0.9490   4.963 8.94e-07 ***
CYLINDERS         -3.7850     0.6542  -5.786 1.13e-08 ***
FUEL.CONSUMPTION  19.5072     0.2809  69.448  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 11.65 on 635 degrees of freedom
Multiple R-squared:  0.9685,	Adjusted R-squared:  0.9684 
F-statistic:  6516 on 3 and 635 DF,  p-value: < 2.2e-16

> 
> par(mfrow = c(2, 2))
> plot(model)
> plot(model)
> dataset$Predicted <- predict(model, newdata = dataset)
> plot(dataset$COEMISSIONS, dataset$Predicted, 
+ main = "Predicted vs Actual CO Emissions", 
+ xlab = "Actual CO Emissions", 
+ ylab = "Predicted CO Emissions", 
+ pch = 16, col = "blue")
> abline(0, 1, col = "red")
>
