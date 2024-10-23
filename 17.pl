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

17. Dividir una lista en dos partes.

% Divide una lista en dos partes.
% La longitud de la primera parte está dada por el segundo argumento.
split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<int> lista = new List<int> { 1, 2, 3, 4, 5 };
        int n = 3;

        // Divide la lista en dos partes.
        (List<int> primeraParte, List<int> segundaParte) = DividirLista(lista, n);

        Console.WriteLine("Primera parte:");
        foreach (var item in primeraParte)
        {
            Console.Write(item + " ");
        }

        Console.WriteLine("\nSegunda parte:");
        foreach (var item in segundaParte)
        {
            Console.Write(item + " ");
        }
    }

    static (List<T>, List<T>) DividirLista<T>(List<T> lista, int n)
    {
        // Crear las dos listas de salida.
        List<T> primeraParte = new List<T>();
        List<T> segundaParte = new List<T>();

        // Verificar que la lista tenga al menos N elementos.
        if (n > lista.Count)
        {
            n = lista.Count; // Si n es mayor que la cantidad de elementos, ajusta a la longitud de la lista.
        }

        // Recorrer la lista y agregar elementos a las listas correspondientes.
        for (int i = 0; i < lista.Count; i++)
        {
            if (i < n)
            {
                primeraParte.Add(lista[i]); // Los primeros n elementos van a la primera lista.
            }
            else
            {
                segundaParte.Add(lista[i]); // El resto va a la segunda lista.
            }
        }

        return (primeraParte, segundaParte);
    }
}
