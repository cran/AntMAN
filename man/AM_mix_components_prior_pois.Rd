% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AM_mix_components_prior.R
\name{AM_mix_components_prior_pois}
\alias{AM_mix_components_prior_pois}
\title{Generate a configuration object for a Poisson prior on the number of mixture components}
\usage{
AM_mix_components_prior_pois(a = NULL, b = NULL, Lambda = NULL, init = NULL)
}
\arguments{
\item{a}{The shape parameter \code{a} of  the \eqn{Gamma(a,b)} prior distribution.}

\item{b}{The rate  parameter \code{b} of the \eqn{Gamma(a,b)} prior distribution.}

\item{Lambda}{It allows to set the  hyperparameter \eqn{\Lambda} to be assigned a fixed value.}

\item{init}{The  initial value for \eqn{\Lambda}, when specifying \code{a} and \code{b}.}
}
\value{
An \code{\link{AM_mix_components_prior}} object. This is a configuration list to be used as \code{mix_components_prior} argument for \code{\link{AM_mcmc_fit}}.
}
\description{
This function generates a configuration object for a Shifted Poisson prior on the number
of mixture components such that
\deqn{q_M(m)=     Pr (M=m)= \frac{e^{-\Lambda}\Lambda^{m-1} }{(m-1)!}    ,      \quad m=1,2,3,\ldots}
The hyperparameter \eqn{\Lambda} can either be fixed using \code{Lambda}
or assigned a \eqn{Gamma(a,b)} prior distribution with \code{a} and \code{b}.
In AntMAN we assume the following parametrization of the Gamma density:
\deqn{p(x\mid a,b )= \frac{b^a x^{a-1}}{\Gamma(a)} \exp\{ -bx \}, \quad x>0.}
}
\details{
If no arguments are provided, the default is a prior distribution with \code{a = 1} and \code{b = 1}.
}
\examples{

components_prior = AM_mix_components_prior_pois (init=3,  a=1, b=1) 

}
\seealso{
\code{\link{AM_mcmc_fit}}
}
\keyword{prior}
