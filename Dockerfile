FROM oven/bun:latest AS build 

WORKDIR /app

COPY package.json package-lock.json bun.lock ./

RUN bun install

COPY . .

EXPOSE 3000

RUN bun run
