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

22. Crear una lista con todos los enteros dentro de un rango dado.

% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).



- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        int inicio = 3;
        int fin = 10;

        List<int> rango = CrearRango(inicio, fin);

        Console.WriteLine("Lista de enteros dentro del rango:");
        Console.ReadLine();
        foreach (var item in rango)
        {
            Console.Write(item + " ");
        }
    }

    static List<int> CrearRango(int inicio, int fin)
    {
        List<int> resultado = new List<int>();

        // Si inicio es mayor que fin, no se agrega nada.
        if (inicio > fin)
        {
            throw new ArgumentException("El valor de inicio debe ser menor o igual que el de fin.");
        }

        // Añadir los enteros dentro del rango.
        for (int i = inicio; i <= fin; i++)
        {
            resultado.Add(i);
        }

        return resultado;
    }
}

