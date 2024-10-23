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

24. Lotería: Extraer N números aleatorios de un rango.

% Extrae N números aleatorios de un rango dado.
% Utiliza la función range para generar la lista de números y luego selecciona aleatoriamente.
lotto(N, M, L) :- range(1, M, R), rnd_select(R, N, L).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        int n = 5;  // Cantidad de números aleatorios a extraer
        int m = 50; // Rango de números (del 1 al m)

        List<int> numerosLoteria = Lotto(n, m);

        Console.WriteLine("Números de lotería seleccionados:");
        Console.ReadLine();
        foreach (var num in numerosLoteria)
        {
            Console.Write(num + " ");
        }
    }

    // Función para generar una lista con números del 1 al m
    static List<int> CrearRango(int inicio, int fin)
    {
        List<int> rango = new List<int>();
        for (int i = inicio; i <= fin; i++)
        {
            rango.Add(i);
        }
        return rango;
    }

    // Función para seleccionar N números aleatorios de un rango de 1 a M
    static List<int> Lotto(int n, int m)
    {
        List<int> rango = CrearRango(1, m);  // Genera la lista de números del 1 al m
        return ExtraerElementosAleatorios(rango, n);  // Selecciona N elementos aleatorios
    }

    // Función para extraer N elementos aleatorios de una lista
    static List<T> ExtraerElementosAleatorios<T>(List<T> lista, int n)
    {
        List<T> resultado = new List<T>();
        Random rand = new Random();
        List<T> listaCopia = new List<T>(lista);  // Copia de la lista original

        if (n > lista.Count)
        {
            throw new ArgumentException("El número de elementos a seleccionar es mayor que el tamaño de la lista.");
        }

        // Selecciona N elementos aleatorios
        for (int i = 0; i < n; i++)
        {
            int index = rand.Next(0, listaCopia.Count);  // Índice aleatorio
            resultado.Add(listaCopia[index]);            // Añade el elemento seleccionado
            listaCopia.RemoveAt(index);                  // Elimina el elemento de la lista para evitar duplicados
        }

        return resultado;
    }
}
