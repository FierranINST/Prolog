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

% -------- Código en Prolog --------------------
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- N > 0, N1 is N - 1, divide(N1, N2, N3), cbal_tree(N2, L), cbal_tree(N3, R).
% ----------------------------------------------

