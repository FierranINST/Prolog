% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Verifica si un número entero dado
%              es primo.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función para verificar si un número es primo.
%     static bool IsPrime(int n)
%     {
%         if (n <= 1) return false;
%         if (n == 2 || n == 3) return true;
%         if (n % 2 == 0) return false;
%         for (int i = 3; i * i <= n; i += 2)
%         {
%             if (n % i == 0) return false;
%         }
%         return true;
%     }
%
%     static void Main()
%     {
%         Console.WriteLine(IsPrime(7)); // True
%         Console.WriteLine(IsPrime(8)); // False
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :- P > 3, P mod 2 =\= 0, \+ has_factor(P, 3).

% Verifica si un número tiene factores.

has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).
