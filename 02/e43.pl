% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que genera el
%              código Gray de N bits.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función que genera el código Gray de N bits
%     static List<string> GrayCode(int n)
%     {
%         if (n == 1) return new List<string> { "0", "1" };
%         var previous = GrayCode(n - 1);
%         var result = new List<string>();
%         foreach (var code in previous)
%         {
%             result.Add("0" + code);
%         }
%         for (int i = previous.Count - 1; i >= 0; i--)
%         {
%             result.Add("1" + previous[i]);
%         }
%         return result;
%     }
%
%     static void Main()
%     {
%         var codes = GrayCode(3);
%         Console.WriteLine(string.Join(", ", codes));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
gray(1, ['0', '1']).
gray(N, C) :- N > 1, N1 is N - 1, gray(N1, C1), maplist(atom_concat('0'), C1, C0),
              reverse(C1, C1R), maplist(atom_concat('1'), C1R, C1G), append(C0, C1G, C).
% ----------------------------------------------

