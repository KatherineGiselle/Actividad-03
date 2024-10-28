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

37. Comparar dos métodos para calcular la función totiente de Euler.

% Compara los dos métodos para calcular la función totiente.
compare_totient(N) :- totient(N, Phi1), totient_improved(N, Phi2), write('Phi (método básico): '), write(Phi1), nl, write('Phi (método mejorado): '), write(Phi2), nl.
