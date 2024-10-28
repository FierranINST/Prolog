% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que construye un
%              árbol binario completamente equilibrado
%              con N nodos.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función que construye un árbol completamente equilibrado
%     static TreeNode BuildCBalTree(int n)
%     {
%         if (n == 0) return null;
%         return new TreeNode("x")
%         {
%             Left = BuildCBalTree(n / 2),
%             Right = BuildCBalTree(n - n / 2 - 1)
%         };
%     }
%
%     static void Main()
%     {
%         var tree = BuildCBalTree(7);
%     }
% }
% ----------------------------------------------

% Construye un árbol binario completamente equilibrado con N nodos.
% Un árbol completamente equilibrado tiene subárboles cuya diferencia de tamaño es como máximo 1.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- 
    N > 0, 
    N1 is N - 1, 
    divide(N1, N2, N3), 
    cbal_tree(N2, L), 
    cbal_tree(N3, R).

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- 
    N1 is N // 2, 
    N2 is N - N1.

% Función main para probar la construcción de un árbol binario completamente equilibrado.
main :-
    N = 7,  % Puedes cambiar el valor de N para probar con diferentes números de nodos
    cbal_tree(N, Tree),
    format('El árbol binario completamente equilibrado con ~w nodos es: ~w~n', [N, Tree]).
