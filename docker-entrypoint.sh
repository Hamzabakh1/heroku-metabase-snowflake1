#!/usr/bin/env bash
set -euo pipefail

# Bind Heroku port to Metabase
if [ -n "${PORT:-}" ]; then
  export MB_JETTY_PORT="$PORT"
fi

# Use Heroku DATABASE_URL
if [ -n "${DATABASE_URL:-}" ]; then
  export MB_DB_CONNECTION_URI="$DATABASE_URL"
fi

# Build Java options
JAVA_OPTS="${JAVA_TOOL_OPTIONS:-}"
JAVA_OPTS+=" -XX:+UnlockExperimentalVMOptions"
JAVA_OPTS+=" -XX:+UseContainerSupport"
JAVA_OPTS+=" -XX:-UseGCOverheadLimit"
JAVA_OPTS+=" -XX:+UseG1GC"
JAVA_OPTS+=" -XX:+UseStringDeduplication"
JAVA_OPTS+=" -server"

# Log Java options in startup logs
echo "Starting Metabase with JAVA_OPTS: $JAVA_OPTS"

# Execute Metabase jar
exec java $JAVA_OPTS -jar /app/metabase.jar