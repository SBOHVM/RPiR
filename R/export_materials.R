#' export_materials
#'
#' @param materials materials
#' @param type content type
#'
#' @keywords internal
export_materials <- function(materials, type = "exercises") {
  if (type == "exercises") {
    c(materials[grepl("practical[A1234][a-z]?-", materials)]#,
#      materials[grepl("project", materials)]
      )
  } else if (type == "lectures") {
    unique(c(materials[grepl("RPiR[123456789][a-z]?-", materials)],
             materials[grepl("RPiR1[01][a-z]?-", materials)]
#             materials[grepl("RPiR1[23][a-z]?-", materials)]
    )
    )
  } else {
    stop(paste("Unknown material type:", type))
  }
}
