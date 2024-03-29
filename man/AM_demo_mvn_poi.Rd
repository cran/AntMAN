% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AM_demo.R
\name{AM_demo_mvn_poi}
\alias{AM_demo_mvn_poi}
\title{Returns an example of \code{\link{AM_mcmc_fit}} output produced by the multivariate gaussian model}
\usage{
AM_demo_mvn_poi()
}
\value{
A list containing the following items:
\itemize{
\item the vector (or matrix) containing the synthetic data used to fit the model.
\item the vector containing the final cluster assignment of each observation.
\item an \code{\link{AM_mcmc_output}} object, which is the typical output of \code{\link{AM_mcmc_fit}}.
}
}
\description{
This function allows us to generate a sample output of fitting the multivariate Gaussian model. No arguments are needed to be passed.
The purpose of this function is to serve as a demo for users to understand the model's output, without diving too deep into details. By default,
this demo generates a sample dataset of dimension 500x2, where the MCMC sampler is specified to run for 2000 iterations, with a burn-in of 1000, and a thinning interval of 10. All possible outputs
that can be produced by \code{\link{AM_mcmc_fit}} are returned (see return value below).
}
\examples{
\donttest{
 mvn_output <- AM_demo_mvn_poi()
}
}
\keyword{demo}
