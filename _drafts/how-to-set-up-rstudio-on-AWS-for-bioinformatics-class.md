---
layout: post
title: how-to-set-up-rstudio-on-AWS-for-bioinformatics-class.md
excerpt: "A powerful and easy way to introduce students to R"
modified: 2015-09-07
categories: articles
tags: [R, RStudio, AWS, cloud, bioinformatics, teaching]
image:
  feature: feature-image-dna1.jpg
comments: true
share: true
---


This fall is probably the most enjoyable semester I've ever had teaching. I had an opportunity to design and run an upper-level special topics course on bioinformatics at Elmhurst College. It's a class I've always wanted to teach because its sort of like being able to organize a class around everything I would have wanted to know before going to graduate school for genetics.

A few discussions with other faculty members and the chair of the department revealed a need for biostatistics as well as the typical computational biology content for a bioinformatics course. Students are required to take a statistics course, and indeed all of my students in the class had already taken such a course. But the other biology professors were pretty adament that the students could use more stats knowledge as it is applied to biology since there is not a biostats course in the curriculum. 

For the biostats portion, I wanted to introduce the students to R, since it can be used for general stats uses as well as hypothesis testing and plotting. The fact that there are also fully featured packages specifically for bioinformatics and sequence analysis in the BioConductor suite meant that we could use R and RStudio throughout the semester for both the biostats and bioinformatics units. It seemed like a no-brainer. Except for the recommendation from others who have taught bioinformatics at the undergraduate level to avoid programming like the plague. Nonetheless, I was certain I could ease them into R like cattle to the slaughterhouse, if I could just make their journey as painless as possible.

## Looking over the options for teaching R

After looking over several bioinformatics and biostatistics syllabi, online courses, and tutorials, I narrowed down several options for introducing and using R in the classroom.

1. Having students install R/RStudio on their own laptops (or with the department's laptops for students without their own machine). 
2. Using a computer lab with R/RStudio preinstalled
3. Setting up my own RStudio server in the cloud
4. Using the College's Citrix server application for R


After careful consideration, I thought that the fourth option would be the least in overhead for both myself and the students. I certainly did not want to have to do my own IT support and troubleshooting while helping them install R on their own machines. I would not mind helping out the occasional student who was interested in having R on their laptop for future use, but I did not want it as a requirement for all students. 

Our college has a citrix server with academic applications, including R and RStudio. Our IT department was somewhat helpful in setting up the environment according to my particular needs - having packages preinstalled would avoid adding in the complexity of having them install each and every package individually. 

But after using the Citrix application myself during a test run, it was painfully slow for memory intensive functions. And there was also an issue with uploading files onto the citrix server as our IT person insisted on requiring the students to use ftp. Getting data into R is enough of a pain without that additional barrier. 

I decided in the end to roll my own server on AWS. There is a nice public AMI available for R/RStudio that makes it very easy to get the basic server up and running for a single user. Below is what I did to add my class as users and to set up packages under the system library.

### Use RStudio AMI from www.louisaslett.com

1. Select t2.micro for free account. 
2. Add ssh option to AMI
3. Set up a public key file for authentication

### Create multiple users for class

1. ssh into instance 

```
$ ssh -i .ssh/HadoopAWS.pem ubuntu@54.84.35.1
```

2. Add users with username and common password

```
$ adduser name
```

Here I left all fields blank for each user. The password was the same for all users. Later I would instruct them on how to change their password. 

3. Install packages to R system library

scp packages.R script to ubuntu home directory. 

sudo su - -c "R -e \"source('/home/ubuntu/packages.R')\""

