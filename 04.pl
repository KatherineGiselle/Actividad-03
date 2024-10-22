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

4. Encontrar el número de elementos de una lista.

% Calcula el número de elementos de una lista.
% Caso base: una lista vacía tiene longitud 0.
list_length([], 0).
% Caso recursivo: la longitud es 1 más que la longitud de la cola.
list_length([_|T], N) :- list_length(T, N1), N is N1 + 1.


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
            // 4. Encontrar el numero de elemntos de una lista

            List<int> list = new List<int> { 1, 2, 3, 4, 5 };
            int length = ListLenght(list);
            Console.WriteLine("Lista: 1, 2, 3, 4, 5");
            Console.WriteLine("El numero de elementos en la lista es: \t" + length);
            Console.ReadLine();
        }
        static int ListLenght<T>(List<T>list)
        {
            if(list==null ||list.Count==0)
            {
                return 0;
            }
            return ListLengthRecursive(list, 0);
        }
        static int ListLengthRecursive<T>(List<T>list, int count)
        {
            if(list.Count==0)
            {
                return count;
            }
            List<T> tail = list.GetRange(1, list.Count - 1);
            return ListLengthRecursive(tail, count + 1);
        }
    
        }
    }
