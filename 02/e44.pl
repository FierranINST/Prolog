% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que genera un
%              árbol de Huffman dado un conjunto
%              de frecuencias.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función que genera un árbol de Huffman
%     static HuffmanNode BuildHuffmanTree(Dictionary<char, int> frequencies)
%     {
%         var priorityQueue = new PriorityQueue<HuffmanNode>();
%         foreach (var pair in frequencies)
%         {
%             priorityQueue.Enqueue(new HuffmanNode(pair.Key, pair.Value));
%         }
%         while (priorityQueue.Count > 1)
%         {
%             var left = priorityQueue.Dequeue();
%             var right = priorityQueue.Dequeue();
%             var merged = new HuffmanNode('\0', left.Frequency + right.Frequency, left, right);
%             priorityQueue.Enqueue(merged);
%         }
%         return priorityQueue.Dequeue();
%     }
%
%     static void Main()
%     {
%         var frequencies = new Dictionary<char, int>
%         {
%             { 'a', 5 },
%             { 'b', 9 },
%             { 'c', 12 },
%             { 'd', 13 },
%             { 'e', 16 },
%             { 'f', 45 }
%         };
%         var huffmanTree = BuildHuffmanTree(frequencies);
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

% El árbol vacío es válido
istree(nil).

% Un árbol no vacío es válido si el subárbol izquierdo y el derecho también son árboles binarios
istree(t(_, L, R)) :-
    istree(L),
    istree(R).

% Función main para probar la generación de un árbol de Huffman a partir de un conjunto de frecuencias.
main :-
    Frequencies = [fr(a, 45), fr(b, 13), fr(c, 12), fr(d, 16), fr(e, 9), fr(f, 5)],
    huffman(Frequencies, HuffmanTree),
    format('El árbol de Huffman generado es: ~w~n', [HuffmanTree]).
