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

26. Generar combinaciones de K elementos distintos seleccionados de una lista de N elementos.

% Genera todas las combinaciones de K elementos seleccionados de una lista dada.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- K > 0, K1 is K - 1, combination(K1, T, Comb).
combination(K, [_|T], Comb) :- K > 0, combination(K, T, Comb).

- - - - -  C# - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<int> lista = new List<int> { 1, 2, 3, 4, 5 }; // Lista de entrada
        int k = 3; // Número de elementos a combinar

        List<List<int>> combinaciones = GenerarCombinaciones(lista, k);

        Console.WriteLine($"Combinaciones de {k} elementos:");
        Console.ReadLine();
        foreach (var combinacion in combinaciones)
        {
            Console.WriteLine(string.Join(", ", combinacion));
        }
    }

    // Función principal para generar combinaciones de K elementos
    static List<List<T>> GenerarCombinaciones<T>(List<T> lista, int k)
    {
        List<List<T>> resultado = new List<List<T>>();
        CombinacionesRecursivas(lista, k, 0, new List<T>(), resultado);
        return resultado;
    }

    static void CombinacionesRecursivas<T>(List<T> lista, int k, int index, List<T> combinacionActual, List<List<T>> resultado)
    {
        // Caso base: si K es 0, se añade la combinación actual al resultado
        if (k == 0)
        {
            resultado.Add(new List<T>(combinacionActual));
            return;
        }

        // Recorrer los elementos de la lista
        for (int i = index; i < lista.Count; i++)
        {
            // Añadir el elemento actual a la combinación
            combinacionActual.Add(lista[i]);
            // Llamar recursivamente, reduciendo K y avanzando en la lista
            CombinacionesRecursivas(lista, k - 1, i + 1, combinacionActual, resultado);
            // Retirar el último elemento para probar la siguiente combinación
            combinacionActual.RemoveAt(combinacionActual.Count - 1);
        }
    }
}
