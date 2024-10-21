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
coprime(X, Y) :- gcd(X, Y, 1).
% ----------------------------------------------

