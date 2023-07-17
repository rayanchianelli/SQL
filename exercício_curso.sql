CREATE schema Curso;
CREATE TABLE curso.aluno (
    id INT,
    nome VARCHAR(100),
    nascimento VARCHAR(100)
);
CREATE TABLE curso.turma (
    id INT,
    id_disciplina INT,
    turno INT
);
CREATE TABLE curso.disciplina (
    id INT,
    nome VARCHAR(100),
    qnt_creditos INT
);
CREATE TABLE curso.matricula (
    id INT,
    id_aluno INT,
    id_turma INT,
    dt_matricula VARCHAR(100),
    periodo_letivo VARCHAR(100)
);
CREATE TABLE curso.mensalidade (
    id INT,
    id_matricula INT,
    dt_vencimento VARCHAR(100),
    valor INT,
    status_pgto VARCHAR(100)
);

/*CONSULTA A: */

SELECT a.nome, SUM(m.valor) AS valor_total
FROM curso.aluno AS a
JOIN curso.matrícula AS ma ON a.id = ma.id_aluno
JOIN curso.mensalidade AS m ON ma.id = m.id_matricula
GROUP BY a.nome;

/*CONSULTA B: */

SELECT d.nome AS disciplina,
       d.qnt_creditos,
       m.periodo_letivo,
       SUM(m.valor) AS valor_total_mensalidades
FROM curso.disciplina AS d
JOIN curso.turma AS t ON d.id = t.id_disciplina
JOIN curso.matrícula AS ma ON t.id = ma.id_turma
JOIN curso.mensalidade AS m ON ma.id = m.id_matricula
GROUP BY d.nome, d.qnt_creditos, matricula.periodo_letivo;

