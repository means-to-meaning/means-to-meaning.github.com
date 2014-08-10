#/bin/sh
#needs a correctly set BLOG_PATH variable
#BLOG_PATH=
RSCRIPT="$BLOG_PATH/Rmd/knit.R"
cd $BLOG_PATH
if [ -f $RSCRIPT ]
then
	/usr/bin/Rscript $RSCRIPT "Rmd/$1"
else
	echo "knit.R not found in $BLOG_PATH/Rmd."
fi
