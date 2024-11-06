package_names.vec <- c("glue","tidyverse")
package_prep <- \(names.vec)
{
  for (name in names.vec)
  {
    if ( !require(name,character.only = TRUE)) renv::install(name)
  }
}
package_names.vec |> package_prep()
