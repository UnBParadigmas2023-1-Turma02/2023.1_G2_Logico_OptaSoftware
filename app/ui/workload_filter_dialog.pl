:- module(workload_filter_dialog, [workload_filter_dialog/1]).

:- use_module(library(pce)).

:- ensure_loaded('../materias.pl').

:- op(100, fx, ?).

unique_workloads(UniqueWorkloads) :-
        findall(Workload, materia(_, _, _, Workload, _), Workloads),
        sort(Workloads, UniqueWorkloads).

workload_filter_dialog(Workload) :-
        unique_workloads(Workloads),
        new(D, dialog('Workload')),
        send(D, append, label(title, 'Qual a carga horária?')),
        send(D, append, new(LB, list_browser)),
        forall(member(Workload, Workloads), send(LB, append, Workload)),
        send(D, append, button(ok, message(D, return, LB?selection?key))),
        % send(D, append, button(back)),
        get(D, confirm_centered, Rval),
        free(D),
        Workload = Rval.
