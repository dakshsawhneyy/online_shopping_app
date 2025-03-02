# Stage 1
FROM node:18 AS builder

WORKDIR /app

# If package.json is already there, don't install it
COPY package*.json ./

RUN npm install

COPY . .

# Stage 2
FROM node:18-alpine 

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 5173

CMD ["npm","run","dev"] 
