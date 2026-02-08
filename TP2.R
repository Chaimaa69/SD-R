#Exercice 1 - Importer les données

df = read.csv("fao.csv", sep=";", dec=",", header = TRUE)

nrow(df[ , ])
nrow(df)

summary(df)

#Exercice 2 - Statistiques descriptives

mean(df$Dispo_alim,na.rm=TRUE)
#na.rm sert à supprimé les données manqauntes car R ne sais pas calculer les indicateurs  avec les données manquantes 

sum(df$Population,na.rm=TRUE)

sd(df$Export_viande,na.rm = TRUE)
sd(df$Import_viande,na.rm = TRUE)

median(df$Prod_viande, na.rm = TRUE)

#quartile(df$Dispo_alim,na.rm=TRUE)
#Quantile 
quantile(df$Dispo_alim)
quantile(df$Dispo_alim,na.rm=TRUE)
#si doute tjr utiliser na.rm
#Pas de seq car on veut tous les quartiles

quantile(df$Import_viande,na.rd=TRUE, seq(0,1,0.01))
quantile(df$Import_viande, seq(0,1,0.01))
#pas de prog = car c'est le 2eme argumennt 
#A eviter de ne pas le mettre 
 
#Exercice 3 - Tris et filtres
#paysordre=order(df$Population)
#cinqdernier=df[ , ]
#cinqdernier => n'a pas pris les 5 

rang = order(df$Population)
#les mets dans l'ordre
resultat = head(df[ rang , ], n = 5)
#prend les 5 premiers
View(resultat)

rang = order(df$Population, decreasing = TRUE)
resultat=head(df[rang, ], n=5)
View
#decreasing pour mettre dans l'ordre décroissant

rang = order(df$Prod_viande, decreasing = TRUE)
resultat=head(df[rang, ], n=5)
View(resultat)

rang = order(df$Import_viande, decreasing = TRUE)
resultat=head(df[rang, ], n=5)
View(resultat)

#pays=subset(df$Dispo_alim>=2300)
#View(pays)
resultat = subset(df, Dispo_alim>=2300)
View(resultat)

pays=subset(df, Dispo_alim>3500 & Prod_viande>=1000000  )
View(pays)
#1 000 000 ne marche pas 
#pas production mais import, c'est pour ca qu'il n'y a rien

resultat = subset(df, Dispo_alim > 3500  & Import_viande > 1000)
View(resultat)
#on met 1000 car l'inport est compter en milliers de tonnes 

#pays=subset(df,Nom=="France" or Nom=="Belgique")
#View(pays)
#Pas de or dans R mais %in% utiliser comme SQL %in%c(argument1, argument2..)
resultat = subset(df, Nom %in% c("France","Belgique"))
View(resultat)

#Exercice 4 - Modifier le dataframe
df$Part_expor=df$Export_viande/df$Prod_viande

#dispo_alim_pays=df$Dispo_alim/df$Population
df$Dispo_alim_pays<-df$Dispo_alim*df$Population
#multiplication

#write.table(x, file =ExportTp2.csv )
#x non trouver + "" pour fichier
write.table(x = df, file = "ExportTp2.csv")

#sum(df$Dispo_alim, na.rm = TRUE) =>mondiale
sum(df$dispo_alim_mondiale, na.rm = TRUE)
dispo_alim_mondiale = sum(df$Dispo_alim_pays, na.rm=TRUE)
dispo_alim_mondiale
#cela affiche 0

dispo_alim_mondiale/2300
#tjr 0


#Exercice 5 - Corrélation
plot(x = df$Prod_viande,
     y = df$Export_viande, 
     main = "Pays : Prod_viande / Export_viande")
#le lien est fort

cor(x = df$Prod_viande,
    y = df$Export_viande)
#affiche na donc probablemnet des données manquante =>na.rm
#cor(x = df$Prod_viande,
    #y = df$Export_viande,na.rm =TRUE) =>fonctionne pas 
#cor(x = df$Prod_viande,na.rm =TRUE,
    #y = df$Export_viande,na.rm =TRUE)

#Voir les questions et cours a partir des matrices




