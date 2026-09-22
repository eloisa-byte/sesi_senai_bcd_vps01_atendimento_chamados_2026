# VPS 01 -  Banco de Dados
## Desafio: 
### Atendimento a chamados

|Entidade|Atributos básicos|Descrição|
|--------|-----------------|---------|
|Usuário|id, nome, email, telefone, departamento, cargo, status|Pessoa que solicita ou recebe atendimento|
|Chamado|id, titulo, descricao, data_abertura, data_fechamento, status, prioridade, id_usuario, id_categoria, id_tecnico|Registra a solicitação ou incidente|
|Técnico|id, nome, email, especialidade, status|Profissional responsável pelo atendimento do chamado.|
|Categoria|id, nome, descricao|Classifica o chamado, por exemplo: Hardware, Software, Rede ou Acesso.|
|Histórico/Comentários|id, id_chamado, id_usuario, data_hora, descricao, tipo|Armazena comentários, atualizações e ações realizadas durante o atendimento e Solução.|

## MER DER Conceitual
![MER conceitual](./Mer%20conceitual%20-%20Atendimento%20chamados.drawio.pngMer conceitual - Atendimento chamados.png)
## MER DER Lógico
![MER lógico](./Mer%20lógico%20-%20Atendimento%20chamados.drawio.png)
## Dicionário de Dados

| Entidade  | Atributo        | Tipo     | Tamanho | Descrição                                            |
| --------- | --------------- | -------- | ------: | ---------------------------------------------------- |
| Usuário   | id_usuario      | INT      |      11 | Chave primária do usuário                            |
| Usuário   | nome            | VARCHAR  |     100 | Nome completo do usuário                             |
| Usuário   | email           | VARCHAR  |     100 | E-mail do usuário                                    |
| Usuário   | telefone        | VARCHAR  |      20 | Telefone do usuário                                  |
| Usuário   | departamento    | VARCHAR  |      50 | Departamento onde o usuário trabalha                 |
| Usuário   | cargo           | VARCHAR  |      50 | Cargo ocupado pelo usuário                           |
| Usuário   | status          | VARCHAR  |      20 | Situação do usuário                                  |
| Técnico   | id_tecnico      | INT      |      11 | Chave primária do técnico                            |
| Técnico   | nome            | VARCHAR  |     100 | Nome completo do técnico                             |
| Técnico   | email           | VARCHAR  |     100 | E-mail do técnico                                    |
| Técnico   | especialidade   | VARCHAR  |     100 | Área de especialidade do técnico                     |
| Técnico   | status          | VARCHAR  |      20 | Situação do técnico                                  |
| Categoria | id_categoria    | INT      |      11 | Chave primária da categoria                          |
| Categoria | nome            | VARCHAR  |      50 | Nome da categoria                                    |
| Categoria | descricao       | VARCHAR  |     255 | Descrição da categoria                               |
| Chamado   | id_chamado      | INT      |      11 | Chave primária do chamado                            |
| Chamado   | titulo          | VARCHAR  |     150 | Título do chamado                                    |
| Chamado   | descricao       | TEXT     |       — | Descrição detalhada do problema                      |
| Chamado   | data_abertura   | DATETIME |       — | Data e hora de abertura                              |
| Chamado   | data_fechamento | DATETIME |       — | Data e hora de fechamento                            |
| Chamado   | status          | VARCHAR  |      30 | Situação atual do chamado                            |
| Chamado   | prioridade      | VARCHAR  |      20 | Nível de prioridade                                  |
| Chamado   | id_usuario      | INT      |      11 | Chave estrangeira do usuário solicitante             |
| Chamado   | id_categoria    | INT      |      11 | Chave estrangeira da categoria                       |
| Chamado   | id_tecnico      | INT      |      11 | Chave estrangeira do técnico responsável             |
| Histórico | id_historico    | INT      |      11 | Chave primária do histórico                          |
| Histórico | id_chamado      | INT      |      11 | Chave estrangeira do chamado                         |
| Histórico | id_usuario      | INT      |      11 | Chave estrangeira do usuário que realizou o registro |
| Histórico | data_hora       | DATETIME |       — | Data e hora do registro                              |
| Histórico | descricao       | TEXT     |       — | Descrição da atualização ou ação                     |
| Histórico | tipo            | VARCHAR  |      30 | Tipo do registro realizado                           |


## Dados de teste em CSV

 - <a href="categoria.csv">categoria.csv</a>
 - <a href="chamado.csv">chamado.csv</a>
 - <a href="historico.csv">historico.csv</a>
 - <a href="tecnico.csv">tecnico.csv</a>
 - <a href="usuario.csv">usuario.csv</a>

## Script SQL DDL (Desenvolvimento: Criação do Banco de dados)

