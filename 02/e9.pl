% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que agrupa
%              duplicados consecutivos de una lista
%              en sublistas.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     % Función para agrupar duplicados consecutivos en sublistas.
%     static List<List<T>> Pack<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0) return new List<List<T>>();
%
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
%         List<int> lista = new List<int> { 1, 1, 2, 2, 2, 3, 4, 4 };
%         List<List<int>> listaAgrupada = Pack(lista);
%         foreach (var sublist in listaAgrupada)
%         {
%             Console.WriteLine("Sublista: " + string.Join(", ", sublist));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado pack(List, Packed) que agrupa duplicados
% consecutivos de la lista List en sublistas.

% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :-
    transfer(X, Xs, Ys, Rest),
    pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], []).

% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :-
    X \= Y.

% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :-
    transfer(X, Xs, Ys, Rest).
% ----------------------------------------------
main :-
    pack([a, a, b, b, c, c, d], R),
    writeln(R).

