# Diagnostic potential for a serum miRNA neural network for detection of ovarian cancer
![image](https://user-images.githubusercontent.com/101028862/173796111-e3a27eef-4436-431e-8676-dc45c3424cfb.png)

### Members
* 章峻福 110753503
* 葉冠宏 student ID2


### Demo 
You might provide an example commend or few commends to reproduce your analysis
![demo](https://user-images.githubusercontent.com/101028862/173810804-07ebd881-ef35-4fb1-92ff-416452a7c249.png)

## Folder organization and its related information

### docs
* rminer: the R package user guide. We use its automated machine learning functions to solve the multi-class classification problem
* sampling: the R package user guide. We use it to implement stratified random sampling for training data via test data
* 2 papers: the one paper talks about NormiRazor package how to implement NormFinder algorithm on GPU; the other one compare the performance of 8 AutoML tool.
*  

### data
* Source: NCBI (accession: PRJNA371423; GEO: GSE94533). The raw data(about 51GB) is stored on AWS or Google Cloud Platform(GCP). The processed data(about 14MB) can be download on GEO accession viewer. But the clinical data were written as a table in supplement file. 
* Format: xlsx file & docx file
* 

### code
* Which packages do you use? 
  * Authors use STATISTICA software & Python to accomplished their results.
  * We attempt to use R & related packages to reproduce results.
   * Packages: openxlsx(read data), rminer(AutoML), sampling(Stratified random sampling), caret(automated feature seletion)    
* Analysis steps: 2 step to remove our doubt 
 *  1. Why didn't use boosting ensemble models, such as XGBoost? --> we use rminer to compare 13 multi-class classification models by classification accuracy rate, weight True Positive rate and weighted F1 score. To make sure if boosting ensemble models perform well after tuning hyperparameters.   
 *  2. We found that the rfe function provided by the caret R package could automatic select feature. The method is called Recursive Feature Elimination. To check whether this method could select similar miRNAs, compared by qPCR test results.   

### results
* Which part of the paper do you reproduce?
* Any improvement or change by your package?

## References
* Packages you use
* Related publications
