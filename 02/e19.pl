% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Rota una lista N lugares a la izquierda.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para rotar una lista N lugares a la izquierda.
%     static List<T> Rotate<T>(List<T> list, int n)
%     {
%         int len = list.Count;
%         n = n % len;
%         if (n < 0) n += len;
%         List<T> result = new List<T>(list.GetRange(n, len - n));
%         result.AddRange(list.GetRange(0, n));
%         return result;
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         List<char> rotada = Rotate(lista, 2);
%         Console.WriteLine(string.Join(", ", rotada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Rota una lista N lugares a la izquierda.
rotate(L, N, R) :- length(L, Len), N1 is N mod Len, rotate_left(L, N1, R).

% Caso base: cuando N es 0, la lista queda igual.
rotate_left(L, 0, L).

% Caso recursivo: divide la lista en dos partes y las intercambia.
rotate_left([H|T], N, R) :- N > 0, append(T, [H], L), N1 is N - 1, rotate_left(L, N1, R).

main :-
    ListaOriginal = [a, b, c, d, e, f, g],
    N = 2,  % número de posiciones a rotar
    rotate(ListaOriginal, N, ListaRotada),
    format('La lista original es: ~w~n', [ListaOriginal]),
    format('La lista rotada ~w lugares a la izquierda es: ~w~n', [N, ListaRotada]).

