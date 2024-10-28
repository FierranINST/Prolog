% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que comprueba si
%              un árbol binario es simétrico.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función que verifica si un árbol es simétrico
%     static bool IsSymmetric(TreeNode left, TreeNode right)
%     {
%         if (left == null && right == null) return true;
%         if (left == null || right == null) return false;
%         return left.Value == right.Value &&
%                IsSymmetric(left.Left, right.Right) &&
%                IsSymmetric(left.Right, right.Left);
%     }
%
%     static void Main()
%     {
%         // Ejemplo de uso
%     }
% }
% ----------------------------------------------

% Construye un árbol binario de búsqueda a partir de una lista de enteros.
% Un árbol binario de búsqueda es un árbol en el cual, para cada nodo,
% todos los elementos en el subárbol izquierdo son menores y en el subárbol derecho son mayores.
construct([], nil).
construct([X|Xs], T) :- construct(Xs, T1), add(X, T1, T).

% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, NL, R)) :- X < Root, add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- X >= Root, add(X, R, NR).

% Función main para construir un árbol binario de búsqueda a partir de una lista de enteros.
main :-
    % Lista de ejemplo.
    List = [5, 3, 7, 2, 4, 6, 8],
    construct(List, Tree),
    format('El árbol binario de búsqueda construido a partir de ~w es: ~w~n', [List, Tree]).
