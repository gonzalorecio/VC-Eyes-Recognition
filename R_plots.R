par(mfrow = c(2,2))
valuesCellSize = c(3,5,7,9,11,13,15) # amb numbins = 9 default
accuracy = c ((82.72+81.19+81.447)/3, (83.0134+83.0134+83.3973)/3, (83.1094+83.3973+83.0134)/3, (83.9731 + 83.7812+83.6852)/3, 
              (82.9175+83.2054+82.72556)/3, (83.2054+83.5893+83.4933+83.69+82.917)/5, (83.2054+82.8215+82.9175)/3)
plot(valuesCellSize,accuracy,main="Optimal Cell Value for HOG features")
lines(valuesCellSize,accuracy,lty=2)



numOfBins = c(5,7,8,9,10,11,12,15,20,25)

accuracy = c ((82.6296+83.5893+83.3973)/3,
              (83.1094+83.3973+83.6852)/3,
              (82.6296+82.4376+83.5893)/3,
              (83.3973+83.1094+82.5336)/3,
              (84.2610+83.3013+83.4933+83.0134+83.5893)/5, 
              (83.1094+83.0134+83.1094)/3,
              (83.3013+83.5893+83.0134)/3,
              (82.6296+82.5336+82.6296)/3, 
              (82.2457+82.9175+82.6296)/3, 
              (82.4376+81.5739+81.4779)/3 )

plot(numOfBins,accuracy,main="Optimal Number of Bins for HOG features")
lines(numOfBins,accuracy,lty=2)




blockSize = c(1, 2, 3, 4, 5, 6, 7)
accuracy = c ((82.8215+82.5336+80.9981)/3,
              (83.3013+82.1497+83.5893)/3,
              (83.3013+82.7255+83.9731)/3,
              (83.9731+84.1651+83.2054)/3,
              (83.2054+83.2054+83.1094+83.1094+83.4933)/5,
              (84.6449+83.1094+83.6852)/3,
              (83.3973+83.4933+83.3973)/3 )

plot(blockSize,accuracy,main="Optimal BlockSize for HOG features")
lines(blockSize,accuracy,lty=2)


signedOrientation = c(1,2)
accuracy = c((83.9731+83.0134+82.7255+82.5336+84.3570)/5,
              (84.1651+84.1651+84.2610+84.0691+84.3570)/5)

barplot(accuracy,,main="Optimal Option for Signed Value for HOG features",
        names.arg=c("False", "True"),
        ylim = c(80.0, 85.0),xpd = FALSE)
lines(signedOrientation,accuracy,lty=2)







##############################

##############################
numNeighbors = c(8,10,12,14,16,18)
accuracy = c((84.1651+83.3973+84.3570)/3,
             (84.4530+84.3570+83.8772)/3,
             (83.6852+84.8369+84.2610)/3,
             (84.5489+84.0691+83.5893)/3,  
             (83.9731+84.4530+83.4933)/3,
             (83.5893+84.0691+84.3570)/3)
plot(numNeighbors, accuracy, main="Optimal Number of Neighbors for LBP feats. ")
lines(numNeighbors, accuracy, lty=2)



radius = c(1,2,3,4,5)
accuracy = c((84.7409+85.0288+84.1651+84.1651+84.0691+83.6852)/6,
             (84.0691+83.7812+83.6852+84.5489+83.8772)/5,
             (84.1651+84.1651+84.8369+84.4530+84.1651)/5,
             (83.4933+84.2610+83.3973)/3,
             (83.5893+84.2610+83.3973)/3
             )
plot(radius, accuracy, main="Optimal Radius for LBP feats. ")
lines(radius, accuracy, lty=2)



accuracy = c((84.5489+84.5489+84.0691+84.4530+83.8772)/5,
             (83.6852+83.2054+84.6449+85.0288+83.7812)/5)
barplot(accuracy,,main="Optimal Value for Upright for LBP feats.",
        names.arg=c("False", "True"),
        ylim = c(80.0, 85.0),xpd = FALSE)
lines(signedOrientation,accuracy,lty=2)



valuesCellSize = c(7,9,11,12,13,15) 
accuracy = c ((83.3013+83.8772+82.8215)/3, 
              (83.9731+83.3973+83.7812)/3, 
              (84.4530+84.1651+84.0691)/3,
              (83.7812+85.1248+83.9731)/3,
              (84.7409+83.9731+84.4530+83.7812+83.7812)/5, 
              (83.5893+84.2610+83.8772)/3)
