% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_rf_cv.R
\name{my_rf_cv}
\alias{my_rf_cv}
\title{Random Forest with K-fold Cross Validation}
\usage{
my_rf_cv(k)
}
\arguments{
\item{k}{the number of folds to use in cross-validation}
}
\value{
the average mse of the model across all folds
}
\description{
This function predicts the body mass of penguins using the bill length,
the bill depth, and the flipper length. It is not generalizeable.
}
\examples{
my_rf_cv(3)
my_rf_cv(5)

}
\keyword{inference}
