% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AM_find_gamma.R
\name{AM_find_gamma_NegBin}
\alias{AM_find_gamma_NegBin}
\title{Given that the prior on M is a Negative Binomial, find the \eqn{\gamma} hyperparameter of the weights
prior to match \eqn{E(K)=K*}, where \eqn{K*} is user-specified}
\usage{
AM_find_gamma_NegBin(
  n,
  r,
  p,
  Kstar = 6,
  gam_min = 0.001,
  gam_max = 10000,
  tolerance = 0.1
)
}
\arguments{
\item{n}{The sample size.}

\item{r}{The dispersion parameter \code{r} of the Negative Binomial.}

\item{p}{The probability of failure parameter \code{p} of the Negative Binomial.}

\item{Kstar}{The mean number of clusters the user wants to specify.}

\item{gam_min}{The lower bound of the interval in which \code{gamma} should lie.}

\item{gam_max}{The upper bound of the interval in which \code{gamma} should lie.}

\item{tolerance}{Level of tolerance of the method.}
}
\value{
A value of \code{gamma} such that \eqn{E(K)=K^{*}}
}
\description{
Once the prior on the number of mixture components M is assumed to be a Negative Binomial with
parameter \code{r>0} and \code{0<p<1}, with  mean is 1+ r*p/(1-p), this function adopts a \emph{bisection method}
to find the value of \code{gamma} such that the induced distribution on the number of clusters is centered around a
user specifed value \eqn{K^{*}}, i.e. the function uses a bisection method to solve for \eqn{\gamma} \insertCite{argiento2019infinity}{AntMAN}.
The user can provide a lower \eqn{\gamma_{l}} and an upper \eqn{\gamma_{u}} bound for the possible values of \eqn{\gamma}. The default values
are \eqn{\gamma_l= 10^{-3}} and \eqn{\gamma_{u}=10}.  A defaault value for the tolerance is \eqn{\epsilon=0.1}. Moreover, after a
maximum number of iteration (default is 31), the function stops warning that convergence has not bee reached.
}
\examples{
n <- 82
r <- 1
p <- 0.8571
gam_nb= AM_find_gamma_NegBin(n,r,p,Kstar=6, gam_min=0.001,gam_max=10000, tolerance=0.1)
prior_K_nb= AM_prior_K_NegBin(n,gam_nb, r, p)
prior_K_nb\%*\%1:n
}
\keyword{clusters}
\keyword{number}
\keyword{of}
\keyword{prior}
