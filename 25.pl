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

25. Generar una permutación aleatoria de los elementos de una lista.

% Genera una permutación aleatoria de los elementos de una lista.
% Utiliza la selección aleatoria para construir la permutación.
rnd_permu(L, P) :- length(L, Len), rnd_select(L, Len, P).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6 };
        
        List<int> permutacionAleatoria = GenerarPermutacionAleatoria(lista);

        Console.WriteLine("Permutación aleatoria:");
        foreach (var num in permutacionAleatoria)
        {
            Console.Write(num + " ");
        }
    }

    // Función para generar una permutación aleatoria de los elementos de una lista
    static List<T> GenerarPermutacionAleatoria<T>(List<T> lista)
    {
        // Crear una copia de la lista para no modificar la original
        List<T> listaCopia = new List<T>(lista);
        List<T> resultado = new List<T>();

        // Mientras haya elementos en la lista copia, selecciona aleatoriamente y elimina
        Random rand = new Random();
        while (listaCopia.Count > 0)
        {
            int index = rand.Next(0, listaCopia.Count); // Selección de índice aleatorio
            resultado.Add(listaCopia[index]);            // Añadir el elemento seleccionado
            listaCopia.RemoveAt(index);                  // Eliminar el elemento de la lista
        }

        return resultado; // Retornar la permutación aleatoria
    }
}
