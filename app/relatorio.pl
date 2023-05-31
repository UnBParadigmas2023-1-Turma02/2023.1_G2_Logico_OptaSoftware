% Usar base de dados
:-consult('materias.pl')
:-consult('filtros.pl')

imprimir_materias([]).

tratar_lista_vazia([]) :-
    % Regra para lista vazia
    write('A lista está vazia!').

tratar_lista_vazia(tem_palavra_ementa('programação')| Markdown) :-
    % Regra para lista não vazia
    write('A lista não está vazia!'),
    % Chamada recursiva para tratar o restante da lista
    tratar_lista_vazia(Markdown).

gerar_markdown(Resto, Markdown) :-
    atomic_list_concat(Resto, '\n', PrologLines),
    split_string(PrologLines, "\n", "\n", Lines),
    format_markdown(Lines, Markdown).

format_markdown([], []).
format_markdown([Line | Rest], [FormattedLine | FormattedRest]) :-
    format_line(Line, FormattedLine),
    format_markdown(Rest, FormattedRest).

format_line(Line, FormattedLine) :-
    string_concat('`', Line, Temp),
    string_concat(Temp, '`', FormattedLine).