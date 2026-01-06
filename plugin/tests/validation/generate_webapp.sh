#!/bin/bash
# generate_webapp.sh - Generate a React/TypeScript webapp for ACT validation

set -e

PROJECT_NAME=${1:-"test-webapp"}
TARGET_DIR=${2:-"/tmp/act-validation"}

echo "📦 Generating Webapp: $PROJECT_NAME"

mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

# Create with Vite
npm create vite@latest "$PROJECT_NAME" -- --template react-ts

cd "$PROJECT_NAME"

# Add basic structure
mkdir -p src/components src/services tests

# Create a simple component
cat > src/components/Counter.tsx << 'EOF'
import { useState } from 'react'

export function Counter() {
  const [count, setCount] = useState(0)
  return (
    <button onClick={() => setCount(c => c + 1)}>
      Count: {count}
    </button>
  )
}
EOF

# Create a simple test
cat > tests/Counter.test.tsx << 'EOF'
import { describe, it, expect } from 'vitest'
import { render, screen } from '@testing-library/react'
import { Counter } from '../src/components/Counter'

describe('Counter', () => {
  it('renders with initial count', () => {
    render(<Counter />)
    expect(screen.getByText(/Count: 0/)).toBeDefined()
  })
})
EOF

# Install dependencies
npm install
npm install -D vitest @testing-library/react @testing-library/jest-dom jsdom

# Add test script to package.json
npm pkg set scripts.test="vitest run"

echo "✅ Webapp generated at: $TARGET_DIR/$PROJECT_NAME"
