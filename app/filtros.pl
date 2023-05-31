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
tem_palavra_ementa(PalavrasChave) :-
    findall((Materia, ListaPalavras, Area, Duracao, Ementa), (
        palavra_em_string_ementa(PalavrasChave, Materia),
        materia(Materia, ListaPalavras, Area, Duracao, Ementa)
    ), MateriasSemDuplicacoes),
    list_to_set(MateriasSemDuplicacoes, Materias),
    imprimir_materias(Materias).

% Função auxiliar para verificar se a sub_string está na string
palavra_em_string_ementa(PalavrasChave, Materia) :-
    materia(Materia, _, _, _, String),
    tem_todas_palavras_ementa(PalavrasChave, String).

% Função auxiliar para verificar se todas as palavras passadas estão na string ementa
tem_todas_palavras_ementa([], _).
tem_todas_palavras_ementa([Palavra|Resto], String) :-
    sub_string(String, _, _, _, Palavra),
    tem_todas_palavras_ementa(Resto, String).

% Função auxiliar para imprimir a lista de matérias
imprimir_materias([]).
imprimir_materias([(Materia, ListaPalavras, Area, Duracao, Ementa)|Resto]) :-
    write(Materia), write(', '),
    write(ListaPalavras), write(', '),
    write(Area), write(', '),
    write(Duracao), write(', '),
    write(Ementa), nl,
    imprimir_materias(Resto).

% Função auxiliar para verificar se a sub_string está na string dentro da lista de palavras_chaves
palavra_chave_em_string(Palavra, ListaPalavras) :-
    member(String, ListaPalavras),
    sub_string(String, _, _, _, Palavra).

% Filtro de Palavras Chave não aceitando casos de palavras_chaves complexas(ex. "Engenharia de Software")
tem_palavra_chave(PalavrasChave) :-
    findall((Materia, ListaPalavras, Area, Duracao, Ementa), (
        materia(Materia, ListaPalavras, Area, Duracao, Ementa),
        tem_todas_palavras_chave(PalavrasChave, ListaPalavras)
    ), MateriasSemDuplicacoes),
    list_to_set(MateriasSemDuplicacoes, Materias),
    imprimir_materias(Materias).

% Função auxiliar para verificar se todas as palavras passadas estão na lista de palavras chave
tem_todas_palavras_chave([], _).
tem_todas_palavras_chave([Palavra|Resto], ListaPalavras) :-
    member(Palavra, ListaPalavras),
    tem_todas_palavras_chave(Resto, ListaPalavras).

% Filtro de Palavras Chave verificando em caso de palavras_chaves complexas(ex. "Engenharia de Software")
tem_palavra_chave_complexa(ListaPalavrasChave) :-
    findall((Materia, ListaPalavras, Area, Duracao, Ementa), (
        materia(Materia, ListaPalavras, Area, Duracao, Ementa),
        tem_todas_palavras_chaves_complexa(ListaPalavras, ListaPalavrasChave)
    ), MateriasSemDuplicacoes),
    list_to_set(MateriasSemDuplicacoes, Materias),
    imprimir_materias(Materias).

% Função auxiliar para verificar se todas as palavras passadas estão na lista de palavras chave, voltada para o filtros aceitando palavras_chaves complexas(ex. "Engenharia de Software")
tem_todas_palavras_chaves_complexa(_, []).
tem_todas_palavras_chaves_complexa(ListaPalavras, [PalavraChave|Resto]) :-
    (member(PalavraChave, ListaPalavras); palavra_chave_em_string(PalavraChave, ListaPalavras)),
    tem_todas_palavras_chaves_complexa(ListaPalavras, Resto).