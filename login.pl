
% User dataset
user(ghala, '1234').
user(sara, '5678').
user(nora, '9012').

% Start login
login :-
    attempt(3).

% Check credentials
attempt(N) :-
    N > 0,
    write('Username: '),
    read(Username),
    write('Password: '),
    read(Password),
    (
        user(Username, Password)
    ->
        write('Login Successful'), nl
    ;
        write('Login Unsuccessful'), nl,
        Remaining is N - 1,
        (
            Remaining > 0
        ->
            attempt(Remaining)
        ;
            write('Sorry, you exceeded the maximum number of attempts, try again later.'),
            nl
        )
    ).
