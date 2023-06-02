% Usar base de dados
:-consult('materias.pl').

% Criação de estrutura inicial do Markdown
cabecalho_markdown(Materias) :-
    open('./Relatorios/out.md', write, Out),
    write(Out, '| NOME | CARGA HORARIA | EMENTA |\n'),
    write(Out, '| ------ | ------ | ----- |\n'),
    imprimir_materias(Out,  Materias),
    close(Out).

imprimir_materias(_, []).
imprimir_materias(Out,[(Nome, _, _, CargaHoraria, Ementa) | Resto]) :-
    write(Out, '| '), write(Out, Nome), write(Out, ' | '),
    write(Out, CargaHoraria), write(Out, ' | '),
    write(Out, Ementa), write(Out, ' |\n'),
    imprimir_materias(Out, Resto).