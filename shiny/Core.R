EcheancierPret <- function(
  crd, txpret, mensualite, duree,
  format, 
  typediffere, dureediffere, 
  formatdiffere )
{
  formatdiffere =as.integer(formatdiffere)
  typediffere = as.integer(typediffere)
  
  diff = ( formatdiffere != 1)
  calctx = (formatdiffere == 1) || (typediffere == 2)
  calcam = (formatdiffere == 1)
  
  durediff = as.integer(dureediffere)*diff
  print(durediff)
  result = list(crdin = c(), amt = c(), intr=c(), crdout=c()   )
  result$crdin[[1]] = crd
  t=(crd*txpret/1200)
  result$intr[[1]] = calctx*t
  m=min( mensualite-result$intr[[1]], crd)
  result$amt[[1]] =calcam*m
  result$crdout[[1]] = result$crdin[[1]]-result$amt[[1]] + (1-calctx)*t
  
  while((result$crdin[[length(result$crdin)]]>=0) 
        && (result$crdout[[length(result$crdout)]]>0)
        && (result$amt[[length(result$amt)]]>=0))
  {
    i = length(result$crdin)
    durediff=durediff-1
    if(durediff <= 0 ) { 
      calctx= TRUE 
      calcam =TRUE }
    
    
    result$crdin[[i+1]] =  result$crdout[[i]]
    t=(result$crdin[[i+1]]*txpret/1200)
    result$intr[[i+1]] = calctx*t
    m= min( mensualite -result$intr[[i+1]],result$crdin[[i+1]])
    result$amt[[i+1]] =calcam*m
    result$crdout[[i+1]] = result$crdin[[i+1]]-result$amt[[i+1]] + (1-calctx)*t
    
  }
  
  result=data.frame(result)
  rownames(result)=1:nrow(result)
  
  return(result )
}