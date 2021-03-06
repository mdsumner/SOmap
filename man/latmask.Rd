% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/latmask.R
\name{latmask}
\alias{latmask}
\title{Latitude mask for polar rasters.}
\usage{
latmask(x, latitude = 0, southern = TRUE)
}
\arguments{
\item{x}{A raster layer.}

\item{latitude}{maximum latitude (effectively a minimum latitude if southern = FALSE)}

\item{southern}{flag for whether south-polar context is used, default is TRUE}
}
\description{
Latitude mask for polar projections; written by M.D. Sumner and part of the spex package.
}
\examples{
plot(latmask(ice, -60))

}
