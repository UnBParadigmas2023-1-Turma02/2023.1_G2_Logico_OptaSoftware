% Usar base de dados
:- consult('materias.pl').
% Formatar saída do prolog, remover pergunta, evitar truncamento
:- set_prolog_flag(toplevel_print_options, [quoted(true), portray(true), max_depth(0)]).

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
    findall(Materia, (
        palavra_em_string_ementa(Palavra, Materia)
    ), MateriasSemDuplicacoes),
    list_to_set(MateriasSemDuplicacoes, Materias),
    imprimir_materias(Materias).

% Função auxiliar para imprimir a lista de matérias
imprimir_materias([]).
imprimir_materias([Materia|Resto]) :-
    write(Materia), nl,
    imprimir_materias(Resto).

% Função auxiliar para verificar se a sub_string está na string
palavra_em_string_ementa(Palavra, Materia) :-
    materia(Materia, _, _, _, String),
    sub_string(String, _, _, _, Palavra).

% Função auxiliar para verificar se a sub_string está na string dentro da lista de palavras_chaves
palavra_chave_em_string(Palavra, ListaPalavras) :-
    member(String, ListaPalavras),
    sub_string(String, _, _, _, Palavra).

% Filtro de Palavras Chave não aceitando casos de palavras_chaves complexas(ex. "Engenharia de Software")
tem_palavra_chave(Palavra) :-
    findall(Materia, (
        materia(Materia, ListaPalavras, _, _, _),
        member(Palavra, ListaPalavras)
    ), MateriasSemDuplicacoes),
    list_to_set(MateriasSemDuplicacoes, Materias),
    imprimir_materias(Materias).

% Filtro de Palavras Chave verificando em caso de palavras_chaves complexas(ex. "Engenharia de Software")
tem_palavra_chave_complexa(Palavra) :-
    findall(Materia, (
        materia(Materia, ListaPalavras, _, _, _),
        (member(Palavra, ListaPalavras); palavra_chave_em_string(Palavra, ListaPalavras))
    ), MateriasSemDuplicacoes),
    list_to_set(MateriasSemDuplicacoes, Materias),
    imprimir_materias(Materias).