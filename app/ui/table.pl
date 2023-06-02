:- use_module(library(tabular)).
:- use_module(library(autowin)).
:- use_module(library(pce)).

:- ensure_loaded('../relatorio.pl').

list_to_string(List, AtomString) :-
    with_output_to(string(String), write_term(List, [quoted(true)])),
    atom_string(AtomString, String).

string_to_list(String, List) :-
    atom_chars(String, CharList),
    read_term_from_chars(CharList, List, []).


make_table(Materias) :-
    new(P, dialog('Resultado da Busca')),
    new(B, button('Gerar Relatório em Markdown')),
    list_to_string(Materias,LMS),
    send(B, message, message(@prolog, gerar_relatorio, LMS)),
    send(B, colour, blue),
    send(P, display, B),


    get(P, width, PWidth),
    get(B, width, BWidth),
    X is (PWidth - BWidth) / 2,
    
    send(B, position, point(X, 10)),
    
    new(T, tabular),
    send(T, border, 1),
    send(T, cell_spacing, -1),
    send(T, rules, all),
    send_list(T, [
        append('Nome da Matéria', bold, center),
        append('Carga Horária', bold, center),
        append('Ementa', bold, center)
    ]),
    add_rows(T, Materias),
    
    send(P, display, T, point(10, 50)), 
    
    send(P, open), !.


add_rows(_,[]).
add_rows(T,[(Nome,_,_,CargaHoraria,Ementa) | Resto]) :-
    sub_string(Ementa,0,50,_,Ementa50Car),
    send_list(T,
    [
        next_row,
        append(Nome),
        append(CargaHoraria),
        append(Ementa50Car)
    ]),
    add_rows(T, Resto).

gerar_relatorio(MateriasString) :-
    string_to_list(MateriasString, ListaMaterias),
    cabecalho_markdown(ListaMaterias).