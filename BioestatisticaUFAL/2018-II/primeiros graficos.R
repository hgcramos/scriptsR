#################################
#Nossos primeiros gr�ficos <3   #
#Bioestat�stica UFAL, 2018-2    #
#Prof Marcos Vital              #
#################################


#Carregando um conjunto de dados de exemplo (da mem�ria do R):
data(iris)

#Resumindo os dados:
summary(iris)

######################

#Gr�fico do comprimento da p�tala em resposta ao comp da s�pala:
plot(iris$Petal.Length ~ iris$Sepal.Length)

#O til serve para representar a rela��o entre as vari�veis
#O padr�o �: var explicativa ~ var resposta

#Agora vamos melhor nosso gr�fico:
plot(iris$Petal.Length ~ iris$Sepal.Length, pch=16, las=1,
xlab="Comprimento da s�pala", ylab="Comprimento da p�tala", col="red")

#Os argumentos usados:
#pch determina o s�mbolo (execute ?pch se quiser ver os s�mbolos)
#las determinar a orienta��o dos n�meros (las=1 s�o todos na horizontal)
#xlab e ylab determinam nomes dos eixos (usar aspas!)
#col determina a cor dos pontos
#Se quiser, quebre o comando em v�rias linhas, sempre assim:
   #comece a nova linha ap�s uma v�rgula
   #execute tudo selecionando todas as linhas envolvidas
   #sempre confira bem os par�nteses e aspas