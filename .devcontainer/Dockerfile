FROM mcr.microsoft.com/vscode/devcontainers/ruby:3

# Instalar Node.js y Yarn (requeridos por Rails)
RUN apt-get update && apt-get install -y nodejs yarn

# Instalar Rails
RUN gem install rails