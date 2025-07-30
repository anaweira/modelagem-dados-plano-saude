
-- Criação da tabela de especialidades
CREATE TABLE especialidade (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criação da tabela de planos de saúde
CREATE TABLE plano_saude (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    registro_ans VARCHAR(20) UNIQUE
);

-- Criação da tabela de profissionais
CREATE TABLE profissional (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    especialidade_id INTEGER REFERENCES especialidade(id)
);

-- Tabela associativa N:N entre profissionais e planos de saúde
CREATE TABLE profissional_plano (
    profissional_id INTEGER REFERENCES profissional(id),
    plano_saude_id INTEGER REFERENCES plano_saude(id),
    PRIMARY KEY (profissional_id, plano_saude_id)
);

-- Índices adicionais para melhorar performance de consulta
CREATE INDEX idx_profissional_cpf_cnpj ON profissional(cpf_cnpj);
CREATE INDEX idx_profissional_plano_profissional_id ON profissional_plano(profissional_id);
CREATE INDEX idx_profissional_plano_plano_id ON profissional_plano(plano_saude_id);
