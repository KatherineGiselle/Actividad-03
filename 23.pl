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

23. Extraer un número dado de elementos seleccionados aleatoriamente de una lista.

% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :- length(L, Len), random(1, Len, I), element_at(X, L, I), delete(L, X, L1), N1 is N - 1, rnd_select(L1, N1, R).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
        int n = 3;  // Número de elementos aleatorios a extraer

        List<int> elementosAleatorios = ExtraerElementosAleatorios(lista, n);

        Console.WriteLine("Elementos aleatorios seleccionados:");
        foreach (var item in elementosAleatorios)
        {
            Console.Write(item + " ");
            Console.ReadLine();
        }
    }

    static List<T> ExtraerElementosAleatorios<T>(List<T> lista, int n)
    {
        List<T> resultado = new List<T>();
        Random rand = new Random();
        List<T> listaCopia = new List<T>(lista);  // Crear una copia para no modificar la lista original

        if (n > lista.Count)
        {
            throw new ArgumentException("El número de elementos a seleccionar es mayor que la longitud de la lista.");
        }

        // Extraer elementos aleatorios hasta obtener n elementos
        for (int i = 0; i < n; i++)
        {
            // Seleccionar un índice aleatorio
            int index = rand.Next(0, listaCopia.Count);
 
            resultado.Add(listaCopia[index]);
            
            // Eliminar el elemento de la lista para no seleccionarlo nuevamente
            listaCopia.RemoveAt(index);
        }

        return resultado;
    }
}

