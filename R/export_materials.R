#' export_materials
#'
#' @param materials materials
#' @param type content type
#'
export_materials <- function(materials, type = "exercises") {
  if (type == "exercises") {
    c(materials[grepl("practical[A123][a-z]?-", materials)]#,
#      materials[grepl("practical4[a-z]?-", materials)],
#      materials[grepl("project", materials)]
      )
  } else if (type == "lectures") {
    unique(c(materials[grepl("RPiR[12345678][a-z]?-", materials)]#,
#             materials[grepl("RPiR9[a-z]?-", materials)],
#             materials[grepl("RPiR1[0123][a-z]?-", materials)]
             )
           )
  } else {
    stop(paste("Unknown material type:", type))
  }
}
