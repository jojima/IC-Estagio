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
