# Use uma imagem base do Python
FROM python:3.13

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo de requirements para o contêiner
COPY requirements.txt .

# Instale as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copie o código da aplicação para o contêiner
COPY . .

# Exponha a porta que o Flask usará
EXPOSE 5000

# Defina o comando para executar o aplicativo
CMD ["python", "run.py"]