% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que valida
%              si un árbol es un árbol binario.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función para verificar si un árbol es un árbol binario
%     static bool IsBinaryTree(Node node)
%     {
%         if (node == null) return true;
%         return IsBinaryTree(node.Left) && IsBinaryTree(node.Right);
%     }
%
%     static void Main()
%     {
%         // Ejemplo de uso
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).
% ----------------------------------------------

