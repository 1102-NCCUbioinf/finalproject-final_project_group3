


#read file
library(openxlsx)
dset1 <- read.xlsx(xlsxFile="E:/hw/final_present/final_dataset_use.xlsx",sheet=1)
dset2 <- read.xlsx(xlsxFile="E:/hw/final_present/final_dataset_use.xlsx",sheet=2)
dsetf <- merge(dset2,dset1,by.x="ID",by.y="Sample_ID")


#Stratified randome sampling
install.packages("sampling")
library(sampling)
s <- strata(dsetf,stratanames="Pathology",size=c(12,34,40,33,16),method="srswor")
dset_train <- dsetf[row.names(dsetf) %in% s$ID_unit,]
dset_test <- dsetf[!(row.names(dsetf) %in% s$ID_unit),]



#automatic feature selection :  Recursive Feature Elimination
#package : caret
library(caret)

control <- rfeControl(functions=caretFuncs, method = "repeatedcv",repeats = 5)
results <- rfe(d[,c(1,3:194)],d$outcome_cat,sizes=c(1:15), rfeControl=control)
mirna_select <- row.names((results$fit)$importanceSD)
rna_select <- results$optVariables


#alternative
#control <- trainControl(method="repeatedcv", number=10, repeats=3)
#model <- train(outcome_cat~., data=d, method="lvq", preProcess="scale", trControl=control)
#importance <- varImp(model, scale=FALSE)


#autoML

library(rminer)

dset_train$outcome_cat <- as.factor(dset_train$outcome_cat)
d=dset_train[,c(6,8:200)]
inputs=ncol(d)-1
metric="AUC"

#Some ML algorithms have error due to the names of variables. Rename 
dset_train2 <- dset_train
dset_test2 <- dset_test
var_name <- names(dset_train)
names(dset_train2) <- c(names(dset_train)[1:8],paste0("Var_",1:192))
names(dset_test2) <- c(names(dset_test)[1:8],paste0("Var_",1:192))

ttt <- names(dset_train2)[which(var_name %in% rna_select)]
f_formu <- paste0("outcome_cat~Age+",paste0(ttt,collapse="+"))

model1=c("naive","ctree","cv.glmnet","dt","knn","svm","lssvm","mlp","randomForest","xgboost","bagging","boosting","lda","multinom","naiveBayes")

sm=mparheuristic(model=model1,n=NA,task="class",inputs=length(rna_select)+1)
mode="auto"

imethod=c("holdout",4/5,123) # internal validation method
emethod=c("holdout",2/3,567) # external validation method

search=list(search=sm,smethod=mode,method=imethod,metric=metric,convex=0)
M=mining(formula(f_formu),data=dset_train2,model="auto",search=search,method=emethod,fdebug=TRUE)
cat("best",emethod[1],"selected model:",M$object@model,"\n")
cat(metric,"=",round(as.numeric(mmetric(M,metric=metric)),2),"\n")

# internal kfold and external kfold: 
imethod=c("kfold",3,123) # internal validation method
emethod=c("kfold",5,567) # external validation method
search=list(search=sm,smethod=mode,method=imethod,metric=metric,convex=0)
M=mining(formula(f_formu),data=dset_train2,model="auto",search=search,method=emethod,fdebug=TRUE)
kfolds=as.numeric(emethod[2])
models=vector(length=kfolds)
for(i in 1:kfolds) models[i]=M$object$model[[i]]
cat("best",emethod[1],"selected models:",models,"\n")
cat(metric,"=",round(as.numeric(mmetric(M,metric=metric)),2),"\n")



# testing of rminer classification methods:

model1=c("naive","ctree","cv.glmnet","dt","knn","svm","lssvm","mlp", "randomForest","xgboost","bagging","boosting","lda","multinom","naiveBayes")

dset_train2 <- dset_train
dset_test2 <- dset_test
names(dset_train2) <- c(names(dset_train)[1:8],paste0("Var_",1:192))
names(dset_test2) <- c(names(dset_test)[1:8],paste0("Var_",1:192))

inputs=ncol(d)-1
#ho=holdout(d$outcome_cat,2/3,seed=123) # 2/3 for training and 1/3 for testing
Y=as.factor(dset_test2$outcome_cat)
dset_train2$outcome_cat <- as.factor(dset_train2$outcome_cat)
dset_test2$outcome_cat <- as.factor(dset_test2$outcome_cat)


ttt <- names(dset_train2)[which(names(dset_train) %in% rna_select)]
f_formu <- paste0("outcome_cat~Age+",paste0(ttt,collapse="+"))

task_c <- c(rep("prob",time=6),"class",rep("prob",time=8))
for(i in 1:length(model1))
{
cat("i:",i,"model:",model1[i],"\n")
search=list(search=mparheuristic(model1[i],n=NA,task=task_c[i],inputs=13)) # rminer default values
M=fit(x=formula(f_formu),data=dset_train2[,c(6,8:200)],model=model1[i],search=search,task=task_c[i],fdebug=TRUE)


P=predict(M,dset_test2[,c(6,8:200)])
cat("AUC:",round(mmetric(Y,P,metric="AUC"),1),"\n")
#cat("predicted weightedTPR score:",round(mmetric(Y,P,metric="weightedTPR"),1),"\n")
#cat("predicted weightedF1 score:",round(mmetric(Y,P,metric="weightedF1"),1),"\n")
}





#install & use  NormFinder algorithms
install.packages("remotes")
# or remotes::install_github("dhammarstrom/generefer")
source("E:/hw/NormFinder_algorithm/r.NormOldStab5.txt")












