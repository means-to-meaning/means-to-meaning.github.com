---
layout: post
title:  "First post to Jekyll!"
date:   2014-08-10 17:11:32
categories: jekyll
---


Jekyll offers powerful support for code snippets:

{% highlight python %}
#Fibonacci sequence
def fibIter(n):
    if n < 2:
        return n
    fibPrev = 1
    fib = 1
    for num in xrange(2, n):
        fibPrev, fib = fib, fib + fibPrev
    return fib
{% endhighlight %}

And just for comparison, also some R code. This time we pick a task more suitable for R.

{% highlight R %}
#Generate a 1000 multivariate normal random variables
library(mvtnorm) 
sigma <- matrix(c(1, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 1), ncol = 3) 
x <- rmvnorm(n = 1000, mean = c(1, 5, 10), sigma = sigma) 
cov(x)
colMeans(x)
{% endhighlight %}

![MathJax Logo]({{ site.url }}/assets/mathjax.svg)

This is a small test to display math using MathJax inline and as block. Given that \\(\mathopen|x\mathclose| < 1\\), we have:
$$\sum_{n=0}^{\infty} x^n = \frac{1}{1-x}$$.
And for completeness sake, also an equation:
\\[P(A|B) = \frac{P(B|A)\,P(A)}{ P(B|A) P(A) + P(B|\neg A) P(\neg A)}\cdot\\]

Check out the [Jekyll docs][jekyll] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll's GitHub repo][jekyll-gh].

[jekyll-gh]: https://github.com/jekyll/jekyll
[jekyll]:    http://jekyllrb.com
