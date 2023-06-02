:- module(syllabus_filter_dialog, [syllabus_filter_dialog/1]).

:- use_module(library(pce)).

:- op(100, fx, ?).

syllabus_filter_dialog(Query) :-
    new(D, dialog('Ementa')),
    send(D, append, label(title, 'Qual termo deseja buscar?')),
    send(D, append, new(TI, text_item('Busca'))),
    send(D, append, button(ok, message(D, return, TI?selection))),
    get(D, confirm_centered, Rval),
    free(D),
    (   Rval == @nil
    ->  fail
    ;   Query = Rval
    ).
