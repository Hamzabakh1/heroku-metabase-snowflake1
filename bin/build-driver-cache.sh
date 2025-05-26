#!/usr/bin/env bash
set -euo pipefail

# Define Snowflake JDBC version
SNOWFLAKE_JDBC_VERSION="3.23.0"
JAR_URL="https://repo1.maven.org/maven2/net/snowflake/snowflake-jdbc/${SNOWFLAKE_JDBC_VERSION}/snowflake-jdbc-${SNOWFLAKE_JDBC_VERSION}.jar"
PLUGIN_DIR="/app/plugins"

# Fetch driver if not already present (idempotent)
mkdir -p "$PLUGIN_DIR"
if [ ! -f "$PLUGIN_DIR/snowflake-jdbc.jar" ]; then
  curl -fsSL "$JAR_URL" -o "$PLUGIN_DIR/snowflake-jdbc.jar"
  echo "Downloaded Snowflake JDBC driver version $SNOWFLAKE_JDBC_VERSION"
else
  echo "Snowflake JDBC driver already present, skipping download"
fi