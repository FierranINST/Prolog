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

% Verifica si un número es primo.
is_prime(2) :- !.
is_prime(N) :-
    N > 2,
    N mod 2 =\= 0,
    \+ has_factor(N, 3).

% Verifica si existe un divisor entre 3 y sqrt(N).
has_factor(N, F) :-
    N mod F =:= 0.
has_factor(N, F) :-
    F * F < N,
    F2 is F + 2,
    has_factor(N, F2).

% Genera una lista de números primos en un rango dado.
prime_list(Low, High, Primes) :-
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Encuentra dos números primos que sumen un número par dado según la conjetura de Goldbach.
goldbach(N, [P1, P2]) :- 
    N > 2, 
    N mod 2 =:= 0, 
    prime_list(2, N, Primes), 
    member(P1, Primes), 
    P2 is N - P1, 
    is_prime(P2).

% Encuentra las composiciones de Goldbach para todos los números pares dentro de un rango.
goldbach_list(Low, High, L) :- 
    findall([N, P1, P2], 
            (between(Low, High, N), 
             N mod 2 =:= 0, 
             goldbach(N, [P1, P2])), 
            L).

% Predicado main para ejecutar el programa y mostrar las composiciones de Goldbach en un rango.
main :-
    Low = 4, % Cambia estos valores según sea necesario
    High = 20,
    goldbach_list(Low, High, L),
    format('Composiciones de Goldbach entre ~w y ~w: ~w~n', [Low, High, L]).

