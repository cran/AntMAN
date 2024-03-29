% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AM_mix_hyperparams.R
\name{AM_mix_hyperparams_uninorm}
\alias{AM_mix_hyperparams_uninorm}
\title{univariate Normal mixture hyperparameters}
\usage{
AM_mix_hyperparams_uninorm(m0, k0, nu0, sig02)
}
\arguments{
\item{m0}{The \eqn{m_0} hyperparameter.}

\item{k0}{The \eqn{\kappa_0} hyperparameter.}

\item{nu0}{The \eqn{\nu_0} hyperparameter.}

\item{sig02}{The \eqn{\sigma^2_0} hyperparameter.}
}
\value{
An \code{\link{AM_mix_hyperparams}} object. This is a configuration list to be used as \code{mix_kernel_hyperparams} argument for \code{\link{AM_mcmc_fit}}.
}
\description{
Generate a configuration object that specifies a univariate Normal mixture kernel, where users can specify the hyperparameters of the Normal-InverseGamma conjugate prior.
As such, the kernel is a Gaussian distribution with mean \eqn{\mu} and variance \eqn{\sigma^2}. The prior on \eqn{(\mu,\sigma^2)} the Normal-InverseGamma:
\deqn{\pi(\mu,\sigma^2\mid m_0,\kappa_0,\nu_0,\sigma^2_0) = \pi_{\mu}(\mu|\sigma^2,m_0,\kappa_0)\pi_{\sigma^2}(\sigma^2\mid \nu_0,\sigma^2_0),}
\deqn{\pi_{\mu}(\mu|\sigma^2,m_0,\kappa_0)  =\frac{\sqrt{\kappa_0}}{\sqrt{2\pi\sigma^2},} 
 \exp^{-\frac{\kappa_0}{2\sigma^2}(\mu-m_0)^2 }, \qquad \mu\in\mathcal{R},}
\deqn{\pi_{\sigma^2}(\sigma^2\mid \nu_0,\sigma^2_0)= {\frac {\sigma_0^{2^{\nu_0 }}}{\Gamma (\nu_0 )}}(1/\sigma^2)^{\nu_0 +1}\exp \left(-\frac{\sigma_0^2}{\sigma^2}\right), \qquad \sigma^2>0.}
}
\details{
\eqn{m_0} corresponds \code{m0},
\eqn{\kappa_0} corresponds \code{k0},
\eqn{\nu_0} corresponds \code{nu0}, and
\eqn{\sigma^2_0} corresponds \code{sig02}.

If hyperparameters are not specified, the default is \code{m0=0}, \code{k0=1}, \code{nu0=3}, \code{sig02=1}.
}
\examples{
     
     #### This example ...
     
     data(galaxy)
     y_uvn = galaxy
     mixture_uvn_params = AM_mix_hyperparams_uninorm  (m0=20.83146, k0=0.3333333,
                                                       nu0=4.222222, sig02=3.661027)
     
     mcmc_params        = AM_mcmc_parameters(niter=2000, burnin=500, thin=10, verbose=0)
     components_prior   = AM_mix_components_prior_pois (init=3,  a=1, b=1) 
     weights_prior      = AM_mix_weights_prior_gamma(init=2, a=1, b=1)
     
     fit <- AM_mcmc_fit(
       y = y_uvn,
       mix_kernel_hyperparams = mixture_uvn_params,
       mix_components_prior =components_prior,
       mix_weight_prior = weights_prior,
       mcmc_parameters = mcmc_params)
     
     summary (fit)
     plot (fit)
     
}