plot(valuesCellSize,accuracy,main="Optimal Cell Value for LBP features")
lines(valuesCellSize,accuracy,lty=2)





##############################################################
##############################################################


numTrees = c(100,1000,10000)
accuracy = c(83.9731,
             (84.8369+ 84.8369)/2,
             84.6449
             );
plot(numTrees, accuracy, main = "Number of trees for the TreeBagger")
lines(numTrees, accuracy, lty=2)






"

ans =
  
  80


ans =
  
  9     3
  1     7

  scores =
    
    0.6800    0.3200
    0.5700    0.4300
    0.4700    0.5300
    0.4600    0.5400
    0.5400    0.4600
    0.5600    0.4400
    0.5700    0.4300
    0.5300    0.4700
    0.4400    0.5600
    0.4200    0.5800
    0.5800    0.4200
    0.6100    0.3900
    0.5600    0.4400
    0.4800    0.5200
    0.5100    0.4900
    0.5900    0.4100
    0.4400    0.5600
    0.3800    0.6200
    0.5500    0.4500
    0.4300    0.5700

    
    
    ans =
      
      85
    
    
    ans =
      
      9     2
      1     8
      
      scores =
        
        0.5900    0.4100
        0.5900    0.4100
        0.4300    0.5700
        0.4200    0.5800
        0.5100    0.4900
        0.5500    0.4500
        0.5800    0.4200
        0.5900    0.4100
        0.3600    0.6400
        0.4800    0.5200
        0.5200    0.4800
        0.5000    0.5000
        0.5300    0.4700
        0.3900    0.6100
        0.5500    0.4500
        0.5300    0.4700
        0.4700    0.5300
        0.3900    0.6100
        0.4400    0.5600
        0.4200    0.5800
    
        
        
        
        
    foto 1
  "   
      
         
        
        
        
        
        
        
###################
# ULLS vs no ULLS
###################
           
par(mfrow = c(2,2))   
cellSize = c(2,4,8,12,15,17,20,25)
accuracy = c(91.36,
             94.19,
             98.14,
             98.59,
             97.70,
             97.80,
             97.98,96.80)
plot(cellSize, accuracy, main = "Optimal CellSize Value for HOG features")
lines(cellSize, accuracy, lty=2)           
        

numBins = c(3,5,8,10,12,15,17,20,25)
accuracy = c(95.23,
             97.63,
             98.37,
             98.40,
             98.24,
             98.46,
             98.05,
             98.24,
             97.84)
plot(numBins, accuracy, main = "Optimal NumBins Value for HOG features")
lines(numBins, accuracy, lty=2) 



blockSize = c(1,2,3,4,5)
accuracy = c(96.55,
             98.78,
             98.66,
             98.46,
             98.46)
plot(blockSize, accuracy, main = "Optimal BlockSize Value for HOG features")
lines(blockSize, accuracy, lty=2)




signedOrientation = c(1,2)
accuracy = c(98.78,97.76)
barplot(accuracy, main = "Optimal SignedOrient. Value for HOG features",
        names.arg=c("True", "False"),
        ylim = c(95.0, 100.0),xpd = FALSE)
lines(signedOrientation,accuracy,lty=2)







################################


numNeighbors = c (2,
                  4,
                  8,
                  10,
                  12,
                  14,
                  17,
                  20,
                  25)
accuracy = c(98.69,
             98.69,
             98.40,
             98.72,
             98.98,
             98.85,
             98.72,
             98.72,
             98.59)
plot(numNeighbors, accuracy, main="Optimal Number of Neighbors for LBP feats. ")
lines(numNeighbors, accuracy, lty=2)


radius = c(1,2,3,4)
accuracy = c(98.75,
             98.80,
             98.32,
             98.66)
plot(radius, accuracy, main="Optimal Radius for LBP feats. ")
lines(radius, accuracy, lty=2)



accuracy = c(98.62,
             98.69)
barplot(accuracy,,main="Optimal Value for Upright for LBP feats.",
        names.arg=c("True", "False"),
        ylim = c(96.0, 100.0),xpd = FALSE)
lines(signedOrientation,accuracy,lty=2)



valuesCellSize = c(4,
                   8,
                   10,
                   12,
                   15,
                   17,
                   20) 
accuracy = c (97.89,
              98.75,
              98.75,
              98.98,
              98.85,
              98.66,
              98.46)
plot(valuesCellSize,accuracy,main="Optimal CellSize for LBP features")
lines(valuesCellSize,accuracy,lty=2)

