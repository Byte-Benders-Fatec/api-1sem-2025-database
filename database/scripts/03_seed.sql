SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

USE fapg;

-- Seed: system_role
-- Papéis globais do sistema, definidos para controlar o nível de acesso administrativo.
-- Cada papel possui um nível hierárquico (level) que define sua autoridade dentro da plataforma.

INSERT INTO system_role (id, name, description, level) VALUES
(1, 'Super Admin', 'Acesso total ao sistema. Gerencia todos os administradores.', 100),
(2, 'Admin', 'Gerencia usuários, projetos e permissões.', 80),
(3, 'User', 'Usuário comum. Acessa apenas projetos atribuídos.', 50),
(4, 'Viewer', 'Acesso somente leitura aos projetos atribuídos.', 10);



-- Seed: user
-- Cadastro de usuários do sistema com diferentes níveis de acesso, definidos por system_role_id.
-- Os usuários incluem administradores, usuários comuns e visualizadores.
-- A senha está armazenada em formato de hash (exemplo fictício), e todos os usuários estão ativos.
-- A associação com system_role define o papel global do usuário na plataforma.

INSERT INTO user (id, name, email, is_active, system_role_id) VALUES
(UUID(), 'Joana Almeida', 'joana@fapg.org.br', TRUE, 1), -- Super Admin 
(UUID(), 'João Silva', 'joao@fapg.org.br', TRUE, 1), -- Super Admin
(UUID(), 'Carlos Santos', 'carlos@fapg.org.br', TRUE, 4), -- Viewer
(UUID(), 'Caio Vinicius', 'caio@fapg.org.br', TRUE, 4); -- Viewer

INSERT INTO user (id, name, email, is_active, system_role_id) VALUES
(UUID(), 'Ana Lima', 'ana@fapg.org.br', TRUE, 2), -- Admin
(UUID(), 'Ângela Teixeira', 'angela.teixeira@fapg.org.br', TRUE, 2), -- Admin
(UUID(), 'Aline Laura Gonçalves', 'aline.laura.goncalves@fapg.org.br', TRUE, 2), -- Admin
(UUID(), 'Amanda Beatriz Nascimento', 'amanda.beatriz.nascimento@fapg.org.br', TRUE, 3), -- User
(UUID(), 'Adriana Souza', 'adriana.souza@fapg.org.br', TRUE, 3), -- User
(UUID(), 'Alice Júlia Oliveira', 'alice.julia.oliveira@fapg.org.br', TRUE, 3), -- User
(UUID(), 'Antônia Silveira', 'antonia.silveira@fapg.org.br', TRUE, 3); -- User

INSERT INTO user (id, name, email, is_active, system_role_id) VALUES
(UUID(), 'Pedro Rocha', 'pedro@fapg.org.br', TRUE, 2), -- Admin
(UUID(), 'Paola Ramos', 'paola.ramos@fapg.org.br', TRUE, 2), -- Admin
(UUID(), 'Paulo Alves', 'paulo.alves@fapg.org.br', TRUE, 2), -- Admin
(UUID(), 'Patrício Peixoto', 'patricio.peixoto@fapg.org.br', TRUE, 3), -- User
(UUID(), 'Pâmela Pinto', 'pamela.pinto@fapg.org.br', TRUE, 3), -- User
(UUID(), 'Priscila Sales', 'priscila.sales@fapg.org.br', TRUE, 3), -- User
(UUID(), 'Pietro Viana', 'pietro.viana@fapg.org.br', TRUE, 3); -- User

INSERT INTO user (id, name, email, is_active, system_role_id) VALUES
(UUID(), 'Maria Oliveira', 'maria@fapg.org.br', TRUE, 2), -- Admin
(UUID(), 'Mônica da Paz', 'monica.da.paz@fapg.org.br', TRUE, 2), -- Admin
(UUID(), 'Manuela Cecília Teixeira', 'manuela.cecilia.teixeira@fapg.org.br', TRUE, 2), -- Admin
(UUID(), 'Marcelo Peixoto', 'marcelo.peixoto@fapg.org.br', TRUE, 3), -- User
(UUID(), 'Matheus Nascimento', 'matheus.nascimento@fapg.org.br', TRUE, 3), -- User
(UUID(), 'Milena Duarte', 'milena.duarte@fapg.org.br', TRUE, 3), -- User
(UUID(), 'Marina Rezende', 'marina.rezende@fapg.org.br', TRUE, 3); -- User



-- Seed: action
-- Ações padrão que representam operações permitidas no sistema.
-- Essas ações são utilizadas para compor permissões em conjunto com os módulos do sistema.

INSERT INTO action (id, name) VALUES
(1, 'View'),
(2, 'Create'),
(3, 'Edit'),
(4, 'Delete');



-- Seed: module
-- Módulos principais do sistema, representando as áreas onde as permissões são aplicadas.
-- Cada permissão é composta por um módulo e uma ação.

INSERT INTO module (id, name) VALUES
(1, 'User'),
(2, 'Team'),
(3, 'Project'),
(4, 'Activity'),
(5, 'Task'),
(6, 'Document'),
(7, 'Funding Agency'),
(8, 'Area');



-- Seed: permission (acesso controlado)
-- Permissões pré-definidas do sistema. São imutáveis via interface e não podem ser excluídas ou editadas.
-- Essas permissões são aplicadas apenas via associação a papéis (role_permission).

INSERT INTO permission (id, name, module_id, action_id, system_defined) VALUES
-- User (1)
(UUID(), 'User - View', 1, 1, TRUE),
(UUID(), 'User - Create', 1, 2, TRUE),
(UUID(), 'User - Edit', 1, 3, TRUE),
(UUID(), 'User - Delete', 1, 4, TRUE),

-- Team (2)
(UUID(), 'Team - View', 2, 1, TRUE),
(UUID(), 'Team - Create', 2, 2, TRUE),
(UUID(), 'Team - Edit', 2, 3, TRUE),
(UUID(), 'Team - Delete', 2, 4, TRUE),

-- Project (3)
(UUID(), 'Project - View', 3, 1, TRUE),
(UUID(), 'Project - Create', 3, 2, TRUE),
(UUID(), 'Project - Edit', 3, 3, TRUE),
(UUID(), 'Project - Delete', 3, 4, TRUE),

-- Activity (4)
(UUID(), 'Activity - View', 4, 1, TRUE),
(UUID(), 'Activity - Create', 4, 2, TRUE),
(UUID(), 'Activity - Edit', 4, 3, TRUE),
(UUID(), 'Activity - Delete', 4, 4, TRUE),

-- Task (5)
(UUID(), 'Task - View', 5, 1, TRUE),
(UUID(), 'Task - Create', 5, 2, TRUE),
(UUID(), 'Task - Edit', 5, 3, TRUE),
(UUID(), 'Task - Delete', 5, 4, TRUE),

-- Document (6)
(UUID(), 'Document - View', 6, 1, TRUE),
(UUID(), 'Document - Create', 6, 2, TRUE),
(UUID(), 'Document - Edit', 6, 3, TRUE),
(UUID(), 'Document - Delete', 6, 4, TRUE),

