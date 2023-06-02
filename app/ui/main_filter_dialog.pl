:- module(main_filter_dialog, [main_filter_dialog/1]).

:- use_module(library(pce)).

main_filter_dialog(Button) :-
    Description = 'Como você gostaria de buscar por disciplinas optativas?',
    Area = 'Área',
    Keywords = 'Palavras-chave',
    Workload = 'Carga horária',
    Syllabus = 'Ementa',

    new(D, dialog('Optasoftware')),
    send(D, append(new(_, label(description, Description)))),
    send(D, append(new(_, button(Area, message(D, return, Area))))),
    send(D, append(new(_, button(Keywords, message(D, return, Keywords))))),
    send(D, append(new(_, button(Workload, message(D, return, Workload))))),
    send(D, append(new(_, button(Syllabus, message(D, return, Syllabus))))),

    get(D, confirm_centered, Rval),
    free(D),
    Button = Rval.
