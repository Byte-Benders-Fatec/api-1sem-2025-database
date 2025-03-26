
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
CREATE TRIGGER trg_delete_unused_documents_on_project_delete
AFTER DELETE ON project
FOR EACH ROW
BEGIN
  DELETE FROM document
  WHERE id IN (
    SELECT d.id
    FROM document d
    INNER JOIN project_document pd ON d.id = pd.document_id
    WHERE pd.project_id = OLD.id

    -- Garante que o documento NÃO esteja vinculado a nenhuma outra projeto
    AND NOT EXISTS (
      SELECT 1 FROM project_document pd2
      WHERE pd2.document_id = d.id AND pd2.project_id <> OLD.id
    )

    -- Garante que o documento NÃO esteja vinculado a nenhuma atividade
    AND NOT EXISTS (
      SELECT 1 FROM activity_document ad WHERE ad.document_id = d.id
    )

    -- Garante que o documento NÃO esteja vinculado a nenhuma tarefa
    AND NOT EXISTS (
      SELECT 1 FROM task_document td WHERE td.document_id = d.id
    )
  );
END;
//
DELIMITER ;

-- Trigger: Exclusão segura de documentos vinculados exclusivamente à atividade
-- Objetivo: Ao excluir uma atividade, remover documentos vinculados a ela
-- somente se esses documentos não estiverem associados a outras entidades (tarefa ou projeto).

DELIMITER //
CREATE TRIGGER trg_delete_unused_documents_on_activity_delete
AFTER DELETE ON activity
FOR EACH ROW
BEGIN
  DELETE FROM document
  WHERE id IN (
    SELECT d.id
    FROM document d
    INNER JOIN activity_document ad ON d.id = ad.document_id
    WHERE ad.activity_id = OLD.id

    -- Garante que o documento NÃO esteja vinculado a nenhuma tarefa
    AND NOT EXISTS (
      SELECT 1 FROM task_document td WHERE td.document_id = d.id
    )

    -- Garante que o documento NÃO esteja vinculado a nenhum projeto
    AND NOT EXISTS (
      SELECT 1 FROM project_document pd WHERE pd.document_id = d.id
    )

    -- Garante que o documento NÃO esteja vinculado a outra atividade
    AND NOT EXISTS (
      SELECT 1 FROM activity_document ad2
      WHERE ad2.document_id = d.id AND ad2.activity_id <> OLD.id
    )
  );
END;
//
DELIMITER ;

-- Trigger: Exclusão segura de documentos vinculados exclusivamente à tarefa
-- Objetivo: Ao excluir uma tarefa, remover documentos vinculados a ela
-- somente se esses documentos não estiverem associados a outras entidades (atividade ou projeto).

DELIMITER //
CREATE TRIGGER trg_delete_unused_documents_on_task_delete
AFTER DELETE ON task
FOR EACH ROW
BEGIN
  DELETE FROM document
  WHERE id IN (
    SELECT d.id
    FROM document d
    INNER JOIN task_document td ON d.id = td.document_id
    WHERE td.task_id = OLD.id

    -- Garante que o documento NÃO esteja vinculado a nenhuma outra tarefa
    AND NOT EXISTS (
      SELECT 1 FROM task_document td2
      WHERE td2.document_id = d.id AND td2.task_id <> OLD.id
    )

    -- Garante que o documento NÃO esteja vinculado a nenhuma atividade
    AND NOT EXISTS (
      SELECT 1 FROM activity_document ad WHERE ad.document_id = d.id
    )

    -- Garante que o documento NÃO esteja vinculado a nenhum projeto
    AND NOT EXISTS (
      SELECT 1 FROM project_document pd WHERE pd.document_id = d.id
    )
  );
END;
//
DELIMITER ;
