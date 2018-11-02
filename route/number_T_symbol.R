setwd("C:\\Users\\Administrator\\Desktop\\vic\\result\\route\\rout2.0")
data_df<-read.table("sample_direction_T.txt")
n1<-nrow(data_df)
n2<-ncol(data_df)
data<-as.matrix(data_df)
legend<-c()
legend[1]<-"��"
legend[2]<-"�J"
legend[3]<-"��"
legend[4]<-"�K"
legend[5]<-"��"
legend[6]<-"�L"
legend[7]<-"��"
legend[8]<-"�I"

for(i in 1:n1){
  for(j in 1:n2){
    if(data[i,j]==-1){
      data_df[i,j]="0"
    }
    else{
      data_df[i,j]=legend[data[i,j]]
    }
  }
}
data_df
write.table(data_df,"sample_direction_S.txt",col.names = F,row.names = F,quote = F)
#��δ���������ǽ������ü�ͷ��ʾ�������ų��������
