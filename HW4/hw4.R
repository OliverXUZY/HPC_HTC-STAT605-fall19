rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 2){
  template = (args[1])
  directory = (args[2])
} else {
  cat('usage: Rscript hw4.R <template spectrum> <data directory> \n', file=stderr())
  stop()
}

###  hw2 code for one file
library('astro')
###
cB58 = read.fitstab(template)
#noisy = read.fitstab('data/spec-7424-57160-0977.fits')

obs = 3  ##  for test
files = list.files(directory)[1:3]

ext2 = function(fil){
  sig_flux = cB58[,2]
  noisy = read.fitstab(paste(directory,fil,sep = "/"))
  if(length(sig_flux) > dim(noisy)[1]){
  MSE = 9999;corr = 1; index = 0
  }
  else{
  MSEi = rep(0,dim(noisy)[1] - 2180)
  corri = rep(0,dim(noisy)[1] - 2180)
  #noise_flux = scale(noisy[,1])
  for(i in 1:(dim(noisy)[1] - 2180)){
    sig_flux = cB58[,2]
    noise_flux = noisy[i:(i+2180),1]
    noise_flux = noise_flux[noisy[i:(i+2180),4] == 0]  ###   ??
    sig_flux = sig_flux[which(noisy[i:(i+2180),4] == 0)]
    sig_flux = as.vector(scale(sig_flux))
    noise_flux = as.vector(scale(noise_flux))
    if(length(noise_flux) <= 1000){MSEi[i] = 9999
    }else{
      MSEi[i] = sqrt(sum((sig_flux - noise_flux)^2))/length(sig_flux)
      corri[i] = cor(sig_flux,noise_flux)
    }
  }
  index = union(order(MSEi)[1], order(corri,decreasing = TRUE)[1])
  MSE = MSEi[index]
  corr = corri[index]
  }
  return(list(index,MSE,corr))
} 

# ext2(files[1])

sele = lapply(files, ext2)

MSE = unlist(lapply(1:obs, function(x) sele[[x]][[2]][1]))
index = unlist(lapply(1:obs, function(x) sele[[x]][[1]][1]))

#corr = unlist(lapply(1:100, function(x) sele[[x]][[3]][2]))
#index = unlist(lapply(1:100, function(x) sele[[x]][[1]][2]))

hwdf = data.frame(distance = MSE, spectrumID = files, i = index)
hwdf = hwdf[order(hwdf$distance),]
hwdf = hwdf[is.na(hwdf$distance) == FALSE,]
# hwdf$direc = directory
write.csv(hwdf,paste(directory,'.csv',sep = ''), row.names = FALSE)
