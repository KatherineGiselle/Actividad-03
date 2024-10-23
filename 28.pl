Encabezado
% C# solucion / Python


%------------------------------------------------------------------------------
% Módulo:       50_programas
% Propósito:    Elaborar 50 programas en Prolog
% 
% Autor:        Diaz Morales Katherine Giselle
% Fecha:        23 de octubre de 2024
%
% Descripción: 
% Elaborar 50 programas en Prolog, usar templete.

--------------------------------------------------------------------------------------


- - - - -  PROLOG - - - - -

28. Ordenar una lista de listas de acuerdo con la longitud de las sublistas.

% Ordena una lista de listas de acuerdo con la longitud de las sublistas.
lsort(L, S) :- map_list_to_pairs(length, L, P), keysort(P, SP), pairs_values(SP, S).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static void Main()
    {
        List<List<int>> listaDeListas = new List<List<int>>
        {
            new List<int> { 1, 2 },
            new List<int> { 1 },
            new List<int> { 1, 2, 3, 4 },
            new List<int> { 1, 2, 3 },
            new List<int> { 1, 2, 3, 4, 5 }
        };

        List<List<int>> listaOrdenada = Lsort(listaDeListas);

        Console.WriteLine("Lista ordenada por longitud de sublistas:");
        foreach (var sublista in listaOrdenada)
        {
            Console.WriteLine($"[{string.Join(", ", sublista)}]");
            Console.ReadLine();
        }
    }

    static List<List<T>> Lsort<T>(List<List<T>> listas)
    {
        return listas.OrderBy(l => l.Count).ToList(); // Ordena por la longitud de las sublistas
    }
}
