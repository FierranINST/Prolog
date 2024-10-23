% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que aplana una
%              estructura de lista anidada.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections;
% using System.Collections.Generic;
%
% class Program
% {
%     % Función para aplanar una lista anidada.
%     static List<object> Flatten(List<object> list)
%     {
%         List<object> flatList = new List<object>();
%
%         foreach (var item in list)
%         {
%             if (item is List<object> nestedList)
%             {
%                 flatList.AddRange(Flatten(nestedList));
%             }
%             else
%             {
%                 flatList.Add(item);
%             }
%         }
%
%         return flatList;
%     }
%
%     static void Main()
%     {
%         List<object> lista = new List<object> { 1, new List<object> { 2, 3 }, 4 };
%         List<object> listaAplanada = Flatten(lista);
%         Console.WriteLine("Lista aplanada: " + string.Join(", ", listaAplanada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado my_flatten(List, Flat) que aplana una lista
% anidada en Flat.

% Caso base: si la lista está vacía, no hay nada que aplanar.
my_flatten([], []).

% Si el primer elemento es una lista, aplana la sublista.
my_flatten([H|T], Flat) :-
    is_list(H),
    my_flatten(H, FH),
    my_flatten(T, FT),
    append(FH, FT, Flat).

% Si el primer elemento no es una lista, añádelo al resultado.
my_flatten([H|T], [H|FT]) :-
    \+ is_list(H),
    my_flatten(T, FT).
% ----------------------------------------------
main :-
    NestedList = [1, [2, 3], [4, [5, 6]], 7],
    my_flatten(NestedList, Flat),
    format('La lista aplana: ~w.~n', [Flat]).

