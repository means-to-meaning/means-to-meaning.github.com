---
layout: post
title: "Blog post from RMarkdown"
description: ""
category: r
tags: [knitr, jekyll, tutorial]
---

This test post is cloned from Jason C Fischer's http://jfisher-usgs.github.io/. Here is some test $$\LaTeX$$ stuff. and also including the MathJax syntax \\(x_i\\). For jekyll, the standard latex syntax needs to be doubled, i.e. the above is achieved using "\\\\(x_i)\\\\".

The [knitr](http://yihui.name/knitr/) package provides an easy way to embed 
[R](http://www.r-project.org/) code in a [Jekyll-Bootstrap](http://jekyllbootstrap.com/) 
blog post. The only required input is an **R Markdown** source file. 
The name of the source file used to generate this post is *2012-07-03-knitr-jekyll.Rmd*, available
[here](https://github.com/jfisher-usgs/jfisher-usgs.github.com/blob/master/Rmd/2012-07-03-knitr-jekyll.Rmd).
Steps taken to build this post are as follows:


### Step 1

Create a Jekyll-Boostrap blog if you don't already have one. 
A brief tutorial on building this blog is available 
[here](/lessons/2012/05/30/jekyll-build-on-windows/).

### Step 2

Open the R Console and process the source file:

{% highlight r %}
KnitPost <- function(input, base.url = "/") {
  require(knitr)
  opts_knit$set(base.url = base.url)
  fig.path <- paste0("figs/", sub(".Rmd$", "", basename(input)), "/")
  opts_chunk$set(fig.path = fig.path)
  opts_chunk$set(fig.cap = "center")
  render_jekyll()
  knit(input, envir = parent.frame())
}
KnitPost("2012-07-03-knitr-jekyll.Rmd")
{% endhighlight %}

### Step 3

Move the resulting image folder *2012-07-03-knitr-jekyll* and **Markdown** file 
*2012-07-03-knitr-jekyll.md* to the local 
*jfisher-usgs.github.com* [git](http://git-scm.com/) repository.
The KnitPost function assumes that the image folder will be placed in a 
[figs](https://github.com/jfisher-usgs/jfisher-usgs.github.com/tree/master/figs) 
folder located at the root of the repository.

### Step 4

Add the following CSS code to the 
*/assets/themes/twitter-2.0/css/bootstrap.min.css* file to center images:

    [alt=center] {
      display: block;
      margin: auto;
    }

That's it.

***

Here are a few examples of embedding R code:

{% highlight r %}
summary(cars)
{% endhighlight %}



{% highlight text %}
##      speed           dist    
##  Min.   : 4.0   Min.   :  2  
##  1st Qu.:12.0   1st Qu.: 26  
##  Median :15.0   Median : 36  
##  Mean   :15.4   Mean   : 43  
##  3rd Qu.:19.0   3rd Qu.: 56  
##  Max.   :25.0   Max.   :120
{% endhighlight %}


{% highlight r %}
par(mar = c(4, 4, 0.1, 0.1), omi = c(0, 0, 0, 0))
plot(cars)
{% endhighlight %}

![center](/figs/2014-08-10-first-knitr-test/fig1.png) 
##### Figure 1: Caption


{% highlight r %}
par(mar = c(2.5, 2.5, 0.5, 0.1), omi = c(0, 0, 0, 0))
filled.contour(volcano)
{% endhighlight %}

![center](/figs/2014-08-10-first-knitr-test/fig2.png) 
##### Figure 2: Caption

And don't forget your session information for proper reproducible research.

{% highlight r %}
sessionInfo()
{% endhighlight %}



{% highlight text %}
## R version 3.1.1 (2014-07-10)
## Platform: x86_64-apple-darwin13.1.0 (64-bit)
## 
## locale:
## [1] C/UTF-8/C/C/C/C
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  base     
## 
## other attached packages:
## [1] knitr_1.6
## 
## loaded via a namespace (and not attached):
## [1] evaluate_0.5.5 formatR_0.10   stringr_0.6.2  tools_3.1.1
{% endhighlight %}
