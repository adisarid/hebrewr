# Word count on all files
files <- dir(pattern = "*.qmd|*.rmd|*.Rmd", full.names = T)

total_words <- purrr::map(
  files, 
  ~{
    tmp <- paste(
      readr::read_lines(.x),
      collapse = " "
    )

    stringr::str_split(tmp, pattern = "\\s+") |> unlist() |> length()

  }
) |> 
  unlist()

cat(glue::glue("Total words so far: {sum(total_words)}"))
