########################## PLOT GRAPH 2 #################################
##ter data dos dias 1, 2 e 3
subeData <- eData[eData$fDate <= asDate("2007-02-02"),]
subeData <- subeData[subeData$fDate >= asDate("2007-02-01"),]

##novo elemento da tabela que junta dia e horario pra poder visualizar melhor
##func paste seria para juntar ambos os elementos
subeData$DateAndTime <- strptime(paste(subeData$Date, subeData$Time), "%d/%m/%Y %H:%M:%S")

##plot do grafico de linhas (type L) com o dado que foi criado
plot(subeData$DateAndTime, subeData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
