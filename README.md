# Projeto DevOps com Express, Docker, Terraform e GitHub Actions

Este projeto demonstra a configuração e o deploy de uma aplicação web simples usando Node.js com Express, Docker, AWS, Terraform e GitHub Actions em um cluster EKS (Elastic Kubernetes Service) na AWS.

## Sumário

- [Visão Geral](#visão-geral)
- [Instalação e Configuração](#instalação-e-configuração)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Deploy com GitHub Actions no EKS](#deploy-com-github-actions-no-eks)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Visão Geral

Este projeto inclui:

- Uma aplicação web simples criada com Node.js e Express.
- Um Dockerfile para criar uma imagem Docker da aplicação.
- Infraestrutura provisionada com Terraform, incluindo uma VPC, sub-redes e um cluster EKS.
- Um pipeline de CI/CD usando GitHub Actions para construir e implantar a imagem Docker no cluster EKS da AWS.

## Instalação e Configuração

### Requisitos

- [Node.js](https://nodejs.org/) (versão 14 ou superior)
- [Docker](https://www.docker.com/get-started)
- [Terraform](https://www.terraform.io/downloads.html)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [AWS CLI](https://aws.amazon.com/cli/)
- [GitHub Actions](https://github.com/features/actions)
- Conta AWS com permissões apropriadas

### Configuração Local

1. **Clone o repositório:**

    ```bash
    git clone https://github.com/usuario/repositorio.git
    cd repositorio
    ```

2. **Instale as dependências da aplicação Node.js:**

    ```bash
    npm install
    ```

3. **Execute a aplicação localmente:**

    ```bash
    npm start
    ```

    A aplicação estará disponível em `http://localhost:3000`.

### Docker

1. **Construa a imagem Docker:**

    ```bash
    docker build -t my-app .
    ```

2. **Execute o contêiner Docker:**

    ```bash
    docker run -d -p 3000:3000 my-app
    ```

## Estrutura do Projeto

- **app.js:** Código da aplicação Express.
- **Dockerfile:** Define a imagem Docker da aplicação.
- **terraform/**: Configurações do Terraform para provisionamento da infraestrutura AWS.
- **.github/workflows/deploy.yml:** Configuração do pipeline de CI/CD com GitHub Actions para deploy no EKS.

## Deploy com GitHub Actions no EKS

O pipeline de CI/CD está configurado para realizar os seguintes passos:

1. **Checkout do código.**
2. **Construção da imagem Docker.**
3. **Configuração das credenciais AWS.**
4. **Login no Amazon ECR, tag e push da imagem Docker para o repositório ECR.**
5. **Atualização do kubeconfig para se conectar ao cluster EKS.**
6. **Deploy da imagem Docker no cluster EKS.**


##Nota 
O deploy no EKS não foi concluído devido às limitações da conta AWS Free Tier, que não suporta os recursos necessários para um ambiente de produção completo.
