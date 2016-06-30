#ler o arquivo considerando a primeira linha como nomes dos campos, 
#usar o separador de ponto e virgula e
# nao fazer a conversao dos strings como factores (ver videos)
eData<-read.table("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors=F)

#para cada campo devem convertir ao tipo de dado do campo, 
#dado que sao lidos como strings de caracteres

#Para convertir os campos "Date" e "Time" aos tipos de campos de data e tempo 
#(repare que os valores os salvo em outros campos - fDate e fTime- 
##"$" se refere a uma das colunas da tabela, nesse caso estamos criando uma nova com "f" em frente
#voces se desejam podem atualizar os mesmos campos - Date e Time) :
eData$fDate<-as.Date( as.character(eData$Date), "%e/%m/%Y")
eData$fTime <- format(strptime(as.character(eData$Time), "%H:%M:%S"),"%H:%M:%S")


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

########################## PLOT GRAPH 2 #################################
##ter data dos dias 1, 2 e 3
subeData <- eData[eData$fDate <= asDate("2007-02-02"),]
subeData <- subeData[subeData$fDate >= asDate("2007-02-01"),]

##novo elemento da tabela que junta dia e horario pra poder visualizar melhor
##func paste seria para juntar ambos os elementos
subeData$DateAndTime <- strptime(paste(subeData$Date, subeData$Time), "%d/%m/%Y %H:%M:%S")

##plot do grafico de linhas (type L) com o dado que foi criado
plot(subeData$DateAndTime, subeData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


########################## PLOT GRAPH 3 #################################
##ter data dos dias 1 e 2
subeData <- eData[eData$fDate <= asDate("2007-02-02"),]
subeData <- subeData[subeData$fDate >= asDate("2007-02-01"),]

##novo elemento da tabela que junta dia e horario pra poder visualizar melhor
##func paste seria para juntar ambos os elementos
subeData$DateAndTime <- strptime(paste(subeData$Date, subeData$Time), "%d/%m/%Y %H:%M:%S")

##plot de cada grafico separado
plot(subeData$DateAndTime, subeData$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")

plot(subeData$DateAndTime, subeData$Sub_metering_2, type = "l", xlab = " ", ylab = "Energy sub metering")

plot(subeData$DateAndTime, subeData$Sub_metering_3, type = "l", xlab = " ", ylab = "Energy sub metering")

##plotar o que tem maior escala e depois subrepor outros dados com o points, no caso plot do primeiro que tem maior escala
plot(subeData$DateAndTime, subeData$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
points(subeData$DateAndTime, subeData$Sub_metering_2, type = "l", xlab = " ", ylab = "Energy sub metering", col = "red")
points(subeData$DateAndTime, subeData$Sub_metering_3, type = "l", xlab = " ", ylab = "Energy sub metering", col = "blue")


########################## PLOT GRAPH 4 #################################
##ter data dos dias 1 e 2
subeData <- eData[eData$fDate <= asDate("2007-02-02"),]
subeData <- subeData[subeData$fDate >= asDate("2007-02-01"),]

##novo elemento da tabela que junta dia e horario pra poder visualizar melhor
##func paste seria para juntar ambos os elementos
subeData$DateAndTime <- strptime(paste(subeData$Date, subeData$Time), "%d/%m/%Y %H:%M:%S")


##par can be used to set or query graphical parameters. Parameters can be set by specifying them as arguments to par in tag = value form, or by passing them as a list of tagged values.
## func par serve para plotar varios graficos nao sobrepostos
##mfcol serve para dizer quantos graficos por coluna e depois por linha eu devo ter (default e 1 grafico plotado por vez)
par(mfcol = c(2, 2))

##plot do segundo grafico
plot(subeData$DateAndTime, subeData$Global_active_power, type = "l", ylab = "Global Active Power", xlab = " ")

##plot do terceiro grafico
plot(subeData$DateAndTime, subeData$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
points(subeData$DateAndTime, subeData$Sub_metering_2, type = "l", xlab = " ", ylab = "Energy sub metering", col = "red")
points(subeData$DateAndTime, subeData$Sub_metering_3, type = "l", xlab = " ", ylab = "Energy sub metering", col = "blue")

##plot do grafico de voltagem por dia/hora
plot(subeData$DateAndTime, subeData$Voltage, type = "l", ylab = "Voltage", xlab = "Date/Time")

##parecido com o primeiro mas com Global Reactive Power
plot(subeData$DateAndTime, subeData$Global_reactive_power, type = "l", ylab = "Global Rctive Power", xlab = " ")

