% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Extrae N números aleatorios de un
%              rango dado.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función para extraer N números aleatorios de un rango dado.
%     static List<int> Lotto(int n, int m)
%     {
%         List<int> range = Enumerable.Range(1, m).ToList();
%         return RndSelect(range, n);
%     }
%
%     static List<T> RndSelect<T>(List<T> list, int count)
%     {
%         Random rand = new Random();
%         return list.OrderBy(x => rand.Next()).Take(count).ToList();
%     }
%
%     static void Main()
%     {
%         List<int> seleccion = Lotto(3, 10);
%         Console.WriteLine(string.Join(", ", seleccion));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Genera una lista con todos los enteros dentro de un rango dado.
range(I, I, [I]).
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

% Extrae N números aleatorios de un rango dado.
lotto(N, M, L) :- range(1, M, R), rnd_select(R, N, L).

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
    N = 6,           % número de elementos a seleccionar
    M = 49,          % límite superior del rango
    lotto(N, M, Resultado),
    format('Números seleccionados aleatorios: ~w~n', [Resultado]).
