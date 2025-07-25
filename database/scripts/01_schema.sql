
CREATE DATABASE IF NOT EXISTS fapg
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;

USE fapg;

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- Tabela: system_role
-- Finalidade: Armazena os papéis globais de acesso do sistema, como Super Admin, Admin, User e Viewer.
-- Cada papel possui um Id único, nome, descrição e nível hierárquico.

CREATE TABLE IF NOT EXISTS system_role (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT 'ID do papel global do sistema',
    name VARCHAR(50) NOT NULL UNIQUE COMMENT 'Nome do papel (ex: Admin, Viewer)',
    description VARCHAR(255) NOT NULL COMMENT 'Descrição do papel e sua função no sistema',
    level INT NOT NULL UNIQUE COMMENT 'Nível hierárquico do papel (valores maiores indicam maior acesso)'
) COMMENT = 'Tabela de definição de papéis de acesso globais do sistema';



-- Tabela: user
-- Finalidade: Armazena os dados cadastrais e de acesso lógico dos usuários do sistema.

CREATE TABLE IF NOT EXISTS user (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID do usuário',
    name VARCHAR(100) NOT NULL COMMENT 'Nome completo do usuário',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'E-mail utilizado para login',
    is_active BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'Indica se o usuário está ativo no sistema',
    system_role_id INT NOT NULL COMMENT 'UUID do papel global do sistema associado ao usuário',

    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do usuário',
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data da última atualização do usuário',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',

    FOREIGN KEY (system_role_id) REFERENCES system_role(id)
) COMMENT = 'Tabela de usuários com ciclo de vida e referência ao papel global';



-- Tabela: user_photo
-- Finalidade: Armazena fotos de perfil dos usuários diretamente no banco de dados, com controle de ciclo de vida e auditoria.

CREATE TABLE IF NOT EXISTS user_photo (
    user_id CHAR(36) PRIMARY KEY COMMENT 'Referência ao usuário, também usada como chave primária',
    name VARCHAR(255) NOT NULL COMMENT 'Nome original do arquivo',
    mime_type VARCHAR(100) NOT NULL COMMENT 'Tipo MIME do arquivo (image/png, image/jpeg, etc)',
    content MEDIUMBLOB NOT NULL COMMENT 'Conteúdo binário da imagem (até 16 MB)',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do documento',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação do documento',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica do documento',

    CONSTRAINT fk_user_photo_user FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
) COMMENT = 'Fotos de perfil dos usuários armazenadas no banco de dados, vinculadas diretamente por ID ao usuário';



-- Tabela: action
-- Finalidade: Define as ações possíveis sobre os módulos do sistema (ex: visualizar, criar, editar, excluir).

CREATE TABLE IF NOT EXISTS action (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT 'ID da ação',
    name VARCHAR(50) NOT NULL UNIQUE COMMENT 'Nome da ação (ex: View, Create, Edit, Delete)'
) COMMENT = 'Ações possíveis aplicadas a módulos do sistema';



-- Tabela: module
-- Finalidade: Define os módulos do sistema aos quais as permissões podem estar associadas (ex: projetos, atividades).

CREATE TABLE IF NOT EXISTS module (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT 'ID do módulo',
    name VARCHAR(50) NOT NULL UNIQUE COMMENT 'Nome do módulo (ex: Project, Activity)'
) COMMENT = 'Módulos funcionais do sistema onde permissões são aplicadas';



-- Tabela: permission
-- Finalidade: Define as permissões disponíveis no sistema, compostas por um módulo e uma ação.

