# Usa uma imagem oficial do Ruby
FROM ruby:3.3

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos do projeto para dentro do container
COPY . .

# Instala as dependências do projeto
RUN bundle install

# Expõe a porta 8080 (usada no Fly.io)
EXPOSE 8080

# Comando para iniciar o servidor
CMD ["ruby", "server.rb"]
