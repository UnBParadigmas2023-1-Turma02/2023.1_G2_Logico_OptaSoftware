:- use_module(library(tabular)).
:- use_module(library(autowin)).
:- use_module(library(pce)).

make_table(Materias) :-
    new(P, dialog('Resultado da Busca')),
    
    % Create the button
    new(B, button('Gerar Relatório em Markdown')),
    send(B, message, message(@pce, button_clicked,(1,2,3))),
    send(B, colour, blue),
    send(P, display, B),


    get(P, width, PWidth),
    get(B, width, BWidth),
    X is (PWidth - BWidth) / 2,
    
    send(B, position, point(X, 10)),
    
    % Create the table
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
    
    % Display the table
    send(P, display, T, point(10, 50)), % Adjust the table position
    
    % Open the picture
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

% Define the button_clicked predicate to receive the complex structure
button_clicked((A,B,C)) :-
    writeln(A).