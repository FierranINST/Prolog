% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Modifica la codificación Run-Length
%              de una lista para no empaquetar 
%              elementos que no tienen duplicados.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para codificar una lista sin empaquetar
%     // elementos sin duplicados.
%     static List<object> EncodeModified(List<List<object>> encodedList)
%     {
%         List<object> result = new List<object>();
%         
%         foreach (var item in encodedList)
%         {
%             if ((int)item[0] == 1)
%             {
%                 result.Add(item[1]);
%             }
%             else
%             {
%                 result.Add(item);
%             }
%         }
%         return result;
%     }
%
%     static void Main()
%     {
%         var encodedList = new List<List<object>> {
%             new List<object> { 4, 'a' },
%             new List<object> { 1, 'b' },
%             new List<object> { 2, 'c' }
%         };
%         
%         var modified = EncodeModified(encodedList);
%         Console.WriteLine(string.Join(", ", modified));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Modifica la codificación Run-Length de una lista.
% Si un elemento no tiene duplicados, se mantiene sin empaquetar.
encode_modified(L, R) :- encode(L, Enc), modify(Enc, R).

% Caso base: lista vacía.
modify([], []).
% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).
% Si hay más de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).

main :-
    List = [a, a, b, b, c, d, e, e, e, f],
    encode_modified(List, Encoded),
    format('La lista codificada modificada es: ~w.~n', [Encoded]).

