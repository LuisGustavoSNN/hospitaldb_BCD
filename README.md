# Hospital DB

Banco de dados relacional de um hospital, feito em MySQL. Ele guarda pacientes, médicos, consultas, prescrições, quartos e internações.

## Como usar

1. Abra o MySQL (Workbench, terminal ou outro cliente).
2. Execute o script SQL do projeto.
3. O banco `hospital_db` será criado junto com as tabelas e os índices.

> Atenção: o script começa apagando as tabelas que já existirem (`DROP TABLE IF EXISTS`). Isso é útil para rodar de novo do zero, mas apaga os dados que estiverem lá.

## Diagrama

<img width="1431" height="788" alt="Untitled" src="https://github.com/user-attachments/assets/2c4a4d38-e474-4ffd-819c-1fad272184d9" />


## Tabelas

### pacientes

| Campo | Tipo | Regras |
|-------|------|--------|
| id_paciente | int | chave primária, auto incremento |
| nome_paciente | varchar(100) | obrigatório |
| cpf | char(14) | obrigatório, único |
| data_nascimento | date | obrigatório |
| telefone_paciente | char(15) | opcional |
| convenio | char(50) | obrigatório |

### medicos

| Campo | Tipo | Regras |
|-------|------|--------|
| id_medico | int | chave primária, auto incremento |
| nome_medico | char(100) | obrigatório |
| crm | char(12) | obrigatório, único |
| especialidade | char(50) | obrigatório |

### quartos

| Campo | Tipo | Regras |
|-------|------|--------|
| id_quarto | int | chave primária, auto incremento |
| numero_quarto | char(3) | obrigatório, único |
| andar | char(3) | obrigatório |
| tipo_quarto | char(30) | obrigatório |
| status_quarto | char(20) | obrigatório, padrão `Livre` |

### internacoes

| Campo | Tipo | Regras |
|-------|------|--------|
| id_internacao | int | chave primária, auto incremento |
| id_paciente | int | obrigatório, chave estrangeira de `pacientes` |
| id_quarto | int | obrigatório, chave estrangeira de `quartos` |
| data_entrada | date | obrigatório |
| data_saida | date | opcional (vazio enquanto o paciente está internado) |
| valor_diaria | decimal(10,2) | obrigatório |

### consultas

| Campo | Tipo | Regras |
|-------|------|--------|
| id_consulta | int | chave primária, auto incremento |
| data_consulta | datetime | obrigatório |
| status_consulta | char(20) | opcional |
| valor_consulta | decimal(10,2) | opcional |
| id_paciente | int | obrigatório, chave estrangeira de `pacientes` |
| id_medico | int | obrigatório, chave estrangeira de `medicos` |

### prescricoes

| Campo | Tipo | Regras |
|-------|------|--------|
| id_prescricao | int | chave primária, auto incremento |
| id_consulta | int | obrigatório, chave estrangeira de `consultas` |
| medicamento | char(100) | obrigatório |
| dosagem | char(50) | obrigatório |
| quantidade | char(30) | obrigatório |

## Relacionamentos

- Um paciente pode ter várias consultas, e cada consulta é de um paciente.
- Um médico pode atender várias consultas, e cada consulta tem um médico.
- Uma consulta pode ter várias prescrições, e cada prescrição pertence a uma consulta.
- Um paciente pode ter várias internações, e cada internação é de um paciente.
- Um quarto pode receber várias internações ao longo do tempo, e cada internação usa um quarto.

## Índices

| Índice | Tabela | Coluna | Para que serve |
|--------|--------|--------|----------------|
| idx_pacientes_nome | pacientes | nome_paciente | buscar pacientes pelo nome |
| idx_medicos_especialidade | medicos | especialidade | buscar médicos por especialidade |
| idx_consultas_data | consultas | data_consulta | buscar consultas por data |
