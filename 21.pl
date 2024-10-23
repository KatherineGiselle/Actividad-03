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

21. Insertar un elemento en una lista en una posición dada.

% Inserta un elemento en una lista en la posición dada.
% El índice K debe ser mayor que 0.
insert_at(X, L, 1, [X|L]).
insert_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, insert_at(X, T, K1, R).



- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
        int elemento = 99; // El elemento a insertar
        int posicion = 5;  // La posición en la que queremos insertar

        List<int> nuevaLista = InsertarEnPosicion(lista, elemento, posicion);

        Console.WriteLine("Lista después de insertar el elemento:");
        Console.ReadLine();
        foreach (var item in nuevaLista)
        {
            Console.Write(item + " ");
        }
    }

    static List<T> InsertarEnPosicion<T>(List<T> lista, T elemento, int posicion)
    {
        // Verificar que la posición esté dentro del rango permitido.
        if (posicion < 1 || posicion > lista.Count + 1)
        {
            throw new ArgumentOutOfRangeException("La posición está fuera de rango.");
        }

        // Crear una nueva lista copiando los elementos originales.
        List<T> nuevaLista = new List<T>(lista);

        // Insertar el elemento en la posición correspondiente (posición - 1 en base 0).
        nuevaLista.Insert(posicion - 1, elemento);

        return nuevaLista;
    }
}
