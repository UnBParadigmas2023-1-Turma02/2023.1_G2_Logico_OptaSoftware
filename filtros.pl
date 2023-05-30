% materia(NOME, [PALAVRAS_CHAVE], AREA_CONHECIMENTO, CARGA_HORARIA, EMENTA).

% Fato matéria apenas para testar os filtros
materia(computacao_basica, 
    [pascal, computadores, basico, resolucao, matematica, programacao, algoritmo, vetores],
    software, 
    60, 
    "histórico do computador computadores e resolução de problemas estruturas de decisão vetores e 
matrizes cadeias de caracteres sub-algoritmos: funções e procedimentos estilo de programação particularidades da linguagem pascal.").


% Filtro de Nome da Matéria
tem_nome(Nome):- materia(Nome, _, _, _, _).

% Filtro de Carga Horária da Matéria
tem_carga_horaria(CargaHoraria):- materia(_, _, _, CargaHoraria, _).

% Filtro de Ementa
tem_palavra_ementa(Palavra) :-
    materia(_, _, _, _, Ementa),
    sub_string(Ementa, _, _, _, Palavra).

% Filtro de Palavras Chave
tem_palavras_chave(Palavra) :-
    materia(_, ListaPalavras, _, _, _),
    member(Palavra, ListaPalavras).