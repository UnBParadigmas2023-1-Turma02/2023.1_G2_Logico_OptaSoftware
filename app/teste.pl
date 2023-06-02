imprimir_materias(_, []).
imprimir_materias(Out,[(Nome, _, _, CargaHoraria, Ementa) | Resto]) :-
    writeln('Imprimindo'),
    writeln(Nome), writeln(CargaHoraria), writeln(Ementa),
    % write(Out, '| '), write(Out, Nome), write(Out, ' | '),
    % write(Out, CargaHoraria), write(Out, ' | '),
    % write(Out, Ementa), write(Out, ' |\n'),
    imprimir_materias(Out, Resto).