-- Funding Agency (7)
(UUID(), 'Funding Agency - View', 7, 1, TRUE),
(UUID(), 'Funding Agency - Create', 7, 2, TRUE),
(UUID(), 'Funding Agency - Edit', 7, 3, TRUE),
(UUID(), 'Funding Agency - Delete', 7, 4, TRUE),

-- Area (8)
(UUID(), 'Area - View', 8, 1, TRUE),
(UUID(), 'Area - Create', 8, 2, TRUE),
(UUID(), 'Area - Edit', 8, 3, TRUE),
(UUID(), 'Area - Delete', 8, 4, TRUE);



-- Seed: role
-- Papéis padrão do sistema atribuíveis a usuários no contexto de projetos.
-- Esses papéis são definidos pelo sistema (system_defined = TRUE) e controlam o nível de acesso às funcionalidades.
-- O papel "Colaborador" é o padrão para novos usuários atribuídos a projetos (is_default = TRUE).

INSERT INTO role (id, name, description, is_default, system_defined) VALUES
(UUID(), 'Coordenador', 'Responsável por liderar o projeto', FALSE, TRUE),
(UUID(), 'Colaborador', 'Participa da execução das atividades do projeto', TRUE, TRUE),
(UUID(), 'Gestor', 'Gerencia o progresso e recursos do projeto', FALSE, TRUE),
(UUID(), 'Observador', 'Pode visualizar o projeto, mas não realizar alterações', FALSE, TRUE);



-- Seed: role_permission
-- Associação entre papéis (roles) e permissões do sistema.
-- Define o que cada papel pode realizar em cada módulo do sistema.

INSERT INTO role_permission (id, role_id, permission_id)
SELECT UUID(), r.id, p.id
FROM role r
JOIN permission p ON (
  (r.name = 'Coordenador' AND (
    p.name LIKE 'User - %' OR
    p.name LIKE 'Team - %' OR
    p.name LIKE 'Project - %' OR
    p.name LIKE 'Activity - %' OR
    p.name LIKE 'Task - %' OR
    p.name LIKE 'Document - %' OR
    p.name LIKE 'Funding Agency - %' OR
    p.name LIKE 'Area - %'
  ))
  OR (r.name = 'Gestor' AND (
    p.name IN (
      'User - View',
      'Team - View', 'Team - Create', 'Team - Edit', 'Team - Delete',
      'Project - View', 'Project - Create', 'Project - Edit', 'Project - Delete',
      'Activity - View', 'Activity -Create', 'Activity - Edit', 'Activity - Delete',
      'Task - View', 'Task - Create', 'Task - Edit', 'Task - Delete',
      'Document - View', 'Document - Create', 'Document - Edit', 'Document - Delete',
      'Funding Agency - View', 'Funding Agency - Create', 'Funding Agency - Edit', 'Funding Agency - Delete',
      'Area - View', 'Area - Create', 'Area - Edit', 'Area - Delete'
    )
  ))
  OR (r.name = 'Colaborador' AND (
    p.name IN (
      'Team - View',
      'Project - View',
      'Activity - View', 'Activity - Edit',
      'Task - View', 'Task - Create', 'Task - Edit', 'Task - Delete',
      'Document - View', 'Document - Create', 'Document - Edit', 'Document - Delete'
    )
  ))
  OR (r.name = 'Observador' AND (
    p.name IN (
      'User - View',
      'Team - View',
      'Project - View',
      'Activity - View',
      'Task - View',
      'Document - View'
    )
  ))
);



-- Seed: funding_agency
-- Agências financiadoras mais comuns no cenário de pesquisa, inovação e extensão

INSERT INTO funding_agency (id, name, acronym, cnpj, website)
VALUES
  (UUID(),'Não aplicável','N/A','00.000.000/0001-00','N/A'),
  (UUID(), 'Coordenação de Aperfeiçoamento de Pessoal de Nível Superior', 'CAPES', '00.394.544/0001-62', 'https://www.gov.br/capes'),
  (UUID(), 'Fundação de Amparo à Pesquisa do Estado de São Paulo', 'FAPESP', '43.828.151/0001-45', 'https://fapesp.br'),
  (UUID(), 'Conselho Nacional de Desenvolvimento Científico e Tecnológico', 'CNPq', '33.654.831/0001-36', 'https://www.gov.br/cnpq'),
  (UUID(), 'Financiadora de Estudos e Projetos', 'Finep', '33.749.793/0001-01', 'https://www.finep.gov.br'),
  (UUID(), 'Serviço Brasileiro de Apoio às Micro e Pequenas Empresas', 'Sebrae', '03.813.990/0001-47', 'https://www.sebrae.com.br');



-- Seed: institution
-- Instituições de ensino e pesquisa beneficiadas por projetos

INSERT INTO institution (id, name, acronym, cnpj, website)
VALUES
  (UUID(), 'Não aplicável', 'N/A', '00.000.000/0001-00', 'N/A'),
  (UUID(), 'Fatec São José dos Campos – Prof. Jessen Vidal', 'FATEC-SJC', '62.823.257/0146-65', 'https://sjc.fatec.sp.gov.br'),
  (UUID(), 'Fatec Jacareí – Professor Francisco de Moura', 'FATEC-JACAREÍ', '62.823.257/0258-61', 'https://fatecjacarei.cps.sp.gov.br'),
  (UUID(), 'Fatec Taubaté', 'FATEC-TAUBATÉ', '62.823.257/0251-95', 'https://fatectaubate.cps.sp.gov.br'),
  (UUID(), 'Fatec Guaratinguetá – Prof. João Mod', 'FATEC-GUARATINGUETÁ', '62.823.257/0106-78', 'https://www.fatecguaratingueta.edu.br'),
  (UUID(), 'Fatec Mogi das Cruzes', 'FATEC-MOGI', '62.823.257/0184-90', 'https://www.fatecmogidascruzes.com.br'),
  (UUID(), 'Fatec São Paulo', 'FATEC-SP', '62.823.257/0015-04', 'https://www.fatecsp.br');



-- Seed: area
-- Áreas temáticas utilizadas para classificar os projetos cadastrados na plataforma.
-- Essa categorização permite filtrar, agrupar e analisar os projetos por domínio de conhecimento ou aplicação.

INSERT INTO area (id, name, description)
VALUES 
  (UUID(), 'Aeroespacial', 'Projetos relacionados a engenharia e tecnologia aeroespacial'),
  (UUID(), 'Saúde', 'Projetos voltados para biomedicina, saúde pública e ciências da vida'),
  (UUID(), 'Tecnologia da Informação', 'Projetos na área de desenvolvimento de software, dados e sistemas'),
  (UUID(), 'Educação', 'Projetos relacionados à inovação e pesquisa na área educacional'),
  (UUID(), 'Energia', 'Projetos sobre fontes de energia, sustentabilidade e eficiência energética'),
  (UUID(), 'Meio Ambiente', 'Projetos focados em preservação ambiental, ecologia e sustentabilidade'),
  (UUID(), 'Robótica', 'Projetos com foco em automação, robótica e mecatrônica');



