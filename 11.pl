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

11. Modificar la codificación Run-Length de una lista.

% Modifica la codificación Run-Length de una lista.
% Si un elemento no tiene duplicados, se mantiene sin empaquetar.
encode_modified(L, R) :- encode(L, Enc), modify(Enc, R).

% Caso base: lista vacía.
modify([], []).
% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).
% Si hay más de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).


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

    // Función que modifica la codificación Run-Length para elementos sin duplicados
    static List<object> EncodeModified<T>(List<T> list)
    {
        var encodedList = Encode(list);
        List<object> result = new List<object>();

        foreach (var item in encodedList)
        {
            if (item.Item1 == 1)
            {
                result.Add(item.Item2);  // Si solo aparece una vez, agregar directamente
            }
            else
            {
                result.Add(item);  // Si tiene duplicados, mantener la tupla (N, X)
            }
        }

        return result;
    }

    static void Main()
    {
        List<char> input = new List<char> { 'a', 'a', 'b', 'c', 'c', 'c', 'd', 'e', 'e' };
        List<object> output = EncodeModified(input);

        Console.WriteLine("Input: " + string.Join(", ", input));
        Console.WriteLine("Output (Modified Run-Length Encoding):");
        foreach (var item in output)
        {
            if (item is ValueTuple<int, char> pair)
            {
                Console.WriteLine($"({pair.Item1}, {pair.Item2})");
            }
            else
            {
                Console.WriteLine(item);
            }
        }
    }
}
