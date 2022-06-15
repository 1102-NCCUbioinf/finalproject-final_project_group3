# Paper3: Diagnostic potential for a serum miRNA neural network for detection of ovarian cancer

## Members
Group 3:
* 章峻福 110753503
* 葉冠宏 108753208

## Demo 
### Method
We follow the workflow mentioned in the paper as follows: 
![work](https://user-images.githubusercontent.com/20900157/173859171-a7bf182a-aa6f-4e75-ba98-b911da077f84.png)

### Feature
We use the following features selected by each of the methods mentioned in the paper plus the feature "Age" to reproduce the result.
![fea](https://user-images.githubusercontent.com/20900157/173857391-b0dcdb29-3df2-4a79-a003-4d81819c2da7.png)

### Result
峻福part:
![demo](https://user-images.githubusercontent.com/101028862/173810804-07ebd881-ef35-4fb1-92ff-416452a7c249.png)

冠宏part:
![demo2](https://user-images.githubusercontent.com/20900157/173848824-c84ddb3f-a8f5-4fb3-8166-dadefb86b7f8.png)
## Folder organization and its related information
### docs
* rminer.pdf: the R package user guide. We use its automated machine learning functions to solve the multi-class classification problem
* sampling.pdf: the R package user guide. We use it to implement stratified random sampling for training data via test data
* paper3_Elife_Elias.pdf: Our research paper for final project.
* A Comparison of AutoML Tools for Machine Learning, Deep Learning and XGBoost.pdf: the paper compares the performance of 8 AutoML tool. 
* NormiRazor：tool applying GPU-accelerated computing for determination of internal references in microRNA transcription studies.pdf: the paper talks about NormiRazor package of how to implement NormFinder algorithm on GPU. 

### data
* Source: NCBI (accession: PRJNA371423; GEO: GSE94533). The raw data(about 51GB) is stored on AWS or Google Cloud Platform(GCP). The processed data(about 14MB) can be download on GEO accession viewer. But the clinical data were written as a table in supplement file. 
* Format: xlsx file & docx file
* final_dset_combine.csv: our main imported data file.
* other files: other source files to generate the main data file.(Just for reference)

### code
* Which packages do you use? 
  * Authors use STATISTICA software & Python to accomplish the results.
  * 峻福 use R & related packages to reproduce results.
    * Packages: openxlsx(read data), rminer(AutoML), sampling(Stratified random sampling), caret(automated feature seletion)
  * 冠宏 use Python & related packages to reproduce results.
    * Packages: sklearn, sklego, pgmpy.models, pandas, numpy
* Analysis steps: 2 step to remove our doubt 
  *  1. Why didn't we use boosting ensemble models, such as XGBoost? --> we use rminer to compare 13 multi-class classification models by classification accuracy rate, weighted True Positive rate and weighted F1 score to make sure if boosting ensemble models perform well after tuning hyperparameters.   
  *  2. We found that the rfe function provided by the caret R package could automatically select features. The method is called Recursive Feature Elimination. We do this to check whether this method could select similar miRNAs, compared by qPCR test results.   
* Codes:
  * 峻福 part:
    * f_project_tmp.r
  * 冠宏 part:
    * test.py
### results
* Which part of the paper do you reproduce?
![show](https://user-images.githubusercontent.com/20900157/173854517-b541a288-1095-4be1-bc24-ee2c94e67121.png)
* Any improvement or change by your package?
  * 峻福 try to reproduce the result by automated machine learning functions.
* Files:
  * 冠宏 part:
    * result.xlsx

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
  * A Comparison of AutoML Tools for Machine Learning, Deep Learning and XGBoost.pdf
  * NormiRazor：tool applying GPU-accelerated computing for determination of internal references in microRNA transcription studies.pdf
  * paper3_Elife_Elias.pdf
