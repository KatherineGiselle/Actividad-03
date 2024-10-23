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

7. Aplanar una estructura de lista anidada.

% Aplana una lista anidada en una lista simple.
% Caso base: la lista vacía se aplana a una lista vacía.
my_flatten([], []).
% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
my_flatten([H|T], Flat) :- my_flatten(H, FH), my_flatten(T, FT), append(FH, FT, Flat).
% Si la cabeza no es una lista, simplemente agrégala al resultado.
my_flatten(X, [X]) :- X \= [], \+ is_list(X).


- - - - -  C# - - - - -

using System;
using System.Collections;
using System.Collections.Generic;

class Program
{
    // Método que aplana una lista anidada
    static List<object> MyFlatten(List<object> nestedList)
    {
        List<object> flatList = new List<object>();

        foreach (var item in nestedList)
        {
            if (item is List<object> sublist)
            {
                // Si el item es una lista, se aplana recursivamente
                flatList.AddRange(MyFlatten(sublist));
            }
            else
            {
                // Si el item no es una lista, simplemente se agrega a la lista resultante
                flatList.Add(item);
            }
        }

        return flatList;
    }

    static void Main()
    {
        // Ejemplo de lista anidada
        List<object> nestedList = new List<object>
        {
            1, 
            new List<object> { 2, new List<object> { 3, 4 } }, 
            5, 
            new List<object> { 6 }
        };

        // Aplanar la lista
        List<object> flatList = MyFlatten(nestedList);

        // Mostrar la lista aplanada
        Console.WriteLine(string.Join(", ", flatList));
    }
}