CREATE TABLE IF NOT EXISTS permission (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da permissão',
    name VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nome da permissão (ex: Projetos - Visualizar)',
    module_id INT NOT NULL COMMENT 'ID do módulo relacionado à permissão',
    action_id INT NOT NULL COMMENT 'ID da ação relacionada à permissão',
    system_defined BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Define se a permissão é criada pelo sistema (não editável, não deletável)',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da permissão',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data da última atualização',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica da permissão (soft delete)',

    FOREIGN KEY (module_id) REFERENCES module(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (action_id) REFERENCES action(id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Permissões disponíveis no sistema, associadas a um módulo e a uma ação';



-- Tabela: role
-- Finalidade: Define os papéis atribuíveis a usuários dentro de projetos ou times.

CREATE TABLE IF NOT EXISTS role (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID do papel de projeto/time',
    name VARCHAR(50) NOT NULL UNIQUE COMMENT 'Nome do papel (ex: Coordenador, Colaborador)',
    description VARCHAR(255) NOT NULL COMMENT 'Descrição da função deste papel dentro de um projeto',
    is_default BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Indica se este é o papel padrão ao adicionar usuários',
    system_defined BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Define se o papel é criado pelo sistema (não editável, não deletável)',
    
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do papel',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última atualização do papel',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)'
) COMMENT = 'Tabela de papéis atribuíveis aos usuários dentro de projetos';



-- Tabela: role_permission
-- Finalidade: Associa papéis de projeto a permissões específicas do sistema.

CREATE TABLE IF NOT EXISTS role_permission (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da associação entre papel e permissão',
    role_id CHAR(36) NOT NULL COMMENT 'UUID do papel atribuído',
    permission_id CHAR(36) NOT NULL COMMENT 'UUID da permissão concedida ao papel',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da associação',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',

	-- Impede que uma mesma permissão seja atribuída mais de uma vez a um papel
	UNIQUE KEY unique_role_permission (role_id, permission_id),

    FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (permission_id) REFERENCES permission(id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Tabela que relaciona papéis atribuíveis aos usuários com permissões específicas do sistema';



-- Tabela: funding_agency
-- Finalidade: Armazena as agências financiadoras que podem estar associadas a projetos. 
-- Permite controle de status (ativa/inativa), dados institucionais e rastreamento de alterações.

CREATE TABLE IF NOT EXISTS funding_agency (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da agência financiadora',
    name VARCHAR(255) NOT NULL UNIQUE COMMENT 'Nome completo da agência (ex: Conselho Nacional de Desenvolvimento Científico e Tecnológico)',
    acronym VARCHAR(30) NOT NULL UNIQUE COMMENT 'Sigla da agência (ex: CNPq)',
    cnpj VARCHAR(18) NOT NULL UNIQUE COMMENT 'CNPJ da agência financiadora (formato 00.000.000/0000-00)',
    website VARCHAR(255) DEFAULT NULL COMMENT 'Site oficial da agência',
    is_active BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'Define se a agência está ativa para uso no sistema',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do registro',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data da última modificação',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)'
) COMMENT = 'Agências financiadoras que podem ser associadas a projetos na plataforma';



-- Tabela: institution
-- Finalidade: Armazena instituições beneficiadas pelos projetos, como universidades e faculdades.
-- Permite controle de status (ativa/inativa), dados institucionais e rastreamento de alterações.

CREATE TABLE IF NOT EXISTS institution (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da instituição',
    name VARCHAR(255) NOT NULL UNIQUE COMMENT 'Nome completo da instituição (ex: Faculdade de Tecnologia de São José dos Campos)',
    acronym VARCHAR(30) NOT NULL UNIQUE COMMENT 'Sigla da instituição (ex: FATEC-SJC)',
    cnpj VARCHAR(18) NOT NULL UNIQUE COMMENT 'CNPJ da instituição (formato 00.000.000/0000-00)',
    website VARCHAR(255) DEFAULT NULL COMMENT 'Site oficial da instituição',
    is_active BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'Define se a instituição está ativa para uso no sistema',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do registro',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data da última modificação',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)'
) COMMENT = 'Instituições beneficiadas pelos projetos da plataforma, como universidades e faculdades';



-- Tabela: document
-- Finalidade: Armazena arquivos binários (PDFs) diretamente no banco de dados, com controle de ciclo de vida.

CREATE TABLE IF NOT EXISTS document (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID do documento',
    name VARCHAR(255) NOT NULL COMMENT 'Nome original do arquivo',
    mime_type VARCHAR(100) NOT NULL DEFAULT 'application/pdf' COMMENT 'Tipo MIME do arquivo (geralmente application/pdf)',
    content MEDIUMBLOB NOT NULL COMMENT 'Conteúdo binário do arquivo PDF (até 16 MB)',

    is_active BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'Indica se o documento está ativo para uso ou exibição',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do documento',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação do documento',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica do documento'
) COMMENT = 'Documentos armazenados diretamente no banco de dados, anexáveis a projetos ou atividades';



-- Tabela: area
-- Finalidade: Define as áreas temáticas utilizadas para classificar os projetos da plataforma.

CREATE TABLE IF NOT EXISTS area (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da área temática',
    name VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nome da área (ex: Aeroespacial, Educação)',
    description VARCHAR(255) COMMENT 'Descrição adicional da área, se necessário',
	
    is_active BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'Indica se a área está ativa no sistema',
    
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da área',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data da última atualização da área',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica da área'
) COMMENT = 'Classificação temática para os projetos, podendo abranger diversas áreas do conhecimento';



-- Tabela: project
-- Finalidade: Armazena os projetos cadastrados na plataforma, com informações como nome, código, descrição, status, orçamento, datas, autor da criação e responsável pela condução.
-- O vínculo com agências financiadoras, instituições, áreas temáticas, usuários e times é feito por meio de tabelas associativas N:N.

CREATE TABLE IF NOT EXISTS project (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID do projeto',
    name VARCHAR(255) NOT NULL COMMENT 'Nome do projeto',
    code VARCHAR(50) NOT NULL UNIQUE COMMENT 'Código interno ou institucional do projeto',
    description TEXT COMMENT 'Descrição detalhada do projeto',

    status ENUM(
        'Planejado',
        'Em andamento',
        'Suspenso',
        'Concluído',
        'Cancelado'
    ) NOT NULL DEFAULT 'Planejado' COMMENT 'Status atual do projeto no sistema',

    is_active BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'Define se o projeto está ativo na plataforma',
    start_date DATE NOT NULL COMMENT 'Data de início planejada ou real do projeto',
    end_date DATE NOT NULL COMMENT 'Data de término prevista ou real do projeto',
	CHECK (end_date >= start_date),
    
    budget DECIMAL(12,2) NOT NULL DEFAULT 0.00 COMMENT 'Orçamento total disponível para o projeto (em reais)',
    CHECK (budget >= 0.00),
    
    created_by_id CHAR(36) DEFAULT NULL COMMENT 'UUID do usuário responsável pela criação do projeto',
    responsible_user_id CHAR(36) DEFAULT NULL COMMENT 'UUID do usuário responsável pelo projeto',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do projeto',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação do projeto',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica do projeto',
    
    FOREIGN KEY (created_by_id) REFERENCES user(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (responsible_user_id) REFERENCES user(id) ON DELETE SET NULL ON UPDATE CASCADE
) COMMENT = 'Projetos registrados na plataforma, com controle de status, orçamento, responsáveis e datas';



-- Tabela: project_document
-- Finalidade: Realiza a associação entre documentos PDF e projetos cadastrados no sistema.
-- Permite o vínculo de múltiplos documentos a um projeto, com controle de exclusão lógica (soft delete).

CREATE TABLE IF NOT EXISTS project_document (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da associação entre projeto e documento',
    project_id CHAR(36) NOT NULL COMMENT 'UUID do projeto relacionado',
    document_id CHAR(36) NOT NULL COMMENT 'UUID do documento associado ao projeto',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da associação',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',

    FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (document_id) REFERENCES document(id) ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_project_document (project_id, document_id)
) COMMENT = 'Associação de documentos PDF a projetos cadastrados na plataforma';



-- Tabela: project_area
-- Finalidade: Relaciona projetos a uma ou mais áreas temáticas, permitindo classificação múltipla dos projetos.

CREATE TABLE IF NOT EXISTS project_area (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da associação entre projeto e área',
    project_id CHAR(36) NOT NULL COMMENT 'UUID do projeto relacionado',
    area_id CHAR(36) NOT NULL COMMENT 'UUID da área atribuída ao projeto',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data da associação do projeto à área',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica da associação',

    FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (area_id) REFERENCES area(id) ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_project_area (project_id, area_id)
) COMMENT = 'Associação entre projetos e áreas temáticas, permitindo classificação múltipla';



-- Tabela: project_institution
-- Finalidade: Relaciona projetos a uma ou mais instituições, permitindo múltiplos vínculos institucionais por projeto.

CREATE TABLE IF NOT EXISTS project_institution (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da associação entre projeto e instituição',
    project_id CHAR(36) NOT NULL COMMENT 'UUID do projeto relacionado',
    institution_id CHAR(36) NOT NULL COMMENT 'UUID da instituição vinculada ao projeto',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data da associação do projeto à instituição',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica da associação',

    FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (institution_id) REFERENCES institution(id) ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_project_institution (project_id, institution_id)
) COMMENT = 'Associação entre projetos e instituições, permitindo múltiplos vínculos institucionais por projeto';



-- Tabela: project_funding_agency
-- Finalidade: Relaciona projetos a uma ou mais agências financiadoras, permitindo múltiplas fontes de financiamento por projeto.

CREATE TABLE IF NOT EXISTS project_funding_agency (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da associação entre projeto e agência financiadora',
    project_id CHAR(36) NOT NULL COMMENT 'UUID do projeto relacionado',
    funding_agency_id CHAR(36) NOT NULL COMMENT 'UUID da agência financiadora vinculada ao projeto',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data da associação do projeto à agência financiadora',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica da associação',

    FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (funding_agency_id) REFERENCES funding_agency(id) ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_project_funding_agency (project_id, funding_agency_id)
) COMMENT = 'Associação entre projetos e agências financiadoras, permitindo múltiplas fontes de financiamento por projeto';



-- Tabela: user_project
-- Finalidade: Define a associação entre usuários e projetos, indicando o papel que o usuário desempenha em cada projeto.
-- Cada usuário pode participar de múltiplos projetos, mas com apenas um papel por projeto.
-- Permite controle de exclusão lógica e atualização de papel com rastreabilidade.

CREATE TABLE IF NOT EXISTS user_project (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da associação entre usuário e projeto',
    user_id CHAR(36) NOT NULL COMMENT 'UUID do usuário participante do projeto',
    project_id CHAR(36) NOT NULL COMMENT 'UUID do projeto',
    role_id CHAR(36) NOT NULL COMMENT 'UUID do papel do usuário neste projeto',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da associação',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação da associação',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica da associação',

    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_user_project (user_id, project_id)
) COMMENT = 'Associação entre usuários e projetos com definição de papéis no contexto do projeto';



-- Tabela: team
-- Finalidade: Representa grupos de usuários organizados por afinidade, função ou projeto.
-- Utilizados para controlar quais pessoas podem ser atribuídas a projetos específicos.

CREATE TABLE IF NOT EXISTS team (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID do time ou grupo',
    name VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nome do time',
    description VARCHAR(255) COMMENT 'Descrição da finalidade ou escopo do time',
    is_active BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'Indica se o time está ativo no sistema',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do time',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação do time',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)'
) COMMENT = 'Cadastro de times utilizados para agrupar usuários e associá-los a projetos';



-- Tabela: user_team
-- Finalidade: Relaciona usuários aos times que participam.
-- Permite que um mesmo usuário esteja em múltiplos times.

CREATE TABLE IF NOT EXISTS user_team (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da associação entre usuário e time',
    user_id CHAR(36) NOT NULL COMMENT 'UUID do usuário participante',
    team_id CHAR(36) NOT NULL COMMENT 'UUID do time associado',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da associação',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica da associação',

    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (team_id) REFERENCES team(id) ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_user_team (user_id, team_id)
) COMMENT = 'Associação entre usuários e times';



-- Tabela: project_team
-- Finalidade: Relaciona projetos aos times que podem colaborar nele.
-- Define quem pode ser selecionado para participar de um projeto.

CREATE TABLE IF NOT EXISTS project_team (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da associação entre projeto e time',
    project_id CHAR(36) NOT NULL COMMENT 'UUID do projeto',
    team_id CHAR(36) NOT NULL COMMENT 'UUID do time autorizado',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de associação do time ao projeto',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica da associação',

    FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (team_id) REFERENCES team(id) ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_project_team (project_id, team_id)
) COMMENT = 'Associação entre projetos e os times autorizados a colaborar neles';



-- Tabela: activity
-- Finalidade: Representa uma atividade dentro de um projeto, com planejamento de execução, responsáveis e orçamento alocado.

CREATE TABLE IF NOT EXISTS activity (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da atividade',
    
    project_id CHAR(36) NOT NULL COMMENT 'Projeto ao qual a atividade está vinculada',
    name VARCHAR(255) NOT NULL COMMENT 'Título da atividade',
    description TEXT DEFAULT NULL COMMENT 'Descrição detalhada da atividade',

    status ENUM('Não iniciada', 'Em andamento', 'Concluída', 'Cancelada') DEFAULT 'Não iniciada' COMMENT 'Status atual da atividade',

    allocated_budget DECIMAL(12,2) NOT NULL DEFAULT 0.00 COMMENT 'Valor em reais reservado para esta atividade dentro do orçamento do projeto',
    CHECK (allocated_budget >= 0.00),
    
    start_date DATE NOT NULL COMMENT 'Data de início planejada da atividade',
    end_date DATE NOT NULL COMMENT 'Data de término planejada da atividade',
	CHECK (end_date >= start_date),
    
    created_by_id CHAR(36) DEFAULT NULL COMMENT 'UUID do usuário responsável pela criação da atividade',
    responsible_user_id CHAR(36) DEFAULT NULL COMMENT 'UUID do usuário responsável pela atividade',
    is_active BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'Indica se a atividade está ativa no sistema',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da atividade',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação da atividade',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica da atividade',

    FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (created_by_id) REFERENCES user(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (responsible_user_id) REFERENCES user(id) ON DELETE SET NULL ON UPDATE CASCADE
) COMMENT = 'Atividades planejadas dentro de projetos, com orçamento, status e responsáveis definidos ou abertos.';



-- Tabela: activity_user
-- Finalidade: Relaciona usuários responsáveis por atividades específicas dentro de um projeto.
-- Permite múltiplos responsáveis por atividade, bem como atividades sem responsáveis definidos (atividade aberta).

CREATE TABLE IF NOT EXISTS activity_user (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    activity_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    deleted_at DATETIME DEFAULT NULL,

    FOREIGN KEY (activity_id) REFERENCES activity(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_activity_user (activity_id, user_id)
) COMMENT = 'Usuários responsáveis por atividades (pode haver múltiplos ou nenhum responsável)';



-- Tabela: task
-- Finalidade: Registra as tarefas executadas por usuários no contexto de uma atividade.
-- Cada tarefa está vinculada a uma única atividade e a um único usuário.
-- Armazena informações como tempo dedicado, custo associado e uma descrição da ação realizada.
-- Permite o rastreio detalhado do trabalho realizado dentro das atividades do projeto.

CREATE TABLE IF NOT EXISTS task (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da tarefa',

    activity_id CHAR(36) NOT NULL COMMENT 'UUID da atividade associada à tarefa',
    user_id CHAR(36) DEFAULT NULL COMMENT 'Usuário responsável pela tarefa (pode ser nulo se o usuário for removido)',
    
    title VARCHAR(255) NOT NULL COMMENT 'Título da tarefa',
    description TEXT DEFAULT NULL COMMENT 'Descrição detalhada da tarefa',
    
    time_spent_minutes INT NOT NULL DEFAULT 0 COMMENT 'Tempo em minutos dedicado à tarefa',
    CHECK (time_spent_minutes >= 0),
    cost DECIMAL(12,2) NOT NULL DEFAULT 0.00 COMMENT 'Custo monetário associado à tarefa (se aplicável)',
    CHECK (cost >= 0.00),
    
    date DATE NOT NULL COMMENT 'Data de registro da tarefa',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da tarefa',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Última modificação da tarefa',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica (soft delete)',

    FOREIGN KEY (activity_id) REFERENCES activity(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE SET NULL ON UPDATE CASCADE
) COMMENT = 'Tarefas criadas dentro de atividades por usuários responsáveis';



-- Tabela: activity_document
-- Finalidade: Relaciona documentos a uma atividade específica.
-- Permite o anexo de arquivos que dão suporte à execução da atividade como um todo (ex: cronogramas, instruções, modelos).

CREATE TABLE IF NOT EXISTS activity_document (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da associação entre atividade e documento',
    activity_id CHAR(36) NOT NULL COMMENT 'UUID da atividade associada',
    document_id CHAR(36) NOT NULL COMMENT 'UUID do documento vinculado',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data da associação',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica',

    FOREIGN KEY (activity_id) REFERENCES activity(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (document_id) REFERENCES document(id) ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_activity_document (activity_id, document_id)
) COMMENT = 'Associação de documentos a uma atividade no projeto';



-- Tabela: task_document
-- Finalidade: Relaciona documentos a uma tarefa específica executada dentro de uma atividade.
-- Os documentos podem conter evidências, relatórios, arquivos gerados pela execução da tarefa.

CREATE TABLE IF NOT EXISTS task_document (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da associação entre tarefa e documento',
    task_id CHAR(36) NOT NULL COMMENT 'UUID da tarefa associada',
    document_id CHAR(36) NOT NULL COMMENT 'UUID do documento vinculado',

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data da associação',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Data de exclusão lógica',

    FOREIGN KEY (task_id) REFERENCES task(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (document_id) REFERENCES document(id) ON DELETE CASCADE ON UPDATE CASCADE,

    UNIQUE KEY unique_task_document (task_id, document_id)
) COMMENT = 'Associação de documentos a uma tarefa realizada dentro de uma atividade';



-- Tabela: two_fa_code
-- Finalidade: Armazena códigos de verificação temporários para autenticação em duas etapas via e-mail.
-- Utilizada para validar acessos com código de 6 dígitos enviado após login, redefinição de senha ou confirmação de ações críticas.

CREATE TABLE IF NOT EXISTS two_fa_code (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID do código de verificação gerado',
    user_id CHAR(36) NOT NULL COMMENT 'UUID do usuário que solicitou o código de verificação',
    code_hash VARCHAR(255) NOT NULL COMMENT 'Hash seguro do código de 6 dígitos enviado ao e-mail',
    is_double BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Indica se o código é dublo (12 dígitos) ou simples (6 dígitos)',
    attempts INT DEFAULT 0 COMMENT 'Número de tentativas realizadas com esse código',
    max_attempts INT DEFAULT 5 COMMENT 'Número máximo de tentativas permitidas',
    status ENUM('pending', 'verified', 'denied') DEFAULT 'pending' COMMENT 'Estado da verificação: pendente, verificado ou negado',
    type ENUM('login', 'password_reset', 'password_change', 'critical_action') NOT NULL DEFAULT 'login' COMMENT 'Finalidade do código de verificação gerado',
    expires_at DATETIME NOT NULL COMMENT 'Data e hora de expiração do código',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação do código',

    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Armazena códigos de verificação temporários para autenticação em dois fatores e validação de ações sensíveis.';



-- Tabela: user_password
-- Finalidade: Armazena senhas associadas ao usuário, com suporte a senhas permanentes e temporárias.
-- Permite o controle de expiração, tentativas de autenticação, histórico, níveis de bloqueio e prevenção de reuso de senhas anteriores.
-- É utilizada para autenticação segura de usuários.

CREATE TABLE IF NOT EXISTS user_password (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()) COMMENT 'UUID da entrada de senha',
    user_id CHAR(36) NOT NULL COMMENT 'UUID do usuário ao qual a senha está associada',
    password_hash VARCHAR(255) NOT NULL COMMENT 'Hash seguro da senha (permanente ou temporária)',
    is_temp BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Indica se a senha é temporária (ex: recuperação de senha)',
    attempts INT DEFAULT 0 COMMENT 'Número de tentativas de login com esta senha',
    max_attempts INT DEFAULT 5 COMMENT 'Número máximo de tentativas permitidas antes de bloquear esta senha',
    locked_until DATETIME DEFAULT NULL COMMENT 'Data/hora até a qual esta senha está temporariamente bloqueada após tentativas inválidas',
    lockout_level INT NOT NULL DEFAULT 0 COMMENT 'Nível de bloqueio aplicado ao usuário',
    status ENUM('valid', 'expired', 'blocked') DEFAULT 'valid' COMMENT 'Estado da senha: válida, expirada ou bloqueada',
    expires_at DATETIME DEFAULT NULL COMMENT 'Data e hora de expiração da senha (se temporária)',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação da senha',
    deleted_at DATETIME DEFAULT NULL COMMENT 'Soft delete ou inativação da senha',

    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Armazena senhas com suporte a temporárias, tentativas, bloqueios, expiração e níveis de segurança.';
