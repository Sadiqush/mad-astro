FROM oven/bun:alpine AS builder

WORKDIR /app

COPY package.json bun.lock* ./

RUN bun install --frozen-lockfile

COPY . .

RUN bun run build

FROM oven/bun:alpine

WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json .

RUN bun install --production --frozen-lockfile

EXPOSE 4321

CMD ["bun", "run", "preview"]
