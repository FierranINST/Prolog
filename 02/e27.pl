% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Ordena una lista de listas según la
%              longitud de las sublistas.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% class Program
% {
%     // Función para ordenar una lista de listas según la longitud de las sublistas.
%     static List<List<T>> LSort<T>(List<List<T>> list)
%     {
%         return list.OrderBy(l => l.Count).ToList();
%     }
%
%     static void Main()
%     {
%         List<List<char>> lista = new List<List<char>> {
%             new List<char> { 'a', 'b', 'c' },
%             new List<char> { 'd' },
%             new List<char> { 'e', 'f' }
%         };
%         var ordenada = LSort(lista);
%         foreach (var sublista in ordenada)
%         {
%             Console.WriteLine(string.Join(", ", sublista));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Ordena una lista de listas de acuerdo con la longitud de las sublistas.
lsort(L, S) :- map_list_to_pairs(length, L, P), keysort(P, SP), pairs_values(SP, S).

