% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Duplica los elementos de una lista
%              un número dado de veces.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para duplicar los elementos de una lista un número dado de veces.
%     static List<T> Dupli<T>(List<T> list, int n)
%     {
%         List<T> result = new List<T>();
%         foreach (T item in list)
%         {
%             for (int i = 0; i < n; i++)
%             {
%                 result.Add(item);
%             }
%         }
%         return result;
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c' };
%         List<char> duplicada = Dupli(lista, 3);
%         Console.WriteLine(string.Join(", ", duplicada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Duplica los elementos de una lista un número dado de veces.
% Caso base: la lista vacía se mantiene vacía.
dupli([], _, []).

% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
dupli([H|T], N, R) :- duplicate(H, N, D), dupli(T, N, R1), append(D, R1, R).

% Crea una lista con N repeticiones del elemento X.
duplicate(_, 0, []).
duplicate(X, N, [X|R]) :- N > 0, N1 is N - 1, duplicate(X, N1, R).

