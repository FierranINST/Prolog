% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Decodifica una lista codificada mediante
%              Run-Length.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para decodificar una lista codificada.
%     static List<object> Decode(List<List<object>> encodedList)
%     {
%         List<object> result = new List<object>();
%         
%         foreach (var item in encodedList)
%         {
%             int count = (int)item[0];
%             for (int i = 0; i < count; i++)
%             {
%                 result.Add(item[1]);
%             }
%         }
%         return result;
%     }
%
%     static void Main()
%     {
%         var encodedList = new List<List<object>> {
%             new List<object> { 4, 'a' },
%             new List<object> { 2, 'b' }
%         };
%         
%         var decoded = Decode(encodedList);
%         Console.WriteLine(string.Join(", ", decoded));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Decodifica una lista codificada mediante Run-Length.
% Expande cada par (N, X) en una lista con N elementos X.
decode([], []).
decode([[N,X]|T], R) :- decode(T, R1), expand(X, N, E), append(E, R1, R).

main :-
    Encoded = [[2, a], [1, b], [3, c], [1, d], [2, e]],
    decode(Encoded, Decoded),
    format('La lista decodificada es: ~w.~n', [Decoded]).


