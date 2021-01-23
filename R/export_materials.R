#' export_materials
#'
#'
export_materials <- function(materials, type = "exercises") {
  if (type == "exercises") {
    materials[grepl("1.?-", materials)]
  } else if (type == "lectures") {
    materials[grepl("[123].?-", materials)]
  } else {
    stop(paste("Unknown material type:", type))
  }
}
