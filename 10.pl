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

10. Codificación Run-Length de una lista.

% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- pack(L, P), transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    // Función que agrupa duplicados consecutivos en sublistas
    static List<List<T>> Pack<T>(List<T> list)
    {
        if (list == null || list.Count == 0)
            return new List<List<T>>();

        List<List<T>> result = new List<List<T>>();
        List<T> currentGroup = new List<T> { list[0] };

        for (int i = 1; i < list.Count; i++)
        {
            if (list[i].Equals(list[i - 1]))
            {
                currentGroup.Add(list[i]);
            }
            else
            {
                result.Add(currentGroup);
                currentGroup = new List<T> { list[i] };
            }
        }

        result.Add(currentGroup); // Añadir el último grupo

        return result;
    }

    // Función que codifica la lista usando codificación Run-Length
    static List<(int, T)> Encode<T>(List<T> list)
    {
        var packedList = Pack(list);
        List<(int, T)> result = new List<(int, T)>();

        foreach (var group in packedList)
        {
            result.Add((group.Count, group[0]));
        }

        return result;
    }

    static void Main()
    {
        List<char> input = new List<char> { 'a', 'a', 'a', 'b', 'b', 'c', 'c', 'c', 'c', 'd', 'e', 'e' };
        List<(int, char)> output = Encode(input);

        Console.WriteLine("Input: " + string.Join(", ", input));
        Console.WriteLine("Output (Run-Length Encoding):");
        foreach (var pair in output)
        {
            Console.WriteLine($"({pair.Item1}, {pair.Item2})");
            Console.ReadLine();
        }
    }
}
