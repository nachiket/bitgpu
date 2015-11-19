#!/usr/bin/Rscript

require(scales);
require(ggplot2);
require(reshape2);

pdf(file="good_sols.pdf", height=3.5, width=5)

a<-read.csv('../data/good_sols.dat',header=F)
df<-data.frame(bench=a[,1],thresh=a[,2],good=a[,4],total=a[,5],perc=a[,6]);

p <- ggplot(data=df, aes(x=thresh,y=perc,group=bench,colour=bench)) +
	geom_line(size=1.1,linetype="solid") +
	geom_point(aes(shape=bench),size=3)+
	scale_x_log10() + 
	scale_y_log10() +
	xlab("Error Threshold") + ylab("Valid Solutions (%)") +
	theme_bw();

#	scale_x_log10(limits=c(1,100)) + 
	
p + theme(legend.key=element_blank(),legend.title=element_blank(),legend.background = element_blank(),legend.text=element_text(size=10));
