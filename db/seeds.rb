# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)


series_version_one = Series.create([
    {
        name: "Formula 1",
        number_of_drivers: 20,
        number_of_races: 24,
        number_of_teams: 10
    },
    {
        name: "Formula 2",
        number_of_drivers: 22,
        number_of_races: 14,
        number_of_teams: 11
    },
    {
        name: "Formula 3",
        number_of_drivers: 30,
        number_of_races: 18,
        number_of_teams: 10
    },
    {
        name: "WEC",
        number_of_drivers: 139,
        number_of_races: 7,
        number_of_teams: 29
    },

])

# formula_one_drivers = Driver.create([
#     {
#         name: "Max Verstappen",
#         age: 26,
#         number: 1,
#         height: 181,
#         nationality: "Netherlands",
#         number_of_championships: 3,
#         number_of_wins: 48,
#         number_of_podiums: 92,
#     },
#     {
#         name: "Sergio Pérez",
#         age: 33,
#         number: 11,
#         height: 173,
#         nationality: "Mexico",
#         number_of_championships: 0,
#         number_of_wins: 6,
#         number_of_podiums: 34,
#     },
#     {
#         name: "Lewis Hamilton",
#         age: 38,
#         number: 44,
#         height: 174,
#         nationality: "Great Britain",
#         number_of_championships: 7,
#         number_of_wins: 103,
#         number_of_podiums: 196,
#     },
#     {
#         name: "George Russell",
#         age: 25,
#         number: 63,
#         height: 185,
#         nationality: "Great Britain",
#         number_of_championships: 0,
#         number_of_wins: 1,
#         number_of_podiums: 10,
#     },
#     {
#         name: "Lando Norris",
#         age: 23,
#         number: 4,
#         height: 175,
#         nationality: "Great Britain",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 9,
#     },
#     {
#         name: "Oscar Piastri",
#         age: 22,
#         number: 81,
#         height: 182,
#         nationality: "Australia",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 1,
#     },
#     {
#         name: "Charles Leclerc",
#         age: 25,
#         number: 16,
#         height: 180,
#         nationality: "Monaco",
#         number_of_championships: 0,
#         number_of_wins: 5,
#         number_of_podiums: 27
#     },
#     {
#         name: "Carlos Sainz Jr.",
#         age: 29,
#         number: 55,
#         height: 178,
#         nationality: "Spain",
#         number_of_championships: 0,
#         number_of_wins: 2,
#         number_of_podiums: 17
#     },
#     {
#         name: "Fernando Alonso",
#         age: 42,
#         number: 14,
#         height: 171,
#         nationality: "Spain",
#         number_of_championships: 2,
#         number_of_wins: 32,
#         number_of_podiums: 105
#     },
#     {
#         name: "Lance Stroll",
#         age: 24,
#         number: 18,
#         height: 182,
#         nationality: "Canada",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 3
#     },
#     {
#         name: "Esteban Ocon",
#         age: 27,
#         number: 31,
#         height: 186,
#         nationality: "France",
#         number_of_championships: 0,
#         number_of_wins: 1,
#         number_of_podiums: 3
#     },
#     {
#         name: "Pierre Gasly",
#         age: 27,
#         number: 10,
#         height: 177,
#         nationality: "France",
#         number_of_championships: 0,
#         number_of_wins: 1,
#         number_of_podiums: 4
#     },
#     {
#         name: "Valtteri Bottas",
#         age: 34,
#         number: 77,
#         height: 173,
#         nationality: "Finland",
#         number_of_championships: 0,
#         number_of_wins: 10,
#         number_of_podiums: 67
#     },
#     {
#         name: "Zhou Guanyu",
#         age: 24,
#         number: 24,
#         height: 175,
#         nationality: "China",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 0,
#     },
#     {
#         name: "Daniel Ricciardo",
#         age: 34,
#         number: 3,
#         height: 179,
#         nationality: "Australia",
#         number_of_championships: 0,
#         number_of_wins: 8,
#         number_of_podiums: 32
#     },
#     {
#         name: "Yuki Tsunoda",
#         age: 23,
#         number: 22,
#         height: 159,
#         nationality: "Japan",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 0
#     },
#     {
#         name: "Kevin Magnussen",
#         age: 30,
#         number: 20,
#         height: 174,
#         nationality: "Denmark",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 1
#     },
#     {
#         name: "Nico Hulkenberg",
#         age: 36,
#         number: 27,
#         height: 184,
#         nationality: "German",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 0
#     },
#     {
#         name: "Alexander Albon",
#         age: 27,
#         number: 23,
#         height: 186,
#         nationality: "Thai",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 2
#     },
#     {
#         name: "Logan Sargeant",
#         age: 22,
#         number: 2,
#         height: 181,
#         nationality: "USA",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 0
#     }
# ])

