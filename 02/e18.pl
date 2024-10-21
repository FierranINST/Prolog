% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Extrae una porción de una lista,
%              dado un rango de índices.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para extraer una porción de una lista, dado un rango.
%     static List<T> Slice<T>(List<T> list, int i, int k)
%     {
%         return list.GetRange(i - 1, k - i + 1);
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         List<char> porcion = Slice(lista, 2, 4);
%         Console.WriteLine(string.Join(", ", porcion));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Extrae una porción de una lista, dado un rango.
% Los índices I y K deben ser mayores que 0.
slice([H|_], 1, 1, [H]).
slice([H|T], 1, K, [H|R]) :- K > 1, K1 is K - 1, slice(T, 1, K1, R).
slice([_|T], I, K, R) :- I > 1, I1 is I - 1, K1 is K - 1, slice(T, I1, K1, R).

