% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Extrae un número dado de elementos
%              aleatorios de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% class Program
% {
%     // Función para extraer un número dado de elementos aleatorios de una lista.
%     static List<T> RndSelect<T>(List<T> list, int count)
%     {
%         Random rand = new Random();
%         return list.OrderBy(x => rand.Next()).Take(count).ToList();
%     }
%
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         List<char> seleccion = RndSelect(lista, 3);
%         Console.WriteLine(string.Join(", ", seleccion));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Extrae un número dado de elementos aleatorios de una lista.
rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :-
    length(L, Len),
    random(1, Len, I),
    element_at(X, L, I),
    delete(L, X, L1),
    N1 is N - 1,
    rnd_select(L1, N1, R).

% Obtiene el elemento en la posición I de la lista L.
element_at(X, [X|_], 1).  % El primer elemento es en la posición 1
element_at(X, [_|T], I) :- 
    I > 1, 
    I1 is I - 1, 
    element_at(X, T, I1).

main :-
    Lista = [a, b, c, d, e, f, g, h],  % lista de elementos
    N = 3,                             % número de elementos a seleccionar
    rnd_select(Lista, N, Resultado),
    format('Elementos seleccionados aleatorios: ~w~n', [Resultado]).
