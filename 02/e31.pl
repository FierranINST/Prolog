% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Calcula el máximo común divisor usando el algoritmo de Euclides.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función para calcular el MCD usando el algoritmo de Euclides
%     static int GCD(int x, int y)
%     {
%         return y == 0 ? x : GCD(y, x % y);
%     }
%
%     static void Main()
%     {
%         Console.WriteLine(GCD(48, 18)); // 6
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

