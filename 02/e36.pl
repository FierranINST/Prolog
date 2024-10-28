% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que calcula la
%              función totiente de Euler usando los
%              factores primos con multiplicidad para
%              mejorar la eficiencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función que calcula la función totiente de Euler mejorada
%     static int TotientImproved(int n)
%     {
%         var factors = PrimeFactorsMult(n);
%         double phi = 1;
%         foreach (var factor in factors)
%         {
%             phi *= (factor.Key - 1) * Math.Pow(factor.Key, factor.Value - 1);
%         }
%         return (int)phi;
%     }
%
%     // Función para determinar los factores primos con su multiplicidad
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
%         int result = TotientImproved(10);
%         Console.WriteLine("El valor de la función Totient mejorada es: " + result);
%     }
% }
% ----------------------------------------------

% Calcula la función totiente usando los factores primos con multiplicidad para mejorar la eficiencia.
% https://es.wikipedia.org/wiki/Función_φ_de_Euler
totient_improved(N, Phi) :- prime_factors_mult(N, F), totient_phi(F, Phi).

totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- totient_phi(T, Phi1), Phi is Phi1 * (P - 1) * P ** (M - 1).

% Función auxiliar para encontrar factores primos con multiplicidad
prime_factors_mult(N, Factors) :-
    prime_factors(N, Primes),
    encode(Primes, Factors).

prime_factors(1, []) :- !.
prime_factors(N, [F|T]) :-
    integer(N),
    N > 1,
    smallest_factor(N, F),
    N1 is N // F,
    prime_factors(N1, T).

smallest_factor(N, F) :-
    between(2, N, F),
    N mod F =:= 0, !.

encode([], []).
encode([H|T], [[H, M]|EncodedTail]) :-
    count_occurrences(H, [H|T], M, Rest),
    encode(Rest, EncodedTail).

count_occurrences(_, [], 0, []) :- !.
count_occurrences(X, [X|T], M, Rest) :-
    count_occurrences(X, T, M1, Rest),
    M is M1 + 1, !.
count_occurrences(X, [H|T], 0, [H|T]) :- X \= H.

% Predicado main para correr el código automáticamente
main :-
    N = 10, % Puedes cambiar este valor
    totient_improved(N, Phi),
    format('El totient mejorado de ~w es ~w~n', [N, Phi]).

