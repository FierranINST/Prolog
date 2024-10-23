% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que realiza la
%              codificación Run-Length de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     % Función para realizar la codificación Run-Length de una lista.
%     static List<Tuple<int, T>> Encode<T>(List<T> list)
%     {
%         List<List<T>> packedList = Pack(list);
%         List<Tuple<int, T>> encoded = new List<Tuple<int, T>>();
%
%         foreach (var sublist in packedList)
%         {
%             encoded.Add(Tuple.Create(sublist.Count, sublist[0]));
%         }
%         return encoded;
%     }
%
%     % Función auxiliar para agrupar duplicados consecutivos.
%     static List<List<T>> Pack<T>(List<T> list)
%     {
%         List<List<T>> packed = new List<List<T>>();
%         List<T> sublist = new List<T> { list[0] };
%
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (EqualityComparer<T>.Default.Equals(list[i], list[i - 1]))
%             {
%                 sublist.Add(list[i]);
%             }
%             else
%             {
%                 packed.Add(sublist);
%                 sublist = new List<T> { list[i] };
%             }
%         }
%         packed.Add(sublist);
%         return packed;
%     }
%
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 1, 2, 2, 3, 3, 3, 4 };
%         List<Tuple<int, int>> codificacion = Encode(lista);
%         foreach (var pair in codificacion)
%         {
%             Console.WriteLine("Elemento: " + pair.Item2 + ", Frecuencia: " + pair.Item1);
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode(List, Encoded) que realiza la
% codificación Run-Length de la lista List.

% Primero agrupa los duplicados consecutivos y luego transforma las sublistas en parejas (N, X).
encode(L, R) :-
    pack(L, P),
    transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).

transform([[X|Xs]|Ys], [[N,X]|Zs]) :-
    length([X|Xs], N),
    transform(Ys, Zs).
% ----------------------------------------------
main :-
    List = [a, a, b, b, b, c, c, c, c, d, e, e],
    encode(List, Encoded),
    format('La lista codificada es: ~w.~n', [Encoded]).

