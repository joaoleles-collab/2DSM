
USE RPG;

CREATE TABLE classe (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

-- não esquecer de adicionar validação
-- add um select para ver se a guilda que ele está tentando inserir está com o estado CONTRATANDO
CREATE TABLE guilda (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    estado VARCHAR(25) -- CONTRATANDO, FECHADA
);
    

CREATE TABLE item (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    raridade INT -- 0 A 10, vai servir como porcentagem no sorteio, 0 para itens lendários
);

CREATE TABLE quest (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25),
    descricao VARCHAR(255),
    nivel_requerido INT,
    item_requerido INT,
    item_dropado INT,
    FOREIGN KEY (item_requerido)
		REFERENCES item(id)
);

CREATE TABLE aventureiro (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) UNIQUE NOT NULL,
    nivel INT, -- DEIXA ELE ESCOLHER, MAS COLOCA 1 NO FINAL hehe... easter egg
    classe_fk INT,
    guilda_fk INT,
    quest_fk INT,
    FOREIGN KEY (classe_fk) 
		REFERENCES classe(id),
	FOREIGN KEY (guilda_fk)
		REFERENCES guilda(id),
	FOREIGN KEY (quest_fk)
		REFERENCES quest(id)
);

CREATE TABLE inventario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    -- estado? talvez futuramente: QUEBRADO, EVOLUÍDO, NORMAL
    item_fk INT,
    aventureiro_fk INT,
    FOREIGN KEY (item_fk)
		REFERENCES item(id),
	FOREIGN KEY (aventureiro_fk)
		REFERENCES aventureiro(id)
);

CREATE TABLE inimigo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nivel INT
);