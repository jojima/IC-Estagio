seatle1<-read.table("trace1S", header=FALSE,sep=" ", stringsAsFactors=F, col.names =c("month-day-time",
 "bus_id","route_id","Unknown","Latitude","Longitude"))

seatle1$DateAndTime <- format(strptime(as.character(seatle1$month.day.time), format="%d-%m %H:%M:%S"), "%d-%m %H:%M:%S")

seatle1$DateAndTime <- as.Date(as.character(seatle1$month.day.time), format = "%m-%e %H:%M:%S")

hist(seatle1$DateAndTime, xlab = "date")

plot(seatle1$Latitude, seatle1$Longitude)