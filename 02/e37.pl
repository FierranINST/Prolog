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

% -------- Código en Prolog --------------------
compare_totient(N) :- totient(N, Phi1), totient_improved(N, Phi2), 
                      write('Phi (método básico): '), write(Phi1), nl, 
                      write('Phi (método mejorado): '), write(Phi2), nl.
% ----------------------------------------------

