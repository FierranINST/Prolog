% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que encuentra las
%              composiciones de Goldbach para todos
%              los números pares dentro de un rango.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función que encuentra las composiciones de Goldbach para todos los números pares en un rango
%     static List<(int, int, int)> GoldbachList(int low, int high)
%     {
%         var list = new List<(int, int, int)>();
%         for (int n = low; n <= high; n += 2)
%         {
%             var (p1, p2) = Goldbach(n);
%             list.Add((n, p1, p2));
%         }
%         return list;
%     }
%
%     // Función que encuentra dos números primos que sumen un número par
%     static (int, int) Goldbach(int n)
%     {
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
%         var compositions = GoldbachList(4, 20);
%         foreach (var (n, p1, p2) in compositions)
%         {
%             Console.WriteLine($"{n} = {p1} + {p2}");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
goldbach_list(Low, High, L) :- findall([N, P1, P2], (between(Low, High, N), N mod 2 =:= 0, 
                     goldbach(N, [P1, P2])), L).
% ----------------------------------------------

