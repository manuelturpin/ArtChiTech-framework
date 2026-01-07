#!/usr/bin/env python3
"""
CLAUDE.md Generator for ACT Framework

Generates optimized CLAUDE.md files based on project stack analysis.
"""

import json
import os
import sys
from pathlib import Path
from typing import Optional
from string import Template

# Script directory for template loading
SCRIPT_DIR = Path(__file__).parent.parent
TEMPLATES_DIR = SCRIPT_DIR / "templates"


def analyze_complexity(stack_info: dict) -> int:
    """
    Calculate project complexity score (1-10) based on technologies count.

    Args:
        stack_info: Dictionary with stack detection results

    Returns:
        Complexity score from 1 to 10
    """
    score = 0

    # Base language
    if stack_info.get("language"):
        score += 1

    # Framework
    if stack_info.get("framework"):
        score += 2

    # Database
    if stack_info.get("database"):
        score += 2

    # Testing
    if stack_info.get("has_tests"):
        score += 1

    # CI/CD
    if stack_info.get("has_ci"):
        score += 1

    # Docker
    if stack_info.get("has_docker"):
        score += 1

    # Additional technologies (from extras if present)
    extras = stack_info.get("extras", [])
    score += min(len(extras), 2)

    return min(score, 10)


def select_strategy(complexity: int, has_existing: bool) -> str:
    """
    Select generation strategy based on complexity and existing files.

    Args:
        complexity: Complexity score (1-10)
        has_existing: Whether CLAUDE.md already exists

    Returns:
        Strategy: 'SINGLE', 'MODULAR', or 'ENHANCE'
    """
    if has_existing:
        return "ENHANCE"
    elif complexity >= 5:
        return "MODULAR"
    else:
        return "SINGLE"


def load_template(template_name: str) -> str:
    """
    Load a template file from the templates directory.

    Args:
        template_name: Name of template file (e.g., 'base.md.tmpl')

    Returns:
        Template content as string
    """
    template_path = TEMPLATES_DIR / template_name
    if not template_path.exists():
        return ""
    return template_path.read_text()


def get_phase_name(phase: int) -> str:
    """Get phase name from phase number."""
    phases = {
        1: "Discovery",
        2: "Strategy",
        3: "Design",
        4: "Development",
        5: "Quality",
        6: "Launch",
        7: "Growth"
    }
    return phases.get(phase, "Unknown")


def generate_stack_table(stack_info: dict) -> str:
    """Generate markdown table for tech stack."""
    rows = []

    if stack_info.get("language"):
        rows.append(f"| Language | {stack_info['language'].title()} |")

    if stack_info.get("framework"):
        rows.append(f"| Framework | {stack_info['framework']} |")

    if stack_info.get("runtime"):
        rows.append(f"| Runtime | {stack_info['runtime'].title()} |")

    if stack_info.get("database"):
        rows.append(f"| Database | {stack_info['database'].title()} |")

    if stack_info.get("has_tests"):
        rows.append("| Testing | Yes |")

    if stack_info.get("has_ci"):
        rows.append("| CI/CD | Yes |")

    if stack_info.get("has_docker"):
        rows.append("| Docker | Yes |")

    return "\n".join(rows) if rows else "| - | - |"


def generate_commands_section(stack_info: dict) -> str:
    """Generate commands section based on runtime/language."""
    runtime = stack_info.get("runtime", "")
    language = stack_info.get("language", "")

    if runtime == "node" or language in ["typescript", "javascript"]:
        return """## Commands

```bash
npm run dev       # Start development server
npm run build     # Build for production
npm run test      # Run tests
npm run lint      # Lint code
```"""

    elif runtime == "python" or language == "python":
        return """## Commands

```bash
python -m pytest          # Run tests
python -m mypy .          # Type check
python -m black .         # Format code
python -m flake8 .        # Lint code
```"""

    elif language == "go":
        return """## Commands

```bash
go run .          # Run application
go build          # Build binary
go test ./...     # Run tests
go fmt ./...      # Format code
```"""

    elif language == "rust":
        return """## Commands

```bash
cargo run         # Run application
cargo build       # Build binary
cargo test        # Run tests
cargo fmt         # Format code
```"""

    return ""


def generate_type_sections(project_type: str, stack_info: dict) -> str:
    """Generate sections specific to project type."""
    sections = []

    if project_type == "webapp":
        sections.append("""## Performance

- MUST use lazy loading for routes
- MUST optimize images (WebP, responsive sizes)
- Target Lighthouse score: > 90

## Accessibility

- MUST include alt text on images
- MUST use semantic HTML elements
- MUST support keyboard navigation""")

    elif project_type == "api":
        sections.append("""## API Conventions

### Endpoints

- Use RESTful naming: `/resources/{id}`
- Version in URL: `/api/v1/...`
- Return appropriate HTTP status codes

### Validation

- MUST validate all request inputs
- Return structured error responses:

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Human readable message"
  }
}
```""")

    elif project_type == "cli":
        sections.append("""## CLI Conventions

### Commands

- MUST provide `--help` for all commands
- MUST provide `--version` flag
- Use semantic exit codes (0=success, 1=error)

### Output

- Normal output to stdout
- Errors to stderr
- Support `--quiet` and `--verbose` flags""")

    elif project_type == "library":
        sections.append("""## Library Conventions

### Exports

- Define clear public API in index
- Document all public functions
- Use barrel exports

### Versioning

- Follow Semantic Versioning
- Update CHANGELOG.md on each release
- Tag releases in git""")

    return "\n\n".join(sections)


