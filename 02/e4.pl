% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que encuentra el
%              número de elementos de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     % Función para encontrar el número de elementos de una lista.
%     static int ListLength<T>(List<T> list)
%     {
%         return list.Count;
%     }
%
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4 };
%         int longitud = ListLength(lista);
%         Console.WriteLine("La longitud de la lista es: " + longitud);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado list_length(List, N) que encuentra el
% número de elementos N en la lista List.

% Caso base: la lista vacía tiene longitud 0.
list_length([], 0).

% Caso recursivo: la longitud es 1 más que la longitud de la cola.
list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.
% ----------------------------------------------
main :-
    List = [a, b, c, d, e],
    list_length(List, N),
    format('La longitud de la lista es: ~w~n', [N]).

