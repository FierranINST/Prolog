% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que determina si
%              una lista es un palíndromo.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     % Función para verificar si una lista es un palíndromo.
%     static bool IsPalindrome<T>(List<T> list)
%     {
%         List<T> reversed = new List<T>(list);
%         reversed.Reverse();
%         return list.SequenceEqual(reversed);
%     }
%
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 2, 1 };
%         bool esPalindromo = IsPalindrome(lista);
%         Console.WriteLine("¿Es palíndromo?: " + esPalindromo);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado palindrome(List) que verifica si la lista
% List es un palíndromo.

reverse_list([], Acc, Acc).
reverse_list([H|T], Acc, R) :- reverse_list(T, [H|Acc], R).
reverse_list(L, R) :- reverse_list(L, [], R).


% Una lista es un palíndromo si es igual a su inversa.
palindrome(L) :-
    reverse_list(L, L).
% ----------------------------------------------
main :-
    List = [a, b, c, b, a],
    (palindrome(List) ->
        format('La lista ~w es un palíndromo.~n', [List])
    ;
        format('La lista ~w no es un palíndromo.~n', [List])
    ).