```
CREATE DATABASE atendimento_chamados;

USE atendimento_chamados;

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    departamento VARCHAR(50),
    cargo VARCHAR(50),
    status VARCHAR(20) NOT NULL
);

CREATE TABLE tecnico (
    id_tecnico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    status VARCHAR(20) NOT NULL
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE chamado (
    id_chamado INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,
    data_abertura DATETIME NOT NULL,
    data_fechamento DATETIME,
    status VARCHAR(30) NOT NULL,
    prioridade VARCHAR(20) NOT NULL,
    id_usuario INT NOT NULL,
    id_categoria INT NOT NULL,
    id_tecnico INT,

    CONSTRAINT fk_chamado_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario),

    CONSTRAINT fk_chamado_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria),

    CONSTRAINT fk_chamado_tecnico
        FOREIGN KEY (id_tecnico)
        REFERENCES tecnico(id_tecnico)
);

CREATE TABLE historico (
    id_historico INT PRIMARY KEY AUTO_INCREMENT,
    id_chamado INT NOT NULL,
    id_usuario INT NOT NULL,
    data_hora DATETIME NOT NULL,
    descricao TEXT NOT NULL,
    tipo VARCHAR(30) NOT NULL,

    CONSTRAINT fk_historico_chamado
        FOREIGN KEY (id_chamado)
        REFERENCES chamado(id_chamado),

    CONSTRAINT fk_historico_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
);

```

## Script SQL DML(Manipulação: População com dados de teste)

```
USE atendimento_chamados;

INSERT INTO usuario
(id_usuario, nome, email, telefone, departamento, cargo, status)
VALUES
(1, 'Ana Souza', 'ana.souza@email.com', '11987654321', 'Financeiro', 'Analista', 'Ativo'),
(2, 'Carlos Oliveira', 'carlos.oliveira@email.com', '11976543210', 'Recursos Humanos', 'Assistente', 'Ativo'),
(3, 'Mariana Santos', 'mariana.santos@email.com', '11965432109', 'Marketing', 'Coordenadora', 'Ativo'),
(4, 'João Pereira', 'joao.pereira@email.com', '11954321098', 'Administrativo', 'Gerente', 'Ativo'),
(5, 'Beatriz Lima', 'beatriz.lima@email.com', '11943210987', 'Vendas', 'Vendedora', 'Inativo');


INSERT INTO tecnico
(id_tecnico, nome, email, especialidade, status)
VALUES
(1, 'Lucas Mendes', 'lucas.mendes@empresa.com', 'Hardware', 'Ativo'),
(2, 'Pedro Almeida', 'pedro.almeida@empresa.com', 'Software', 'Ativo'),
(3, 'Juliana Costa', 'juliana.costa@empresa.com', 'Redes', 'Ativo'),
(4, 'Rafael Martins', 'rafael.martins@empresa.com', 'Segurança', 'Ativo'),
(5, 'Fernanda Rocha', 'fernanda.rocha@empresa.com', 'Banco de Dados', 'Inativo');


INSERT INTO categoria
(id_categoria, nome, descricao)
VALUES
(1, 'Hardware', 'Problemas relacionados a computadores e equipamentos'),
(2, 'Software', 'Problemas relacionados a programas e sistemas'),
(3, 'Rede', 'Problemas relacionados a conexao de rede e internet'),
(4, 'Acesso', 'Problemas relacionados a login e permissoes de acesso'),
(5, 'Seguranca', 'Problemas relacionados a seguranca da informacao');


INSERT INTO chamado
(id_chamado, titulo, descricao, data_abertura, data_fechamento, status, prioridade, id_usuario, id_categoria, id_tecnico)
VALUES
(1, 'Computador nao liga', 'O computador do setor financeiro nao liga.', '2026-09-15 08:30:00', '2026-09-15 11:00:00', 'Fechado', 'Alta', 1, 1, 1),
(2, 'Erro no sistema de vendas', 'O sistema de vendas apresenta erro ao tentar registrar um pedido.', '2026-09-16 09:15:00', NULL, 'Em andamento', 'Media', 5, 2, 2),
(3, 'Internet instavel', 'A conexao com a internet esta apresentando quedas frequentes.', '2026-09-17 10:00:00', '2026-09-17 14:30:00', 'Fechado', 'Alta', 3, 3, 3),
(4, 'Acesso ao sistema', 'O usuario nao consegue acessar o sistema de recursos humanos.', '2026-09-18 13:20:00', NULL, 'Aberto', 'Media', 2, 4, 4),
(5, 'Computador lento', 'O computador apresenta lentidao durante a utilizacao dos programas.', '2026-09-19 15:40:00', NULL, 'Em andamento', 'Baixa', 4, 1, 1);


INSERT INTO historico
(id_historico, id_chamado, id_usuario, data_hora, descricao, tipo)
VALUES
(1, 1, 1, '2026-09-15 08:45:00', 'Chamado recebido e encaminhado para o tecnico responsavel.', 'Atualizacao'),
(2, 1, 1, '2026-09-15 10:30:00', 'Foi identificado um problema na fonte de alimentacao do computador.', 'Diagnostico'),
(3, 1, 1, '2026-09-15 11:00:00', 'A fonte de alimentacao foi substituida e o computador voltou a funcionar.', 'Solucao'),
(4, 2, 5, '2026-09-16 09:30:00', 'Chamado encaminhado para analise do sistema de vendas.', 'Atualizacao'),
(5, 3, 3, '2026-09-17 14:30:00', 'Configuracao da rede corrigida e conexao estabilizada.', 'Solucao');


```
