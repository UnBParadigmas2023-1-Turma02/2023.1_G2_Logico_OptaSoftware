:- module(main_filter_dialog, [main_filter_dialog/1]).

:- use_module(library(pce)).

main_filter_dialog(Button) :-
    Description = 'Como você gostaria de buscar por disciplinas optativas?',
    Label1 = 'Área',
    Label2 = 'Carga horária',
    Label3 = 'Ementa',

    new(D, dialog('Optasoftware')),
    send(D, append(new(_, label(description, Description)))),
    send(D, append(new(_, button(Label1, message(D, return, Label1))))),
    send(D, append(new(_, button(Label2, message(D, return, Label2))))),
    send(D, append(new(_, button(Label3, message(D, return, Label3))))),

    get(D, confirm_centered, Rval),
    free(D),
    Button = Rval.
