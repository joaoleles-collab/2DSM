
USE sql_detetive;

CREATE TABLE classe (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE museu (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);
 
-- Fase 2: característica usada para filtrar suspeitos
CREATE TABLE profissao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);
 
-- Fase 1 a 4: as 5 pessoas registradas no sistema da polícia
CREATE TABLE pessoa (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT, -- Fase 2: "mais de 30 anos"
    profissao_fk INT,
    FOREIGN KEY (profissao_fk)
		REFERENCES profissao(id)
);
 
-- Fase 1 e 4: o roubo (horário confirmado: 23h40)
CREATE TABLE crime (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    objeto_roubado VARCHAR(100),
    valor_objeto DECIMAL(10,2),
    horario DATETIME,
    museu_fk INT,
    FOREIGN KEY (museu_fk)
		REFERENCES museu(id)
);
 
-- Fase 1, 2 e 4: registros de acesso ao museu (onde cada pessoa esteve e quando)
CREATE TABLE acesso (
	id INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_fk INT,
    museu_fk INT,
    local VARCHAR(50), -- Entrada, Galeria, Corredor...
    horario DATETIME,
    FOREIGN KEY (pessoa_fk)
		REFERENCES pessoa(id),
	FOREIGN KEY (museu_fk)
		REFERENCES museu(id)
);
 
-- Fase 1, 2, 3 e 4: lista de suspeitos (começa com todos e vai sendo filtrada pelas consultas)
CREATE TABLE suspeito (
	id INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_fk INT,
    crime_fk INT,
    status VARCHAR(25), -- EM_ANALISE
    FOREIGN KEY (pessoa_fk)
		REFERENCES pessoa(id),
	FOREIGN KEY (crime_fk)
		REFERENCES crime(id)
);
 
-- Fase 3: a testemunha NÃO está na tabela pessoa (a Fase 1 mostra só 5 pessoas)
CREATE TABLE testemunha (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);
 
-- Fase 3: o que a testemunha lembra (só uma parte do nome)
CREATE TABLE depoimento (
	id INT PRIMARY KEY AUTO_INCREMENT,
    testemunha_fk INT,
    crime_fk INT,
    horario DATETIME,
    local_visto VARCHAR(50),
    parte_nome VARCHAR(10), -- o nome começa com...
    descricao VARCHAR(255),
    FOREIGN KEY (testemunha_fk)
		REFERENCES testemunha(id),
	FOREIGN KEY (crime_fk)
		REFERENCES crime(id)
);
 