#!/usr/bin/env bash
set -e

env_missing() { echo "missing $* environment variable"; exit 1; }

if [ -n "$DATA_DICTIONARY_API_HOST" ]; then
  ENVSTR="NEXT_PUBLIC_HASURA_URL=$DATA_DICTIONARY_API_HOST"
else
  env_missing "DATA_DICTIONARY_API_HOST"
fi

if [ -n "$HASURA_GRAPHQL_ADMIN_SECRET" ]; then
  ENVSTR="$ENVSTR\nNEXT_PUBLIC_HASURA_ADMIN_SECRET=$HASURA_GRAPHQL_ADMIN_SECRET"
else
  env_missing "HASURA_GRAPHQL_ADMIN_SECRET"
fi

if [ -n "$DATA_DICTIONARY_PORT" ]; then
  ENVSTR="$ENVSTR\nNEXT_PUBLIC_REACT_APP_URL=http://localhost:$DATA_DICTIONARY_PORT"
else
  ENVSTR="$ENVSTR\nNEXT_PUBLIC_REACT_APP_URL=http://localhost:3000"
fi


# Changing nextJs basepath causes the program to crash
# https://github.com/hasura/data-dictionary/issues/6
#cat > next.config.js <<- JAVASCRIPT
#module.exports = {
  #basePath: '$DATA_DICTIONARY_BASE_PATH',
  #typescript: {
    #ignoreBuildErrors: true
  #},
  #serverRuntimeConfig: {
    #PROJECT_ROOT: __dirname
  #}
#}
#JAVASCRIPT

printf "$ENVSTR" > .env

yarn dev
