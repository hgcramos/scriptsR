###########################################
#Mantel, correlogramas e filtros espaciais#
#Estat�stica multivariada, ufal, 2018     #
#Prof Marcos Vital                        #
#Agosto de 2018                           #
###########################################

##Leitura dos dados:

amb<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsEnv.csv", row.names=1)
peixes<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsSpe.csv", row.names=1)

library(vegan)

##########################################

#Neste script, vamos retirar a linha 8 de todos os dados:
amb2<-amb[-8, ]
peixes2<-peixes[-8, ]

#Se quiser, voc� pode remover os objetos iniciais da mem�ria do R:
rm(amb, peixes)

##
#Criando um conjunto de matrizes de dist�ncia:
dist.spa<-vegdist(amb2$dfs, method="euclidean")   #Dist�ncias espaciais ao longo do rio
dist.bray<-vegdist(peixes2, method="bray")  #Dist�ncias de bray-curtis

#Para vari�veis ambientais, primeiro temos que padronizar:
amb2.pad<-decostand(amb2[ ,-1], method="standardize")  #Padronizando (deixei de fora a vari�vel dfs, j� foi usada)
dist.amb<-vegdist(amb2.pad, method="euclidean")  #Dist�ncias ambientais
##

################################

#Teste de Mantel:

mantel(dist.amb, dist.bray)

#Conferindo o padr�o desta correla��o ao longo das dist�ncias:
plot(dist.amb, dist.bray)

##
#Correlograma de Mantel:
correlograma.amb.peixes<-mantel.correlog(dist.bray, dist.amb)

#Resultado:
correlograma.amb.peixes

#Gr�fico:
plot(correlograma.amb.peixes)
##

##
#Mantel Parcial

mantel.partial(dist.amb, dist.bray, dist.spa)
##

##
#Voltando ao autocorrelograma:
correlograma.peixes.spa<-mantel.correlog(dist.bray, dist.spa)

correlograma.peixes.spa

plot(correlograma.peixes.spa)

#Podemos alterar o n�mero de classes; por exemplo:
mantel.correlog(dist.bray, dist.spa, n.class=5)

#ou assim:
classes<-c(0, 50, 100, 200, 450)
mantel.correlog(dist.bray, dist.spa, break.pts=classes)

#####################################################

##
#Filtros espaciais

#Etapa 1: matriz de dist�ncia espacial (ou o que for relevante)
#Aqui na verdade vamos converter o objeto que criamos para outro formato:
dist.spa.m<-as.matrix(dist.spa)
dist.spa.df<-as.data.frame(dist.spa.m)

#Etapa 2: pca desta matriz de dist�ncia:
pca.spa<-rda(dist.spa.df)

summary(pca.spa)

componentes<-scores(pca.spa, display="sites", choices=1:5)

#Etapa 3: regress�o m�ltipla com vari�veis de interesse
#Aqui decidimos usar riqueza e concentra��o de nitrog�nio

riqueza<-specnumber(peixes2)
nitro<-amb2$nit

reg.riq<-lm(riqueza~componentes)
reg.nit<-lm(nitro~componentes)

summary(reg.riq)
summary(reg.nit)

#Etapa 4: extraindo os res�duos (apenas quando h� efeito de autocorrela��o)
riqueza.r<-reg.riq$residuals
nitro.r<-reg.nit$residuals

#Etapa 5: fa�a o que quiser com as vari�veis, agora livres de autocorrela��o

#Aqui, apenas para entender o m�todo, vamos ver o efeito do nitrog�nio
#sobre a riqueza, com e sem o efeito da autocorrela��o

cor(riqueza, nitro)
cor(riqueza.r, nitro.r)

plot(riqueza~nitro)
plot(riqueza.r~nitro.r)

reg1<-lm(riqueza~nitro)
reg2<-lm(riqueza.r~nitro.r)

par(mfrow=c(1,2))
plot(riqueza~nitro, pch=16, main="sem filtro")
abline(reg1, lty=2, col="red")
plot(riqueza.r~nitro.r, pch=16, main="com filtro")
abline(reg2, lty=2, col="red")


