data (iris) #data bawaan default di r studio
head (iris) #manggil kolom di data
summary(iris) #nampilin data iris
pie(table(iris$Species), #bikin pie chart
    col=c("#0000ff","#0099ff","#00ffff")) #warna pie chart

#baris-baris dibawah ini taruh di console
iris_hm <- iris[,-5] #-5 berarti cuma nampilin 4 kolom
cor(iris_hm) #nampilin korelasi
library(corrplot) #library buat bikin corrplot, tapi jangan lupa install dulu kalo belum (saya sudah)
corrplot(cor(iris_hm, method = "pearson"), number.cex = .9, method = "square", hclust.method = "ward", order = "FPC", type = "full", tl.cex = 0.8,tl.col = "black") #iris_hm wajib dideklarasikan dulu sebelum bikin corrplot, ini buat bikin corrplot
library(psych) #library buat 
pairs.panels(iris[,-5],method = "pearson", hist.col = "#0099ff", density = TRUE, ellipses = TRUE) #buat bikin...
