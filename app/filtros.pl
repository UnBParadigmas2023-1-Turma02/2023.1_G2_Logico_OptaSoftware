:- consult('materias.pl').

% Filtro de Nome da Matéria
tem_nome(Nome):- materia(Nome, _, _, _, _).

% Filtro de Carga Horária da Matéria
tem_carga_horaria(CargaHoraria):- materia(_, _, _, CargaHoraria, _).

% Filtro de Area de Conhecimento
tem_area_conhecimento(AreaConhec):- 
    materia(_, _, ListaAreas, _, _),
    member(AreaConhec, ListaAreas).

% (nome, [palavras_chaves], area_conhecimento, horas, ementa).

% Predicado para buscar matérias por área de conhecimento e retorna uma Lista com Nomes das matérias
busca_area_conhecimento(AreaConhec, Materias) :-
    findall(Nome, materia(Nome, _, AreaConhec, _, _), Materias).

% Filtro de Ementa
tem_palavra_ementa(Palavra) :-
    materia(_, _, _, _, Ementa),
    sub_string(Ementa, _, _, _, Palavra).

% Filtro de Palavras Chave
tem_palavras_chave(Palavra) :-
    materia(_, ListaPalavras, _, _, _),
    member(Palavra, ListaPalavras).