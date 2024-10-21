% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Elimina un elemento de una lista en
%              una posición dada.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para eliminar un elemento de una lista en una posición dada.
%     static List<T> RemoveAt<T>(List<T> list, int position)
%     {
%         List<T> result = new List<T>(list);
%         result.RemoveAt(position - 1);
%         return result;
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         List<char> nuevaLista = RemoveAt(lista, 3);
%         Console.WriteLine(string.Join(", ", nuevaLista));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Elimina un elemento de una lista en una posición dada.
remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], N, [H|R]) :- N > 1, N1 is N - 1, remove_at(X, T, N1, R).

