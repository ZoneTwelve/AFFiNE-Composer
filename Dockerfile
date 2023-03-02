FROM node:18.14.1 as dependencies
WORKDIR /usr/src/app
#COPY patches ./patches
#COPY package.json pnpm-lock.yaml ./
COPY . .
RUN npm i -g pnpm --quiet
RUN pnpm install --quiet

#FROM builder
#FROM node:18.14.1 as builder
#WORKDIR /usr/src/app
#RUN npm i -g pnpm --quiet
#COPY --from=dependencies /usr/src/app/node_modules ./node_modules
RUN pnpm run build

#FROM runner
FROM node:18.14.1 as runner
WORKDIR /usr/src/app
ENV NODE_ENV production
ENV NEXT_TELEMETRY_DISABLED 1

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=dependencies --chown=nextjs:nodejs /usr/src/app/ ./
#COPY --from=dependencies --chown=nextjs:nodejs /usr/src/app/.next ./.next
#COPY --from=dependencies /usr/src/app/node_modules ./node_modules
#COPY --from=dependencies /usr/src/app/package.json ./package.json
USER nextjs

#WORKDIR /usr/src/app
#RUN npm i -g pnpm --quiet
# ENV FIREBASE_API_KEY $(key stuff)
#COPY --from=builder /usr/src/app/apps/web/* ./
#COPY --from=builder /usr/src/app/apps/web/public ./public
#COPY --from=builder /usr/src/app/apps/web/src ./src
#COPY --from=builder /usr/src/app/apps/web/scripts ./scripts
#COPY --from=builder /usr/src/app/apps/web/scripts ./scripts
#COPY --from=builder /usr/src/app/apps/web/package.json ./package.json
EXPOSE 3000

ENV PORT 3000

CMD ["pnpm", "start"]

# EXPOSE 3000
# CMD ["pnpm", "start"]

# run command: CMD ["pnpm", "start"]

