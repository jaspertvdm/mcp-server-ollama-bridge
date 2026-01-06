# Ollama Bridge MCP Server - Docker Image
# Bridge to local Ollama LLM server
#
# Build: docker build -t mcp-server-ollama-bridge .
# Run:   docker run -i -e OLLAMA_HOST=http://host.docker.internal:11434 mcp-server-ollama-bridge
#
# Part of HumoticaOS/SymbAIon - https://humotica.com

FROM python:3.11-slim

LABEL maintainer="Jasper van de Meent <info@humotica.com>"
LABEL org.opencontainers.image.source="https://github.com/jaspertvdm/mcp-server-ollama-bridge"
LABEL org.opencontainers.image.description="Ollama Bridge - Connect MCP to local Ollama LLM server"
LABEL org.opencontainers.image.licenses="MIT"

# Install from PyPI
RUN pip install --no-cache-dir mcp-server-ollama-bridge

# Default Ollama host (override with -e OLLAMA_HOST=...)
ENV OLLAMA_HOST=http://localhost:11434

# MCP servers communicate via stdio
ENTRYPOINT ["mcp-server-ollama-bridge"]
