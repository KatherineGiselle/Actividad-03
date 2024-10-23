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

18. Extraer una porción de una lista.

% Extrae una porción de una lista, dado un rango.
% Los índices I y K deben ser mayores que 0.
slice([H|_], 1, 1, [H]).
slice([H|T], 1, K, [H|R]) :- K > 1, K1 is K - 1, slice(T, 1, K1, R).
slice([_|T], I, K, R) :- I > 1, I1 is I - 1, K1 is K - 1, slice(T, I1, K1, R).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
        int inicio = 3; // Índice de inicio (basado en 1)
        int fin = 7;    // Índice de fin (basado en 1)

        List<int> porcion = ExtraerPorcion(lista, inicio, fin);

        Console.WriteLine("Porción extraída:");
        foreach (var item in porcion)
        {
            Console.Write(item + " ");
        }
    }

    static List<T> ExtraerPorcion<T>(List<T> lista, int inicio, int fin)
    {
        // Asegurar que los índices sean válidos (1 basado).
        if (inicio < 1 || fin > lista.Count || inicio > fin)
        {
            throw new ArgumentOutOfRangeException("Los índices están fuera de rango.");
        }

        // Convertir los índices basados en 1 a basados en 0 para la lista.
        int indiceInicio = inicio - 1;
        int longitud = fin - inicio + 1;

        // Usar GetRange para extraer la porción de la lista.
        return lista.GetRange(indiceInicio, longitud);
    }
}
