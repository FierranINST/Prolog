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

% Construye un árbol binario equilibrado en altura con una altura dada.
hbal_tree(0, nil).
hbal_tree(H, t('x', L, R)) :-
    H > 0,
    H1 is H - 1,
    (H2 is H1 ; H2 is H1 - 1),  % Permitir una diferencia de altura de 0 o 1
    hbal_tree(H1, L),
    hbal_tree(H2, R).

% Definición de main para probar hbal_tree/2 con distintas alturas
main :-
    writeln('Árbol binario equilibrado de altura 0:'),
    hbal_tree(0, Tree0), writeln(Tree0),
    writeln('Árbol binario equilibrado de altura 1:'),
    hbal_tree(1, Tree1), writeln(Tree1),
    writeln('Árbol binario equilibrado de altura 2:'),
    hbal_tree(2, Tree2), writeln(Tree2),
    writeln('Árbol binario equilibrado de altura 3:'),
    hbal_tree(3, Tree3), writeln(Tree3),
    halt.
