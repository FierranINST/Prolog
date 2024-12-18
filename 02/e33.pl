% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que calcula la
%              función totiente de Euler para un
%              número dado.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función que cuenta cuántos números menores que M son coprimos con M
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
%         int result = Totient(10);
%         Console.WriteLine("El valor de la función Totient es: " + result);
%     }
% }
% ----------------------------------------------

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Calcula la función totiente de Euler, que cuenta cuántos números menores que M son coprimos con M.
totient(1, 1).
totient(M, Phi) :- M > 1, totient_acc(M, M, 0, Phi).

totient_acc(_, 0, Acc, Acc).
totient_acc(M, K, Acc, Phi) :- K > 0, coprime(M, K), Acc1 is Acc + 1, K1 is K - 1, totient_acc(M, K1, Acc1, Phi).
totient_acc(M, K, Acc, Phi) :- K > 0, \+ coprime(M, K), K1 is K - 1, totient_acc(M, K1, Acc, Phi).

% Función main para probar la función totiente
main :-
    M = 10,  % Ejemplo con el número 10
    totient(M, Phi),
    format('El valor de la función totiente de Euler para ~w es: ~w~n', [M, Phi]).

