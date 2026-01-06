#!/usr/bin/env python3
"""
Stack Detection Script for Project Onboarding

Analyzes a project directory and returns detected stack information as JSON.
Usage: python detect_stack.py [path]  (defaults to current directory)
"""

import json
import os
import sys
from pathlib import Path
from typing import Optional


def read_json_file(path: Path) -> Optional[dict]:
    """Read and parse a JSON file, returning None on error."""
    try:
        with open(path, 'r', encoding='utf-8') as f:
            return json.load(f)
    except (json.JSONDecodeError, FileNotFoundError, PermissionError):
        return None


def detect_language(project_path: Path) -> tuple[Optional[str], Optional[str]]:
    """
    Detect the primary language and runtime.
    Returns (language, runtime) tuple.
    """
    # Check for JavaScript/TypeScript
    package_json = project_path / "package.json"
    if package_json.exists():
        pkg = read_json_file(package_json)
        # Check for TypeScript indicators
        tsconfig = project_path / "tsconfig.json"
        has_ts_dep = False
        if pkg:
            all_deps = {**pkg.get("dependencies", {}), **pkg.get("devDependencies", {})}
            has_ts_dep = "typescript" in all_deps

        if tsconfig.exists() or has_ts_dep:
            return ("typescript", "node")
        return ("javascript", "node")

    # Check for Python
    if (project_path / "requirements.txt").exists():
        return ("python", "python")
    if (project_path / "pyproject.toml").exists():
        return ("python", "python")
    if (project_path / "setup.py").exists():
        return ("python", "python")

    # Check for Go
    if (project_path / "go.mod").exists():
        return ("go", "go")

    # Check for Rust
    if (project_path / "Cargo.toml").exists():
        return ("rust", "rust")

    # Check for Java
    if (project_path / "pom.xml").exists() or (project_path / "build.gradle").exists():
        return ("java", "jvm")

    # Check for Ruby
    if (project_path / "Gemfile").exists():
        return ("ruby", "ruby")

    return (None, None)


def detect_framework(project_path: Path, language: Optional[str]) -> Optional[str]:
    """Detect the framework based on dependencies."""
    if not language:
        return None

    if language in ("javascript", "typescript"):
        package_json = project_path / "package.json"
        pkg = read_json_file(package_json)
        if not pkg:
            return None

        deps = {**pkg.get("dependencies", {}), **pkg.get("devDependencies", {})}

        # Web frameworks (order matters - more specific first)
        if "next" in deps:
            return "next.js"
        if "nuxt" in deps:
            return "nuxt"
        if "@angular/core" in deps:
            return "angular"
        if "vue" in deps:
            return "vue"
        if "react" in deps:
            return "react"
        if "svelte" in deps:
            return "svelte"

        # API frameworks
        if "fastify" in deps:
            return "fastify"
        if "koa" in deps:
            return "koa"
        if "hono" in deps:
            return "hono"
        if "express" in deps:
            return "express"

        # CLI frameworks
        if "commander" in deps or "yargs" in deps:
            return "cli"

    elif language == "python":
        # Check requirements.txt
        requirements = project_path / "requirements.txt"
        pyproject = project_path / "pyproject.toml"

        deps_text = ""
        if requirements.exists():
            try:
                with open(requirements, 'r') as f:
                    deps_text = f.read().lower()
            except:
                pass

        if pyproject.exists():
            try:
                with open(pyproject, 'r') as f:
                    deps_text += f.read().lower()
            except:
                pass

        # Web frameworks
        if "fastapi" in deps_text:
            return "fastapi"
        if "django" in deps_text:
            return "django"
        if "flask" in deps_text:
            return "flask"
        if "starlette" in deps_text:
            return "starlette"

        # CLI frameworks
        if "click" in deps_text or "typer" in deps_text:
            return "cli"

    elif language == "go":
        go_mod = project_path / "go.mod"
        if go_mod.exists():
            try:
                with open(go_mod, 'r') as f:
                    content = f.read()
                if "gin-gonic/gin" in content:
                    return "gin"
                if "labstack/echo" in content:
                    return "echo"
                if "gofiber/fiber" in content:
                    return "fiber"
            except:
                pass

    elif language == "rust":
        cargo_toml = project_path / "Cargo.toml"
        if cargo_toml.exists():
            try:
                with open(cargo_toml, 'r') as f:
                    content = f.read()
                if "actix-web" in content:
                    return "actix-web"
                if "axum" in content:
                    return "axum"
                if "rocket" in content:
                    return "rocket"
            except:
                pass

    return None


