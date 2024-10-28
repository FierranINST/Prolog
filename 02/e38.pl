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

% Predicado main para ejecutar el programa y generar la lista de primos en un rango.
main :-
    Low = 10, % Cambia los valores de Low y High según sea necesario
    High = 50,
    prime_list(Low, High, Primes),
    format('Primos entre ~w y ~w: ~w~n', [Low, High, Primes]).

