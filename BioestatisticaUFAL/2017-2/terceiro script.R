########################################
#Bioestatistica UFAL, 2017-2           #
#Scrpit 3, leitura de dados            #
#Marcos Vital                          #
########################################

###Lendo dados no R

##Etapa 1 - Determinar a pasta de trabalho:
setwd("D:/Documentos/Bioestatistica 2017-2")

#Conferindo os arquivos da pasta:
dir()

##Etapa 2 - Lendo o arquivo desejado
dados<-read.table("pratica1.txt", header=T)

#Conferindo o objeto criado:
summary(dados)

##############################################

#Revendo rapid�o a parte de estat�stica descritiva

mean(dados$Riqueza)     #Calcula a riqueza m�dia
sd(dados$Riqueza)       #Calcula o desvio padr�o da riqueza
quantile(dados$Riqueza) #Mediana, quartis, m�ximo e m�nimo

##
#A fun��o tapply pode ser usada para calcular algo de uma
#vari�vel quantitativa de acordo com uma vari�vel categ�rica
#O formato � sempre:
#tapply(var.quantitiva, var.categ�rica, o que voc� quer calcular )

tapply(dados$Riqueza, dados$Ambiente, mean)  #Aqui usamos para m�dia
tapply(dados$Riqueza, dados$Ambiente, sd)   #E aqui, para desvio padr�o

############################################################

##
#Gr�ficos! \o/

##
#Histogramas:

hist(dados$Riqueza)
hist(dados$Abund_sp1)

#Melhorando o histograma:
hist(dados$Riqueza, main=" ", col="gray",
xlab="N�mero de esp�cies", ylab="Frequ�ncia", las=1)

#Explicando:
#main determina o t�tulo (se deixar em branco, fica sem)
#col determina a cor das barras
#xlab e ylab determinam os nomes dos eixos
#las determina a orienta��o dos n�meros (=1 para todos na horizontal)








