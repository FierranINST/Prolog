% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que construye un
%              árbol binario de búsqueda a partir de
%              una lista de enteros.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función que construye un árbol binario de búsqueda
%     static TreeNode ConstructBST(int[] values)
%     {
%         TreeNode root = null;
%         foreach (var value in values)
%         {
%             root = Add(value, root);
%         }
%         return root;
%     }
%
%     static TreeNode Add(int value, TreeNode node)
%     {
%         if (node == null) return new TreeNode(value);
%         if (value < node.Value)
%             node.Left = Add(value, node.Left);
%         else
%             node.Right = Add(value, node.Right);
%         return node;
%     }
%
%     static void Main()
%     {
%         var tree = ConstructBST(new[] { 5, 3, 7, 2, 4 });
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Construye un árbol binario completamente equilibrado con N nodos.
% Un árbol completamente equilibrado tiene subárboles cuya diferencia de tamaño es como máximo 1.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- N > 0, N1 is N - 1, divide(N1, N2, N3), cbal_tree(N2, L), cbal_tree(N3, R).

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- N1 is N // 2, N2 is N - N1.

% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% Genera todos los árboles binarios simétricos y completamente equilibrados con N nodos.
% Utiliza el paradigma de generar y probar para encontrar todos los árboles que cumplen ambas propiedades.
sym_cbal_trees(N, Ts) :- findall(T, (cbal_tree(N, T), symmetric(T)), Ts).

% Función main para probar la generación de árboles binarios simétricos y completamente equilibrados con N nodos.
main :-
    N = 5,  % Número de nodos (ejemplo)
    sym_cbal_trees(N, Ts),
    format('Árboles binarios simétricos y completamente equilibrados con ~w nodos:~n', [N]),
    write_trees(Ts).

% Escribe la lista de árboles generados.
write_trees([]).
write_trees([T|Ts]) :-
    write(T), nl,
    write_trees(Ts).
