#' export_materials
#'
#' @param materials materials
#' @param type content type
#'
export_materials <- function(materials, type = "exercises") {
  if (type == "exercises") {
    c(materials[grepl("[012].?-", materials)]#,
#      materials[grepl("[34].?-", materials)],
#      materials[grepl("project", materials)]
      )
  } else if (type == "lectures") {
    unique(c(materials[grepl("[12].?-", materials)]#,
#             materials[grepl("[3456789].?-", materials)],
#             materials[grepl("1[0123].?-", materials)]
             )
           )
  } else {
    stop(paste("Unknown material type:", type))
  }
}