-- Seed: document (com conteúdo PDF via LOAD_FILE)
-- Inserção dos arquivos PDF de exemplo gerados para projetos institucionais, com base nas agências financiadoras. 
-- Os arquivos devem estar previamente disponíveis na pasta configurada em `secure_file_priv`.

INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'documento_PRJ-0001_CAPES.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/documento_PRJ-0001_CAPES.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'documento_PRJ-0002_CAPES.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/documento_PRJ-0002_CAPES.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'documento_PRJ-0003_FAPESP.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/documento_PRJ-0003_FAPESP.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'documento_PRJ-0004_FAPESP.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/documento_PRJ-0004_FAPESP.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'documento_PRJ-0005_CNPq.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/documento_PRJ-0005_CNPq.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'documento_PRJ-0006_CNPq.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/documento_PRJ-0006_CNPq.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'documento_PRJ-0007_Finep.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/documento_PRJ-0007_Finep.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'documento_PRJ-0008_Finep.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/documento_PRJ-0008_Finep.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'documento_PRJ-0009_Sebrae.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/documento_PRJ-0009_Sebrae.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'documento_PRJ-0010_Sebrae.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/documento_PRJ-0010_Sebrae.pdf'));



-- Seed: project
-- Projetos institucionais de exemplo, com diferentes estágios (status) e datas coerentes com seus ciclos de vida.
-- Cada projeto possui referência ao usuário que o criou e ao usuário responsável pela sua condução.
-- Os vínculos com agências financiadoras, instituições e áreas temáticas são realizados por meio de tabelas associativas N:N,
-- com os identificadores buscados dinamicamente através de subqueries baseadas em valores únicos (ex: nome do usuário).

SET @ana_id = (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1);
SET @pedro_id =(SELECT id FROM user WHERE name = 'Pedro Rocha' LIMIT 1);
SET @maria_id =(SELECT id FROM user WHERE name = 'Maria Oliveira' LIMIT 1);

INSERT INTO project (id, name, code, description, status, is_active, start_date, end_date, budget, created_by_id, responsible_user_id)
VALUES (
  UUID(),
  'Projeto Exemplo 1',
  'PRJ-0001',
  'Projeto 1 gerado automaticamente para fins de teste e validação.',
  'Planejado',
  TRUE,
  '2023-01-01',
  '2023-06-30',
  100000.00,
  @ana_id,
  @ana_id
);

INSERT INTO project (id, name, code, description, status, is_active, start_date, end_date, budget, created_by_id, responsible_user_id)
VALUES (
  UUID(),
  'Projeto Exemplo 2',
  'PRJ-0002',
  'Projeto 2 gerado automaticamente para fins de teste e validação.',
  'Em andamento',
  TRUE,
  '2023-07-01',
  '2023-12-31',
  85000.00,
  @pedro_id,
  @pedro_id 
);

INSERT INTO project (id, name, code, description, status, is_active, start_date, end_date, budget, created_by_id, responsible_user_id)
VALUES (
  UUID(),
  'Projeto Exemplo 3',
  'PRJ-0003',
  'Projeto 3 gerado automaticamente para fins de teste e validação.',
  'Suspenso',
  TRUE,
  '2024-01-01',
  '2024-06-30',
  120000.00,
  @ana_id,
  @ana_id
);

INSERT INTO project (id, name, code, description, status, is_active, start_date, end_date, budget, created_by_id, responsible_user_id)
VALUES (
  UUID(),
  'Projeto Exemplo 4',
  'PRJ-0004',
  'Projeto 4 gerado automaticamente para fins de teste e validação.',
  'Cancelado',
  FALSE,
  '2024-01-01',
  '2024-06-30',
  0.00,
  @pedro_id,
  @pedro_id
);

INSERT INTO project (id, name, code, description, status, is_active, start_date, end_date, budget, created_by_id, responsible_user_id)
VALUES (
  UUID(),
  'Projeto Exemplo 5',
  'PRJ-0005',
  'Projeto 5 gerado automaticamente para fins de teste e validação.',
  'Concluído',
  FALSE,
  '2024-07-01',
  '2024-12-31',
  70000.00,
  @maria_id,
  @maria_id
);

INSERT INTO project (id, name, code, description, status, is_active, start_date, end_date, budget, created_by_id, responsible_user_id)
VALUES (
  UUID(),
  'Projeto Exemplo 6',
  'PRJ-0006',
  'Projeto 6 gerado automaticamente para fins de teste e validação.',
  'Em andamento',
  TRUE,
  '2024-07-01',
  '2024-12-31',
  95000.00,
  @maria_id,
  @maria_id
);

INSERT INTO project (id, name, code, description, status, is_active, start_date, end_date, budget, created_by_id, responsible_user_id)
VALUES (
  UUID(),
  'Projeto Exemplo 7',
  'PRJ-0007',
  'Projeto 7 gerado automaticamente para fins de teste e validação.',
  'Planejado',
  TRUE,
  '2025-01-01',
  '2025-06-30',
  200000.00,
  @ana_id,
  @ana_id
);

INSERT INTO project (id, name, code, description, status, is_active, start_date, end_date, budget, created_by_id, responsible_user_id)
VALUES (
  UUID(),
  'Projeto Exemplo 8',
  'PRJ-0008',
  'Projeto 8 gerado automaticamente para fins de teste e validação.',
  'Concluído',
  FALSE,
  '2025-01-01',
  '2025-06-30',
  110000.00,
  @ana_id,
  @ana_id
);

INSERT INTO project (id, name, code, description, status, is_active, start_date, end_date, budget, created_by_id, responsible_user_id)
VALUES (
  UUID(),
  'Projeto Exemplo 9',
  'PRJ-0009',
  'Projeto 9 gerado automaticamente para fins de teste e validação.',
  'Em andamento',
  TRUE,
  '2025-07-01',
  '2025-12-31',
  67000.00,
  @maria_id,
  @maria_id
);

INSERT INTO project (id, name, code, description, status, is_active, start_date, end_date, budget, created_by_id, responsible_user_id)
VALUES (
  UUID(),
  'Projeto Exemplo 10',
  'PRJ-0010',
  'Projeto 10 gerado automaticamente para fins de teste e validação.',
  'Cancelado',
  FALSE,
  '2025-07-01',
  '2025-12-31',
  0.00,
  @pedro_id,
  @pedro_id
);



-- Seed: project_area
-- Associação entre projetos e áreas temáticas, permitindo múltiplos rótulos por projeto.
-- Essa estrutura N:N permite classificar os projetos com maior flexibilidade e promover filtragens mais inteligentes.