def detect_project_type(project_path: Path, language: Optional[str], framework: Optional[str]) -> str:
    """Detect the project type based on structure and dependencies."""

    # Check for docs project
    docs_dir = project_path / "docs"
    src_dir = project_path / "src"

    # Count markdown files
    md_files = list(project_path.rglob("*.md"))
    code_files = []
    for ext in ["*.py", "*.js", "*.ts", "*.tsx", "*.jsx", "*.go", "*.rs", "*.java"]:
        code_files.extend(project_path.rglob(ext))

    # Filter out node_modules and other vendor dirs
    def is_source_file(p):
        parts = p.parts
        return not any(x in parts for x in ["node_modules", "vendor", ".git", "dist", "build"])

    code_files = [f for f in code_files if is_source_file(f)]
    md_files = [f for f in md_files if is_source_file(f)]

    # Research/docs project: mostly markdown, no real code
    if len(md_files) > 5 and len(code_files) < 3:
        if docs_dir.exists() and not src_dir.exists():
            return "docs"
        return "research"

    # Define directories for later checks
    pages_dir = project_path / "src" / "pages"
    app_dir = project_path / "src" / "app"
    components_dir = project_path / "src" / "components"
    api_dir = project_path / "src" / "api"
    routes_dir = project_path / "src" / "routes"
    bin_dir = project_path / "bin"
    cli_dir = project_path / "src" / "cli"

    # Define framework categories
    webapp_frameworks = ["next.js", "nuxt", "react", "vue", "angular", "svelte"]
    api_frameworks = ["express", "fastify", "koa", "hono", "fastapi", "flask", "django", "gin", "echo", "fiber", "actix-web", "axum", "rocket"]

    # Check for webapp first (highest priority for user-facing apps)
    if framework in webapp_frameworks:
        return "webapp"

    if pages_dir.exists() or app_dir.exists() or components_dir.exists():
        return "webapp"

    # Check for API (before CLI - API frameworks take precedence)
    if framework in api_frameworks:
        # If has UI components, it's a webapp
        if components_dir.exists() or pages_dir.exists():
            return "webapp"
        return "api"

    if api_dir.exists() or routes_dir.exists():
        if not (components_dir.exists() or pages_dir.exists()):
            return "api"

    # Check for CLI project (only if not an API/webapp)
    if language in ("javascript", "typescript"):
        pkg = read_json_file(project_path / "package.json")
        if pkg:
            # Has bin entry and CLI framework
            if pkg.get("bin") and framework == "cli":
                return "cli"
            # Has bin entry, no web/api framework
            if pkg.get("bin"):
                deps = {**pkg.get("dependencies", {}), **pkg.get("devDependencies", {})}
                has_web = any(f in deps for f in ["react", "vue", "next", "angular", "svelte"])
                has_api = any(f in deps for f in ["express", "fastify", "koa", "hono"])
                if not has_web and not has_api:
                    return "cli"

    if (bin_dir.exists() or cli_dir.exists()) and framework == "cli":
        return "cli"

    # Check for library
    if language in ("javascript", "typescript"):
        pkg = read_json_file(project_path / "package.json")
        if pkg:
            # Has main/exports but no app structure
            has_exports = pkg.get("main") or pkg.get("exports") or pkg.get("module")

            if has_exports and not (pages_dir.exists() or app_dir.exists()):
                if not components_dir.exists() and not api_dir.exists():
                    return "library"

    # Default fallback
    if language:
        return "unknown"

    return "unknown"


