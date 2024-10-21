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
construct([], nil).
construct([X|Xs], T) :- construct(Xs, T1), add(X, T1, T).

add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, NL, R)) :- X < Root, add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- X >= Root, add(X, R, NR).
% ----------------------------------------------

