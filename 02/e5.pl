% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que invierte
%              una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     % Función para invertir una lista.
%     static List<T> ReverseList<T>(List<T> list)
%     {
%         list.Reverse();
%         return list;
%     }
%
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4 };
%         List<int> listaInvertida = ReverseList(lista);
%         Console.WriteLine("La lista invertida es: " + string.Join(", ", listaInvertida));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado reverse_list(List, Reversed) que invierte
% la lista List y devuelve el resultado en Reversed.

% Caso base: cuando la lista está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el primer elemento al acumulador.
reverse_list([H|T], Acc, R) :-
    reverse_list(T, [H|Acc], R).

% Predicado auxiliar para simplificar la llamada con el acumulador.
reverse_list(L, R) :-
    reverse_list(L, [], R).
% ----------------------------------------------
