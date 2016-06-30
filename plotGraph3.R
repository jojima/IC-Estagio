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
