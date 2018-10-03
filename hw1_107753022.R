args=commandArgs(trailingOnly=TRUE)
input_file <- ""
output_file <- ""
if(length(args)==0){
   stop("USAGE:Rscript hw1_107753022.R input",call. = FALSE)
}else if(length(args)>0){
  index <- 1
  while(index<=length(args)){ 
    if(args[index] == "-input"){
      input_file <- args[index+1]
    }
   
    if(args[index]=="-out"){
      output_file <- args[index+1]
    } 
    index <- index+1
  }
    
}
data <- read.csv(input_file,header=T,sep=",")
weight_summary <- max(data$weight)
height_summary <- max(data$height)
final_weight <- round(weight_summary,2)
final_height <- round(height_summary,2)
library(tools)
input_file<- basename(file_path_sans_ext(input_file))
set <- c(input_file)
weight <- c(final_weight)
height <- c(final_height)
final <- data.frame(set,weight,height)
write.table(final,file=output_file,sep=",",row.names = FALSE)