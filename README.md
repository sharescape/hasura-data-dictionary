# hasura-data-dictionary
Dockerfile for hosting Hasura's data-dictionary.  

The Next.js project is built at run-time rather than container-build-time because the
project uses `gqlgen` for code generation--requiring access to the Hasura schema. 

```sh
docker pull sharescape/hasura-data-dictionary
```

## Environment Variables
- `HASURA_GRAPHQL_SERVER_HOST`: The Hasura endpoint to pass to the data-dictionary's build-time env. Required.
- `HASURA_GRAPHQL_ADMIN_SECRET`: Required.
- `DATA_DICTIONARY_PORT`: Port where the data-dictionary UI is hosted on(default 3000). Optional
- `DATA_DICTIONARY_BASE_PATH`: For reverse proxies(optional). (not-supported in this release)

### Using environment variables

```sh
docker run --rm \
--env HASURA_GRAPHQL_SERVER_HOST=http://localhost:8080
--env HASURA_GRAPHQL_ADMIN_SECRET=SuperSecretPassword
--env DATA_DICTIONARY_PORT=1234
--env DATA_DICTIONARY_BASE_PATH="/dictionary"
sharescape/hasura-data-dictionary
```
