#Exercice 1 - Utilisation d'un dataframe existant un dataframe

iris
class(iris)

View(iris)

nrow(iris)

ncol(iris)

colnames(iris)

summary(iris)

iris[, c("Sepal.Length", "Species")]
#virgule avant c = ligne, apres = colonnes

iris[c(100, 103, 105), ]

# iris[c(50:100),] => Faux
iris[50:100 , ]

#avg(,c(Sepal.Length)) : mmoyenne= mean $ = Accéder à une colonne d'un dataframe
mean(iris$Sepal.Length)

median(iris$Sepal.Width)

sd(iris$Petal.Length)

#quantile(iris$Petal.Width,probs = c(0.25, 0.5, 0.75)))
quantile(iris$Petal.Width,
         probs = seq(from = 0.1, to = 0.9, by =0.1))


#Exercice 2 - Import/Exporter un dataframe

dfManga <- read.csv(file = "C:/Users/cabdelaziz/Downloads/manga.csv",
                    header= TRUE,
                    sep = ",",
                    dec = ".")

dfAnime <- read.csv(file = "C:/Users/cabdelaziz/Downloads/anime.csv",
                     header= TRUE,
                     sep = ",",
                     dec = ".")

class(dfManga)

class(dfAnime)


View(dfAnime)
View(dfManga)

dim(dfAnime)
dim(dfManga)

mean(dfAnime$Score)
mean(dfManga$Score)
#La moyenne la plus élevé est celle representant les animes

sum(dfAnime$Vote)
sum(dfManga$Vote)

sd(dfAnime$Score)
sd(dfManga$Score)
#Au niveau du score l'echantullon le plus homogène est celui repréentant les magas

quantile(dfAnime$Score, 
         probs = seq(from=0.1, to = 0.9, by = 0.1))

quantile(dfManga$Score, 
         probs = seq(from=0.1, to = 0.9, by = 0.1))


a=subset(dfManga, Score > 9)
nrow(a)

b = subset(dfManga, Vote >= 200000)
nrow(b)

c = subset(dfManga, Vote >= 200000 & Score >= 8 )
nrow(c)

d = subset(dfManga, Score>7 & Score<8)
nrow(d)

# A revoir 
effectifRating = table(dfAnime$Rating)
print(effectifRating)
length(effectifRating)
prop.table(effectifRating)

a = subset(dfAnime, Rating == "R - 17+ (violence & profanity)")
nrow(a)

b = subset(dfAnime, Rating=="R - 17+ (violence & profanity)" 
           & Score>=8)
nrow(b)

c = subset(dfAnime, Rating != " R - 17+ (violence & profanity)")
nrow(c)

#d = subset(dfAnime, Rating == "PG - Children et G - All Ages")
#nrow(d) FAUX

extraction5 <- subset(dfAnime, Rating %in% c("PG - Children","G - All Ages"))
nrow(extraction5)

#e= subset(dfAnime, Rating %not in% c("PG - Children et G - All Ages")
#nrow(e) Faux

extraction6 <- subset(dfAnime, !Rating %in% c("PG - Children","G - All Ages"))
nrow(extraction6)

f = subset(dfAnime, Score >= 9 & Vote > 400000)
nrow(f)
#Faux
extraction7 <- subset(dfAnime, Score >= 9 | Vote > 400000)
nrow(extraction7)

dfAnime = dfAnime[ , c("Title","Score","Vote","Ranked")]
dfManga =  dfManga[ , c("Title","Score","Vote","Ranked")]


dfAnime$Type <- "Anime" #on utilise juste un $ meme pour cree une colonne
dfManga$Type <- "Manga

dfConcat <- rbind(dfManga,dfAnime)
View(dfConcat)

#Revoir le TP a partir du Filtre sur les Animes


