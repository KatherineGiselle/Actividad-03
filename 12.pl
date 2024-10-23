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

12. Decodificar una lista codificada mediante Run-Length.
% Decodifica una lista codificada mediante Run-Length.
% Expande cada par (N, X) en una lista con N elementos X.
decode([], []).
decode([[N,X]|T], R) :- decode(T, R1), expand(X, N, E), append(E, R1, R).

% Expande un elemento X en una lista de longitud N.
expand(_, 0, []).
expand(X, N, [X|T]) :- N > 0, N1 is N - 1, expand(X, N1, T).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    // Función que decodifica una lista codificada mediante Run-Length
    static List<T> Decode<T>(List<(int, T)> encodedList)
    {
        List<T> result = new List<T>();

        foreach (var pair in encodedList)
        {
            var expanded = Expand(pair.Item2, pair.Item1);
            result.AddRange(expanded);
        }

        return result;
    }

    // Función que expande un elemento X en una lista con N elementos X
    static List<T> Expand<T>(T element, int count)
    {
        List<T> expandedList = new List<T>();

        for (int i = 0; i < count; i++)
        {
            expandedList.Add(element);
        }

        return expandedList;
    }

    static void Main()
    {
        // Lista codificada usando Run-Length
        List<(int, char)> encodedInput = new List<(int, char)>
        {
            (3, 'a'), (2, 'b'), (1, 'c'), (4, 'd')
        };

        // Decodificar la lista
        List<char> decodedOutput = Decode(encodedInput);

        // Imprimir resultado
        Console.WriteLine("Encoded Input: ");
        foreach (var pair in encodedInput)
        {
            Console.WriteLine($"({pair.Item1}, {pair.Item2})");
        }

        Console.WriteLine("\nDecoded Output: " + string.Join(", ", decodedOutput));
        Console.ReadLine();
    }
}
