#!/bin/bash
# setup.sh - Setup starter project for ACT testing

set -e

echo "🚀 Setting up ACT Starter Project"
echo "=================================="

# Create project
mkdir -p starter-webapp
cd starter-webapp

# Initialize npm
npm init -y

# Create minimal structure
mkdir -p src tests

# Create index.html
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>ACT Starter</title>
</head>
<body>
    <h1>ACT Starter Project</h1>
    <p>Use this project to test ACT Framework.</p>
    <script src="src/main.js"></script>
</body>
</html>
EOF

# Create main.js
cat > src/main.js << 'EOF'
console.log('ACT Starter Project loaded');
EOF

# Create test
cat > tests/main.test.js << 'EOF'
test('placeholder', () => {
    expect(true).toBe(true);
});
EOF

echo ""
echo "✅ Starter project created in: starter-webapp/"
echo ""
echo "Next steps:"
echo "1. cd starter-webapp"
echo "2. Open Claude Code"
echo "3. Run /project"
