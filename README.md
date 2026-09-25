# Simple Gradle Java APP
Simple Java App Created with Gradle

Please read this Article to make the best use of this git repo

[https://adityasridhar.com/posts/how-to-get-started-with-gradle](https://adityasridhar.com/posts/how-to-get-started-with-gradle)

## Cloning the Code

Clone this code into your local using the following command

`git clone https://github.com/aditya-sridhar/simple-gradle-java-app.git`

## Building the Application 

The application can be built using the following command 

**Windows** : `gradlew.bat build`

**Linux/MacOS**: `./gradlew build`

## Running the Application

The application can be run using the following command 

**Windows** : `gradlew.bat run`

**Linux/MacOS**: `./gradlew run`

## Tests

After the Application is built using the Build command, the test results report can be found in below file
*build/reports/tests/test/index.html*

# Réponses au TP - Gestion de code source avec Git

## 1. Options des commandes Git
- `git init --bare` : Crée un dépôt sans répertoire de travail (fichiers sources non visibles directement), servant uniquement de serveur central pour recevoir et distribuer des pushs.
- `git fetch` : Télécharge les nouveaux commits et branches depuis le dépôt distant sans modifier la copie de travail locale.
- `git pull` : Équivaut à `git fetch` suivi immédiatement d'un `git merge` pour fusionner les nouveautés distantes dans la branche locale courante.

## 2. Qu'est-ce qu'un commit atomique ?
Un commit atomique est un commit qui n'embarque qu'une seule modification logique, cohérente et indivisible (par exemple une fonctionnalité précise ou la correction d'un bug unique). Il doit laisser le projet dans un état stable et compilable. Cela facilite la relecture (code review), le débogage (via `git bisect`) et les retours en arrière (`git revert`).

## 3. Comment purger un secret d'un dépôt Git ?
Supprimer simplement un fichier contenant un mot de passe ou une clé API dans un nouveau commit ne suffit pas, car le secret reste présent dans tout l'historique de Git. Pour le purger définitivement :
1. Réécrire l'historique du dépôt avec un outil moderne comme **git-filter-repo** (ou historiquement BFG Repo-Cleaner / `git filter-branch`).
2. Révoquer et renouveler immédiatement le secret (clé API, mot de passe) auprès du fournisseur du service.
3. Forcer la mise à jour des branches distantes avec `git push --force`.

## 4. Comment prévenir les fuites de secrets ?
- Configurer rigoureusement le fichier `.gitignore` pour exclure les fichiers sensibles (`.env`, `credentials.json`, `*.pem`, etc.).
- Utiliser des hooks de pré-commit locaux couplés à des outils comme **gitleaks** ou **trufflehog** pour bloquer la validation d'un commit contenant des secrets.
- Intégrer des scanners de sécurité dans les pipelines CI/CD (GitHub Secret Scanning, GitLab Secret Detection).
- Passer par des variables d'environnement ou des gestionnaires de secrets (Vault, AWS Secrets Manager) plutôt que d'écrire des identifiants en dur dans le code.
