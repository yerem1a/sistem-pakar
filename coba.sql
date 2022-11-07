INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (1, 1,0.4);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (2, 1,0.3);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (3, 1,0.8);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (4, 1,0.5);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (15, 1,0.3);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (18, 1,0.7);

INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (4, 2,0.5);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (5, 2,0.2);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (6, 2,0.6);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (7, 2,0.6);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (11, 2,0.7);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (16, 2,0.4);

DELETE FROM ds_rules WHERE id_problem=4;
DELETE FROM ds_rules WHERE id_problem=5;
DELETE FROM ds_rules WHERE id_problem=6;
DELETE FROM ds_rules WHERE id_problem=7;
DELETE FROM ds_rules WHERE id_problem=8;
DELETE FROM ds_rules WHERE id_problem=9;
DELETE FROM ds_rules WHERE id_problem=10;
DELETE FROM ds_rules WHERE id_problem=11;
DELETE FROM ds_rules WHERE id_problem=12;

INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (4, 3,0.5);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (8, 3,0.7);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (9, 3,0.4);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (10, 3,0.9);

INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (11, 4,0.7);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (12, 4,0.5);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (13, 4,0.3);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (14, 4,0.5);
INSERT INTO ds_rules (id_evidence, id_problem,cf) VALUES (17, 4,0.8);
