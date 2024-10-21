% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que genera todos
%              los árboles binarios simétricos y
%              completamente equilibrados con N nodos.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función que genera árboles binarios simétricos
%     static List<TreeNode> GenerateSymCBalTrees(int n)
%     {
%         var trees = new List<TreeNode>();
%         foreach (var tree in CBalTrees(n))
%         {
%             if (IsSymmetric(tree)) trees.Add(tree);
%         }
%         return trees;
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
sym_cbal_trees(N, Ts) :- findall(T, (cbal_tree(N, T), symmetric(T)), Ts).
% ----------------------------------------------

