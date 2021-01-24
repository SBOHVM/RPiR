#' export_materials
#'
#' @param materials materials
#' @param type content type
#'
export_materials <- function(materials, type = "exercises") {
  if (type == "exercises") {
    materials[grepl("[01].?-", materials)]
  } else if (type == "lectures") {
    materials[grepl("[123].?-", materials)]
  } else {
    stop(paste("Unknown material type:", type))
  }
}
