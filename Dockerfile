# Use Azure Functions base image for Python 3.12
FROM mcr.microsoft.com/azure-functions/python:4-python3.12

# Install PostgreSQL client tools
RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for Azure Functions
ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

# Copy your function app code
COPY . /home/site/wwwroot