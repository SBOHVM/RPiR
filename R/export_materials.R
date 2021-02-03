#' export_materials
#'
#' @param materials materials
#' @param type content type
#'
export_materials <- function(materials, type = "exercises") {
  if (type == "exercises") {
    c(materials[grepl("A.?-", materials)],
      materials[grepl("1.?-[12345]", materials)],
      materials[grepl("2.?-", materials)],
      materials[grepl("3.?-", materials)])
  } else if (type == "lectures") {
    materials[grepl("[12345678].?-", materials)]
  } else {
    stop(paste("Unknown material type:", type))
  }
}
