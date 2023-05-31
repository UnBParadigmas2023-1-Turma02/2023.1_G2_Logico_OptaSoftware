% Usar base de dados
:-consult('materias.pl').
:-consult('filtros.pl').

% Criação de estrutura inicial do Markdown
cabecalho_markdown() :-
    open('./Relatorios/out.md', append, Out),
   	write(Out, '| NOME | CARGA HORARIA | EMENTA |'),
    write(Out, '\n'),
    write(Out, '| ----- | :----: | ------- |'),
    write(Out, '\n'),
   	close(Out).
