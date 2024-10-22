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

3. Encontrar el k-ésimo elemento de una lista.

% Encuentra el k-ésimo elemento de una lista.
% El índice K debe ser mayor que 0.
element_at(X, [X|_], 1).
element_at(X, [_|T], K) :- K > 1, K1 is K - 1, element_at(X, T, K1).



- - - - -  C# - - - - -
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _50_programas_en_prolog
{
    class Program
    {
        static void Main(string[] args)
        {
            // 3. Encontrar el k-ésimo elemento de una lista

            List<int> list = new List<int> { 10, 20, 30, 40, 50 };
            int k = 3;
            int elemento = ElementoAt(list, k);
            Console.WriteLine(" Lista: 10, 20, 30, 40, 50");
            Console.WriteLine($" El elemento en la posicion {k} es: \t" + elemento);
            Console.ReadLine();
        }
        static T ElementoAt<T>(List<T>list, int k)
        {
            if(list==null ||k<1||k>list.Count)
            {
                throw new ArgumentException("El indice debe ser mayor que 0 y menor o igual al tamaño de la lista");

            }
            return list[k - 1];
        }
    }
}
