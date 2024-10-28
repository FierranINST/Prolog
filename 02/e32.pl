% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que verifica si
%              dos números son coprimos.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función para verificar si dos números son coprimos
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
%         bool result = AreCoprime(35, 64);
%         Console.WriteLine("Son coprimos: " + result);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Función main para probar si dos números son coprimos.
main :-
    X = 35,  % Primer número
    Y = 64,  % Segundo número
    (   coprime(X, Y)
    ->  format('~w y ~w son coprimos.~n', [X, Y])
    ;   format('~w y ~w no son coprimos.~n', [X, Y])
    ).

