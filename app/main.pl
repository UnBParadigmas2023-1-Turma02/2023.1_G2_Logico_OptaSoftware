:- use_module(library(pce)).

:- ensure_loaded('ui/main_filter_dialog.pl').
:- ensure_loaded('ui/area_filter_dialog.pl').



main :-
    main_filter_dialog(Button),
    format('Selected button: ~w~n', [Button]),
    ( Button == 'Área'
    -> area_filter_dialog(Area),
        format('Área selecionada: ~w~n', [Area]),
        % tem_area_conhecimento(Area);
        true).
