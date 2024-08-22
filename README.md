# Go API Service

## Overview

This project is a REST API service written in Go. It includes several endpoints for IP address lookup, validation, and query history. The service is designed to be highly performant, containerized using Docker, and deployable to Kubernetes using Helm.

## Features

- IP Address Lookup: Resolve IPv4 addresses for a given domain.
- IP Address Validation: Validate if the input is a valid IPv4 address.
- Query History: Retrieve the latest 20 queries.
- Prometheus Metrics: Metrics are exposed on the /metrics endpoint for monitoring.
- Health Check: A /health endpoint is available for service health monitoring.
- Kubernetes Deployment: Fully deployable with Kubernetes using Helm charts.
- CI/CD Pipeline: GitHub Actions workflow for automated testing, building, and deploying.

## Prerequisites

- Go: v1.20+
- Docker: v20.10+
- Docker Compose: v1.29+
- Kubernetes: v1.21+
- Helm: v3.5+
- PostgreSQL Cloud Service (Supabase)

## Getting Started

### 1. Clone the Repository

```bash
git clone HTtps;//github.com/M-Killer-dev/go-api.git
cd go-api
```

### 2. Configure Environment Variables

Create a .env file in the root directory and configure the following environment variables:
```bash
DB_HOST=your-db-host
DB_PORT=your-db-port
DB_USER=your-db-username
DB_PASSWORD=your-db-password
DB_NAME=your-db-name
```

### 3. Build and Run Locally

To build and run the application locally:
```bash
go build -o go-api .
./go-api
```

### 4. Docker Setup

Build Docker Image
```bash
docker build -t go-api:latest .
```

Run Docker Container
```bash
docker run -p 3000:3000 --env-file .env go-api:latest
```

### 5. Kubernetes Deployment

Deploy with Helm
Ensure you have configured your Kubernetes cluster and Helm:
```bash
helm install go-api ./helm/go-api-chart --set image.repository=go-api,image.tag=latest
```

### 6. CI/CD Pipeline

This project includes a GitHub Actions workflow for CI/CD:
- Automatic Triggers: The workflow runs on every push or pull request to the main branch.
- Manual Triggers: You can also manually trigger the workflow via the GitHub UI.

### 7. Accessing the API

- Base URL: http://localhost:3000
- Endpoints:
  - /: Returns the current date and version.
  - /v1/tools/lookup?domain=example.com: Look up IPv4 addresses.
  - /v1/tools/validate?ip=127.0.0.1: Validate an IPv4 address.
  - /v1/history: Retrieve the last 20 queries.
  - /metrics: Prometheus metrics.
  - /health: Health check endpoint.

## Development

### 1. Running Tests

To run tests locally:
```bash
go test ./...
```

### 2. linting

To lint the codebase:
```bash
golangci-lint run
```

## Contact

If you have any questions, feel free to reach out to me at mykhailokoroldev@outlook.com.