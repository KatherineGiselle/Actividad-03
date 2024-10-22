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

6. Determinar si una lista es un palíndromo.

% Verifica si una lista es un palíndromo.
% Una lista es un palíndromo si es igual a su inversa.
palindrome(L) :- reverse_list(L, L).


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
            // 6. Verifica si una lista es un palíndromo. Una lista es un palindromo si es igual a su inversa

            List<int> list = new List<int> { 1, 2, 3, 2, 1 };
            bool esPalindrome = EsPalindrome(list);
            Console.WriteLine("Lista: 1, 2, 3, 4, 5");
            Console.WriteLine("La lista es Palindrome?" + esPalindrome);
            Console.ReadLine();
        }
        static bool EsPalindrome<T>(List<T>list)  
        {
            List<T> reversedList = ReverseList(list);
            return EsListsIgual(list, reversedList);
        }
        static List<T>ReverseList<T>(Lists<T> list)
        {
            List<T> reversed = new List<T>(list);
            reversed.Reverse();
            return reversed;
        }
        static bool EsListsIgual<T>(List<T> list1, List<T> list2)
        {
            if(list1.Count!=list2.Count)
            {
                return false;
            }
            for (int i=0;i<list1.Count;i++)
            {
                if(!list1[i].Equals(list2[i]))
                {
                    return false;
                }

                }
            return true;
            }
        }
    }

