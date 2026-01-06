#!/bin/bash
# generate_api.sh - Generate a Node/Express API for ACT validation

set -e

PROJECT_NAME=${1:-"test-api"}
TARGET_DIR=${2:-"/tmp/act-validation"}

echo "📦 Generating API: $PROJECT_NAME"

mkdir -p "$TARGET_DIR/$PROJECT_NAME"
cd "$TARGET_DIR/$PROJECT_NAME"

# Initialize npm
npm init -y

# Install dependencies
npm install express cors
npm install -D typescript @types/node @types/express vitest

# Create structure
mkdir -p src/routes src/services tests

# Create tsconfig
cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "commonjs",
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true
  }
}
EOF

# Create main app
cat > src/index.ts << 'EOF'
import express from 'express'
import cors from 'cors'

const app = express()
app.use(cors())
app.use(express.json())

app.get('/health', (req, res) => {
  res.json({ status: 'ok' })
})

app.get('/api/items', (req, res) => {
  res.json([{ id: 1, name: 'Item 1' }])
})

const PORT = process.env.PORT || 3000
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})

export default app
EOF

# Create test
cat > tests/api.test.ts << 'EOF'
import { describe, it, expect } from 'vitest'

describe('API', () => {
  it('should have health endpoint', () => {
    expect(true).toBe(true) // Placeholder
  })
})
EOF

# Add scripts
npm pkg set scripts.build="tsc"
npm pkg set scripts.start="node dist/index.js"
npm pkg set scripts.test="vitest run"

echo "✅ API generated at: $TARGET_DIR/$PROJECT_NAME"
