% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que determina los
%              factores primos de un número entero
%              con su multiplicidad.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función que determina los factores primos con su multiplicidad
%     static Dictionary<int, int> PrimeFactorsMult(int n)
%     {
%         Dictionary<int, int> factors = new Dictionary<int, int>();
%         int divisor = 2;
%         while (n > 1)
%         {
%             while (n % divisor == 0)
%             {
%                 if (factors.ContainsKey(divisor))
%                     factors[divisor]++;
%                 else
%                     factors[divisor] = 1;
%
%                 n /= divisor;
%             }
%             divisor++;
%         }
%         return factors;
%     }
%
%     static void Main()
%     {
%         var factors = PrimeFactorsMult(315);
%         foreach (var factor in factors)
%         {
%             Console.WriteLine($"Factor: {factor.Key}, Multiplicidad: {factor.Value}");
%         }
%     }
% }
% ----------------------------------------------

% Encuentra los factores primos de un número entero positivo.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), prime_factors(N, F1, L).

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

% Codificación Run-Length (RLE) de una lista.
encode([], []).
encode([X|Xs], [[N, X]|Ys]) :- count(X, Xs, N, Rest), encode(Rest, Ys).

% Cuenta cuántas veces X aparece consecutivamente al principio de la lista.
count(_, [], 1, []).  % Cambiado para evitar la advertencia de variable singleton.
count(X, [Y|Ys], 1, [Y|Ys]) :- X \= Y.
count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.

% Determina los factores primos con su multiplicidad.
prime_factors_mult(N, L) :- prime_factors(N, F), encode(F, L).

% Función main para probar la descomposición en factores primos con multiplicidad.
main :-
    N = 100,  % Ejemplo con el número 100
    prime_factors_mult(N, FactorsMult),
    format('Los factores primos de ~w con multiplicidad son: ~w~n', [N, FactorsMult]).

