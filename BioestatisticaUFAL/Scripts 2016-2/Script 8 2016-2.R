######################################
#Script 8 de bioestat�stica###########
#Regress�o linear simples#############
#Prof Marcos Vital UFAL###############
#17-04-2017###########################
######################################

##Lendo o arquivo:

dados<-read.table(file.choose(), header=T) #Abra o arquivo pr�tica1.txt
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 
############################################################################

#S� pra relembrar:
plot(Riqueza~�rea, pch=16)

#Fazendo a regress�o:
resultado<-lm(Riqueza~�rea)
summary(resultado)

#O gr�fico:
plot(Riqueza~�rea, pch=16)
abline(resultado, lty=2, col="red")


######################################################

#Desafio: separando os dados dos tipos de mata
#E refazendo a an�lise em cada um

#Vamos fazer isso usando as condi��es entre colchetes

resultado.p<-lm(Riqueza[Ambiente=="prim�rio"]~�rea[Ambiente=="prim�rio"])
resultado.s<-lm(Riqueza[Ambiente=="secund�rio"]~�rea[Ambiente=="secund�rio"])

summary(resultado.p)
summary(resultado.s)

#Vou fazer um gr�fico com os dois elementos diferenciados:
cores<-c("green4", "red4")
legenda<-c("Mata Prim�ria", "Mata Secund�ria")
plot(Riqueza~�rea, col=cores[Ambiente], pch=16, las=1)
legend("topleft", legend=legenda, pch=16, col=cores)
abline(resultado.p, lty=2, col="green4")
abline(resultado.s, lty=2, col="red4")
