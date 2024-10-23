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

8. Eliminar duplicados consecutivos de los elementos de una lista.

% Elimina duplicados consecutivos de una lista.
% Caso base: una lista vacía se mantiene vacía.
compress([], []).
% Si queda un solo elemento, no hay duplicados.
compress([X], [X]).
% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
compress([X,X|T], R) :- compress([X|T], R).
% Si el primer y segundo elemento son distintos, conserva el primero.
compress([X,Y|T], [X|R]) :- X \= Y, compress([Y|T], R).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static List<T> Compress<T>(List<T> list)
    {
        if (list == null || list.Count == 0)
            return new List<T>();

        List<T> result = new List<T> { list[0] };

        for (int i = 1; i < list.Count; i++)
        {
            if (!list[i].Equals(list[i - 1]))
            {
                result.Add(list[i]);
            }
        }

        return result;
    }

    static void Main()
    {
        List<int> input = new List<int> { 1, 1, 2, 3, 3, 3, 4, 5, 5 };
        List<int> output = Compress(input);

        Console.WriteLine("Input: " + string.Join(", ", input));
        Console.WriteLine("Output: " + string.Join(", ", output));
    }
}
