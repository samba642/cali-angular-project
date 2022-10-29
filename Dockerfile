# stage:1
FROM node:10 As build
WORKDIR /app
COPY package*.json
RUN npm install
COPY . .
RUN npm run build

# stage:2
FROM nginx:latest
COPY --from=build /app/dist/project /usr/share/nginx/html
