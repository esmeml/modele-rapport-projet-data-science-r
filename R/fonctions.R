# Fonctions du projet
#
# Rangez ici les fonctions de votre analyse (préparation des données, calcul
# d'indicateurs, graphiques...). Elles sont chargées au début de rapport.qmd
# avec source("R/fonctions.R").

# Charge le jeu de données principal du projet n° `projet` (1 à 7, voir le
# document des projets) et le renvoie sous forme de tableau de données.
charger_donnees <- function(projet) {
  verifier_package <- function(package) {
    if (!requireNamespace(package, quietly = TRUE)) {
      stop("Installer d'abord le package ", package, " : install.packages(\"",
           package, "\")", call. = FALSE)
    }
  }
  charger <- function(nom, package) {
    verifier_package(package)
    environnement <- new.env()
    utils::data(list = nom, package = package, envir = environnement)
    environnement[[nom]]
  }

  switch(as.character(projet),
    "1" = charger("marketing", "datarium"),       # mix marketing multicanal
    "2" = charger("customerSat", "bayesm"),       # satisfaction client
    "3" = charger("Caravan", "ISLR"),             # réponse à une offre
    "4" = charger("Carseats", "ISLR"),            # efficacité publicitaire
    "5" = lire_boutique_commandes(),              # valeur client (boutique en ligne)
    "6" = charger("Scotch", "bayesm"),            # positionnement des marques
    "7" = charger("OJ", "ISLR"),                  # prix, promotions et choix de marque
    stop("Numéro de projet inconnu : ", projet, " (attendu : 1 à 7)", call. = FALSE)
  )
}

# Projet 5 : les fichiers CSV de la boutique en ligne doivent être placés dans
# le dossier donnees/ (voir donnees/README.md).
lire_boutique <- function(table) {
  chemin <- file.path("donnees", paste0("boutique_", table, ".csv"))
  if (!file.exists(chemin)) {
    stop("Fichier introuvable : ", chemin, " (voir donnees/README.md)", call. = FALSE)
  }
  utils::read.csv(chemin, fileEncoding = "UTF-8")
}

# Tableau des commandes enrichi des informations sur les clients (une ligne par
# commande). Les tables boutique_categories et boutique_campagne se lisent avec
# lire_boutique("categories") et lire_boutique("campagne").
lire_boutique_commandes <- function() {
  commandes <- lire_boutique("commandes")
  clients <- lire_boutique("clients")
  commandes$date <- as.Date(commandes$date)
  clients$date_inscription <- as.Date(clients$date_inscription)
  merge(commandes, clients, by = "client_id", all.x = TRUE)
}

# Racine de l'erreur quadratique moyenne, pour évaluer une prédiction numérique
rmse <- function(observe, predit) {
  sqrt(mean((observe - predit)^2, na.rm = TRUE))
}
