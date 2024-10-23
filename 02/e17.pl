% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Divide una lista en dos partes.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para dividir una lista en dos partes.
%     static void Split<T>(List<T> list, int n, out List<T> list1, out List<T> list2)
%     {
%         list1 = list.GetRange(0, n);
%         list2 = list.GetRange(n, list.Count - n);
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         Split(lista, 3, out List<char> parte1, out List<char> parte2);
%         Console.WriteLine("Parte 1: " + string.Join(", ", parte1));
%         Console.WriteLine("Parte 2: " + string.Join(", ", parte2));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Divide una lista en dos partes.
% La longitud de la primera parte está dada por el segundo argumento.
split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).

main :-
    ListaOriginal = [a, b, c, d, e, f, g, h],
    N = 4,
    split(ListaOriginal, N, Parte1, Parte2),
    format('La lista original es: ~w~n', [ListaOriginal]),
    format('La primera parte (longitud ~w) es: ~w~n', [N, Parte1]),
    format('La segunda parte es: ~w~n', [Parte2]).

