setwd("D:\\data_xijiang\\data_result\\rout")
flowacc1<-read.table("shixianshuju.txt")
#���������dem�ֱ��ʵ������������arcgis����ļ��������жԱȸ�ֵ��
flowacc1<-as.matrix(flowacc1)
n1<-nrow(flowacc1)
n2<-ncol(flowacc1)
#�����к���
c1=c()
#�������
#�������ܷ�-9999����
v1=1
for(i in 1:n1){
  for(j in 1:n2){
    if(flowacc1[i,j]!=-9999){
      c1[v1] = flowacc1[i,j]
      v1=v1+1
    }
  }
}

flowacc2<-read.table("shixianshuju3_S.txt")
#��������ǳ���100�Ժ�arcgis�������������
flowacc2<-as.matrix(flowacc2)
n3<-nrow(flowacc2)
n4<-ncol(flowacc2)
c2=c()
#��������
#�������ܷ�-9999����
v2=1
for(i in 1:n3){
  for(j in 1:n4){
    if(flowacc2[i,j]!=-9999){
      c2[v2]=flowacc2[i,j]
      v2=v2+1
    }
  }
}
if(F){
  #���Rstdio��Ϊ������̫����޷�����Ļ���������Ĵ������У�Ȼ��R-gui��������
  write.table(c1,"c1.txt",col.names = F,row.names = F,quote = F)
  write.table(c2,"c2.txt",col.names = F,row.names = F,quote = F)
  #���c1��c2����Ϊ������̫��R�޷���������
  data_df<-data.frame(c1,c2)
  write.table(data_df,"data_df.txt",col.names = F,row.names = F,quote = F)
  #��������ݿ�
}


data_df<-data_df[order(data_df$c1),]
n5<-nrow(data_df)
grid_flowacc=c()
n=1
t=0
for(i in 1:n5){
  C_id<-data_df$c1[i]
  C_flowacc<-data_df$c2[i]
  if(t<C_flowacc){
    t=C_flowacc
  }
  if(i==n5||C_id!=data_df$c1[i+1]){
    grid_flowacc[n]=t
    n=n+1
    t=0
  }
}
n
write.table(grid_flowacc,"grid_flowacc.txt",col.names = F,row.names = F,quote = F)
#��δ�������������4661�������Ļ����������ֵ�������丳����Ӧ����
if(F){
  #������Ĵ������R-gui��Ҫ���еĴ���
  setwd("D:\\data_xijiang\\data_result\\rout")
  data_df<-read.table("data_df.txt")
  class(data_df)
  data_df<-data_df[order(data_df$V1),]
  n5<-nrow(data_df)
  grid_flowacc=c()
  n=1
  t=0
  for(i in 1:n5){
    C_id<-data_df$V1[i]
    C_flowacc<-data_df$V2[i]
    if(t<C_flowacc){
      t=C_flowacc
    }
    if(i==n5||C_id!=data_df$V1[i+1]){
      grid_flowacc[n]=t
      n=n+1
      t=0
    }
  }
  n
  write.table(grid_flowacc,"grid_flowacc.txt",col.names = F,row.names = F,quote = F)
  #��δ�������������4661�������Ļ����������ֵ�������丳����Ӧ����
}