% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SOmap_auto.R
\name{SOmap_auto}
\alias{SOmap_auto}
\title{Custom Southern Ocean map}
\usage{
SOmap_auto(
  x,
  y,
  centre_lon = NULL,
  centre_lat = NULL,
  target = "stere",
  dimXY = c(512, 512),
  bathy = TRUE,
  land = TRUE,
  land_col = "black",
  ice = TRUE,
  ice_col = "black",
  input_points = TRUE,
  input_lines = TRUE,
  graticule = TRUE,
  expand = 0.05,
  contours = FALSE,
  levels = c(-500, -1000, -2000),
  ppch = 19,
  pcol = 2,
  pcex = 1,
  bathyleg = FALSE,
  llty = 1,
  llwd = 1,
  lcol = 1,
  gratlon = NULL,
  gratlat = NULL,
  gratpos = "all",
  ...
)
}
\arguments{
\item{x}{optional input data longitudes. \code{x} can also be a \code{Raster} or \code{Spatial} object, in which case the extent of \code{x} will be used for the map, but note that the contents of \code{x} will not be plotted automatically (use \code{SOplot} to do so)}

\item{y}{optional input data latitudes}

\item{centre_lon}{optional centre longitude (of the map projection, also used to for plot range if \code{expand = TRUE})}

\item{centre_lat}{as per \code{centre_lon}}

\item{target}{optional projection family (default is \code{stere}ographic), or full PROJ string (see Details)}

\item{dimXY}{dimensions of background bathmetry (if used), a default is provided}

\item{bathy}{logical: if \code{TRUE}, plot bathymetry. Alternatively, provide the bathymetry data to use as a \code{Raster} object}

\item{land}{logical: if \code{TRUE}, plot coastline. Alternatively, provide the coastline data to use as a \code{Spatial} object}

\item{land_col}{character: colour to use for plotting the coastline}

\item{ice}{logical: if \code{TRUE}, plot ice features (ice shelves, glacier tongues, and similar)}

\item{ice_col}{character: colour to use for ice features}

\item{input_points}{add points to plot (of x, y)}

\item{input_lines}{add lines to plot   (of x, y)}

\item{graticule}{flag to add a basic graticule}

\item{expand}{fraction to expand plot range (default is 0.05, set to zero for no buffer, may be negative)}

\item{contours}{logical: add contours?}

\item{levels}{numeric: contour levels to use if \code{contours} is \code{TRUE}}

\item{ppch}{set point character (default=19)}

\item{pcol}{set point color (default=19)}

\item{pcex}{set point cex (default=1)}

\item{bathyleg}{optional bathymetry legend (default=FALSE)}

\item{llty}{set line type}

\item{llwd}{set line width}

\item{lcol}{set line color}

\item{gratlon}{longitude values for graticule meridians}

\item{gratlat}{latitude values for graticule parallels}

\item{gratpos}{positions (sides) of graticule labels}

\item{...}{reserved, checked for defunct and deprecated usage}
}
\value{
An object of class SOmap_auto, containing the data and other details required to generate the map. Printing or plotting the object will cause it to be plotted.
}
\description{
Given some minimal input information, \code{SOmap_auto} will attempt to guess an appropriate extent and projection to use. For demonstration purposes, run the function without any inputs at all and it will use random location data.
}
\details{
To input your data, use input locations as \code{x} (longitude) and \code{y} (latitude) values. There must be at least two locations. The \code{x} input object can also be provided as a \code{Raster} or \code{Spatial} object, in which case the extent of \code{x} will be used for the map, but note that the contents of \code{x} will not be plotted automatically (use \code{SOplot} to do so).

Try \code{target} families such as 'lcc', 'laea', 'gnom', 'merc', 'aea' if feeling adventurous.
}
\examples{
\dontrun{
  SOmap_auto(c(0, 50), c(-70, -50))
  SOmap_auto(runif(10, 130, 200), runif(10, -80, -10))
  SOplot(c(147, 180), c(-42, -60), pch = 19, cex = 2,col = "firebrick")
  SOmap_auto(runif(10, 130, 200), runif(10, -85, -60))

  ## save the result to explore later!
  protomap <- SOmap_auto(runif(10, 60, 160), runif(10, -73, -50))

  SOmap_auto(runif(50, 40, 180), runif(50, -73, -10), family = "laea", centre_lat = -15,
                input_lines = FALSE)
}
}
