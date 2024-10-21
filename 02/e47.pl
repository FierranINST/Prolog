% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que divide el
%              número de nodos entre los dos subárboles.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función que divide el número de nodos
%     static void Divide(int n, out int n1, out int n2)
%     {
%         n1 = n / 2;
%         n2 = n - n1;
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
divide(N, N1, N2) :- N1 is N // 2, N2 is N - N1.
% ----------------------------------------------

