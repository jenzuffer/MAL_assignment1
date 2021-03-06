continent(asia).
continent(america).
continent(europe).

country(portugal).
country(netherlands).
country(germany).

city(lisbon).
city(haag).
city(frankfurt).
city(dresden).
city(wiesbaden).

region(alentejo).
region(zuid-holland).
region(hessen).
region(sachsen).

country_region(portugal, alentejo).
country_region(netherlands, zuid-holland).
country_region(germany, hessen).
country_region(germany, sachsen).

continent_country(europe, portugal).
continent_country(europe, netherlands).
continent_country(europe, germany).
continent_country(america, canada).
continent_country(asia, laos).

region_city(alentejo, lisbon).
region_city(hessen, frankfurt).
region_city(sachsen, dresden).
region_city(zuid-holland, haag).
region_city(hessen, wiesbaden).

region_in_continent(X, S) :-
    country_region(CO, X),
    continent_country(S, CO).

city_in_country(X, S) :-
    country_region(S, RE),
    region_city(RE, X).

city_in_continent(X, S) :-
    region_city(RE, X),
    region_in_continent(RE, S).

regions_in_germany() :-
    country_region(germany, Y),
    print(Y).

cities_in_germany() :-
    country_region(germany, Y),
    region_city(Y, X),
    print(X).

cities_in_netherlands() :-
    country_region(netherlands, Y),
    region_city(Y, X),
    print(X).

cities_in_europe() :-
    continent_country(europe, X),
    country_region(X, Y),
    region_city(Y, Z),
    print(Z).

cities_on_same_contient() :-
    continent_country(X, Y),
    country_region(Y, RE),
    region_city(RE, CI),
    print(CI),
    print('
    '),
    print(Y),
    print('
    '),
    print(X).
    

everything_not_inside_germany() :- 
    continent(X),
    X \== europe,
    print(X),
    print('
    '),
    country(Z),
    Z \== germany,
    print(Z),
    print('
    '),
    country_region(Z, RE),
    print(RE),
    print('
    '),
    region_city(RE, CI),
    print(CI),
    print('
    ').

regions_in_europe() :-
    continent_country(europe, X),
    country_region(X, Y),
    print(Y).

regions_and_continents() :-
    continent_country(X, Y),
    country_region(Y, RE),
    print(RE),
    print('
    '),
    print(X).

countries_in_europe() :-
    continent_country(europe, X),
    print(X).
