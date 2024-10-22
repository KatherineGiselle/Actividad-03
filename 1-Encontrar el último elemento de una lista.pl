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
- - - - -  PROLOG  - - - - -

1. Encontrar el último elemento de una lista.

% Encuentra el último elemento de una lista.
% La lista debe tener al menos un elemento.
my_last(X, [X]).
my_last(X, [_|T]) :- my_last(X, T).

- - - - -  C#  - - - - -

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
            //Encuentra el ultimo elemento de una lista, la lista debe tener al menos un elemento
            List<int> list = new List<int> { 1, 2, 3, 4, 5, };
            int ultimoElemento = MiUltimo(list);
            Console.WriteLine("El ultimo elemnto es: \t" + ultimoElemento);
            Console.ReadLine();
        }
        static T MiUltimo<T>(List<T>list)
        {
            if (list==null || list.Count==0)
            {
                throw new ArgumentException("La lista debe tener al menos un elemneto");
            }
            return list[list.Count - 1];
            
        }
    }
}




-------------------------------------------------------------------------------------------------------

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





---------------------------------------------------------------------------------------------

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




--------------------------------------------------------------------------------------------------

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

------------------------------------------------------------------------------------------------------------

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


----------------------------------------------------------------------------------------------------------------

- - - - -  PROLOG  - - - - - 
 7.
