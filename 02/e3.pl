% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que encuentra
%              el k-ésimo elemento de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     % Función para encontrar el k-ésimo elemento de una lista.
%     static T ElementAt<T>(List<T> list, int k)
%     {
%         if (list == null || k < 1 || k > list.Count)
%             throw new ArgumentException("Índice fuera de rango.");
%         
%         return list[k - 1];
%     }
%
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4 };
%         int elemento = ElementAt(lista, 2);
%         Console.WriteLine("El elemento en la posición 2 es: " + elemento);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado element_at(X, List, K) que encuentra el
% k-ésimo elemento X de la lista List.

% Caso base: el primer elemento es el k-ésimo cuando K es 1.
element_at(X, [X|_], 1).

% Caso recursivo: decrementa K y evalúa la cola.
element_at(X, [_|T], K) :-
    K > 1,
    K1 is K - 1,
    element_at(X, T, K1).
% ----------------------------------------------
main :-
    List = [a, b, c, d, e],
    K = 3,
    element_at(X, List, K),
    format('El ~w-ésimo elemento de la lista es: ~w~n', [K, X]).

