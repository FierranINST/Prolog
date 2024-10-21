% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que elimina
%              duplicados consecutivos de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     % Función para eliminar duplicados consecutivos de una lista.
%     static List<T> Compress<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0) return list;
%         
%         List<T> result = new List<T> { list[0] };
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (!EqualityComparer<T>.Default.Equals(list[i], list[i - 1]))
%             {
%                 result.Add(list[i]);
%             }
%         }
%         return result;
%     }
%
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 1, 2, 3, 3, 4, 4 };
%         List<int> listaComprimida = Compress(lista);
%         Console.WriteLine("Lista comprimida: " + string.Join(", ", listaComprimida));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado compress(List, Compressed) que elimina
% duplicados consecutivos de la lista List.

% Caso base: una lista vacía se mantiene vacía.
compress([], []).

% Si queda un solo elemento, no hay duplicados.
compress([X], [X]).

% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
compress([X,X|T], R) :-
    compress([X|T], R).

% Si el primer y segundo elemento son distintos, conserva el primero.
compress([X,Y|T], [X|R]) :-
    X \= Y,
    compress([Y|T], R).
% ----------------------------------------------
