Encabezado
% C# solucion / Python


%------------------------------------------------------------------------------
% Módulo:       50_programas
% Propósito:    Elaborar 50 programas en Prolog
% 
% Autor:        Diaz Morales Katherine Giselle
% Fecha:        21 de octubre de 2024
%
% Descripción: 
% Elaborar 50 programas en Prolog, usar templete.

--------------------------------------------------------------------------------------


- - - - -  PROLOG - - - - -

43. Código Gray.

% Genera el código Gray de N bits.
% https://es.wikipedia.org/wiki/Código_Gray
% La secuencia de código Gray es una secuencia binaria en la que dos valores consecutivos difieren en solo un bit.
gray(1, ['0', '1']).
gray(N, C) :- N > 1, N1 is N - 1, gray(N1, C1), maplist(atom_concat('0'), C1, C0), reverse(C1, C1R), maplist(atom_concat('1'), C1R, C1G), append(C0, C1G, C).
