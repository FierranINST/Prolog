% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Codifica directamente una lista
%              mediante codificación Run-Length.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para codificar una lista directamente.
%     static List<List<object>> EncodeDirect(List<object> list)
%     {
%         List<List<object>> result = new List<List<object>>();
%         int count = 1;
%         
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (list[i].Equals(list[i - 1]))
%             {
%                 count++;
%             }
%             else
%             {
%                 result.Add(new List<object> { count, list[i - 1] });
%                 count = 1;
%             }
%         }
%         result.Add(new List<object> { count, list[^1] });
%         return result;
%     }
%
%     static void Main()
%     {
%         var list = new List<object> { 'a', 'a', 'a', 'b', 'b', 'c' };
%         var encoded = EncodeDirect(list);
%         foreach (var item in encoded)
%         {
%             Console.WriteLine($"({item[0]}, {item[1]})");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Codifica directamente una lista usando codificación Run-Length.
% Cuenta cuántos elementos consecutivos son iguales.
encode_direct([], []).
encode_direct([X|Xs], [[N,X]|R]) :- count(X, [X|Xs], N, Rest), encode_direct(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).
count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.
count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.

