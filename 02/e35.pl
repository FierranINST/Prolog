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

% -------- Código en Prolog --------------------
prime_factors_mult(N, L) :- prime_factors(N, F), encode(F, L).
% ----------------------------------------------

