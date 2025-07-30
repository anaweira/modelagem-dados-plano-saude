
-- Criação da tabela de especialidades
CREATE TABLE especialidade (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Enum para possíveis planos de saúde (exemplo)
DO $$ BEGIN
    CREATE TYPE plano_saude_enum AS ENUM (
        'Unimed', 'Amil', 'SulAmerica', 'Bradesco', 'Outro'
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- Criação da tabela de profissionais com campo jsonb
CREATE TABLE profissional (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    especialidade_id INTEGER REFERENCES especialidade(id),
    planos_aceitos JSONB
);

-- Índices recomendados
CREATE INDEX idx_profissional_cpf_cnpj ON profissional(cpf_cnpj);
CREATE INDEX idx_profissional_planos_aceitos ON profissional USING GIN(planos_aceitos);