# formula_one_teams = Team.create([
#         {
#             name: "Oracle Red Bull Racing",
#             number_of_championships: 6,
#             number_of_races: 365,
#             headquarters_city: "Milton Keynes",
#             date_of_establishment: 2004,
#             technical_director: "Adrian Newey",
#             first_win: 2009,
#             last_championship_win: 2023
#         },
#         {
#             name: "Scuderia Ferrari",
#             number_of_championships: 16,
#             number_of_races: 1067,
#             headquarters_city: "Maranello",
#             date_of_establishment: 1929,
#             technical_director: "Frédéric Vasseur",
#             first_win: 1951,
#             last_championship_win: 2008
#         },
#         {
#             name: "Mercedes-AMG Petronas Formula One Team",
#             number_of_championships: 8,
#             number_of_races: 279,
#             headquarters_city: "Brackley",
#             date_of_establishment: 1954,
#             technical_director: "Toto Wolff",
#             first_win: 1954,
#             last_championship_win: 2021
#         },
#         {
#             name: "McLaren F1 Team",
#             number_of_championships: 8,
#             number_of_races: 931,
#             headquarters_city: "Woking",
#             date_of_establishment: 1964,
#             technical_director: "James Key",
#             first_win: 1968,
#             last_championship_win: 1998
#         },
#         {
#             name: "Aston Martin Aramco Cognizant Formula One Team",
#             number_of_championships: 0,
#             number_of_races: 55,
#             headquarters_city: "Silverstone",
#             date_of_establishment: 2021,
#             technical_director: "Andrew Green",
#             first_win: 0,
#             last_championship_win: 0
#         },
#         {
#             name: "BWT Alpine F1 Team",
#             number_of_championships: 0,
#             number_of_races: 52,
#             headquarters_city: "Enstone",
#             date_of_establishment: 2021,
#             technical_director: "Pat Fry",
#             first_win: 2021,
#             last_championship_win: 0
#         },
#         {
#             name: "Scuderia AlphaTauri",
#             number_of_championships: 0,
#             number_of_races: 77,
#             headquarters_city: "Faenza",
#             date_of_establishment: 2020,
#             technical_director: "Jody Egginton",
#             first_win: 2020,
#             last_championship_win: 0
#         },
#         {
#             name: "Alfa Romeo F1 Team Stake",
#             number_of_championships: 0,
#             number_of_races: 200,
#             headquarters_city: "Hinwill",
#             date_of_establishment: 1950,
#             technical_director: "Jan Monchaux",
#             first_win: 1950,
#             last_championship_win: 0
#         },
#         {
#             name: "Williams Racing",
#             number_of_championships: 9,
#             number_of_races: 808,
#             headquarters_city: "Oxfordshire, Grove",
#             date_of_establishment: 1977,
#             technical_director: "Pat Fry",
#             first_win: 1979,
#             last_championship_win: 1997
#         },
#         {
#             name: "MoneyGram Haas F1 team",
#             number_of_championships: 0,
#             number_of_races: 152,
#             headquarters_city: "Kannapolis",
#             date_of_establishment: 2014,
#             technical_director: "Simone Resta",
#             first_win: 0,
#             last_championship_win: 0
#         },
# ])


