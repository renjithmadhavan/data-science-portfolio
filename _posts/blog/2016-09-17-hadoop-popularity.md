---
layout: post
title: "Hadoop Popularity"
categories: blog
author: "Keith Hultman"
date: 2016-09-25
tags: [BigData]
output: html_document
---





## Exploring the popularity of Pig and Hive

Pig and Hive are sometimes compared with one another for their ability to do data manipulations on a Hadoop cluster. There are some important differences. Hive is a direct implementation of the SQL language standard, which gives it a leg-up in terms of user familiarity. I wanted to see how the two compared in the number of posts on [Stack Overflow](http://stackoverflow.com/) a popular question/answer site for software developers. 

I first found the most popular tag for the associated technologies at [Stackoverflow](http://stackoverflow.com/tags). Then I used the public data explorer on [StackExchange](http://data.stackexchange.com/stackoverflow/query/440749/anonymous-feedback-votes-over-time-on-a-specific-tag?tagname=ocaml&ref=survey-2016#graph) and entered the tags as queries. I then downloaded the csv file and brought it in to R for some visualizations. 



{% highlight r %}
setwd("/Volumes/Half_Dome/OneDrive\ -\ Elmhurst\ College/Elmhurst\ Data\ Science/Programming\ Languages/Hadoop\ tech\ popularity/")
pig <- read.csv("pig.csv", header = TRUE)
hive <- read.csv("hive.csv", header = TRUE)
pighive <- rbind(pig, hive) #combine the data to one dataframe
pighive$mo <- strptime(x = as.character(pighive$mo), format = "%Y-%m-%d %H:%M:%S")

ggplot(pighive, aes(mo, Total.Votes)) +
  geom_line(aes(color = TagName)) + 
  ggtitle("Popularity of Pig vs Hive on Stack Overflow") +
  ylab("Tag Votes") +
  xlab("Time")
{% endhighlight %}

![plot of chunk Pig vs Hive]({{site.url}}/figures/Pig vs Hive-1.svg)

The number of posts with apache-pig as the tag has plataeued and slightly droped from its peak in 2014. Hive has gained in popularity and has more than 3x the number of posts. Seems like a clear winner for Hive here.  

## A comparison of all Hadoop-related technology popularity

How do the other Hadoop-related technologies compare? 


{% highlight r %}
setwd("/Volumes/Half_Dome/OneDrive\ -\ Elmhurst\ College/Elmhurst\ Data\ Science/Programming\ Languages/Hadoop\ tech\ popularity/")
hadoop <- read.csv("hadoop.csv", header = TRUE)
hbase <- read.csv("hbase.csv", header = TRUE)
spark <- read.csv("spark.csv", header = TRUE)
mahout <- read.csv("mahout.csv", header = TRUE)
mapreduce <- read.csv("mapreduce.csv", header = TRUE)

hadoop_all <- rbind(hadoop, pig, hive, hbase, spark, mahout, mapreduce) #combine the data to one dataframe
hadoop_all$mo <- strptime(x = as.character(hadoop_all$mo), format = "%Y-%m-%d %H:%M:%S")

ggplot(hadoop_all, aes(mo, Total.Votes)) +
  geom_line(aes(color = TagName)) + 
  ggtitle("Popularity of Hadoop related technologies on Stack Overflow") +
  ylab("Tag Votes") +
  xlab("Time")
{% endhighlight %}

![plot of chunk All]({{site.url}}/figures/All-1.svg)

Hive's rise is completely dwarfed by the acceleration over the past year and half of Spark. Spark is tagged in twice the number of posts as the general Hadoop tag, a technology it was built upon. This has convinced me to put full effort into learning Spark going forward. 

