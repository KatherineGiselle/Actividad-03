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
16. Eliminar cada n-ésimo elemento de una lista.

% Elimina cada n-ésimo elemento de una lista.
% Utiliza un contador para determinar cuándo eliminar un elemento.
drop(L, N, R) :- drop(L, N, N, R).

% Caso base: cuando la lista está vacía, el resultado es vacío.
drop([], _, _, []).
% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
drop([_|T], 1, N, R) :- drop(T, N, N, R).
% Caso recursivo: disminuye el contador y conserva el elemento.
drop([H|T], K, N, [H|R]) :- K > 1, K1 is K - 1, drop(T, K1, N, R).



- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
        int n = 3;

        List<int> resultado = EliminarCadaNesimo(lista, n);

        Console.WriteLine("Lista resultante:");
        foreach (var item in resultado)
        {
            Console.Write(item + " ");
        }
    }

    static List<T> EliminarCadaNesimo<T>(List<T> lista, int n)
    {
        List<T> resultado = new List<T>();
        int contador = 0;

        for (int i = 0; i < lista.Count; i++)
        {
            contador++;

            // Si el contador es igual a n, omitimos el elemento y reiniciamos el contador.
            if (contador == n)
            {
                contador = 0; // Reiniciar el contador
            }
            else
            {
                resultado.Add(lista[i]);
            }
        }

        return resultado;
    }
}
