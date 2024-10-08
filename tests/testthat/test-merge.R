context("merging of SOmap objects")

test_that("merging works", {
    mymap <- SOmap(bathy_legend = "space") ## leave space for bathy legend
    mylegend <- SOleg(x = runif(100), position = "topright", col = hcl.colors(80, "Viridis"),
                      breaks = c(0.1, 0.2, 0.5, 0.9), trim = -45, label = "Thing",
                      rnd = 1, type = "continuous")
    mymgmt <- SOmanagement(eez = TRUE, basemap = mymap)
    merged <- SOmerge(mymap, mymgmt, mylegend)
    ## should get an object of class SOmap back
    expect_is(merged, "SOmap")
    ## it should have only one projection, target, and plot_sequence component
    expect_equal(sum(names(merged) == "projection"), 1L)
    expect_identical(mymap$projection, merged$projection)
    expect_equal(sum(names(merged) == "target"), 1L)
    expect_identical(mymap$target, merged$target)
    expect_equal(sum(names(merged) == "plot_sequence"), 1L)
    expect_false(identical(mymap$plot_sequence, merged$plot_sequence))

    ## must include exactly one SOmap object
    expect_error(SOmerge(mymap, mymap), "exactly one")
    expect_error(SOmerge(mylegend, mymgmt), "exactly one")

    ## inconsistent projections
    mymap_auto <- SOmap_auto(c(60, 80), c(-56, -45))
    mymgmt_auto <- SOmanagement(eez = TRUE, basemap = mymap_auto)
    ## won't work
    expect_error(SOmerge(mymap, mymgmt_auto, reproject = FALSE), "different projections")
    ## unless we ask for it
    merged <- SOmerge(mymap, mymgmt_auto, reproject = TRUE)
})
