-module(rna_transcription).

-include_lib("eunit/include/eunit.hrl").

-export([to_rna/1]).

to_rna(DnaString) ->
    lists:map(fun translate_nucleotide/1,DnaString).

translate_nucleotide($A) ->
    $U;
translate_nucleotide($T) ->
    $A;
translate_nucleotide($C) ->
    $G;
translate_nucleotide($G) ->
    $C.

-ifdef(EUNIT).

%%% moving logic into translate nucleotide seemed to beg
%%% for some *internal* tests

translate_nucleotide_A_test() ->
    ?assertEqual($U,translate_nucleotide($A)).
translate_nucleotide_T_test() ->
    ?assertEqual($A,translate_nucleotide($T)).
translate_nucleotide_C_test() ->
    ?assertEqual($G,translate_nucleotide($C)).
translate_nucleotide_G_test() ->
    ?assertEqual($C,translate_nucleotide($G)).

-endif.
