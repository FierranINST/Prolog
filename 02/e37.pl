% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que compara dos
%              métodos para calcular la función
%              totiente de Euler.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función para comparar los métodos básicos y mejorados de la función totiente
%     static void CompareTotient(int n)
%     {
%         int phiBasic = Totient(n);
%         int phiImproved = TotientImproved(n);
%         Console.WriteLine($"Phi (método básico): {phiBasic}");
%         Console.WriteLine($"Phi (método mejorado): {phiImproved}");
%     }
%
%     // Función básica para calcular la función totiente
%     static int Totient(int m)
%     {
%         int count = 0;
%         for (int i = 1; i < m; i++)
%         {
%             if (AreCoprime(m, i))
%                 count++;
%         }
%         return count;
%     }
%
%     // Función auxiliar para verificar si dos números son coprimos
%     static bool AreCoprime(int x, int y)
%     {
%         return GCD(x, y) == 1;
%     }
%
%     // Función auxiliar para calcular el MCD
%     static int GCD(int x, int y)
%     {
%         while (y != 0)
%         {
%             int r = x % y;
%             x = y;
%             y = r;
%         }
%         return x;
%     }
%
%     static void Main()
%     {
%         CompareTotient(10);
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

count(_, [], 1, []).  % Corrección de la variable singleton.
count(X, [Y|Ys], 1, [Y|Ys]) :- X \= Y.
count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.

% Determina los factores primos con su multiplicidad.
prime_factors_mult(N, L) :- prime_factors(N, F), encode(F, L).

% Calcula la función totiente usando los factores primos con multiplicidad (método mejorado).
totient_improved(N, Phi) :- prime_factors_mult(N, F), totient_phi(F, Phi).

totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- totient_phi(T, Phi1), Phi is Phi1 * (P - 1) * P ** (M - 1).

% Método básico para calcular la función totiente.
totient(1, 1).
totient(M, Phi) :- M > 1, totient_acc(M, M, 0, Phi).

totient_acc(_, 0, Acc, Acc).
totient_acc(M, K, Acc, Phi) :- K > 0, coprime(M, K), Acc1 is Acc + 1, K1 is K - 1, totient_acc(M, K1, Acc1, Phi).
totient_acc(M, K, Acc, Phi) :- K > 0, \+ coprime(M, K), K1 is K - 1, totient_acc(M, K1, Acc, Phi).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Compara los dos métodos para calcular la función totiente.
compare_totient(N) :- 
    totient(N, Phi1), 
    totient_improved(N, Phi2), 
    format('Phi (método básico): ~w~n', [Phi1]), 
    format('Phi (método mejorado): ~w~n', [Phi2]).

% Función main para comparar los métodos de cálculo de la función totiente.
main :-
    N = 100,  % Ejemplo con el número 100
    compare_totient(N).