def generate_conventions_section(stack_info: dict) -> str:
    """Generate code conventions section."""
    language = stack_info.get("language", "")

    base = """## Code Conventions

### Naming

| Type | Convention | Example |
|------|------------|---------|
| Files | kebab-case | `my-component.tsx` |
| Variables | camelCase | `myVariable` |
| Constants | UPPER_SNAKE | `MAX_RETRIES` |
| Functions | camelCase | `getUserById()` |
| Classes | PascalCase | `UserService` |"""

    if language == "typescript":
        base += """

### TypeScript

- MUST use strict mode
- Prefer interfaces over types for objects
- Use explicit return types on functions"""

    elif language == "javascript":
        base += """

### JavaScript

- Use ES6+ features (const, let, arrow functions)
- Prefer async/await over callbacks
- Use JSDoc for documentation"""

    elif language == "python":
        base += """

### Python

- Follow PEP 8 style guide
- Use type hints for function signatures
- Prefer dataclasses for data structures"""

    return base


def generate_testing_section(stack_info: dict) -> str:
    """Generate testing section."""
    if not stack_info.get("has_tests"):
        return ""

    return """## Testing

- MUST write tests before implementation (TDD)
- Target test coverage: > 60%
- Test edge cases and error conditions

### Test Naming

```
test_<function>_<scenario>_<expected>
```

Example: `test_getUserById_invalidId_throwsError`"""


def generate_act_section(phase: int = 1, score: int = 0) -> str:
    """Generate ACT Framework integration section with dynamic phase import."""
    phase_name = get_phase_name(phase)

    return f"""## ACT Framework

Phase: **{phase}** ({phase_name}) | Score: {score}%

@plugin/references/phases/{phase}-{phase_name.lower()}.md

| Ressource | Accès |
|-----------|-------|
| État projet | `.epct/state.json` |
| Historique | `.epct/history/` |
| Aide | `/act-help` |"""


def assemble_claudemd(
    project_name: str,
    description: str,
    stack_info: dict,
    phase: int = 1,
    score: int = 0
) -> str:
    """
    Assemble complete CLAUDE.md content.

    Args:
        project_name: Name of the project
        description: Short project description
        stack_info: Stack detection results
        phase: Current ACT phase (1-7)
        score: Current ACT score (0-100)

    Returns:
        Complete CLAUDE.md content
    """
    project_type = stack_info.get("type", "unknown")

    sections = []

    # Header
    sections.append(f"# {project_name}")
    sections.append(f"\n> {description}")

    # Tech Stack
    sections.append("\n## Tech Stack")
    sections.append("\n| Component | Technology |")
    sections.append("|-----------|------------|")
    sections.append(generate_stack_table(stack_info))

    # ACT Integration
    sections.append("\n" + generate_act_section(phase, score))

    # Commands
    commands = generate_commands_section(stack_info)
    if commands:
        sections.append("\n" + commands)

    # Type-specific sections
    type_sections = generate_type_sections(project_type, stack_info)
    if type_sections:
        sections.append("\n" + type_sections)

    # Conventions
    sections.append("\n" + generate_conventions_section(stack_info))

    # Testing
    testing = generate_testing_section(stack_info)
    if testing:
        sections.append("\n" + testing)

    return "\n".join(sections)


def generate_enhancement(existing_content: str, stack_info: dict) -> str:
    """
    Generate content to enhance existing CLAUDE.md.

    Args:
        existing_content: Current CLAUDE.md content
        stack_info: Stack detection results

    Returns:
        Sections to add to existing file
    """
    sections = []

    # Check if ACT section exists
    if "## ACT Framework" not in existing_content and "/act-" not in existing_content:
        sections.append("\n" + generate_act_section())

    return "\n".join(sections)


def main():
    """CLI entrypoint."""
    import argparse

    parser = argparse.ArgumentParser(
        description="Generate optimized CLAUDE.md for ACT Framework"
    )
    parser.add_argument(
        "--stack",
        type=str,
        help="JSON string or path to stack.json file"
    )
    parser.add_argument(
        "--output",
        type=str,
        default="CLAUDE.md",
        help="Output file path (default: CLAUDE.md)"
    )
    parser.add_argument(
        "--name",
        type=str,
        default="My Project",
        help="Project name"
    )
    parser.add_argument(
        "--description",
        type=str,
        default="Project description",
        help="Project description"
    )
    parser.add_argument(
        "--phase",
        type=int,
        default=1,
        help="Current ACT phase (1-7)"
    )
    parser.add_argument(
        "--score",
        type=int,
        default=0,
        help="Current ACT score (0-100)"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print output without writing file"
    )

    args = parser.parse_args()

    # Load stack info
    stack_info = {}
    if args.stack:
        if os.path.isfile(args.stack):
            with open(args.stack) as f:
                stack_info = json.load(f)
        else:
            try:
                stack_info = json.loads(args.stack)
            except json.JSONDecodeError:
                print(f"Error: Invalid JSON: {args.stack}", file=sys.stderr)
                sys.exit(1)

    # Check for existing file
    has_existing = os.path.exists(args.output)

    # Calculate complexity and select strategy
    complexity = analyze_complexity(stack_info)
    strategy = select_strategy(complexity, has_existing)

    print(f"Complexity: {complexity}/10")
    print(f"Strategy: {strategy}")

    # Generate content
    if strategy == "ENHANCE":
        with open(args.output) as f:
            existing = f.read()
        content = existing + generate_enhancement(existing, stack_info)
    else:
        content = assemble_claudemd(
            args.name,
            args.description,
            stack_info,
            args.phase,
            args.score
        )

    # Output
    if args.dry_run:
        print("\n--- Generated CLAUDE.md ---\n")
        print(content)
    else:
        with open(args.output, "w") as f:
            f.write(content)
        print(f"\nGenerated: {args.output}")
        print(f"Lines: {len(content.splitlines())}")


if __name__ == "__main__":
    main()
