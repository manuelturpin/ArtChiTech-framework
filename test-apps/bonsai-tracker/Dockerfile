# Bonsai Tracker - Production Dockerfile
FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy built application
COPY dist/ ./dist/
COPY public/ ./public/

# Create data directory
RUN mkdir -p ./data

# Environment
ENV NODE_ENV=production
ENV PORT=3000
ENV USE_SQLITE=true
ENV DB_PATH=./data/bonsai.db

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

# Start server
CMD ["node", "dist/api/server.js"]
