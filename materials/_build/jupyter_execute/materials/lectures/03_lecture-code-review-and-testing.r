library(testthat)

#' scatter2d 
#'
#' A short-cut function for creating 2 dimensional scatterplots via ggplot2.
#'
#' @param data data.frame or tibble
#' @param x unquoted column name to plot on the x-axis from data data.frame or tibble
#' @param y unquoted column name to plot on the y-axis from data data.frame or tibble
#'
#' @return
#' @export
#'
#' @examples
#' scatter2d(mtcars, hp, mpg)
scatter2d <- function(data, x, y) {
    ggplot2::ggplot(data, ggplot2::aes(x = {{x}}, y = {{y}})) +
        ggplot2::geom_point()
}

plot2d <- scatter2d(mtcars, hp, mpg)
plot2d

#plot2d$layers
#plot2d$layers[[1]]$geom
class(plot2d$layers[[1]]$geom)

# x-axes
#plot$mapping$x
rlang::get_expr(plot$mapping$x)

# y-axes
#plot$mapping$y
rlang::get_expr(plot$mapping$y)

test_that('Plot should use geom_point and map x to x-axis, and y to y-axis.', {
    p <- scatter2d(mtcars, hp, mpg)
    expect_true("GeomPoint" %in% c(class(p$layers[[1]]$geom)))
    expect_true("hp"  == rlang::get_expr(p$mapping$x))
    expect_true("mpg" == rlang::get_expr(p$mapping$y))
})
