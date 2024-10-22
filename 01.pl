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


