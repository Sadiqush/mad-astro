FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json bun.lock ./

RUN bun install

COPY . .

RUN bun run
