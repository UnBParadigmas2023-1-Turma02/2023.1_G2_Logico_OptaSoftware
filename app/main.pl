use_module(library(pce)).

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

area_dialog :-
    new(D, dialog('Área')),
    send(D, append(new(_, label(description, 'Selecione a área')))),
    send(D, open).

carga_horaria_dialog :-
    new(D, dialog('Carga horária')),
    send(D, append(new(_, label(description, 'Selecione a carga horária')))),
    send(D, open).

ementa_dialog :-
    new(D, dialog('Ementa')),
    send(D, append(new(_, label(description, 'Digite a ementa')))),
    send(D, open).

main :-
    main_filter_dialog(Button),
    format('Selected button: ~w~n', [Button]),
    (   Button == 'Área'
    ->  area_dialog
    ;   Button == 'Carga horária'
    ->  carga_horaria_dialog
    ;   Button == 'Ementa'
    ->  ementa_dialog
    ;   true
    ).
