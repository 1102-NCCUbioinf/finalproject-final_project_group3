# Diagnostic potential for a serum miRNA neural network for detection of ovarian cancer

### Members
* 章峻福 110753503
* 葉冠宏 108753208


### Demo 
We use the following features selected by each of the methods mentioned in the paper plus the feature "Age" to reproduce the result.
![fea](https://user-images.githubusercontent.com/20900157/173857391-b0dcdb29-3df2-4a79-a003-4d81819c2da7.png)


峻福part:
![demo](https://user-images.githubusercontent.com/101028862/173810804-07ebd881-ef35-4fb1-92ff-416452a7c249.png)

冠宏part:
![demo2](https://user-images.githubusercontent.com/20900157/173848824-c84ddb3f-a8f5-4fb3-8166-dadefb86b7f8.png)
## Folder organization and its related information

### docs
峻福part:
* rminer: the R package user guide. We use its automated machine learning functions to solve the multi-class classification problem
* sampling: the R package user guide. We use it to implement stratified random sampling for training data via test data
* 2 papers: the one paper talks about NormiRazor package how to implement NormFinder algorithm on GPU; the other one compare the performance of 8 AutoML tool.

冠宏part:
* sklearn: the python package that includes implementation of models mentioned in the paper. The following models are what we implemented:
Linear discriminant analysis,Logistic regression,Neural network,Support vector machine,Naive Bayes classifier,Random forest

### data
* Source: NCBI (accession: PRJNA371423; GEO: GSE94533). The raw data(about 51GB) is stored on AWS or Google Cloud Platform(GCP). The processed data(about 14MB) can be download on GEO accession viewer. But the clinical data were written as a table in supplement file. 
* Format: xlsx file & docx file
* 

### code
* Which packages do you use? 
  * Authors use STATISTICA software & Python to accomplished their results.
  * 峻福 attempt to use R & related packages to reproduce results.
    * Packages: openxlsx(read data), rminer(AutoML), sampling(Stratified random sampling), caret(automated feature seletion)
  * 冠宏 attempt to use Python & related packages to reproduce results.
    * Packages: sklearn, sklego, pgmpy.models, pandas, numpy
* Analysis steps: 2 step to remove our doubt 
 *  1. Why didn't use boosting ensemble models, such as XGBoost? --> we use rminer to compare 13 multi-class classification models by classification accuracy rate, weight True Positive rate and weighted F1 score. To make sure if boosting ensemble models perform well after tuning hyperparameters.   
 *  2. We found that the rfe function provided by the caret R package could automatic select feature. The method is called Recursive Feature Elimination. To check whether this method could select similar miRNAs, compared by qPCR test results.   

### results
* Which part of the paper do you reproduce?
![show](https://user-images.githubusercontent.com/20900157/173854517-b541a288-1095-4be1-bc24-ee2c94e67121.png)
* Any improvement or change by your package?
  * 峻福 try to reproduce the result by automated machine learning functions.

## References
* Packages you use
  * 冠宏 part
    * sklearn
    * sklego
    * pgmpy.models
    * pandas
    * numpy
  * 峻福 part
    * openxlsx
    * rminer
    * sampling
    * caret
* Related publications
