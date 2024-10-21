% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Genera todas las combinaciones de K
%              elementos de una lista dada.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para generar todas las combinaciones de K elementos de una lista.
%     static List<List<T>> Combination<T>(List<T> list, int k)
%     {
%         List<List<T>> result = new List<List<T>>();
%         if (k == 0)
%         {
%             result.Add(new List<T>());
%         }
%         else if (list.Count > 0)
%         {
%             T head = list[0];
%             List<T> rest = list.GetRange(1, list.Count - 1);
%             foreach (var comb in Combination(rest, k - 1))
%             {
%                 comb.Insert(0, head);
%                 result.Add(comb);
%             }
%             result.AddRange(Combination(rest, k));
%         }
%         return result;
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c' };
%         var combinaciones = Combination(lista, 2);
%         foreach (var comb in combinaciones)
%         {
%             Console.WriteLine(string.Join(", ", comb));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera todas las combinaciones de K elementos seleccionados de una lista dada.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- K > 0, K1 is K - 1, combination(K1, T, Comb).
combination(K, [_|T], Comb) :- K > 0, combination(K, T, Comb).

