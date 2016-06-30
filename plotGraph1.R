########################## PLOT GRAPH 1 #################################

#o exemplo fala para usar so dois dias de data. Dado que 
#nossos campos ja foram convertidos podem filtrar a data como no 
#seguinte exemplo ou usar tb a funcao "subset" do R:
##definindo subdata como uma restricao de data
subeData<-eData[eData$fDate <= as.Date("2007-02-02"),]

##atualizando subdata com nova restricao, nao da pra fazer ambas em um comando?
subeData<-subeData[subeData$fDate >= as.Date("2007-02-01"),]

#uma vez mais, antes de plotar o primeiro grafico precisamos mudar o tipo do campo:
##mudando o dado do tipo string para numerico
subeData$Global_active_power<- as.numeric(subeData$Global_active_power)

#primeiro grafico:
## faz um histograma de coloracao vermelha
hist(subeData$Global_active_power, xlab="Global active power", col="red")
