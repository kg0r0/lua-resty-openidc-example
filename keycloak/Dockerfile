FROM jboss/keycloak:4.8.3.Final

COPY *.json /opt/jboss/import/

EXPOSE 8080

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

# Export
#CMD ["-b", "0.0.0.0", "-Dkeycloak.migration.action=export", "-Dkeycloak.migration.provider=dir", "-Dkeycloak.migration.dir=/tmp/"]
# Import
CMD ["-b", "0.0.0.0", "-Dkeycloak.migration.action=import", "-Dkeycloak.migration.provider=dir", "-Dkeycloak.migration.dir=/opt/jboss/import/", "-Dkeycloak.migration.strategy=OVERWRITE_EXISTING" ]
# Normal
#CMD ["-b", "0.0.0.0"]