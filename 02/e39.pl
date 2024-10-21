% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que encuentra dos
%              números primos que sumen un número par
%              dado, según la conjetura de Goldbach.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función que encuentra dos números primos que sumen un número par
%     static (int, int) Goldbach(int n)
%     {
%         if (n <= 2 || n % 2 != 0) throw new ArgumentException("N debe ser un número par mayor que 2.");
%         List<int> primes = PrimeList(2, n);
%         foreach (var p1 in primes)
%         {
%             int p2 = n - p1;
%             if (primes.Contains(p2))
%                 return (p1, p2);
%         }
%         return (0, 0); // Solo para cumplir con el tipo de retorno
%     }
%
%     // Función que genera una lista de números primos
%     static List<int> PrimeList(int low, int high)
%     {
%         List<int> primes = new List<int>();
%         for (int i = low; i <= high; i++)
%         {
%             if (IsPrime(i))
%                 primes.Add(i);
%         }
%         return primes;
%     }
%
%     // Función auxiliar para verificar si un número es primo
%     static bool IsPrime(int n)
%     {
%         if (n <= 1) return false;
%         for (int i = 2; i <= Math.Sqrt(n); i++)
%         {
%             if (n % i == 0) return false;
%         }
%         return true;
%     }
%
%     static void Main()
%     {
%         var (p1, p2) = Goldbach(28);
%         Console.WriteLine($"Goldbach: {p1} + {p2} = 28");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
goldbach(N, [P1, P2]) :- N > 2, N mod 2 =:= 0, prime_list(2, N, Primes), 
                         member(P1, Primes), P2 is N - P1, is_prime(P2).
% ----------------------------------------------

