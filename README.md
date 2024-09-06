# Projeto DevOps com Express, Docker, Terraform e GitHub Actions

Este projeto demonstra a configuração e o deploy de uma aplicação web simples usando Node.js com Express, Docker, AWS, Terraform e GitHub Actions.

## Sumário

- [Visão Geral](#visão-geral)
- [Instalação e Configuração](#instalação-e-configuração)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Deploy com GitHub Actions](#deploy-com-github-actions)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Visão Geral

Este projeto inclui:

- Uma aplicação web simples criada com Node.js e Express.
- Um Dockerfile para criar uma imagem Docker da aplicação.
- Infraestrutura provisionada com Terraform, incluindo uma VPC, sub-redes e um cluster EKS.
- Um pipeline de CI/CD usando GitHub Actions para construir e implantar a imagem Docker em uma instância EC2.

## Instalação e Configuração

### Requisitos

- [Node.js](https://nodejs.org/) (versão 14 ou superior)
- [Docker](https://www.docker.com/get-started)
- [Terraform](https://www.terraform.io/downloads.html)
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
- **.github/workflows/deploy.yml:** Configuração do pipeline de CI/CD com GitHub Actions.

## Deploy com GitHub Actions

O pipeline de CI/CD está configurado para realizar os seguintes passos:

1. **Checkout do código.**
2. **Construção da imagem Docker.**
3. **Salvar a imagem como um arquivo tar.**
4. **Configuração das credenciais AWS.**
5. **Upload da imagem Docker para o S3.**
6. **Deploy da imagem Docker em uma instância EC2 usando SSM.**

### Detalhes do Pipeline

- O pipeline é acionado ao realizar um push na branch `main`.
- A imagem Docker da aplicação é construída localmente e salva como um arquivo `.tar`.
- A imagem é carregada para um bucket S3 e, em seguida, implantada em uma instância EC2 via AWS SSM (System Manager), que baixa a imagem do S3, carrega-a no Docker e executa o contêiner.

Certifique-se de que as variáveis de ambiente e segredos necessários estão configurados no GitHub, como `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` e `EC2_INSTANCE_ID`.

## Contribuição

Contribuições são bem-vindas! Por favor, siga o fluxo padrão de pull request para sugerir alterações.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