INSERT INTO project_area (id, project_id, area_id)
VALUES
  -- PRJ-0001: Aeroespacial + Robótica
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1), (SELECT id FROM area WHERE name = 'Aeroespacial' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1), (SELECT id FROM area WHERE name = 'Robótica' LIMIT 1)),

  -- PRJ-0002: Saúde
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0002' LIMIT 1), (SELECT id FROM area WHERE name = 'Saúde' LIMIT 1)),

  -- PRJ-0003: Educação + Tecnologia da Informação
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1), (SELECT id FROM area WHERE name = 'Educação' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1), (SELECT id FROM area WHERE name = 'Tecnologia da Informação' LIMIT 1)),

  -- PRJ-0004: Energia
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0004' LIMIT 1), (SELECT id FROM area WHERE name = 'Energia' LIMIT 1)),

  -- PRJ-0005: Meio Ambiente + Saúde
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1), (SELECT id FROM area WHERE name = 'Meio Ambiente' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1), (SELECT id FROM area WHERE name = 'Saúde' LIMIT 1)),

  -- PRJ-0006: Tecnologia da Informação
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0006' LIMIT 1), (SELECT id FROM area WHERE name = 'Tecnologia da Informação' LIMIT 1)),

  -- PRJ-0007: Aeroespacial
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0007' LIMIT 1), (SELECT id FROM area WHERE name = 'Aeroespacial' LIMIT 1)),

  -- PRJ-0008: Educação
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1), (SELECT id FROM area WHERE name = 'Educação' LIMIT 1)),

  -- PRJ-0009: Meio Ambiente + Energia
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1), (SELECT id FROM area WHERE name = 'Meio Ambiente' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1), (SELECT id FROM area WHERE name = 'Energia' LIMIT 1)),

  -- PRJ-0010: Robótica + Tecnologia da Informação
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1), (SELECT id FROM area WHERE name = 'Robótica' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1), (SELECT id FROM area WHERE name = 'Tecnologia da Informação' LIMIT 1));



-- Seed: project_institution
-- Associação entre projetos e instituições de ensino/pesquisa, permitindo múltiplos vínculos institucionais por projeto.
-- Essa estrutura N:N amplia a rastreabilidade dos projetos e facilita análises institucionais.

INSERT INTO project_institution (id, project_id, institution_id)
VALUES
  -- PRJ-0001: FATEC-SJC, FATEC-SP, FATEC-TAUBATÉ
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-SJC' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-SP' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-TAUBATÉ' LIMIT 1)),

  -- PRJ-0002: FATEC-JACAREÍ
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0002' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-JACAREÍ' LIMIT 1)),

  -- PRJ-0003: FATEC-SJC, FATEC-MOGI
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-SJC' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-MOGI' LIMIT 1)),

  -- PRJ-0004: FATEC-TAUBATÉ
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0004' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-TAUBATÉ' LIMIT 1)),

  -- PRJ-0005: FATEC-GUARATINGUETÁ, FATEC-JACAREÍ
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-GUARATINGUETÁ' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-JACAREÍ' LIMIT 1)),

  -- PRJ-0006: FATEC-SP
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0006' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-SP' LIMIT 1)),

  -- PRJ-0007: FATEC-SJC
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0007' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-SJC' LIMIT 1)),

  -- PRJ-0008: FATEC-TAUBATÉ, FATEC-MOGI
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-TAUBATÉ' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-MOGI' LIMIT 1)),

  -- PRJ-0009: FATEC-GUARATINGUETÁ
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-GUARATINGUETÁ' LIMIT 1)),

  -- PRJ-0010: FATEC-SJC, FATEC-SP, FATEC-JACAREÍ
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-SJC' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-SP' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1), (SELECT id FROM institution WHERE acronym = 'FATEC-JACAREÍ' LIMIT 1));



-- Seed: project_funding_agency
-- Associação entre projetos e agências financiadoras, permitindo múltiplas fontes de fomento por projeto.
-- Essa estrutura N:N permite rastrear com precisão as origens de financiamento e facilitar análises por agência.

INSERT INTO project_funding_agency (id, project_id, funding_agency_id)
VALUES
  -- PRJ-0001: CAPES, CNPq
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'CAPES' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'CNPq' LIMIT 1)),

  -- PRJ-0002: FAPESP
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0002' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'FAPESP' LIMIT 1)),

  -- PRJ-0003: Finep, Sebrae, CAPES
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'Finep' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'Sebrae' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'CAPES' LIMIT 1)),

  -- PRJ-0004: CNPq
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0004' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'CNPq' LIMIT 1)),

  -- PRJ-0005: CAPES, FAPESP
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'CAPES' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'FAPESP' LIMIT 1)),

  -- PRJ-0006: Finep
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0006' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'Finep' LIMIT 1)),

  -- PRJ-0007: Sebrae
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0007' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'Sebrae' LIMIT 1)),

  -- PRJ-0008: FAPESP, CNPq
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'FAPESP' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'CNPq' LIMIT 1)),

  -- PRJ-0009: CAPES
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'CAPES' LIMIT 1)),

  -- PRJ-0010: Sebrae, Finep, CAPES
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'Sebrae' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'Finep' LIMIT 1)),
  (UUID(), (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1), (SELECT id FROM funding_agency WHERE acronym = 'CAPES' LIMIT 1));



-- Seed: project_document
-- Associação entre projetos e documentos PDF previamente cadastrados no sistema.
-- Cada projeto recebe um documento correspondente com base no código do projeto (ex: PRJ-0001).
-- A associação utiliza subqueries para localizar os IDs de projeto e documento por código e nome.

INSERT INTO project_document (id, project_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0001'),
  (SELECT id FROM document WHERE name = 'documento_PRJ-0001_CAPES.pdf')
);
INSERT INTO project_document (id, project_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0002'),
  (SELECT id FROM document WHERE name = 'documento_PRJ-0002_CAPES.pdf')
);
INSERT INTO project_document (id, project_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0003'),
  (SELECT id FROM document WHERE name = 'documento_PRJ-0003_FAPESP.pdf')
);
INSERT INTO project_document (id, project_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0004'),
  (SELECT id FROM document WHERE name = 'documento_PRJ-0004_FAPESP.pdf')
);
INSERT INTO project_document (id, project_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0005'),
  (SELECT id FROM document WHERE name = 'documento_PRJ-0005_CNPq.pdf')
);
INSERT INTO project_document (id, project_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0006'),
  (SELECT id FROM document WHERE name = 'documento_PRJ-0006_CNPq.pdf')
);
INSERT INTO project_document (id, project_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0007'),
  (SELECT id FROM document WHERE name = 'documento_PRJ-0007_Finep.pdf')
);
INSERT INTO project_document (id, project_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0008'),
  (SELECT id FROM document WHERE name = 'documento_PRJ-0008_Finep.pdf')
);
INSERT INTO project_document (id, project_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0009'),
  (SELECT id FROM document WHERE name = 'documento_PRJ-0009_Sebrae.pdf')
);
INSERT INTO project_document (id, project_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0010'),
  (SELECT id FROM document WHERE name = 'documento_PRJ-0010_Sebrae.pdf')
);



-- Seed: user_project
-- Associação de usuários a projetos com papéis específicos (Coordenador, Gestor, Colaborador, Observador).
-- Cada projeto recebe quatro usuários com papéis distintos, utilizando subqueries para localizar os respectivos IDs.
-- Essa estrutura permite controle de acesso e responsabilidades diferenciadas por projeto.

INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Coordenador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Aline Laura Gonçalves' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Gestor' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Adriana Souza' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Colaborador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Alice Júlia Oliveira' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Observador' LIMIT 1)
);


INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Pedro Rocha' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0002' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Coordenador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Paulo Alves' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0002' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Gestor' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Pâmela Pinto' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0002' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Colaborador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Pietro Viana' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0002' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Observador' LIMIT 1)
);


INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Coordenador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Ângela Teixeira' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Gestor' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Amanda Beatriz Nascimento' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Colaborador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Adriana Souza' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Observador' LIMIT 1)
);


INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Pedro Rocha' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0004' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Coordenador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Paola Ramos' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0004' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Gestor' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Pietro Viana' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0004' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Colaborador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Pâmela Pinto' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0004' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Observador' LIMIT 1)
);


INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Maria Oliveira' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Coordenador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Manuela Cecília Teixeira' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Gestor' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Matheus Nascimento' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Colaborador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Marina Rezende' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Observador' LIMIT 1)
);


INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Maria Oliveira' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0006' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Coordenador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Mônica da Paz' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0006' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Gestor' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Marcelo Peixoto' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0006' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Colaborador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Milena Duarte' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0006' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Observador' LIMIT 1)
);


INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0007' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Coordenador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Ângela Teixeira' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0007' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Gestor' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Alice Júlia Oliveira' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0007' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Colaborador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Antônia Silveira' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0007' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Observador' LIMIT 1)
);


INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Coordenador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Aline Laura Gonçalves' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Gestor' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Antônia Silveira' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Colaborador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Adriana Souza' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Observador' LIMIT 1)
);


INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Maria Oliveira' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Coordenador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Manuela Cecília Teixeira' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Gestor' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Marcelo Peixoto' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Colaborador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Matheus Nascimento' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Observador' LIMIT 1)
);


INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Pedro Rocha' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Coordenador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Paola Ramos' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Gestor' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Priscila Sales' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Colaborador' LIMIT 1)
);
INSERT INTO user_project (id, user_id, project_id, role_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Paulo Alves' LIMIT 1),
  (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1),
  (SELECT id FROM role WHERE name = 'Observador' LIMIT 1)
);



-- Seed: team
-- Criação de três times institucionais utilizados para organizar os usuários do sistema.
-- Os times são definidos com base na inicial do primeiro nome dos usuários.
-- Todos os times estão ativos e podem ser vinculados a projetos ou atividades colaborativas.

INSERT INTO team (id, name, description, is_active)
VALUES (
  UUID(),
  'Alpha',
  'Time formado por usuários com nomes iniciados em A',
  TRUE
);
INSERT INTO team (id, name, description, is_active)
VALUES (
  UUID(),
  'Papa',
  'Time formado por usuários com nomes iniciados em P',
  TRUE
);
INSERT INTO team (id, name, description, is_active)
VALUES (
  UUID(),
  'Mike',
  'Time formado por usuários com nomes iniciados em M',
  TRUE
);



-- Seed: user_team
-- Associação de usuários aos seus respectivos times institucionais.
-- Os usuários são agrupados de acordo com a inicial de seus nomes.
-- Essa estrutura facilita a filtragem de usuários no momento de associá-los a projetos e atividades.

INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Alpha' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Ângela Teixeira' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Alpha' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Aline Laura Gonçalves' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Alpha' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Amanda Beatriz Nascimento' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Alpha' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Adriana Souza' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Alpha' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Alice Júlia Oliveira' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Alpha' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Antônia Silveira' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Alpha' LIMIT 1)
);

INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Pedro Rocha' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Papa' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Paola Ramos' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Papa' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Paulo Alves' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Papa' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Patrício Peixoto' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Papa' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Pâmela Pinto' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Papa' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Priscila Sales' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Papa' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Pietro Viana' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Papa' LIMIT 1)
);

INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Maria Oliveira' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Mike' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Mônica da Paz' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Mike' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Manuela Cecília Teixeira' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Mike' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Marcelo Peixoto' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Mike' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Matheus Nascimento' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Mike' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Milena Duarte' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Mike' LIMIT 1)
);
INSERT INTO user_team (id, user_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM user WHERE name = 'Marina Rezende' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Mike' LIMIT 1)
);



-- Seed: project_team
-- Associação entre projetos e os times autorizados a colaborar em cada um deles.
-- Essa estrutura permite controlar quais usuários podem ser vinculados ao projeto,
-- com base em sua participação em times previamente cadastrados.

INSERT INTO project_team (id, project_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Alpha' LIMIT 1)
);
INSERT INTO project_team (id, project_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0002' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Papa' LIMIT 1)
);
INSERT INTO project_team (id, project_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Alpha' LIMIT 1)
);
INSERT INTO project_team (id, project_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0004' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Papa' LIMIT 1)
);
INSERT INTO project_team (id, project_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Mike' LIMIT 1)
);
INSERT INTO project_team (id, project_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0006' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Mike' LIMIT 1)
);
INSERT INTO project_team (id, project_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0007' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Alpha' LIMIT 1)
);
INSERT INTO project_team (id, project_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Alpha' LIMIT 1)
);
INSERT INTO project_team (id, project_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Mike' LIMIT 1)
);
INSERT INTO project_team (id, project_id, team_id)
VALUES (
  UUID(),
  (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1),
  (SELECT id FROM team WHERE name = 'Papa' LIMIT 1)
);



