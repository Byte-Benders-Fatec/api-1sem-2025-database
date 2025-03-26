# Visao Geral do Banco de Dados - FAPG

Este documento fornece um resumo das entidades e relacionamentos do banco de dados utilizado na plataforma **FAPG (Fundação de Apoio à Pesquisa de Pós-Graduandos)**.

---

## Entidades Principais

### `user`
Armazena informacoes dos usuarios do sistema.
- Possui diferentes niveis de acesso definidos por `system_role`.

### `system_role`
Define os niveis de acesso do sistema (Ex: Super Admin, Admin, User, Viewer).

### `team`
Representa grupos de usuarios organizados logicamente.
- Pode estar vinculado a um ou mais projetos.

### `project`
Armazena os projetos cadastrados na plataforma.
- Relacionado com usuarios, areas, times e agencias financiadoras.

### `funding_agency`
Entidade representando a agencia financiadora dos projetos.

### `area`
Permite classificar os projetos de acordo com sua area de atuacao (Ex: Saude, Tecnologia).

### `document`
Contem arquivos binarios (PDFs, anexos) vinculados a projetos, atividades ou tarefas.

### `activity`
Representa etapas ou fases de um projeto.
- Possui status, orcamento e pode ou nao ter responsaveis definidos.

### `task`
Acoes especificas realizadas dentro de uma atividade.
- Informacoes de tempo gasto, custo e descricao detalhada.

### `module` e `action`
- `module`: representa os modulos do sistema (User, Project, etc).
- `action`: representa operacoes basicas (View, Create, Edit, Delete).

### `permission`
Define permissoes granularizadas (ex: User - View) para serem atribuídas a papeis.

### `role`
Define papeis que os usuarios exercem dentro de um projeto (Coordenador, Colaborador etc).

---

## Relacionamentos

### `user_project`
Vincula usuarios a projetos com um papel especifico (`role`).

### `user_team`
Associa usuarios a times.

### `project_team`
Associa projetos aos times autorizados a participar dele.

### `project_document`
Relaciona documentos gerais a projetos.

### `project_area`
Relacionamento N:N entre projetos e areas.

### `activity_user`
Relaciona usuarios responsaveis por uma atividade.
- Permite multiplos ou nenhum responsavel.

### `activity_document`
Relaciona documentos vinculados a uma atividade.

### `task_document`
Relaciona documentos vinculados a uma tarefa.

### `role_permission`
Relaciona papeis (`role`) com permissoes (`permission`).

---

## Considerações:
- O modelo possui suporte a soft delete (`deleted_at`).
- Controle total de acessos por permissao e papel.
- Relacionamentos N:N utilizados quando necessario (ex: areas, times).

Este schema visa garantir flexibilidade, rastreabilidade e controle de acesso refinado para gerenciar projetos institucionais de forma segura e eficiente.

