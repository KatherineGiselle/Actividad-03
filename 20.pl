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

20. Eliminar el k-ésimo elemento de una lista.

% Elimina el k-ésimo elemento de una lista.
% El índice K debe ser mayor que 0.
remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, remove_at(X, T, K1, R).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
        int k = 4; // Eliminar el elemento en la posición k

        List<int> nuevaLista = EliminarEnPosicion(lista, k);

        Console.WriteLine("Lista después de eliminar el k-ésimo elemento:");
        foreach (var item in nuevaLista)
        {
            Console.Write(item + " ");
        }
    }

    static List<T> EliminarEnPosicion<T>(List<T> lista, int k)
    {
        // Verificar que k esté dentro del rango de la lista.
        if (k < 1 || k > lista.Count)
        {
            throw new ArgumentOutOfRangeException("k está fuera de rango.");
        }

        // Crear una nueva lista sin el k-ésimo elemento.
        List<T> nuevaLista = new List<T>(lista);
        nuevaLista.RemoveAt(k - 1); // k-1 porque la lista en C# es de base 0.

        return nuevaLista;
    }
}
