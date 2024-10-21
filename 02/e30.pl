% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Verifica si un número tiene factores.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función para verificar si un número tiene factores.
%     static bool HasFactor(int n, int factor)
%     {
%         return n % factor == 0;
%     }
%
%     static bool HasFactors(int n, int divisor)
%     {
%         if (divisor * divisor > n) return false;
%         if (HasFactor(n, divisor)) return true;
%         return HasFactors(n, divisor + 2);
%     }
%
%     static void Main()
%     {
%         Console.WriteLine(HasFactors(15, 3)); // True
%         Console.WriteLine(HasFactors(17, 3)); // False
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Verifica si un número tiene factores.
has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).

