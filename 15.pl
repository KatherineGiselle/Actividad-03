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

15. Duplicar los elementos de una lista un número dado de veces.

% Duplica los elementos de una lista un número dado de veces.
% Caso base: la lista vacía se mantiene vacía.
dupli([], _, []).
% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
dupli([H|T], N, R) :- duplicate(H, N, D), dupli(T, N, R1), append(D, R1, R).

% Crea una lista con N repeticiones del elemento X.
duplicate(_, 0, []).
duplicate(X, N, [X|R]) :- N > 0, N1 is N - 1, duplicate(X, N1, R).



- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    // Función que duplica los elementos de una lista un número dado de veces
    static List<T> Duplicate<T>(List<T> list, int count)
    {
        List<T> result = new List<T>();

        foreach (T element in list)
        {
            var duplicated = RepeatElement(element, count);
            result.AddRange(duplicated);
        }

        return result;
    }

    // Función que crea una lista con 'count' repeticiones del elemento 'element'
    static List<T> RepeatElement<T>(T element, int count)
    {
        List<T> repeatedList = new List<T>();
        for (int i = 0; i < count; i++)
        {
            repeatedList.Add(element);
        }
        return repeatedList;
    }

    static void Main()
    {
        // Lista de ejemplo
        List<int> input = new List<int> { 1, 2, 3, 4, 5 };
        int duplicateCount = 3;  // Número de veces a duplicar cada elemento

        // Duplicar los elementos de la lista un número dado de veces
        List<int> duplicatedOutput = Duplicate(input, duplicateCount);

        // Imprimir resultado
        Console.WriteLine("Input: " + string.Join(", ", input));
        Console.WriteLine($"Duplicated Output ({duplicateCount} times): " + string.Join(", ", duplicatedOutput));
        Console.ReadLine();
    }
}
