#' export_materials
#'
#' @param materials materials
#' @param type content type
#'
export_materials <- function(materials, type = "exercises") {
  if (type == "exercises") {
    c(materials[grepl("0.?-", materials)],
      materials[grepl("1.?-[12345]", materials)]#,
#      materials[grepl("[234].?-", materials)],
#      materials[grepl("project", materials)]
      )
  } else if (type == "lectures") {
    unique(c(materials[grepl("1.?-", materials)]#,
#             materials[grepl("[23456789].?-", materials)],
#             materials[grepl("1[0123].?-", materials)]
             )
           )
  } else {
    stop(paste("Unknown material type:", type))
  }
}
