% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Duplica los elementos de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para duplicar los elementos de una lista.
%     static List<T> Dupli<T>(List<T> list)
%     {
%         List<T> result = new List<T>();
%         foreach (T item in list)
%         {
%             result.Add(item);
%             result.Add(item);
%         }
%         return result;
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c' };
%         List<char> duplicada = Dupli(lista);
%         Console.WriteLine(string.Join(", ", duplicada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Duplica los elementos de una lista.
% Caso base: la lista vacía se mantiene vacía.
dupli([], []).

% Caso recursivo: duplica el primer elemento y continúa con el resto.
dupli([H|T], [H,H|R]) :- dupli(T, R).

main :-
    ListaOriginal = [a, b, c, d],
    dupli(ListaOriginal, Duplicada),
    format('La lista duplicada es: ~w.~n', [Duplicada]).


