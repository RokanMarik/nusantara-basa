# Nusantara Basa — Makefile
# Usage: make <target>

.PHONY: help dev build start lint test test-run test-coverage type-check db-generate db-push db-seed clean validate ci

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# --- Development ---

dev: ## Start development server
	npm run dev

build: clean ## Clean cache and build for production
	npm run build

start: ## Start production server
	npm start

# --- Quality ---

lint: ## Run ESLint
	npm run lint

test: ## Run tests (watch mode)
	npm run test

test-run: ## Run tests once (no watch)
	npm run test -- --run

test-coverage: ## Run tests with coverage
	npm run test:coverage

type-check: ## TypeScript type checking
	npm run type-check

validate: lint type-check test-run build ## Run all validation checks
	@echo ""
	@echo "All checks passed!"

# --- Database ---

db-generate: ## Generate Prisma client
	npm run db:generate

db-push: ## Push Prisma schema to database
	npm run db:push

db-seed: ## Seed initial data
	npm run db:seed

# --- Maintenance ---

clean: ## Clear Next.js cache
	rm -rf .next
	@echo "Cache cleared."

install: ## Install dependencies
	npm install

# --- CI (local) ---

ci: install db-generate lint type-check test-run build ## Simulate CI pipeline locally
	@echo ""
	@echo "All CI checks passed!"
