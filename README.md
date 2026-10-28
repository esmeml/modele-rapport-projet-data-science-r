# Modèle de rapport de projet — Data Science sous R

Modèles pour les deux documents écrits du projet :

- le **rapport technique**, en Quarto (`rapport.qmd`) ;
- le **résumé exécutif** de 2 pages, en LaTeX (`resume-executif.tex`).

## Utilisation

1. Copiez tout le dossier `modele-rapport` et renommez-le (par exemple `projet-groupe-3`).
2. Ouvrez `modele-rapport.Rproj` dans RStudio : le répertoire de travail est alors le dossier du projet.
3. Installez les packages nécessaires :
   - pour tous : `install.packages(c("tidyverse", "knitr", "rmarkdown"))` ;
   - projet 1 : `install.packages("datarium")` ;
   - projets 2 et 6 : `install.packages("bayesm")` ;
   - projets 3, 4 et 7 : `install.packages("ISLR")` ;
   - projet 5 : placer les fichiers CSV dans `donnees/` (voir `donnees/README.md`) ;
   - selon les méthodes utilisées : `FactoMineR`, `factoextra`, `rpart`, `randomForest`, `pROC`, `cluster`.
4. Ouvrez `rapport.qmd`, indiquez le numéro de votre projet dans le bloc `configuration`, puis cliquez sur **Render**.
5. Rédigez section par section, en suivant les encadrés « Consigne », puis supprimez-les.
6. Pour le résumé exécutif, exportez le graphique principal depuis R
   (`ggsave("figures/figure-cle.pdf", width = 7, height = 3.5)`), complétez le fichier `resume-executif.tex` puis compilez-le avec pdfLaTeX : bouton
   **Compile PDF** de RStudio, ou `pdflatex resume-executif.tex`. 

## Contenu

| Fichier | Rôle |
|:--------|:-----|
| `rapport.qmd` | le rapport (texte, code et résultats) |
| `R/fonctions.R` | fonctions du projet ; `charger_donnees()` charge les données de chaque sujet |
| `references.bib` | références bibliographiques citées dans le rapport |
| `resume-executif.tex` | résumé exécutif (LaTeX, 2 pages au maximum) |
| `figures/` | graphiques exportés pour le résumé exécutif |
| `donnees/` | fichiers de données éventuels |
