#!/bin/bash
# Simple health check script for Docker container
curl -fs http://localhost:8080/healthz
