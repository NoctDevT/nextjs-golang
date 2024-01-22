FROM node:20-bookworm

WORKDIR /app/dataScrape
COPY package*.json ./
RUN npm install\
    && npm install concurrently -g \
    && npm install typescript -g \
    && npx -y playwright@1.41.0 install --with-deps
COPY . .
RUN chmod +x $(which concurrently)
CMD ["npm", "run", "all"]