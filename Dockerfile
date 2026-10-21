FROM node:22-slim
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends unzip && rm -rf /var/lib/apt/lists/*
COPY ["Repere-Version-En-Ligne (1).zip", "/tmp/repere.zip"]
RUN unzip -q /tmp/repere.zip -d /app && rm /tmp/repere.zip
WORKDIR /app/Repere-Partage
RUN npm test
ENV NODE_ENV=production
EXPOSE 10000
CMD ["npm", "run", "start:render"]
