
get_mp3 <- function(urls, outdir = ".") {
  # S'assurer que le dossier existe
  if (!dir.exists(outdir)) dir.create(outdir, recursive = TRUE)
  
  # Pour chaque URL
  for (u in urls) {
    cmd <- paste(
      "yt-dlp",
      "-x --audio-format mp3 --audio-quality 0",
      "--write-info-json",
      "-o", shQuote(file.path(outdir, "%(title)s.%(ext)s")),
      shQuote(u)
    )
    system(cmd)
  }
  
  # Supprimer les fichiers .info.json créés par yt-dlp
  json_files <- list.files(outdir, pattern = "\\.info\\.json$", full.names = TRUE)
  if (length(json_files) > 0) file.remove(json_files)
  
  # Retourner la liste des MP3 téléchargés
  list.files(outdir, pattern = "\\.mp3$", full.names = TRUE)
}

urls <- c(
  "https://youtu.be/3Be2vYp0yNo?si=GWbncVQYAo9i6lwt",
  "https://youtu.be/QpJgtAnZgjw?si=kcxggQpZ7MaEuDLa"
)

mp3_files <- get_mp3(urls, outdir = "C:/Users/antsa.rajaonah/Music")
print(mp3_files)
