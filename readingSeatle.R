#juntando todos os traces
seatle <- do.call("rbind", lapply(c("Trace1", "Trace2", "Trace3", "Trace4", "Trace5"), read.table, sep=" ",header=FALSE, col.names = c("time", "bus_id", "route_id", "unknown", "latitude", "longitude")))

#lendo o trace1
seatle1<-read.table("Trace1", header=FALSE,sep = " ", col.names = c("time", "bus_id", "route_id", "unknown", "latitude", "longitude"))

#transformando a string em data
seatle1$DateTime<-strptime(seatle1$time, "%d-%m:%H:%M:%S")

##transformando em matriz para o heatmap
seatle1_matix <- data.matrix(seatle1)

#dia 30 em seatle
seatle30 <- seatle1[seatle1$DateTime >= as.POSIXlt("2016-10-30 00:00:00"),]
seatle30 <- seatle30[seatle30$DateTime <= as.POSIXlt("2016-10-30 23:59:59"),]

#convertendo para o tempo relativo (ao menor tempo)
seatle1$Tempo <- difftime(seatle1$DateTime, as.POSIXlt(min(seatle1$DateTime)))

#como ver a data, pode ser qualquer data frame
View(tSeatle)

#install package reshape2 e plyr
#teste de merge, aggregate, melt e outros do pacote