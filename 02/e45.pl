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

% Genera un árbol de Huffman dado un conjunto de frecuencias.
% El algoritmo de Huffman se utiliza para la compresión de datos, construyendo un árbol binario óptimo para la codificación.
huffman(Fs, Hs) :-
    length(Fs, Len),
    Len > 1,
    sort(2, @=<, Fs, Sorted),
    huffman_tree(Sorted, Hs).

% Caso base para construir el árbol de Huffman.
huffman_tree([fr(X, _) | []], hc(X, '0')).
huffman_tree([fr(_, _) | [fr(_, _) | _]], _).

% Verifica si un término dado representa un árbol binario.
% Un árbol binario está compuesto por un nodo raíz y dos subárboles.
istree(nil).
istree(t(_, L, R)) :-
    istree(L),
    istree(R).

% Función main para probar la generación del árbol de Huffman y la verificación del árbol.
main :-
    % Conjunto de frecuencias (fr: frecuencia, símbolo).
    Fs = [fr(a, 5), fr(b, 9), fr(c, 12), fr(d, 13), fr(e, 16), fr(f, 45)],
    
    % Generar el árbol de Huffman.
    huffman(Fs, HuffmanTree),
    format('El árbol de Huffman es: ~w~n', [HuffmanTree]),

    % Verificar si es un árbol binario.
    (istree(HuffmanTree) ->
        format('Es un árbol binario válido.~n');
        format('No es un árbol binario válido.~n')
    ).
