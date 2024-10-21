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

% -------- Código en Prolog --------------------
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).
% ----------------------------------------------

