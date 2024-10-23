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

9. Agrupar duplicados consecutivos de los elementos de una lista en sublistas.

% Agrupa duplicados consecutivos de una lista en sublistas.
% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).
% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], []).
% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    // Función principal que agrupa duplicados consecutivos en sublistas
    static List<List<T>> Pack<T>(List<T> list)
    {
        if (list == null || list.Count == 0)
            return new List<List<T>>();

        List<List<T>> result = new List<List<T>>();
        List<T> currentGroup = new List<T> { list[0] };

        for (int i = 1; i < list.Count; i++)
        {
            if (list[i].Equals(list[i - 1]))
            {
                currentGroup.Add(list[i]);
            }
            else
            {
                result.Add(currentGroup);
                currentGroup = new List<T> { list[i] };
            }
        }

        result.Add(currentGroup); // Añadir el último grupo

        return result;
    }

    static void Main()
    {
        List<int> input = new List<int> { 1, 1, 2, 2, 2, 3, 3, 4, 5, 5 };
        List<List<int>> output = Pack(input);

        Console.WriteLine("Input: " + string.Join(", ", input));
        Console.WriteLine("Output:");
        foreach (var group in output)
        {
            Console.WriteLine("[ " + string.Join(", ", group) + " ]");
        }
    }
}
