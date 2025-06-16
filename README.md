# Ruby on Rails Code Interview

Sistema desenvolvido para avaliação técnica com Ruby on Rails. O projeto abrange correções de filtros, paginação com cursor, CRUD, envio de e-mails, relatórios com background jobs e testes automatizados.

## Regras
1. **fazer fork do projeto para seu github**
2. **atualizar a versão do ruby e do rails**
3. **criar o dockerfile e o docker-compose**
4. **enviar o link do seu repositório para avaliação**
5. **não usar IA, e nem copiar de outros projetos, nesse caso será desclassificado**

---

## ⚙️ Funcionalidades

1. **Correção de filtros**
   - Filtro por empresa corrigido para retornar apenas usuários da empresa especificada.
   - Filtro por nome de usuário ajustado para permitir buscas parciais e case-insensitive com `ILIKE`.

2. **Teste geral**
   - RSpec com cobertura de casos de uso para todas as funcionalidades do sistema.

3. **Tweets com paginação por cursor**
   - `GET /tweets`: lista tweets ordenados por mais recentes com paginação baseada em cursor.
   - `GET /users/:user_id/tweets`: mesma lógica aplicada para tweets de um usuário.
   - Criar a relação entre usuário e tweet.

4. **CRUD de Empresas**
   - CRUD completo com páginas HTML (`CompaniesController`).

5. **Mailer de novo usuário**
   - E-mail enviado automaticamente ao cadastrar novo usuário.

6. **Relatório em segundo plano**
   - Relatório gerado com um service/repository usando Sidekiq (`ReportGenerationJob`).
   - O primeiro relatório deve listar todos os usuários e seus tweets, ordenados por data de criação.
   - O segundo relatório deve mostrar as empresas e o número de usuários associados a cada uma.

7. **Cobertura de testes**
   - Cobertura extraída com SimpleCov. Relatório em `coverage/index.html`.

8. **Gerar um relatório com QUERY RAW usando joins, e otimizando a query com indices**
   - aqui você pode criar as tabelas e indices que você achar melhor para demostrar suas habilidades.

9. **utilização de hotwire ou stimulus**
   - aqui é para você mostrar seu conhecimento de ambos.

---

## ▶️ Como rodar

### Pré-requisitos
- Docker e Docker Compose instalados
- Git instalado

### Passos para execução

1. **Clone o repositório**
   ```bash
   git clone <seu-repositorio-forkado>
   cd coding-interview
   ```

2. **Construa e inicie os containers**
   ```bash
   docker-compose build
   docker-compose up -d
   ```

3. **Crie o banco de dados e execute as migrações**
   ```bash
   docker-compose exec web rails db:create
   docker-compose exec web rails db:migrate
   ```

4. **Acesse a aplicação**
   Abra seu navegador e acesse: http://localhost:3000

5. **Para parar a aplicação**
   ```bash
   docker-compose down
   ```

## Como testar

### Executando os testes

1. **Execute todos os testes**
   ```bash
   docker-compose exec web rspec
   ```

2. **Executar um arquivo de teste específico**
   ```bash
   docker-compose exec web rspec spec/models/user_spec.rb
   ```

3. **Executar um teste específico**
   ```bash
   docker-compose exec web rspec spec/models/user_spec.rb:10
   ```
   (substitua :10 pelo número da linha do teste)

4. **Verificar cobertura de testes**
   Após executar os testes, um relatório de cobertura será gerado em `coverage/index.html`
   
5. **Executar o console do Rails para testes manuais**
   ```bash
   docker-compose exec web rails console --sandbox
   ```

### Testando endpoints da API
Você pode usar ferramentas como Postman, cURL ou Insomnia para testar os endpoints da API. Certifique-se de que a aplicação esteja rodando antes de fazer as requisições.
