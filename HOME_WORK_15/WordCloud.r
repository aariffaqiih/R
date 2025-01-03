> install.packages("wordcloud")
> text = readLines("text-full.txt")
> text = unlist(strsplit(text, "\\W+"))
> text = tolower(text)
> text = data.frame(table(text))
> library(wordcloud)
> wordcloud(text$text, text$Freq, min.freq=1, max.words=200, random.order=FALSE, rot.per=0.25, colors=brewer.pal(8,"Dark2"))
> stopw = readLines("stopwords.txt")
> text = text[!is.element(text$text, stopw),]
> wordcloud(text$text, text$Freq, min.freq=1, max.words=200, random.order=FALSE, rot.per=0.25, colors=brewer.pal(8, "Dark2"))
