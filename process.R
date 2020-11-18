#' process.R
#'
#' Short example showing batch processing on a set of CSV files nested within
#' a series of subfolders. See README.md for a little more info.

# Get a list of the files
csv_files <- list.files("data",
                        pattern = ".csv",  # Limit to just files ending in .csv
                        recursive = TRUE,  # Search within subfolders
                        full.names = TRUE) # Return full paths
csv_files

# Iterate with a `for` loop, printing info about each file as we go
for (i in seq_along(csv_files)) {
  csv_df <- read.csv(csv_files[i])
  print(paste(csv_files[i], "has", nrow(csv_df), "row(s)"))
}

# Iterate with a `for` loop, keeping a running sum of the number of rows
total_rows <- 0

for (i in seq_along(csv_files)) {
  csv_df <- read.csv(csv_files[i])
  total_rows <- total_rows + nrow(csv_df)
}

total_rows

#' What if, instead of printing info, we wanted to create a summary table
#'
#' The `for` loop approach works for certain use cases but the *apply family
#' of functions are a much more idiomatic (i.e., natural) way in R to process
#' things in batches

#' We'll use `lapply` here to iterate over the files and return some information
#' about each file as a list
#'
#' First, lapply works like this:

lapply(c("one", "two", "three"), nchar)

#' Above, we run the function `nchar`, which counts the number of characters
#' in a string, on each element of the vector c("one", "two", "three")
#'
#' We can also pass our own, anonymous function, like below:
result <- lapply(csv_files, function(csv_file) {
  csv_df <- read.csv(csv_file)
  data.frame(path = csv_file, nrows = nrow(csv_df))
})

#' The anonymous function is the part that starts with `function(csv_file...`
#' and ends with the closing `}`.
#'
#' Last, we want to join them together, which can be done with `do.call`.
#' `do.call` is related to `lapply` but a bit different. It lets us call a
#' function (here, `rbind`) with arguments that are saved in another variable.
do.call(rbind, result)


