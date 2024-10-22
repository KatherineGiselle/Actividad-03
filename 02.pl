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

2. Encontrar el penúltimo elemento de una lista.

% Encuentra el penúltimo elemento de una lista.
% La lista debe tener al menos dos elementos.
penultimate(X, [X, _]).
penultimate(X, [_|T]) :- penultimate(X, T).


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
            // 2. Encontrar el peniltimo elemento de una lista

            List<int> list = new List<int> { 1, 2, 3, 4, 5 };
            int penultimoElemento = Penultimo(list);
            Console.WriteLine("El penultimo elemento es: \t" + penultimoElemento);
            Console.ReadLine();
        }
        static T Penultimo<T>(List<T>list)
        {
            if(list==null || list.Count<2)
            {
                throw new ArgumentException("La lista debe tener al menos 2 elementos");
            }
            return list[list.Count - 2];
        }
    }
}
