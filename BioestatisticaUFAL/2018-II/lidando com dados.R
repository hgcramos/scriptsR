#################################
#Lidando com dados no R         #
#Bioestatistica ufal 2018-2     #
#prof Marcos Vital              #
#################################

#Criando um objeto simples:
baboseira<-10

#"Chamando" o objeto no console
baboseira

#Agora que o objeto existe, pode ser usado:
baboseira*10
sqrt(baboseira)
baboseira-100

#Criando um objeto com v�rios n�meros dentro:
baboseira2<-1:10

#Vamos chamar o objeto para ver por dentro:
baboseira2

#Posso repetir opera��es como as feitas acima:
baboseira2*3
sqrt(baboseira2)
baboseira2+157

#############################################

#Lendo um conjunto de dados de exemplo:

data(iris)   #Carrega o conjunto de dados "iris"

iris   #Mostra o objeto na tela (n�o � muito bom neste caso)

#Se eu quiser olhar a tabela em uma janela separada:
View(iris)

#Resumindo os dados em poucos n�meros:
summary(iris)

###
#Lidando com as tabelas no R

#Chamando apenas uma coluna
iris$Petal.Width

#Calculando a m�dia da largura da p�tala:
mean(iris$Petal.Width)

#Visualizando partes de uma tabela usando linhas ou colunas

iris[10 , ]      #linha 10, todas as colunas
iris[ , 3]       #todas as linhas, coluna 3
iris[1:10, ]     #linhas 1 a 10, todas as colunas
iris[ , 4:5]     #todas as linhas, colunas 4 a 5
iris[3:7, 2:4]   #linhas 3 a 7, colunas 2 a 4

#Quero saber o comprimento da p�tala da flor 17:
iris[17, 3]    #Linha 17, coluna 3 (coluna 3 � comprimento da p�tala)


################

#Vamos calcular a m�dia do tamanho da p�tala para cada esp�cie
#Vamos fazer isso de tr�s maneiras diferentes
#As duas primeiras, s�o beeeem manuais e n�o muito simples
#A terceira � simples e direta, e usa outra fun��o


#M�todo 1: usando []
mean(iris[1:50, 3])     #M�dia do comp. da p�tala para Iris setosa 
mean(iris[51:100, 3])   #M�dia do comp. da p�tala para Iris versicolor
mean(iris[101:150, 3])  #M�dia do comp. da p�tala para Iris virginica

#Este m�todo � �til quando a organiza��o dos dados permite seu uso
#No caso, deu certo porque cada esp�cie est� agrupada em um conjunto de linhas

#M�todo 2: usando $ e []
mean(iris$Petal.Length [iris$Species == "setosa"] )
mean(iris$Petal.Length [iris$Species == "versicolor"] )
mean(iris$Petal.Length [iris$Species == "virginica"] )


#M�todo 3: usando uma fun��o para isso (a fun��o tapply)
tapply(iris$Petal.Length, iris$Species, mean)

#tapply funciona assim:
#tapply(var quantitativa, var categ�rica, fun��o que eu quero)


##############################################

#Meu primeiro gr�fico no R!

hist(iris$Petal.Length)

#Se eu quiser, posso brincar com o gr�fico:
hist(iris$Petal.Length, col="pink", main="Meu histograma")


#S� pela divers�o:
hist(iris$Petal.Length, col=1:10, main="Meu histograma")

#Pra mais divers�o:
cores<-c("Gainsboro", "Lavender", "DeepSkyBlue", "LawnGreen", "Gold",
         "MediumOrchid","LightSalmon", "Sienna", "Tomato", "DeepPink1" )
hist(iris$Petal.Length, col=cores, main="<3")


