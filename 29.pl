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

29. Ordenar una lista de listas según la frecuencia de la longitud de las sublistas.

% Ordena una lista de listas de acuerdo con la frecuencia de la longitud de las sublistas.
length_frequency(L, F) :- map_list_to_pairs(length, L, P), msort(P, SP), encode(SP, F).


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
            new List<int> { 1, 2, 3, 4, 5 },
            new List<int> { 2, 3 }
        };

        List<(int length, int frequency)> frecuencias = LengthFrequency(listaDeListas);

        Console.WriteLine("Frecuencias de longitudes de sublistas:");
        Console.ReadLine();
        
        foreach (var (length, frequency) in frecuencias)
        {
            Console.WriteLine($"Longitud: {length}, Frecuencia: {frequency}");
        }
    }

    static List<(int length, int frequency)> LengthFrequency(List<List<int>> listas)
    {

        var frecuencias = listas
            .GroupBy(l => l.Count) // Agrupa por la longitud
            .Select(g => (length: g.Key, frequency: g.Count())) // Crea una tupla con longitud y frecuencia
            .OrderBy(x => x.length) // Ordena por longitud
            .ToList();

        return frecuencias;
    }
}

