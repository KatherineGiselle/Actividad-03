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

13. Codificación Run-Length de una lista (solución directa).

% Codifica directamente una lista usando codificación Run-Length.
% Cuenta cuántos elementos consecutivos son iguales.
encode_direct([], []).
encode_direct([X|Xs], [[N,X]|R]) :- count(X, [X|Xs], N, Rest), encode_direct(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).
count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.
count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    // Función que codifica directamente una lista usando Run-Length
    static List<(int, T)> EncodeDirect<T>(List<T> list)
    {
        if (list == null || list.Count == 0)
            return new List<(int, T)>();

        List<(int, T)> result = new List<(int, T)>();
        int index = 0;

        while (index < list.Count)
        {
            T currentElement = list[index];
            int count = CountConsecutive(list, index);
            result.Add((count, currentElement));
            index += count;
        }

        return result;
    }

    // Función que cuenta cuántos elementos consecutivos son iguales
    static int CountConsecutive<T>(List<T> list, int startIndex)
    {
        T element = list[startIndex];
        int count = 0;

        for (int i = startIndex; i < list.Count; i++)
        {
            if (list[i].Equals(element))
            {
                count++;
            }
            else
            {
                break;
            }
        }

        return count;
    }

    static void Main()
    {
        // Lista de ejemplo
        List<char> input = new List<char> { 'a', 'a', 'a', 'b', 'b', 'c', 'd', 'd', 'd', 'd' };

        // Codificar la lista usando la codificación Run-Length directa
        List<(int, char)> encodedOutput = EncodeDirect(input);

        // Imprimir resultado
        Console.WriteLine("Input: " + string.Join(", ", input));
        Console.WriteLine("Encoded Output (Run-Length Direct):");
        foreach (var pair in encodedOutput)
        {
            Console.WriteLine($"({pair.Item1}, {pair.Item2})");
            Console.ReadLine();
        }
    }
}


