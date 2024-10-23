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

19. Rotar una lista un número N de lugares a la izquierda.

% Rota una lista N lugares a la izquierda.
% Utiliza la longitud de la lista para manejar rotaciones mayores que la longitud.
rotate(L, N, R) :- length(L, Len), N1 is N mod Len, split(L, N1, L1, L2), append(L2, L1, R).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
        int n = 3; // Número de lugares a rotar a la izquierda

        List<int> listaRotada = RotarLista(lista, n);

        Console.WriteLine("Lista rotada:");
        foreach (var item in listaRotada)
        {
            Console.Write(item + " ");
        }
    }

    static List<T> RotarLista<T>(List<T> lista, int n)
    {
        int len = lista.Count;

        // Asegurarse de que N esté dentro del rango de la longitud de la lista.
        if (len == 0)
            return lista; // Si la lista está vacía, no hacer nada.

        int nMod = n % len; // Para manejar rotaciones mayores que la longitud.

        // Si no hay rotación, devolvemos la lista tal cual.
        if (nMod == 0)
            return new List<T>(lista);

        // Dividir la lista en dos partes: desde 0 hasta N y desde N en adelante.
        List<T> primeraParte = lista.GetRange(0, nMod);
        List<T> segundaParte = lista.GetRange(nMod, len - nMod);

        // Concatenar la segunda parte con la primera para lograr la rotación.
        List<T> resultado = new List<T>(segundaParte);
        resultado.AddRange(primeraParte);

        return resultado;
    }
}