-- Seed: activity
-- Inserção de atividades associadas aos projetos existentes no sistema.
-- Cada atividade possui título, período de execução e orçamento previsto.

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 1 de PRJ-0001', 'Atividade 1, PRJ-0001: gerada automaticamente para testes', '2023-01-01', '2023-02-28', 'Não iniciada', TRUE, 6029.00,
    (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 2 de PRJ-0001', 'Atividade 2, PRJ-0001: gerada automaticamente para testes', '2023-03-01', '2023-04-30', 'Não iniciada', TRUE, 6169.00,
    (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 3 de PRJ-0001', 'Atividade 3, PRJ-0001: gerada automaticamente para testes', '2023-05-01', '2023-06-30', 'Não iniciada', TRUE, 4042.00,
    (SELECT id FROM project WHERE code = 'PRJ-0001' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 1 de PRJ-0002', 'Atividade 1, PRJ-0002: gerada automaticamente para testes', '2023-07-01', '2023-08-31', 'Concluída', FALSE, 6685.00,
    (SELECT id FROM project WHERE code = 'PRJ-0002' LIMIT 1),
    @pedro_id,
    @pedro_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 2 de PRJ-0002', 'Atividade 2, PRJ-0002: gerada automaticamente para testes', '2023-09-01', '2023-10-31', 'Concluída', FALSE, 2700.00,
    (SELECT id FROM project WHERE code = 'PRJ-0002' LIMIT 1),
    @pedro_id,
    @pedro_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 3 de PRJ-0002', 'Atividade 3, PRJ-0002: gerada automaticamente para testes', '2023-11-01', '2023-12-31', 'Em andamento', TRUE, 8673.00,
    (SELECT id FROM project WHERE code = 'PRJ-0002' LIMIT 1),
    @pedro_id,
    @pedro_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 1 de PRJ-0003', 'Atividade 1, PRJ-0003: gerada automaticamente para testes', '2024-01-01', '2024-02-29', 'Concluída', FALSE, 3552.00,
    (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 2 de PRJ-0003', 'Atividade 2, PRJ-0003: gerada automaticamente para testes', '2024-03-01', '2024-04-30', 'Em andamento', TRUE, 8302.00,
    (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 3 de PRJ-0003', 'Atividade 3, PRJ-0003: gerada automaticamente para testes', '2024-05-01', '2024-06-30', 'Cancelada', FALSE, 5445.00,
    (SELECT id FROM project WHERE code = 'PRJ-0003' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 1 de PRJ-0004', 'Atividade 1, PRJ-0004: gerada automaticamente para testes', '2024-01-01', '2024-02-29', 'Concluída', FALSE, 0.00,
    (SELECT id FROM project WHERE code = 'PRJ-0004' LIMIT 1),
    @pedro_id,
    @pedro_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 2 de PRJ-0004', 'Atividade 2, PRJ-0004: gerada automaticamente para testes', '2024-03-01', '2024-04-30', 'Cancelada', FALSE, 0.00,
    (SELECT id FROM project WHERE code = 'PRJ-0004' LIMIT 1),
    @pedro_id,
    @pedro_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 3 de PRJ-0004', 'Atividade 3, PRJ-0004: gerada automaticamente para testes', '2024-05-01', '2024-06-30', 'Cancelada', FALSE, 0.00,
    (SELECT id FROM project WHERE code = 'PRJ-0004' LIMIT 1),
    @pedro_id,
    @pedro_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 1 de PRJ-0005', 'Atividade 1, PRJ-0005: gerada automaticamente para testes', '2024-07-01', '2024-08-31', 'Concluída', FALSE, 9124.00,
    (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1),
    @maria_id,
    @maria_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 2 de PRJ-0005', 'Atividade 2, PRJ-0005: gerada automaticamente para testes', '2024-09-01', '2024-10-31', 'Concluída', FALSE, 3639.00,
    (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1),
    @maria_id,
    @maria_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 3 de PRJ-0005', 'Atividade 3, PRJ-0005: gerada automaticamente para testes', '2024-11-01', '2024-12-31', 'Concluída', FALSE, 4452.00,
    (SELECT id FROM project WHERE code = 'PRJ-0005' LIMIT 1),
    @maria_id,
    @maria_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 1 de PRJ-0006', 'Atividade 1, PRJ-0006: gerada automaticamente para testes', '2024-07-01', '2024-08-31', 'Concluída', FALSE, 6152.00,
    (SELECT id FROM project WHERE code = 'PRJ-0006' LIMIT 1),
    @maria_id,
    @maria_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 2 de PRJ-0006', 'Atividade 2, PRJ-0006: gerada automaticamente para testes', '2024-09-01', '2024-10-31', 'Em andamento', TRUE, 2828.00,
    (SELECT id FROM project WHERE code = 'PRJ-0006' LIMIT 1),
    @maria_id,
    @maria_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 3 de PRJ-0006', 'Atividade 3, PRJ-0006: gerada automaticamente para testes', '2024-11-01', '2024-12-31', 'Não iniciada', TRUE, 8346.00,
    (SELECT id FROM project WHERE code = 'PRJ-0006' LIMIT 1),
    @maria_id,
    @maria_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 1 de PRJ-0007', 'Atividade 1, PRJ-0007: gerada automaticamente para testes', '2025-01-01', '2025-02-28', 'Não iniciada', TRUE, 3343.00,
    (SELECT id FROM project WHERE code = 'PRJ-0007' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 2 de PRJ-0007', 'Atividade 2, PRJ-0007: gerada automaticamente para testes', '2025-03-01', '2025-04-30', 'Não iniciada', TRUE, 4829.00,
    (SELECT id FROM project WHERE code = 'PRJ-0007' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 3 de PRJ-0007', 'Atividade 3, PRJ-0007: gerada automaticamente para testes', '2025-05-01', '2025-06-30', 'Não iniciada', TRUE, 9379.00,
    (SELECT id FROM project WHERE code = 'PRJ-0007' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 1 de PRJ-0008', 'Atividade 1, PRJ-0008: gerada automaticamente para testes', '2025-01-01', '2025-02-28', 'Concluída', FALSE, 1999.00,
    (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 2 de PRJ-0008', 'Atividade 2, PRJ-0008: gerada automaticamente para testes', '2025-03-01', '2025-04-30', 'Concluída', FALSE, 6719.00,
    (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 3 de PRJ-0008', 'Atividade 3, PRJ-0008: gerada automaticamente para testes', '2025-05-01', '2025-06-30', 'Não iniciada', TRUE, 2150.00,
    (SELECT id FROM project WHERE code = 'PRJ-0008' LIMIT 1),
    @ana_id,
    @ana_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 1 de PRJ-0009', 'Atividade 1, PRJ-0009: gerada automaticamente para testes', '2025-07-01', '2025-08-31', 'Não iniciada', TRUE, 9435.00,
    (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1),
    @maria_id,
    @maria_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 2 de PRJ-0009', 'Atividade 2, PRJ-0009: gerada automaticamente para testes', '2025-09-01', '2025-10-31', 'Não iniciada', TRUE, 8048.00,
    (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1),
    @maria_id,
    @maria_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 3 de PRJ-0009', 'Atividade 3, PRJ-0009: gerada automaticamente para testes', '2025-11-01', '2025-12-31', 'Não iniciada', TRUE, 8196.00,
    (SELECT id FROM project WHERE code = 'PRJ-0009' LIMIT 1),
    @maria_id,
    @maria_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 1 de PRJ-0010', 'Atividade 1, PRJ-0010: gerada automaticamente para testes', '2025-07-01', '2025-08-31', 'Cancelada', FALSE, 0.00,
    (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1),
    @pedro_id,
    @pedro_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 2 de PRJ-0010', 'Atividade 2, PRJ-0010: gerada automaticamente para testes', '2025-09-01', '2025-10-31', 'Cancelada', FALSE, 0.00,
    (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1),
    @pedro_id,
    @pedro_id
);

INSERT INTO activity (
    id, name, description, start_date, end_date, status, is_active, allocated_budget, project_id, created_by_id, responsible_user_id
) VALUES (
    UUID(), 'Atividade 3 de PRJ-0010', 'Atividade 3, PRJ-0010: gerada automaticamente para testes', '2025-11-01', '2025-12-31', 'Cancelada', FALSE, 0.00,
    (SELECT id FROM project WHERE code = 'PRJ-0010' LIMIT 1),
    @pedro_id,
    @pedro_id
);



-- Seed: activity_user
-- Associação de responsáveis às atividades de cada projeto com base nos times autorizados

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0001' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0001' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Ângela Teixeira' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0001' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Aline Laura Gonçalves' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0001' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Amanda Beatriz Nascimento' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0001' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Adriana Souza' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0002' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Pedro Rocha' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0002' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Pâmela Pinto' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0003' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Ângela Teixeira' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0003' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Aline Laura Gonçalves' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0004' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Paulo Alves' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0004' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Priscila Sales' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0005' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Maria Oliveira' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0005' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Marcelo Peixoto' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0006' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Matheus Nascimento' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0006' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Mônica da Paz' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0007' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Amanda Beatriz Nascimento' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0007' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Antônia Silveira' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0008' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0008' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Alice Júlia Oliveira' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0009' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Marcelo Peixoto' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0009' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Maria Oliveira' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0009' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Marina Rezende' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0009' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Milena Duarte' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0010' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Paola Ramos' LIMIT 1)
);

INSERT INTO activity_user (
    id, activity_id, user_id
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0010' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Pietro Viana' LIMIT 1)
);



-- Seed: document (com conteúdo PDF via LOAD_FILE)
-- Inserção dos arquivos PDF correspondentes às atividades dos projetos.
-- Cada documento representa uma atividade específica, numerada de acordo com o projeto e a ordem da atividade.
-- Os arquivos devem estar previamente disponíveis na pasta configurada em `secure_file_priv`.

INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'atividade_PRJ-0001_1.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/atividade_PRJ-0001_1.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'atividade_PRJ-0001_2.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/atividade_PRJ-0001_2.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'atividade_PRJ-0001_3.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/atividade_PRJ-0001_3.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'atividade_PRJ-0002_1.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/atividade_PRJ-0002_1.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'atividade_PRJ-0002_2.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/atividade_PRJ-0002_2.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'atividade_PRJ-0002_3.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/atividade_PRJ-0002_3.pdf'));



-- Seed: activity_document
-- Associação entre atividades e documentos PDF previamente cadastrados no sistema.
-- Cada atividade recebe um documento correspondente com base no código do projeto e ordem de inserção.
-- O relacionamento é realizado utilizando subqueries para localizar os respectivos IDs.

INSERT INTO activity_document (id, activity_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM activity WHERE project_id = (SELECT id FROM project WHERE code = 'PRJ-0001') LIMIT 0, 1),
  (SELECT id FROM document WHERE name = 'atividade_PRJ-0001_1.pdf' LIMIT 1)
);
INSERT INTO activity_document (id, activity_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM activity WHERE project_id = (SELECT id FROM project WHERE code = 'PRJ-0001') LIMIT 1, 1),
  (SELECT id FROM document WHERE name = 'atividade_PRJ-0001_2.pdf' LIMIT 1)
);
INSERT INTO activity_document (id, activity_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM activity WHERE project_id = (SELECT id FROM project WHERE code = 'PRJ-0001') LIMIT 2, 1),
  (SELECT id FROM document WHERE name = 'atividade_PRJ-0001_3.pdf' LIMIT 1)
);
INSERT INTO activity_document (id, activity_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM activity WHERE project_id = (SELECT id FROM project WHERE code = 'PRJ-0002') LIMIT 0, 1),
  (SELECT id FROM document WHERE name = 'atividade_PRJ-0002_1.pdf' LIMIT 1)
);
INSERT INTO activity_document (id, activity_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM activity WHERE project_id = (SELECT id FROM project WHERE code = 'PRJ-0002') LIMIT 1, 1),
  (SELECT id FROM document WHERE name = 'atividade_PRJ-0002_2.pdf' LIMIT 1)
);
INSERT INTO activity_document (id, activity_id, document_id)
VALUES (
  UUID(),
  (SELECT id FROM activity WHERE project_id = (SELECT id FROM project WHERE code = 'PRJ-0002') LIMIT 2, 1),
  (SELECT id FROM document WHERE name = 'atividade_PRJ-0002_3.pdf' LIMIT 1)
);



-- Seed: task
-- Tarefas realizadas por usuários responsáveis dentro das atividades atribuídas

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0001' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1),
    'Documentação',
    'Relatório de progresso entregue.',
    90,
    189.64,
    '2023-01-15'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0001' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1),
    'Reunião técnica',
    'Execução parcial com ajustes previstos.',
    120,
    175.98,
    '2023-02-15'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0001' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Adriana Souza' LIMIT 1),
    'Reunião técnica',
    'Atividade realizada conforme planejamento.',
    150,
    215.16,
    '2023-03-10'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0001' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Adriana Souza' LIMIT 1),
    'Análise preliminar',
    'Contribuição significativa para o andamento da atividade.',
    60,
    181.77,
    '2023-04-20'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0002' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Pedro Rocha' LIMIT 1),
    'Análise preliminar',
    'Atividade realizada conforme planejamento.',
    60,
    415.02,
    '2023-07-05'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0002' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Pedro Rocha' LIMIT 1),
    'Reunião técnica',
    'Relatório de progresso entregue.',
    90,
    284.71,
    '2023-08-10'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0002' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Pâmela Pinto' LIMIT 1),
    'Apresentação interna',
    'Tarefa concluída com sucesso.',
    120,
    345.27,
    '2023-11-15'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0002' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Pâmela Pinto' LIMIT 1),
    'Desenvolvimento inicial',
    'Alinhamento com equipe técnica.',
    150,
    291.72,
    '2023-12-25'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0003' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Ângela Teixeira' LIMIT 1),
    'Apresentação interna',
    'Execução parcial com ajustes previstos.',
    180,
    123.5,
    '2024-03-15'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0003' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Ângela Teixeira' LIMIT 1),
    'Documentação',
    'Relatório de progresso entregue.',
    120,
    295.76,
    '2024-04-30'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0003' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Aline Laura Gonçalves' LIMIT 1),
    'Análise preliminar',
    'Relatório de progresso entregue.',
    60,
    391.37,
    '2024-06-20'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0003' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Aline Laura Gonçalves' LIMIT 1),
    'Análise preliminar',
    'Alinhamento com equipe técnica.',
    180,
    471.46,
    '2024-05-20'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0004' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Paulo Alves' LIMIT 1),
    'Coleta de dados',
    'Atividade realizada conforme planejamento.',
    150,
    350.58,
    '2024-01-05'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0004' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Paulo Alves' LIMIT 1),
    'Apresentação interna',
    'Contribuição significativa para o andamento da atividade.',
    90,
    196.89,
    '2024-02-10'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0004' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Priscila Sales' LIMIT 1),
    'Documentação',
    'Alinhamento com equipe técnica.',
    120,
    290.63,
    '2024-05-15'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0004' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Priscila Sales' LIMIT 1),
    'Apresentação interna',
    'Relatório de progresso entregue.',
    150,
    322.52,
    '2024-06-20'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0005' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Maria Oliveira' LIMIT 1),
    'Apresentação interna',
    'Contribuição significativa para o andamento da atividade.',
    150,
    372.53,
    '2024-07-25'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0005' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Maria Oliveira' LIMIT 1),
    'Apresentação interna',
    'Contribuição significativa para o andamento da atividade.',
    120,
    487.06,
    '2024-08-15'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0005' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Marcelo Peixoto' LIMIT 1),
    'Análise preliminar',
    'Contribuição significativa para o andamento da atividade.',
    60,
    239.49,
    '2024-09-10'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0005' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Marcelo Peixoto' LIMIT 1),
    'Coleta de dados',
    'Alinhamento com equipe técnica.',
    150,
    382.16,
    '2024-10-10'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0006' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Matheus Nascimento' LIMIT 1),
    'Reunião técnica',
    'Atividade realizada conforme planejamento.',
    180,
    124.98,
    '2024-09-08'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0006' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Matheus Nascimento' LIMIT 1),
    'Apresentação interna',
    'Relatório de progresso entregue.',
    180,
    216.12,
    '2024-10-16'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0006' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Mônica da Paz' LIMIT 1),
    'Documentação',
    'Execução parcial com ajustes previstos.',
    180,
    118.43,
    '2024-11-09'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0006' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Mônica da Paz' LIMIT 1),
    'Coleta de dados',
    'Atividade realizada conforme planejamento.',
    180,
    352.47,
    '2024-12-18'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0007' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Amanda Beatriz Nascimento' LIMIT 1),
    'Coleta de dados',
    'Contribuição significativa para o andamento da atividade.',
    60,
    496.78,
    '2025-01-12'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0007' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Amanda Beatriz Nascimento' LIMIT 1),
    'Documentação',
    'Atividade realizada conforme planejamento.',
    60,
    223.03,
    '2025-02-24'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0007' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Antônia Silveira' LIMIT 1),
    'Documentação',
    'Alinhamento com equipe técnica.',
    60,
    194.76,
    '2025-03-13'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0007' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Antônia Silveira' LIMIT 1),
    'Documentação',
    'Atividade realizada conforme planejamento.',
    150,
    443.31,
    '2025-04-26'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0008' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1),
    'Desenvolvimento inicial',
    'Atividade realizada conforme planejamento.',
    180,
    353.19,
    '2025-01-10'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0008' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Ana Lima' LIMIT 1),
    'Apresentação interna',
    'Tarefa concluída com sucesso.',
    150,
    447.59,
    '2025-02-20'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0008' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Alice Júlia Oliveira' LIMIT 1),
    'Desenvolvimento inicial',
    'Tarefa concluída com sucesso.',
    120,
    230.84,
    '2025-05-05'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0008' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Alice Júlia Oliveira' LIMIT 1),
    'Apresentação interna',
    'Relatório de progresso entregue.',
    180,
    419.06,
    '2025-06-05'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0009' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Marcelo Peixoto' LIMIT 1),
    'Documentação',
    'Execução parcial com ajustes previstos.',
    90,
    341.19,
    '2025-08-15'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0009' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Marina Rezende' LIMIT 1),
    'Apresentação interna',
    'Execução parcial com ajustes previstos.',
    60,
    311.08,
    '2025-10-20'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0009' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Milena Duarte' LIMIT 1),
    'Coleta de dados',
    'Contribuição significativa para o andamento da atividade.',
    60,
    160.4,
    '2025-11-25'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 3 de PRJ-0009' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Milena Duarte' LIMIT 1),
    'Apresentação interna',
    'Relatório de progresso entregue.',
    120,
    243.98,
    '2025-12-25'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0010' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Paola Ramos' LIMIT 1),
    'Coleta de dados',
    'Tarefa concluída com sucesso.',
    120,
    137.42,
    '2025-07-05'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 1 de PRJ-0010' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Paola Ramos' LIMIT 1),
    'Análise preliminar',
    'Execução parcial com ajustes previstos.',
    60,
    219.84,
    '2025-08-25'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0010' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Pietro Viana' LIMIT 1),
    'Análise preliminar',
    'Contribuição significativa para o andamento da atividade.',
    120,
    346.24,
    '2025-09-06'
);

