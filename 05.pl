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

5. Invertir una lista.

% Invierte una lista.
% Utiliza un acumulador para ir construyendo la lista invertida.
reverse_list(L, R) :- reverse_list(L, [], R).
% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).
% Caso recursivo: mueve el elemento de la cabeza al acumulador.
reverse_list([H|T], Acc, R) :- reverse_list(T, [H|Acc], R).


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
            // 5. Invertir una lista

            List<int> list = new List<int> { 1, 2, 3, 4, 5 };
            List<int> reversedList = ReverseList(list);
            Console.WriteLine("Lista: 1, 2, 3, 4, 5");
            Console.WriteLine("Lista invertida:" + string.Join(", ", reversedList));
            Console.ReadLine();
            }
        static List<T>ReverseList<T>(List<T>list)
        {
            return ReverseListRecursive(list, new List<T>());
        }
        static List<T>ReverseListRecursive<T>(List<T> list, List<T>accumulator)
        {
            if(list.Count==0)
            {
                return accumulator;
            }
            List<T> tail = list.GetRange(1, list.Count - 1);
            accumulator.Insert(0, list[0]);

            return ReverseListRecursive(tail, accumulator);


        }
    }
}

