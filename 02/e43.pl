% ===============================================
% Autor: Ferran Badillo Cruz
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que genera el
%              código Gray de N bits.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%     // Función que genera el código Gray de N bits
%     static List<string> GrayCode(int n)
%     {
%         if (n == 1) return new List<string> { "0", "1" };
%         var previous = GrayCode(n - 1);
%         var result = new List<string>();
%         foreach (var code in previous)
%         {
%             result.Add("0" + code);
%         }
%         for (int i = previous.Count - 1; i >= 0; i--)
%         {
%             result.Add("1" + previous[i]);
%         }
%         return result;
%     }
%
%     static void Main()
%     {
%         var codes = GrayCode(3);
%         Console.WriteLine(string.Join(", ", codes));
%     }
% }
% ----------------------------------------------

% Genera el código Gray de N bits.
% La secuencia de código Gray es una secuencia binaria en la que dos valores consecutivos difieren en solo un bit.
gray(1, ['0', '1']).
gray(N, C) :-
    N > 1,
    N1 is N - 1,
    gray(N1, C1),
    maplist(atom_concat('0'), C1, C0),
    reverse(C1, C1R),
    maplist(atom_concat('1'), C1R, C1G),
    append(C0, C1G, C).

% Función main para probar la generación del código Gray de N bits.
main :-
    N = 3,  % Cambia este valor para generar el código Gray de N bits
    gray(N, Code),
    format('El código Gray de ~w bits es: ~w~n', [N, Code]).

