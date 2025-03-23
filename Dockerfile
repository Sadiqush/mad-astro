FROM oven/bun:latest AS build 

WORKDIR /app

COPY package.json package-lock.json bun.lock ./

RUN bun install

COPY . .

EXPOSE 4321

RUN bun run start
