USE sql_detetive;


INSERT INTO museu (id, nome) VALUES
(1, 'Museu Central');
 
INSERT INTO profissao (id, nome) VALUES
(1, 'Segurança'),
(2, 'Restauradora'),
(3, 'Visitante'),
(4, 'Administradora'),
(5, 'Técnico');
 
-- Mais de 30 anos: Carlos, Rafael e Beatriz
INSERT INTO pessoa (id, nome, idade, profissao_fk) VALUES
(1, 'Carlos Mendes', 45, 1),
(2, 'Marina Alves', 29, 2),
(3, 'Rafael Costa', 34, 3),
(4, 'Beatriz Lima', 41, 4),
(5, 'Lucas Rocha', 28, 5);
 
INSERT INTO crime (id, nome, objeto_roubado, valor_objeto, horario, museu_fk) VALUES
(1, 'Caso 001 - Roubo no Museu Central', 'Relógio Imperial', 250000.00, '2026-03-14 23:40:00', 1);
 
-- A partir das 23h30 só aparecem Rafael (Galeria, 23h35) e Carlos (Corredor, 23h40)
INSERT INTO acesso (id, pessoa_fk, museu_fk, local, horario) VALUES
(1, 4, 1, 'Entrada',  '2026-03-14 17:45:00'), -- Beatriz
(2, 2, 1, 'Entrada',  '2026-03-14 18:30:00'), -- Marina
(3, 1, 1, 'Entrada',  '2026-03-14 20:00:00'), -- Carlos
(4, 3, 1, 'Entrada',  '2026-03-14 22:15:00'), -- Rafael
(5, 5, 1, 'Galeria',  '2026-03-14 23:20:00'), -- Lucas
(6, 3, 1, 'Galeria',  '2026-03-14 23:35:00'), -- Rafael
(7, 1, 1, 'Corredor', '2026-03-14 23:40:00'); -- Carlos
 
INSERT INTO suspeito (id, pessoa_fk, crime_fk, status) VALUES
(1, 1, 1, 'EM_ANALISE'),
(2, 2, 1, 'EM_ANALISE'),
(3, 3, 1, 'EM_ANALISE'),
(4, 4, 1, 'EM_ANALISE'),
(5, 5, 1, 'EM_ANALISE');
 
INSERT INTO testemunha (id, nome) VALUES
(1, 'Ana Souza');
 
INSERT INTO depoimento (id, testemunha_fk, crime_fk, horario, local_visto, parte_nome, descricao) VALUES
(1, 1, 1, '2026-03-14 23:30:00', 'Galeria', 'R',
 'Vi uma pessoa perto da Galeria. Não consegui ver quem era, mas o nome começava com a letra R.');
 