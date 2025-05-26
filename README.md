# heroku-metabase-snowflake

**Prérequis**
- Docker Desktop installé et en cours d'exécution (assurez-vous que le moteur Docker est démarré).
- Heroku CLI à jour avec le plugin `container` (`heroku plugins:install @heroku-cli/plugin-container-registry`).
- Sur Windows, vérifiez que Docker utilise WSL2 ou le backend Windows correct.

## Résolution des erreurs courantes
- **R14 (Memory quota exceeded)** : on limite la mémoire à 300 Mo via `JAVA_TOOL_OPTIONS=-Xmx300m`.
- **Downgrade detected** : on fixe `METABASE_VERSION` à la même version utilisée pour générer la base de données (ex. `0.54.8`).

## Setup
1. **Cloner**
   ```bash
git clone https://github.com/Hamzabakh1/heroku-metabase-snowflake.git
cd heroku-metabase-snowflake