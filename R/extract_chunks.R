#' extract_chunks
#' 
#' Extract code chunks from a .Rmd file
#' 
#' @param filename filename
#' 
extract_chunks <- function(filename) {
  # Extract code chunks from .Rmd file
  tmp <- tempfile(fileext = ".R")
  on.exit(unlink(tmp))
  knitr::purl(filename, tmp, documentation = 1)
  code <- readLines(tmp)
  start <- grep("^## -*", code)
  end <- vapply(seq_len(length(start)), function(x) 
    dplyr::if_else(x == length(start), 
                   as.numeric(length(code)), 
                   start[x + 1] - 1), numeric(1))
  index <- cbind.data.frame(start, end)
  chunks <- lapply(seq_len(nrow(index)), function(x) 
    code[index$start[x]:index$end[x]])
  
  # Extract chunk label from header
  labels <- lapply(chunks, function(x) 
    strsplit(x[1], ",")[[1]][1] %>% 
      gsub("^## ----", "", .) %>% 
      gsub("-+$", "", .)) %>% 
    unlist()
  names(chunks) <- labels
  
  # Remove chunk header
  chunks <- lapply(chunks, function(x) x[-1])
}
