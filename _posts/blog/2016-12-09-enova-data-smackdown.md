---
layout: post
title: "Enova Data Smackdown Competition"
modified:
categories: blog
excerpt: "Small linear regression model wins big"
tags: [data, competition, meetup]
image:
  feature: feature-image-podcast.jpg
  credit: Patrick Breitenbach
  creditlink: 
date: 2016-12-09
comments: true
share: true
---

Last night I attended a great data science meetup hosted by [Enova Decisions](https://www.enovadecisions.com/) in downtown Chicago. I've been to a few other data related meetups that mostly focused on talks or networking, but this one was all based around a challenging data set for participants to delve into. 

![smackdown.jpg]({{site.url}}/images/smackdown.jpg) 

I heard word of the Smackdown from the fantastic Chicago R Users Group (RUG) earlier this week and was sure to register as soon as I could. After some meet and greats with the fine people at Enova and some other participants we were given the problem at hand. We were to use historical data of book sales that included several categorical and numerical attributes - everything from genre and reading level to author's advance payment amount and previous sales. We were to predict sales of another set of books with the same attributes. The one catch that made this problem interesting was that we were to not only calculate the predicted sales values, but also how much to spend on advertising to maximise that predicted value. The training data had the advertising variable but this wasn't necessarily the optimum amount for maximum profit. 

I teamed up with a few people I met there who were comfortable working with R, including [Jesus](https://www.linkedin.com/in/jesuscampos1908) and [Vijeta](https://www.linkedin.com/in/vijetashah). There were also two other fellas who I didn't get contact info from - if you see this guys drop me a line! 

Our group worked pretty well together coming up with particular components of the business question and possible models. I think we were wise to take an iterative approach to the problem. We trimmed down the data set based on variable importance in a linear regression model. We were hoping to build an ensemble as a final model consisting of the linear model with a random forest, but we ran out of time for that. 

Our final model was 

profit ~ advance_amount + major_category + in_house_review + weeks_spent_writing

## Not every problem in data science is Prediction

The most difficult aspect of the problem was coming up with the advertising budget that maximized predicted profit for each tome. This is an optimization problem that should ideally be based off of the model for each book. Working through this competition made me realize that these types of optimization problems are a deficiency that I should put more emphasis on. I've been working on how accomplish this in my R code this morning, and I will probably resort to using for loops in my code. (For loops are generally regarded as slower and non-ideal when working in R)

We ended up estimating advertising amount based on a constant ratio of the expected profit. Certainly not ideal, but our model ended up in the top 2 for predictive value for the competition. 

I love a good puzzle to solve, and the Smackdown was almost like getting a bunch of friends together for boardgames. The only difference is that at the end of the day you could end up having learned something and holding a production-worth model to implement. 