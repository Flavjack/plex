
if(file.exists("plex.Rmd"))
  {file.remove("plex.Rmd")}
if(dir.exists("libs"))
  {fs::dir_delete("libs")}
if(dir.exists("docs"))
  {fs::dir_delete("docs")}
if(file.exists("rticles-template-for-articles-using-bookdown-package-.html"))
  {file.remove("rticles-template-for-articles-using-bookdown-package-.html")}


