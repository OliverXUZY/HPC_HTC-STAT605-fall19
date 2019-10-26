
data = read.csv('data/allMSN.csv')

data = data[!is.na(data[,2]),]
a = aggregate(data[,2], by = list(data[,1]), mean)
a[,2] = round(a[,2],1)

write.table(t(a[,2]),'res.txt',sep = ' ',col.names = F,row.names = F)

