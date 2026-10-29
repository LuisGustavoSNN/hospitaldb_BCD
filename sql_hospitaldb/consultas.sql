USE hospital_db;

SELECT id_paciente, nome_paciente, convenio
FROM pacientes
ORDER BY nome_paciente;

SELECT id_paciente, nome_paciente, telefone_paciente
FROM pacientes
WHERE convenio = 'Unimed';

SELECT id_paciente, nome_paciente
FROM pacientes
WHERE nome_paciente LIKE '%Silva%';

SELECT id_medico, nome_medico, crm, especialidade
FROM medicos
ORDER BY especialidade;

SELECT numero_quarto, andar, tipo_quarto
FROM quartos
WHERE status_quarto = 'Livre';

SELECT consultas.id_consulta, pacientes.nome_paciente, medicos.nome_medico, consultas.data_consulta
FROM consultas
INNER JOIN pacientes ON consultas.id_paciente = pacientes.id_paciente
INNER JOIN medicos ON consultas.id_medico = medicos.id_medico
ORDER BY consultas.data_consulta;

SELECT id_consulta, data_consulta, status_consulta, valor_consulta
FROM consultas
WHERE data_consulta BETWEEN '2026-10-01 00:00:00' AND '2026-10-31 23:59:59';

SELECT status_consulta, COUNT(*) AS total_consultas
FROM consultas
GROUP BY status_consulta;

SELECT SUM(valor_consulta) AS total_consultas_realizadas
FROM consultas
WHERE status_consulta = 'Realizada';

SELECT pacientes.nome_paciente, SUM(consultas.valor_consulta) AS total_gasto
FROM consultas
INNER JOIN pacientes ON consultas.id_paciente = pacientes.id_paciente
GROUP BY pacientes.nome_paciente
ORDER BY total_gasto DESC;

SELECT pacientes.nome_paciente, medicos.nome_medico, prescricoes.medicamento, prescricoes.dosagem
FROM prescricoes
INNER JOIN consultas ON prescricoes.id_consulta = consultas.id_consulta
INNER JOIN pacientes ON consultas.id_paciente = pacientes.id_paciente
INNER JOIN medicos ON consultas.id_medico = medicos.id_medico;

SELECT internacoes.id_internacao, pacientes.nome_paciente, quartos.numero_quarto, internacoes.data_entrada, internacoes.data_saida
FROM internacoes
INNER JOIN pacientes ON internacoes.id_paciente = pacientes.id_paciente
INNER JOIN quartos ON internacoes.id_quarto = quartos.id_quarto
ORDER BY internacoes.data_entrada;

SELECT pacientes.nome_paciente, quartos.numero_quarto, internacoes.data_entrada
FROM internacoes
INNER JOIN pacientes ON internacoes.id_paciente = pacientes.id_paciente
INNER JOIN quartos ON internacoes.id_quarto = quartos.id_quarto
WHERE internacoes.data_saida IS NULL;

SELECT quartos.tipo_quarto, AVG(internacoes.valor_diaria) AS media_diaria
FROM internacoes
INNER JOIN quartos ON internacoes.id_quarto = quartos.id_quarto
GROUP BY quartos.tipo_quarto;
