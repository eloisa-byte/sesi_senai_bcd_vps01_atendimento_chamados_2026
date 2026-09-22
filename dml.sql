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

