% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que genera una
%              lista de números primos dentro de un
%              rango dado.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función que genera una lista de números primos en un rango
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
%         var primes = PrimeList(10, 50);
%         Console.WriteLine("Números primos: " + string.Join(", ", primes));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
prime_list(Low, High, Primes) :- findall(P, (between(Low, High, P), is_prime(P)), Primes).
% ----------------------------------------------

