# Use a specific stable Metabase OSS version to avoid migrations mismatch
FROM metabase/metabase:v0.54.10.x

# Metadata
LABEL maintainer="Hamza Bakh <email>"
LABEL version="v0.54.10.x"

# Switch to root to install driver
USER root
WORKDIR /app

# Java memory options
ENV JAVA_TOOL_OPTIONS="-Xmx300m"

# Copy and install Snowflake JDBC driver
COPY bin/build-driver-cache.sh /app/bin/build-driver-cache.sh
RUN chmod +x /app/bin/build-driver-cache.sh \
    && /app/bin/build-driver-cache.sh

# Copy entrypoint
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

# Revert to default Metabase user
USER 1000

# Launch Metabase via entrypoint
ENTRYPOINT ["/app/docker-entrypoint.sh"]