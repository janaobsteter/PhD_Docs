ped <- read.table('/home/jana/bin/AlphaSim1.05Linux/PedigreeBURNIN.txt', header=T)


dat <- ped[,c(2,12)]
write.table(dat, '/home/jana/Burnin.dat', col.names=F, sep=" ", row.names=F, quote=F)

ped1 <- ped[ped$Generation==10,]
ped1 <- ped1[,c(2,4,3)]
ped1 <- ped[,c(2,4,3)]
gender <- read.table('/home/jana/bin/AlphaSim1.05Linux/SimulatedData/Gender.txt', header=T)
gender <- gender[,c(2,3)]
ped1 <- merge(ped1, gender, by='Indiv', all.x=T)

write.table(ped1, '/home/jana/Burnin.ped', col.names=F, sep=" ", row.names=F, quote=F)



intersect(ped1$Mother, ped1$Indiv[ped1$Gender==1])
intersect(ped1$Father, ped1$Indiv[ped1$Gender==2])


#####################################################################################
#Mrode example
#ped code: 1 - both parents known,2 - one parent known, 3 - both parents unknown --> HOWEVER, unknown parents can be assigned parent group numbers
ped <- data.frame(id=1:9, sire=c(0,0,0,1,3,1,4,3, 3), dam=c(0,0,0,0,2,2,5,6,2), code=c(3,3,3,2,1,1,1,1,1))
dat <- data.frame(animal = 1:8, p = c(0,0,0,4.5, 2.9, 3.9, 3.5, 5.0), sex = c(1,2,1,1,2,2,1,1))
write.table(dat, '/home/jana/Mrode.dat', col.names=F, sep=" ", row.names=F, quote=F)
write.table(ped, '/home/jana/Mrode.ped', col.names=F, sep=" ", row.names=F, quote=F)

#add full-sib to animal 5
ped[9,] <- c(9, 3, 2, 1)
#female full-sib
dat[9,] <- c(9, 3.5, 2)
#male full-sib
dat[9,] <- c(9, 3.5, 2)
#what happens to accuracies