---
layout: post
title: "Minimum sample size when estimating the ratio of pears and apples - (parameter estimation of binomial distributions)"
description: "Minimum sample size for parameter estimation in a binomial distribution"
category: ""
tags: [R, "parameter estimation"]
---
{% include JB/setup %}
If you are here, it is because a.) you have an unknown amount people/objects/cases that can take on 2 values and you are wondering how many do you need to interview, or investigate in order to be reasonably sure about the estimated proportion, or b.) you are looking for fruit salad recipes.

I decided to write this article since once I needed this stuff, the only Google searches returned were a bunch of weird websites (which I won't name here) and a lot of academic papers on probability theory of small sample estimates. Thus also the choice of my title -- unfortunately most people looking for this stuff don't know exactly what to look for in the first place.

### Problem 
#### Problem description:
Given a group of objects such as chocolate bars, which can be either dark chocolate, or white chocolate, we would like to determine the proportion of each type in our group. We pick would like to pick a small random sample and are ready to accept a certain error (say +/- 0.05), but want to be able to say with 90% certainty that our estimate is in fact correct.

#### Formal description:
Given a population of a finite size $N$ with an underlying binomial distribution, what is the minimal sample size $n$, in order to obtain an estimate which is within an error margin $l$ from the true distribution parameter $p$ with 90% probability using a simple random sample.

#### the really Formal description:
Given population $X_1,\ldots, X_N,\; N \in \mathbb{N}$