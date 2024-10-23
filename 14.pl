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

14. Duplicar los elementos de una lista.
% Duplica los elementos de una lista.
% Caso base: la lista vacía se mantiene vacía.
dupli([], []).
% Caso recursivo: duplica el primer elemento y continúa con el resto.
dupli([H|T], [H,H|R]) :- dupli(T, R).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    // Función que duplica los elementos de una lista
    static List<T> Duplicate<T>(List<T> list)
    {
        List<T> result = new List<T>();

        foreach (T element in list)
        {
            result.Add(element);  // Agrega el elemento original
            result.Add(element);  // Agrega una copia del elemento
        }

        return result;
    }

    static void Main()
    {
        // Lista de ejemplo
        List<int> input = new List<int> { 1, 2, 3, 4, 5 };

        // Duplicar los elementos de la lista
        List<int> duplicatedOutput = Duplicate(input);

        // Imprimir resultado
        Console.WriteLine("Input: " + string.Join(", ", input));
        Console.WriteLine("Duplicated Output: " + string.Join(", ", duplicatedOutput));
        Console.ReadLine();
    }
}

