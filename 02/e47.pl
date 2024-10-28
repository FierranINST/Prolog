% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que divide el
%              número de nodos entre los dos subárboles.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     // Función que divide el número de nodos
%     static void Divide(int n, out int n1, out int n2)
%     {
%         n1 = n / 2;
%         n2 = n - n1;
%     }
% }
% ----------------------------------------------

% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- 
    mirror(L1, R2), 
    mirror(R1, L2).

% Función main para probar si un árbol binario es simétrico.
main :-
    % Ejemplo de árbol simétrico.
    Tree = t('x', t('x', nil, t('x', nil, nil)), t('x', t('x', nil, nil), nil)),
    (symmetric(Tree) ->
        format('El árbol es simétrico: ~w~n', [Tree])
    ;
        format('El árbol no es simétrico: ~w~n', [Tree])).

