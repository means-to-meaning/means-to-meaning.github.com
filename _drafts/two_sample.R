

# Nonnormality
# Unequal population variances
# Unbalanced sample sizes
# Small sample sizes
# Outliers

# Test - detect a difference in means

# How do difference tests peform when in realistic conditions?
# What is a good measure for tests? (Properties of statistical estimators - Efficiency, Power)




simulate_sample <- function(dist1, dist2, params1, params2, iter=1000)
{
	# alpha =  P ( reject H0 | H0 true ) = (1 - confidence level)
	# power = P ( reject H0 | H1 true )
	
	reject_H0_ttest <- numeric()
	reject_H0_kruskal <- numeric()
	p_ttest <- numeric()
	p_kruskaltest <- numeric()

	for (i in 1:iter)
	{
		x1 <- do.call(eval(parse(text=dist1)),params1)
		x2 <- do.call(eval(parse(text=dist2)),params2)

		conf.level <- 0.95
		ttest <- t.test(x1, x2, conf.level = conf.level)
		kruskaltest <- kruskal.test(c(x1, x2), factor(c(rep(1,length(x1)),rep(2,length(x2)))),conf.level = conf.level)
		reject_H0_ttest <- c(reject_H0_ttest, (ttest$p.value < (1 - conf.level)))
		reject_H0_kruskal <- c(reject_H0_kruskal, (kruskaltest$p.value < (1 - conf.level)))
		p_ttest <- c(p_ttest, ttest$p.value)
		p_kruskaltest <- c(p_kruskaltest, kruskaltest$p.value)
	}
	P_reject_ttest <- sum(reject_H0_ttest) / iter
	P_reject_kruskaltest <- sum(reject_H0_kruskal) / iter
	return(list(P_reject_ttest=P_reject_ttest,P_reject_kruskaltes=P_reject_kruskaltest,p_ttest=p_ttest,p_kruskaltest=p_kruskaltest))
}


# H0 true, normal distributions, balanced samples, no outliers, same distribution functions


create_parametrization <- function(param1_first = 0)
{
	param1_first = 0

	tot_n <- c(20, 40, 100, 1000)
	d_mu <- c(0,0.1,1,100)

	# variance
	param1_second <- c(1,10,100)
	param2_second <- c(1,10,100)
	

	dist1 <- c("rnorm", "rexp", "rpois", "rlnorm", "rbeta", "rcauchy", "rt")
	dist2 <- c("rnorm", "rexp", "rpois", "rlnorm", "rbeta", "rcauchy", "rt")	

	prop_n <- 1/c(2, 4, 10)

	n1 <- ceiling(tot_n * rep(prop_n,each=length(tot_n)))
	n2 <- floor(tot_n * (1-rep(prop_n,each=length(tot_n))))

	# mean
	param2_first <- param1_first + d_mu

	opt_params <- expand.grid(dist1, dist2, n1, n2, param1_first, param1_second,
		param2_first, param2_second)
	names(opt_params) <- c("dist1", "dist2", "n1", "n2", "param1_first", 
		"param1_second", "param2_first", "param2_second")

	# add flags for breaking assumptions

	opt_params["H0_true"] <- FALSE
	is_H0_true <- (opt_params$param1_first == opt_params$param2_first)
	opt_params$H0_true[is_H0_true] <- TRUE

	opt_params["equal_variance"] <- FALSE
	is_equal_variance <- (opt_params$param1_second == opt_params$param2_second)
	opt_params$equal_variance[is_equal_variance] <- TRUE

	opt_params["normal_dists"] <- FALSE
	is_normal_dists <- ((opt_params$dist1 == "rnorm") && (opt_params$dist2 == "rnorm"))
	opt_params$normal_dists[is_normal_dists] <- TRUE

	opt_params["balanced_sample"] <- FALSE
	is_balanced_sample <- (opt_params$n1 == opt_params$n2)
	opt_params$balanced_sample[is_balanced_sample] <- TRUE

	opt_params["same_distfun"] <- FALSE
	is_same_distfun <- (opt_params$dist1 == opt_params$dist2)
	opt_params$same_distfun[is_same_distfun] <- TRUE

	opt_params["small_sample"] <- FALSE
	is_small_sample <- ((opt_params$n1 + opt_params$n2) < 30 )
	opt_params$small_sample[is_small_sample] <- TRUE

	return(opt_params)
}

# we need to select parameters differently for each distribution
select_params <- function(param_vec)
{

if ((param_vec[,"dist1"] == "rnorm"))
{
	params1 <- list(n=as.numeric(param_vec[,"n1"]), mean=as.numeric(param_vec[,"param1_first"]), sd = as.numeric(param_vec[,"param1_second"]))
} else {

}


if ((param_vec[,"dist2"] == "rnorm"))
{
	params2 <- list(n=as.numeric(param_vec[,"n2"]), mean=as.numeric(param_vec[,"param2_first"]), sd = as.numeric(param_vec[,"param2_second"]))
} else {

}

res <- list(dist1 = as.character(param_vec[,"dist1"]), dist2 = as.character(param_vec[,"dist2"]), params1=params1, params2=params2)
return(res)
}


opt_params <- create_parametrization()
res <- list()
for (row in 1:length(opt_params$dist1))
{
	param_vec <- opt_params[row,]
	selected_param <- select_params(param_vec)
	res <- simulate_sample(selected_param$dist1, selected_param$dist2, selected_param$params1, selected_param$params2)
}

# x <- apply(opt_params,1,select_params)







