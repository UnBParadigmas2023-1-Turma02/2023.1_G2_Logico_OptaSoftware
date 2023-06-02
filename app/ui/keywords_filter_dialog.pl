:- module(keywords_filter_dialog, [keywords_filter_dialog/1]).

:- use_module(library(pce)).

:- ensure_loaded('../materias.pl').

:- op(100, fx, ?).

unique_palavras_chave(UniquePalavrasChave) :-
    findall(Palavras, materia(_, Palavras, _, _, _), PalavrasList),
    flatten(PalavrasList, FlattenedPalavrasList),
    sort(FlattenedPalavrasList, UniquePalavrasChave).

% KeywordsChainList is a list of dict_item, Keyword is a list of strings
keywords_filter_dialog(Keywords) :-
    unique_palavras_chave(UniquePalavrasChave),
    new(D, dialog('Filtro de palavras-chave')),
    send(D, append, new(LBKeywords, list_browser)),
    send(LBKeywords, multiple_selection, @on),
    % send(LBKeywords, show_label, @off),
    send(LBKeywords, members, UniquePalavrasChave),
    send(D, append, button(ok, message(D, return, LBKeywords?selection))),
    send(D, append, button(cancel, message(D, return, @nil))),
    send(D, default_button, ok),
    get(D, confirm_centered, KeywordChain),
    new(Chain, chain),
    send(KeywordChain, for_all, message(Chain, append, @arg1?label)),
    chain_list(Chain, Keywords),
    free(D).
