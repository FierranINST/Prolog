% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que encuentra los
%              factores primos de un número.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para encontrar los factores primos de un número
%     static List<int> PrimeFactors(int n)
%     {
%         List<int> factors = new List<int>();
%         int divisor = 2;
%         while (n > 1)
%         {
%             while (n % divisor == 0)
%             {
%                 factors.Add(divisor);
%                 n /= divisor;
%             }
%             divisor++;
%         }
%         return factors;
%     }
%
%     static void Main()
%     {
%         List<int> factors = PrimeFactors(315);
%         Console.WriteLine("Factores primos: " + string.Join(", ", factors));
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

main :-
    Number = 2,  % Cambia este número según lo que desees calcular.
    (   Number > 1
    ->  prime_factors(Number, Factors),  % Asignar el resultado a Factors.
        format('Los factores primos de ~d son: ~w~n', [Number, Factors])
    ;   format('Por favor, proporciona un número mayor que 1.~n')
    ).

