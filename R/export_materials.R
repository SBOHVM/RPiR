#' export_materials
#'
#' @param materials materials
#' @param type content type
#'
export_materials <- function(materials, type = "exercises") {
  if (type == "exercises") {
    c(materials[grepl("practical[012][a-z]?-", materials)]#,
#      materials[grepl("practical[34][a-z]?-", materials)],
#      materials[grepl("project", materials)]
      )
  } else if (type == "lectures") {
    unique(c(materials[grepl("RPiR[12][a-z]?-", materials)]#,
#             materials[grepl("RPiR[3456789][a-z]?-", materials)],
#             materials[grepl("RPiR1[0123][a-z]?-", materials)]
             )
           )
  } else {
    stop(paste("Unknown material type:", type))
  }
}
