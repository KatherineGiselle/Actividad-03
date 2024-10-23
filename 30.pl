Encabezado
% C# solucion / Python


%------------------------------------------------------------------------------
% Módulo:       50_programas
% Propósito:    Elaborar 50 programas en Prolog
% 
% Autor:        Diaz Morales Katherine Giselle
% Fecha:        23 de octubre de 2024
%
% Descripción: 
% Elaborar 50 programas en Prolog, usar templete.

--------------------------------------------------------------------------------------


- - - - -  PROLOG - - - - -

30. Determinar si un número entero es primo.

% Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :- P > 3, P mod 2 =\= 0, \\+ has_factor(P, 3).

% Verifica si un número tiene factores.
has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).


- - - - -  C#  - - - - -

using System;

class Program
{
    static void Main()
    {
        Console.WriteLine("Ingrese un número entero para verificar si es primo:");
        if (int.TryParse(Console.ReadLine(), out int numero))
        {
            if (IsPrime(numero))
            {
                Console.WriteLine($"{numero} es un número primo.");
            }
            else
            {
                Console.WriteLine($"{numero} no es un número primo.");
            }
        }
        else
        {
            Console.WriteLine("Entrada no válida. Por favor, ingrese un número entero.");
        }
    }

    // Verifica si un número entero es primo.
    static bool IsPrime(int P)
    {
        if (P <= 1) return false;      // Los números menores o iguales a 1 no son primos.
        if (P == 2 || P == 3) return true; // 2 y 3 son primos.
        if (P % 2 == 0) return false;  // Los números pares mayores que 2 no son primos.
        return !HasFactor(P, 3);        // Verifica si tiene factores a partir de 3.
    }

    // Verifica si un número tiene factores.
    static bool HasFactor(int N, int L)
    {
        if (L * L > N) return false;    // Si L^2 es mayor que N, no hay factores.
        if (N % L == 0) return true;     // Si N es divisible por L, tiene un factor.
        return HasFactor(N, L + 2);      // Verifica el siguiente número impar.
    }
}
