:- module(area_filter_dialog, [area_filter_dialog/1]).

:- use_module(library(pce)).

:- ensure_loaded('../materias.pl').

:- op(100, fx, ?).

unique_areas(UniqueAreas) :-
    findall(Area, materia(_, _, Area, _, _), Areas),
    sort(Areas, UniqueAreas).

unique_palavras_chave(UniquePalavrasChave) :-
        findall(Palavras, materia(_, Palavras, _, _, _), PalavrasList),
        flatten(PalavrasList, FlattenedPalavrasList),
        sort(FlattenedPalavrasList, UniquePalavrasChave).

area_filter_dialog(Area) :-
    unique_areas(Areas),
    new(D, dialog('Area')),
    send(D, append, label(title, 'Em qual área gostaria de buscar?')),
    send(D, append, new(LB, list_browser)),
    forall(member(Area, Areas), send(LB, append, Area)),
    send(D, append, button(ok, message(D, return, LB?selection?key))),
    % send(D, append, button(back)),
    get(D, confirm_centered, Rval),
    free(D),
    Area = Rval.
