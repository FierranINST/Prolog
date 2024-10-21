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

% -------- Código en Prolog --------------------
totient_improved(N, Phi) :- prime_factors_mult(N, F), totient_phi(F, Phi).

totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- totient_phi(T, Phi1), Phi is Phi1 * (P - 1) * P ** (M - 1).
% ----------------------------------------------

