
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

USE fapg;

-- ================================================
-- Finalidade: Criação de gatilhos (triggers) para remover documentos associados
-- a projetos, atividades e tarefas automaticamente quando essas entidades forem excluídas.
-- ================================================

-- Trigger: Exclusão segura de documentos vinculados exclusivamente ao projeto
-- Objetivo: Ao excluir um projeto, remover documentos vinculados a ele
-- somente se esses documentos não estiverem associados a outras entidades (atividade ou tarefa).

DELIMITER //
CREATE TRIGGER trg_delete_documents_on_project_delete
BEFORE DELETE ON project
FOR EACH ROW
BEGIN
  -- Primeiro remove os documentos vinculados
  DELETE FROM document
  WHERE id IN (
    SELECT document_id FROM project_document WHERE project_id = OLD.id
  );

  -- Depois remove os vínculos (como não há mais ON DELETE CASCADE)
  DELETE FROM project_document WHERE project_id = OLD.id;
END;
//
DELIMITER ;

-- Trigger: Exclusão segura de documentos vinculados exclusivamente à atividade
-- Objetivo: Ao excluir uma atividade, remover documentos vinculados a ela
-- somente se esses documentos não estiverem associados a outras entidades (tarefa ou projeto).

DELIMITER //
CREATE TRIGGER trg_delete_documents_on_activity_delete
BEFORE DELETE ON activity
FOR EACH ROW
BEGIN
  -- Primeiro remove os documentos vinculados
  DELETE FROM document
  WHERE id IN (
    SELECT document_id FROM activity_document WHERE activity_id = OLD.id
  );

  -- Depois remove os vínculos (como não há mais ON DELETE CASCADE)
  DELETE FROM activity_document WHERE activity_id = OLD.id;
END;
//
DELIMITER ;

-- Trigger: Exclusão segura de documentos vinculados exclusivamente à tarefa
-- Objetivo: Ao excluir uma tarefa, remover documentos vinculados a ela
-- somente se esses documentos não estiverem associados a outras entidades (atividade ou projeto).

DELIMITER //
CREATE TRIGGER trg_delete_documents_on_task_delete
BEFORE DELETE ON task
FOR EACH ROW
BEGIN
  -- Primeiro remove os documentos vinculados
  DELETE FROM document
  WHERE id IN (
    SELECT document_id FROM task_document WHERE task_id = OLD.id
  );

  -- Depois remove os vínculos (como não há mais ON DELETE CASCADE)
  DELETE FROM task_document WHERE task_id = OLD.id;
END;
//
DELIMITER ;
