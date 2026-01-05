.PHONY: test test-json test-markdown help

# Default target
test: test-json test-markdown
	@echo ""
	@echo "✅ All tests passed!"

# JSON validation
test-json:
	@echo "Running JSON validation..."
	@bash tests/validate-json.sh

# Markdown validation
test-markdown:
	@echo ""
	@echo "Running Markdown validation..."
	@bash tests/validate-markdown.sh

# Help
help:
	@echo "Framework Projet Claude Code - Test Commands"
	@echo ""
	@echo "  make test          Run all tests"
	@echo "  make test-json     Validate JSON files"
	@echo "  make test-markdown Validate Markdown structure"
	@echo "  make help          Show this help"
