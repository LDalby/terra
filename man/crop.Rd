\name{crop}

\docType{methods}

\alias{crop}
\alias{crop,SpatRaster-method}
\alias{crop,SpatRasterDataset-method}
\alias{crop,SpatVector-method}

\title{Cut out a geographic subset}

\description{
Cut out a part of a SpatRaster with a SpatExtent, or another object from which an extent can be obtained. With a SpatRaster you can only extract rectangular areas, but see \code{\link{mask}} for setting cell values within SpatRaster to \code{NA}.

You can crop a SpatVector with a rectangle, or with another vector (if these are not polygons, the minimum convex hull is used). Unlike with \code{\link{intersect}} the geometries and attributes of \code{y} are not transferred to the output.
}

\usage{
\S4method{crop}{SpatRaster}(x, y, snap="near", mask=FALSE, filename="", ...)

\S4method{crop}{SpatRasterDataset}(x, y, snap="near", filename="", ...)

\S4method{crop}{SpatVector}(x, y)
}

\arguments{
  \item{x}{SpatRaster or SpatVector}
  \item{y}{SpatRaster, SpatVector, SpatExtent or other object that has a SpatExtent (\code{\link{ext}} returns a \code{SpatExtent})}
  \item{snap}{character. One of "near", "in", or "out". Used to align \code{y} to the geometry of \code{x}} 
  \item{mask}{logical. Should \code{y} be used to mask? Only used if \code{y} is a SpatVector}  
  \item{filename}{character. Output filename}
  \item{...}{additional arguments for writing files as in \code{\link{writeRaster}}}
}


\value{
SpatRaster
}

\seealso{\code{intersect}}

\examples{
r <- rast(xmin=0, xmax=10, ymin=0, ymax=10, nrows=25, ncols=25)
values(r) <- 1:ncell(r)
e <- ext(-5, 5, -5, 5)
rc <- crop(r, e)

# crop and mask
f <- system.file("ex/elev.tif", package="terra")
r <- rast(f)
f <- system.file("ex/lux.shp", package="terra")
v <- vect(f)
cm <- crop(r, v[9:12,], mask=TRUE)
plot(cm)
lines(v)

# crop vector
f <- system.file("ex/lux.shp", package="terra")
v <- vect(f)
e <- ext(6.15, 6.3, 49.7, 49.8)
x <- crop(v, e)
plot(x, "NAME_1")
}

\keyword{spatial}

