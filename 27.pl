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

27. Agrupar los elementos de un conjunto en subconjuntos disjuntos.

% Agrupa los elementos de un conjunto en subconjuntos disjuntos dados los tamaños de los subgrupos.
group([], [], []).
group([N|Ns], Es, [G|Gs]) :- combination(N, Es, G), subtract(Es, G, Rest), group(Ns, Rest, Gs).


- - - - -  C#  - - - - -

using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static void Main()
    {
        List<int> elementos = new List<int> { 1, 2, 3, 4, 5, 6 }; // Conjunto de elementos
        List<int> tamañosSubgrupos = new List<int> { 2, 2, 2 }; // Tamaños de los subgrupos

        List<List<List<int>>> grupos = Agrupar(elementos, tamañosSubgrupos);

        Console.WriteLine("Subconjuntos disjuntos:");
        Console.ReadLine();
        foreach (var grupo in grupos)
        {
            foreach (var subgrupo in grupo)
            {
                Console.WriteLine($"[{string.Join(", ", subgrupo)}]");
            }
            Console.WriteLine();
        }
    }

    static List<List<List<T>>> Agrupar<T>(List<T> elementos, List<int> tamaños)
    {
        List<List<List<T>>> resultado = new List<List<List<T>>>();
        AgruparRecursivo(elementos, tamaños, new List<List<T>>(), resultado);
        return resultado;
    }

    static void AgruparRecursivo<T>(List<T> elementos, List<int> tamaños, List<List<T>> grupos, List<List<List<T>>> resultado)
    {
        if (tamaños.Count == 0) // Caso base: no quedan tamaños de subgrupo
        {
            resultado.Add(new List<List<T>>(grupos));
            return;
        }

        int tamañoActual = tamaños[0]; // Tamaño del subgrupo actual
        foreach (var combinacion in GenerarCombinaciones(elementos, tamañoActual))
        {
            grupos.Add(combinacion);
            // Eliminar la combinación de elementos y continuar recursivamente
            List<T> elementosRestantes = RestarElementos(elementos, combinacion);
            AgruparRecursivo(elementosRestantes, tamaños.Skip(1).ToList(), grupos, resultado);
            // Quitar la combinación del grupo para backtracking
            grupos.RemoveAt(grupos.Count - 1);
        }
    }

    // Función para generar combinaciones
    static List<List<T>> GenerarCombinaciones<T>(List<T> lista, int k)
    {
        List<List<T>> resultado = new List<List<T>>();
        CombinacionesRecursivas(lista, k, 0, new List<T>(), resultado);
        return resultado;
    }

    // Función recursiva para encontrar combinaciones
    static void CombinacionesRecursivas<T>(List<T> lista, int k, int index, List<T> combinacionActual, List<List<T>> resultado)
    {
        if (k == 0)
        {
            resultado.Add(new List<T>(combinacionActual));
            return;
        }

        for (int i = index; i < lista.Count; i++)
        {
            combinacionActual.Add(lista[i]);     
            CombinacionesRecursivas(lista, k - 1, i + 1, combinacionActual, resultado);
            combinacionActual.RemoveAt(combinacionActual.Count - 1);
        }
    }

    // Función para restar elementos de una lista
    static List<T> RestarElementos<T>(List<T> lista, List<T> elementosARestar)
    {
        List<T> resultado = new List<T>(lista);
        foreach (var elemento in elementosARestar)
        {
            resultado.Remove(elemento);
        }
        return resultado;
    }
}
