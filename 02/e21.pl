% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Inserta un elemento en una lista en
%              la posición dada.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para insertar un elemento en una lista en la posición dada.
%     static List<T> InsertAt<T>(T element, List<T> list, int position)
%     {
%         List<T> result = new List<T>(list);
%         result.Insert(position - 1, element);
%         return result;
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         List<char> nuevaLista = InsertAt('x', lista, 2);
%         Console.WriteLine(string.Join(", ", nuevaLista));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Inserta un elemento en una lista en la posición dada.
insert_at(X, L, 1, [X|L]).
insert_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, insert_at(X, T, K1, R).