def detect_database(project_path: Path, language: Optional[str]) -> Optional[str]:
    """Detect the database/ORM used."""
    if not language:
        return None

    if language in ("javascript", "typescript"):
        pkg = read_json_file(project_path / "package.json")
        if pkg:
            deps = {**pkg.get("dependencies", {}), **pkg.get("devDependencies", {})}

            # ORMs and database clients
            if "prisma" in deps or "@prisma/client" in deps:
                return "prisma"
            if "drizzle-orm" in deps:
                return "drizzle"
            if "typeorm" in deps:
                return "typeorm"
            if "sequelize" in deps:
                return "sequelize"
            if "mongoose" in deps:
                return "mongoose"
            if "better-sqlite3" in deps:
                return "sqlite"
            if "pg" in deps:
                return "postgresql"
            if "mysql2" in deps or "mysql" in deps:
                return "mysql"
            if "redis" in deps or "ioredis" in deps:
                return "redis"

    elif language == "python":
        requirements = project_path / "requirements.txt"
        pyproject = project_path / "pyproject.toml"

        deps_text = ""
        if requirements.exists():
            try:
                with open(requirements, 'r') as f:
                    deps_text = f.read().lower()
            except:
                pass

        if pyproject.exists():
            try:
                with open(pyproject, 'r') as f:
                    deps_text += f.read().lower()
            except:
                pass

        if "sqlalchemy" in deps_text:
            return "sqlalchemy"
        if "django" in deps_text:
            return "django-orm"
        if "tortoise-orm" in deps_text:
            return "tortoise"
        if "pymongo" in deps_text:
            return "mongodb"
        if "psycopg" in deps_text:
            return "postgresql"

    return None


def has_tests(project_path: Path, language: Optional[str]) -> bool:
    """Check if the project has tests."""
    # Check for test directories
    test_dirs = ["test", "tests", "__tests__", "spec"]
    for td in test_dirs:
        if (project_path / td).exists():
            return True

    # Check for test files
    test_patterns = ["*_test.py", "test_*.py", "*.test.js", "*.test.ts", "*.spec.js", "*.spec.ts", "*_test.go", "*_test.rs"]
    for pattern in test_patterns:
        if list(project_path.rglob(pattern)):
            return True

    # Check dependencies for test frameworks
    if language in ("javascript", "typescript"):
        pkg = read_json_file(project_path / "package.json")
        if pkg:
            deps = {**pkg.get("dependencies", {}), **pkg.get("devDependencies", {})}
            test_deps = ["jest", "vitest", "mocha", "ava", "tap", "@testing-library/react", "cypress", "playwright"]
            if any(td in deps for td in test_deps):
                return True

    elif language == "python":
        requirements = project_path / "requirements.txt"
        if requirements.exists():
            try:
                with open(requirements, 'r') as f:
                    content = f.read().lower()
                if "pytest" in content or "unittest" in content or "nose" in content:
                    return True
            except:
                pass

    return False


def has_ci(project_path: Path) -> bool:
    """Check if the project has CI configuration."""
    ci_paths = [
        project_path / ".github" / "workflows",
        project_path / ".gitlab-ci.yml",
        project_path / ".circleci",
        project_path / "Jenkinsfile",
        project_path / ".travis.yml",
        project_path / "azure-pipelines.yml",
        project_path / "bitbucket-pipelines.yml",
    ]

    for ci_path in ci_paths:
        if ci_path.exists():
            if ci_path.is_dir():
                # Check if directory has files
                if list(ci_path.iterdir()):
                    return True
            else:
                return True

    return False


def has_docker(project_path: Path) -> bool:
    """Check if the project has Docker configuration."""
    docker_files = [
        project_path / "Dockerfile",
        project_path / "docker-compose.yml",
        project_path / "docker-compose.yaml",
        project_path / ".dockerignore",
    ]

    return any(df.exists() for df in docker_files)


def detect_stack(project_path: Path) -> dict:
    """Main function to detect the full stack."""
    result = {}

    # Detect language and runtime
    language, runtime = detect_language(project_path)

    # Detect framework
    framework = detect_framework(project_path, language)

    # Detect project type
    project_type = detect_project_type(project_path, language, framework)

    # Detect database
    database = detect_database(project_path, language)

    # Build result
    result["type"] = project_type

    if language:
        result["language"] = language

    if framework:
        result["framework"] = framework

    if runtime:
        result["runtime"] = runtime

    if database:
        result["database"] = database

    result["has_tests"] = has_tests(project_path, language)
    result["has_ci"] = has_ci(project_path)
    result["has_docker"] = has_docker(project_path)

    return result


def main():
    # Get project path from arguments or use current directory
    if len(sys.argv) > 1:
        project_path = Path(sys.argv[1]).resolve()
    else:
        project_path = Path.cwd()

    # Validate path
    if not project_path.exists():
        print(json.dumps({"error": f"Path does not exist: {project_path}"}))
        sys.exit(1)

    if not project_path.is_dir():
        print(json.dumps({"error": f"Path is not a directory: {project_path}"}))
        sys.exit(1)

    # Detect stack
    result = detect_stack(project_path)

    # Output as JSON
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