INSERT INTO task (
    id, activity_id, user_id, title, description, time_spent_minutes, cost, date
) VALUES (
    UUID(),
    (SELECT id FROM activity WHERE name = 'Atividade 2 de PRJ-0010' LIMIT 1),
    (SELECT id FROM user WHERE name = 'Pietro Viana' LIMIT 1),
    'Documentação',
    'Relatório de progresso entregue.',
    180,
    333.87,
    '2025-10-12'
);



-- Seed: document (com conteúdo PDF via LOAD_FILE)
-- Inserção dos arquivos PDF correspondentes às tarefas realizadas em atividades dos projetos.
-- Cada documento representa uma tarefa executada por um usuário, identificada por projeto e número sequencial.
-- Os arquivos devem estar previamente disponíveis na pasta configurada em `secure_file_priv`.

INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'tarefa_PRJ-0001_1.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tarefa_PRJ-0001_1.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'tarefa_PRJ-0001_2.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tarefa_PRJ-0001_2.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'tarefa_PRJ-0002_1.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tarefa_PRJ-0002_1.pdf'));
INSERT INTO document (id, name, mime_type, content)
VALUES (UUID(), 'tarefa_PRJ-0002_2.pdf', 'application/pdf', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tarefa_PRJ-0002_2.pdf'));



-- Seed: task_document
-- Associação entre tarefas e documentos PDF previamente cadastrados no sistema.
-- Cada tarefa recebe um documento correspondente com base no nome da atividade e código do projeto.

INSERT INTO task_document (id, task_id, document_id)
VALUES (
  UUID(),
  (SELECT t.id
   FROM task t
   JOIN activity a ON t.activity_id = a.id
   JOIN project p ON a.project_id = p.id
   WHERE p.code = 'PRJ-0001' AND a.name = 'Atividade 1 de PRJ-0001' LIMIT 0, 1),
  (SELECT id FROM document WHERE name = 'tarefa_PRJ-0001_1.pdf' LIMIT 1)
);

INSERT INTO task_document (id, task_id, document_id)
VALUES (
  UUID(),
  (SELECT t.id
   FROM task t
   JOIN activity a ON t.activity_id = a.id
   JOIN project p ON a.project_id = p.id
   WHERE p.code = 'PRJ-0001' AND a.name = 'Atividade 1 de PRJ-0001' LIMIT 1, 1),
  (SELECT id FROM document WHERE name = 'tarefa_PRJ-0001_2.pdf' LIMIT 1)
);

INSERT INTO task_document (id, task_id, document_id)
VALUES (
  UUID(),
  (SELECT t.id
   FROM task t
   JOIN activity a ON t.activity_id = a.id
   JOIN project p ON a.project_id = p.id
   WHERE p.code = 'PRJ-0002' AND a.name = 'Atividade 1 de PRJ-0002' LIMIT 0, 1),
  (SELECT id FROM document WHERE name = 'tarefa_PRJ-0002_1.pdf' LIMIT 1)
);

INSERT INTO task_document (id, task_id, document_id)
VALUES (
  UUID(),
  (SELECT t.id
   FROM task t
   JOIN activity a ON t.activity_id = a.id
   JOIN project p ON a.project_id = p.id
   WHERE p.code = 'PRJ-0002' AND a.name = 'Atividade 1 de PRJ-0002' LIMIT 1, 1),
  (SELECT id FROM document WHERE name = 'tarefa_PRJ-0002_2.pdf' LIMIT 1)
);
