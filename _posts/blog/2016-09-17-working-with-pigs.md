---
layout: post
title: "Working with Pigs"
modified:
categories: blog
excerpt: "Grunt"
tags: [BigData]
image:
  feature: feature-image-data-blue.jpg
date: 2016-09-17
---

This week I've been learning about the Pig language for Hadoop distributed computing systems. This is the first of several languages that we are covering this semester that were designed as abstractions on top of MapReduce. It's really interesting to me how many different layers of programming can sit on top of one another and work together to make working with what is essentially machine language more human like. 

In the case of Pig, the language is called Pig Latin, and resembles SQL in several ways. It's primary purpose is to make common ETL data pipelines easier to write for MapReduce functions. 

The entire Hadoop ecosystem that has been built up on top of MapReduce seem like a natural and powerful extension, in part because of the challenge in breaking down your problem or algorithm into precise Map and Reduce functions. The abstraction allows you to continue to use familiar framing - for example, the ETL functions of Pig that are familiar to data applications on stand-alone systems. 

I was trying to figure out how some of my previous projects could be converted to Hadoop code. Certainly, our Grupo Bimbo project had large data sets in which simple transformations often took 15 minutes to a few hours on a single machine. Just loading the data into RAM took 30 seconds using an SSD with the fastest method for loading on R. But many of our models seem too advanced for me to implement using explicit Map / Reduce commands. I'm sure some of the other applications built on top of Hadoop will bridge these issues. In Google's original [MapReduce white paper] they make the case that many of their big data problems could be decomposed to a Map - Reduce framework. However, I wonder how many of their questions were inspired by the technology? Sort of like when given a hammer, everything looks like a nail. 

[MapReduce white paper]: http://static.googleusercontent.com/media/research.google.com/en//archive/mapreduce-osdi04.pdf
