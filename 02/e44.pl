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

% -------- Código en Prolog --------------------
huffman(Fs, Hs) :- length(Fs, Len), Len > 1, sort(2, @=<, Fs, Sorted), huffman_tree(Sorted, Hs).

% Caso base para construir el árbol de Huffman.
huffman_tree([fr(X, _) | []], hc(X, '0')).
huffman_tree([fr(_, _) | [fr(_, _) | _]], _).
% ----------------------------------------------

