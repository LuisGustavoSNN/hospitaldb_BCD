USE hospital_db;

INSERT INTO pacientes (nome_paciente, cpf, data_nascimento, telefone_paciente, convenio) VALUES
('Carlos Augusto Silva', '123.456.789-01', '1985-04-10', '(11) 99999-1111', 'Unimed'),
('Ana Julia Oliveira', '234.567.890-12', '2018-03-12', '(11) 98888-2222', 'Amil'),
('Bruno Mendes Costa', '345.678.901-23', '1972-11-25', '(11) 97777-3333', 'Bradesco Saude'),
('Julia de Souza Lima', '456.789.012-34', '1990-07-08', '(11) 96666-4444', 'Unimed'),
('Diego Rocha Ferreira', '567.890.123-45', '1968-01-30', '(11) 95555-5555', 'Particular'),
('Marina Santos Silva', '678.901.234-56', '2001-09-17', '(11) 94444-6666', 'SulAmerica');

INSERT INTO medicos (nome_medico, crm, especialidade) VALUES
('Roberto Almeida', 'CRM-SP 12345', 'Cardiologia'),
('Fernanda Barros', 'CRM-SP 23456', 'Pediatria'),
('Marcelo Tavares', 'CRM-SP 34567', 'Ortopedia'),
('Patricia Gomes', 'CRM-SP 45678', 'Dermatologia'),
('Ricardo Nunes', 'CRM-SP 56789', 'Clinica Geral'),
('Helena Duarte', 'CRM-SP 67890', 'Neurologia');

INSERT INTO quartos (numero_quarto, andar, tipo_quarto, status_quarto) VALUES
('101', '1', 'Enfermaria', 'Livre'),
('102', '1', 'Enfermaria', 'Ocupado'),
('201', '2', 'Apartamento', 'Livre'),
('202', '2', 'Apartamento', 'Livre'),
('301', '3', 'UTI', 'Ocupado'),
('302', '3', 'UTI', 'Livre');

INSERT INTO internacoes (id_paciente, id_quarto, data_entrada, data_saida, valor_diaria) VALUES
(1, 1, '2026-10-01', '2026-10-05', 350.00),
(3, 3, '2026-10-10', '2026-10-14', 500.00),
(2, 5, '2026-10-20', NULL, 1200.00),
(5, 2, '2026-10-25', NULL, 350.00),
(4, 4, '2026-09-15', '2026-09-20', 500.00),
(6, 1, '2026-10-08', '2026-10-09', 350.00);

INSERT INTO consultas (data_consulta, status_consulta, valor_consulta, id_paciente, id_medico) VALUES
('2026-10-05 09:00:00', 'Realizada', 250.00, 1, 1),
('2026-10-06 14:30:00', 'Realizada', 180.00, 2, 2),
('2026-10-12 10:00:00', 'Cancelada', 300.00, 3, 3),
('2026-10-15 11:15:00', 'Realizada', 220.00, 4, 5),
('2026-11-03 08:30:00', 'Agendada', 200.00, 5, 4),
('2026-11-05 16:00:00', 'Agendada', 150.00, 6, 5),
('2026-10-20 13:00:00', 'Realizada', 300.00, 1, 3);

INSERT INTO prescricoes (id_consulta, medicamento, dosagem, quantidade) VALUES
(1, 'Losartana', '50 mg', '30 comprimidos'),
(1, 'Atenolol', '25 mg', '30 comprimidos'),
(2, 'Amoxicilina', '500 mg', '21 capsulas'),
(2, 'Paracetamol', '750 mg', '10 comprimidos'),
(4, 'Dipirona', '500 mg', '20 comprimidos'),
(7, 'Ibuprofeno', '600 mg', '15 comprimidos');
