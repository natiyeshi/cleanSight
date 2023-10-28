# Clear Sight
Clear Sight is a mobile application that is used to detect Trachoma by using a machine learning model.

# Aim of the Project
<p> The aim of developing a trachoma detector application is to leverage technology to assist in the early detection and diagnosis of trachoma, a contagious eye disease caused by the bacterium Chlamydia trachomatis. Trachoma is a leading cause of preventable blindness worldwide, particularly in developing regions with limited access to healthcare resources.
</p>
<p>
The trachoma detector application utilizes computer vision and machine learning algorithms to analyze images of the eye and detect signs of trachoma infection. By capturing images of the eye using a smartphone or other imaging device, the application can identify specific indicators of trachoma, such as trachomatous inflammation-follicular (TF) or trachomatous inflammation-intense (TI), which are used in the clinical diagnosis of the disease.
Overall, the aim of developing a trachoma detector application is to leverage technology to improve the accessibility, efficiency, and accuracy of trachoma screening and diagnosis. By doing so, it can contribute to the global efforts to eliminate trachoma as a public health problem and reduce the burden of preventable blindness.
</p>

# How Does It Work
This model is trained with more than 1,500 pictures and most of the We sourced data from two partner organizations specializing in trachoma:

1. The University of Vermont Machine Learning Engineers
2. Tropical Data, an organization with a Trachoma Photo Database for image grading.

The dataset includes 1,656 inverted eyelid images labeled with trachomatous inflammation—follicular (TF) or trachomatous inflammation—intense (TI). Of these, over 500 are TF or TI-positive, and more than 1,000 are negative for both conditions.

Accuracy:

In our analysis, we used the ResNet_V2_152 and VGG16 deep-learning Convolutional Neural Networks from TensorFlow Hub as feature extractor layers. VGG16 demonstrated superior accuracy, achieving 77% on the training dataset and 70% on the test dataset.
The application is developed using Flutter 



# Features of the Application
<p> Make a conversation with the user so that the model can have a better understanding of the user's status and provide user-specific suggestions  
</p>
<p> Take an eye Image of the given person to provide a learned guess of the trachoma case by processing it on the pre-trained model. </p>
<p>  In addition it will also analyze the person's location, gender, and family case status to predict more accurately </p>

# How to use the application 
We try to make it as simple as possible because we aim particularly at developing regions with limited access to information and technology.
## The first part is the Home Page. 
#### The user can click the upper button which looks like Headset to ask questions and chat.
#### The user can click the CheckUp button to test himself and see the result 
![App Screenshot](https://github.com/natiyeshi/clearSight/blob/kebaHailu-patch-1/server/assets/p5.jpg)
## The second one is inputting user data  for the accuracy of the AI which helps us to estimate more accurate information.
### The person should input his AGE
### The person should input his/her Gender
### The person should input his family member experiences with trachoma
![App Screenshot](https://github.com/natiyeshi/clearSight/blob/kebaHailu-patch-1/server/assets/p4.jpg)
## The thired part is about selecting symptoms. This also helps us with the accuracy
### The person can select all symptoms he got
![App Screenshot](https://github.com/natiyeshi/clearSight/blob/kebaHailu-patch-1/server/assets/p3.jpg)
## This page is about image selection. 
### The user can select an image from the gallery or take a picture immediately 
### The person should Input the inverted eyelid picture so we also prepare a procedure for the person to follow when he inverts his eyelid
![App Screenshot](https://github.com/natiyeshi/clearSight/blob/kebaHailu-patch-1/server/assets/p2.jpg)
## This page is about Generative AI where the person can ask a question and try to come up with any problem he faced with trachoma
![App Screenshot](https://github.com/natiyeshi/clearSight/blob/kebaHailu-patch-1/server/assets/p1.jpg)


