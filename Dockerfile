# base image
FROM node

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY ./data-dictionary/react-app/package.json /app/
RUN yarn install

# add app
COPY ./data-dictionary/react-app /app

COPY ./entrypoint.sh .
CMD ./entrypoint.sh
