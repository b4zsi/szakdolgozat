# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)


# series_version_one = Series.create([
#     {
#         name: "Formula 1",
#         number_of_drivers: 20,
#         number_of_races: 24,
#         number_of_teams: 10
#     },
#     {
#         name: "Formula 2",
#         number_of_drivers: 22,
#         number_of_races: 14,
#         number_of_teams: 11
#     },
#     {
#         name: "Formula 3",
#         number_of_drivers: 30,
#         number_of_races: 18,
#         number_of_teams: 10
#     },
#     {
#         name: "WEC",
#         number_of_drivers: 139,
#         number_of_races: 7,
#         number_of_teams: 29
#     },

# ])

# formula_one_drivers = Driver.create!([
#     {
#         name: "Max Verstappen",
#         age: 26,
#         number: 1,
#         height: 181,
#         nationality: "Netherlands",
#         number_of_championships: 3,
#         number_of_wins: 48,
#         number_of_podiums: 92,
#         series_id:1,
#         description:"Now a three-time World Champion, Max Verstappen’s meteoric rise to the pinnacle of Formula 1 has seen the Dutchman smash numerous records and break new ground en route to becoming today’s most dominant force."
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
#         series_id:1,
#         description:"A stalwart of the Formula 1 grid, Sergio ‘Checo’ Perez has bucked the trend of most drivers before him by achieving his greatest successes in the series more than a decade on from his debut."
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
#         series_id:1,
#         description:"hamilka"
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
#         series_id:1,
#         description:"xddd"
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
#         series_id:1,
#         description:"xdddd"
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
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Charles Leclerc",
#         age: 25,
#         number: 16,
#         height: 180,
#         nationality: "Monaco",
#         number_of_championships: 0,
#         number_of_wins: 5,
#         number_of_podiums: 27,
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Carlos Sainz Jr.",
#         age: 29,
#         number: 55,
#         height: 178,
#         nationality: "Spain",
#         number_of_championships: 0,
#         number_of_wins: 2,
#         number_of_podiums: 17,
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Fernando Alonso",
#         age: 42,
#         number: 14,
#         height: 171,
#         nationality: "Spain",
#         number_of_championships: 2,
#         number_of_wins: 32,
#         number_of_podiums: 105,
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Lance Stroll",
#         age: 24,
#         number: 18,
#         height: 182,
#         nationality: "Canada",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 3,
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Esteban Ocon",
#         age: 27,
#         number: 31,
#         height: 186,
#         nationality: "France",
#         number_of_championships: 0,
#         number_of_wins: 1,
#         number_of_podiums: 3,
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Pierre Gasly",
#         age: 27,
#         number: 10,
#         height: 177,
#         nationality: "France",
#         number_of_championships: 0,
#         number_of_wins: 1,
#         number_of_podiums: 4,
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Valtteri Bottas",
#         age: 34,
#         number: 77,
#         height: 173,
#         nationality: "Finland",
#         number_of_championships: 0,
#         number_of_wins: 10,
#         number_of_podiums: 67,
#         series_id:1,
#         description:"xdddd"
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
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Daniel Ricciardo",
#         age: 34,
#         number: 3,
#         height: 179,
#         nationality: "Australia",
#         number_of_championships: 0,
#         number_of_wins: 8,
#         number_of_podiums: 32,
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Yuki Tsunoda",
#         age: 23,
#         number: 22,
#         height: 159,
#         nationality: "Japan",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 0,
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Kevin Magnussen",
#         age: 30,
#         number: 20,
#         height: 174,
#         nationality: "Denmark",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 1,
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Nico Hulkenberg",
#         age: 36,
#         number: 27,
#         height: 184,
#         nationality: "German",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 0,
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Alexander Albon",
#         age: 27,
#         number: 23,
#         height: 186,
#         nationality: "Thai",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 2,
#         series_id:1,
#         description:"xdddd"
#     },
#     {
#         name: "Logan Sargeant",
#         age: 22,
#         number: 2,
#         height: 181,
#         nationality: "USA",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 0,
#         series_id:1,
#         description:"xdddd"
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

# formula_two_drivers = Driver.create([
#         {
#         name: "Alexander Albon",
#         age: 27,
#         number: 23,
#         height: 186,
#         nationality: "Thai",
#         number_of_championships: 0,
#         number_of_wins: 0,
#         number_of_podiums: 2,
#         series_id:1,
#         description:"xdddd"
#     },
# ])

# formula_two_teams = Team.create([
#     {
#             name: "MP Motorsport",
#             number_of_championships: 1,
#             number_of_races: 155,
#             headquarters_city: "Westmaas",
#             date_of_establishment: 1995,
#             technical_director: "Sander Dorsman",
#             first_win: 2017,
#             last_championship_win: 2022
#         },
#         {
#             name: "Rodin Carlin",
#             number_of_championships: 0,
#             number_of_races: 470,
#             headquarters_city: "Farnham",
#             date_of_establishment: 1996,
#             technical_director: "Matthew Gaze",
#             first_win: 2018,
#             last_championship_win: 0
#         },
#         {
#             name: "Art Grand Prix",
#             number_of_championships: 0,
#             number_of_races: 169,
#             headquarters_city: "Villeneuve-la-Guyard",
#             date_of_establishment: 1996,
#             technical_director: "Clément Sudre",
#             first_win: 0,
#             last_championship_win: 0
#         },
#         {
#             name: "Prema Racing",
#             number_of_championships: 2,
#             number_of_races: 191,
#             headquarters_city: "Veneto",
#             date_of_establishment: 1983,
#             technical_director: "René Rosin",
#             first_win: 2017,
#             last_championship_win: 2021
#         },
#         {
#             name: "Hitech Pulse-Eight",
#             number_of_championships: 0,
#             number_of_races: 99,
#             headquarters_city: "Silverstone",
#             date_of_establishment: 2002,
#             technical_director: "Oliver Oakes",
#             first_win: 2020,
#             last_championship_win: 0
#         },
#         {
#             name: "DAMS",
#             number_of_championships: 1,
#             number_of_races: 167,
#             headquarters_city: "Silverstone",
#             date_of_establishment: 1988,
#             technical_director: "Yannick Hubert",
#             first_win: 2017,
#             last_championship_win: 2019
#         },
#         {
#             name: "Invicta Virtuosi Racing",
#             number_of_championships: 0,
#             number_of_races: 72,
#             headquarters_city: "Norfolk",
#             date_of_establishment: 2012,
#             technical_director: "Andy Roche",
#             first_win: 2019,
#             last_championship_win: 0
#         },
#         {
#             name: "PHM Racing",
#             number_of_championships: 0,
#             number_of_races: 6,
#             headquarters_city: "Berlin",
#             date_of_establishment: 2021,
#             technical_director: "Paul Muller",
#             first_win: 0,
#             last_championship_win: 0
#         },
#         {
#             name: "Trident",
#             number_of_championships: 0,
#             number_of_races: 232,
#             headquarters_city: "Milano",
#             date_of_establishment: 2006,
#             technical_director: "Maurizio Salvadori",
#             first_win: 2006,
#             last_championship_win: 0
#         },
#         {
#             name: "Van Amersfoort Racing",
#             number_of_championships: 0,
#             number_of_races: 48,
#             headquarters_city: "Zeewolde",
#             date_of_establishment: 1975,
#             technical_director: "Frist van Amersfoort",
#             first_win: 2023,
#             last_championship_win: 0
#         },
#         {
#             name: "Campos Racing",
#             number_of_championships: 0,
#             number_of_races: 111,
#             headquarters_city: "Valencia",
#             date_of_establishment:1998,
#             technical_director: "Adrián Campos Jr.",
#             first_win: 2019,
#             last_championship_win: 0
#         }
# ])

# formula_three_teams = Team.create([
#         {
#             name: "PREMA Racing",
#             number_of_championships: 3,
#             number_of_races: 72,
#             headquarters_city: "Grisignano Di Zocco",
#             date_of_establishment:1983,
#             technical_director: "René Rosin",
#             first_win: 2019,
#             last_championship_win: 2022
#         },
#         {
#             name: "Trident",
#             number_of_championships: 1,
#             number_of_races: 138,
#             headquarters_city: "Milano",
#             date_of_establishment:2006,
#             technical_director: "Maurizio Salvadori",
#             first_win: 2013,
#             last_championship_win: 2021
#         },
#         {
#             name: "Art Grand Prix",
#             number_of_championships: 0,
#             number_of_races: 90,
#             headquarters_city: "Saint Pierre du Perray",
#             date_of_establishment: 2005,
#             technical_director: "Sébastien Philippe",
#             first_win: 2010,
#             last_championship_win: 0
#         },
#         {
#             name: "MP Motorsport",
#             number_of_championships: 0,
#             number_of_races: 90,
#             headquarters_city: "Westmaas",
#             date_of_establishment: 1995,
#             technical_director: "Sander Dorsman",
#             first_win: 2020,
#             last_championship_win: 0
#         },
#         {
#             name: "Hitech Pulse-Eight",
#             number_of_championships: 0,
#             number_of_races: 90,
#             headquarters_city: "Silverstone",
#             date_of_establishment: 2002,
#             technical_director: "Oliver Oakes",
#             first_win: 2019,
#             last_championship_win: 0
#         },
#         {
#             name: "Van Amersfoort Racing",
#             number_of_championships: 0,
#             number_of_races: 36,
#             headquarters_city: "Zeewolde",
#             date_of_establishment: 1975,
#             technical_director: "Frist van Amersfoort",
#             first_win: 2022,
#             last_championship_win: 0
#         },
#         {
#             name: "Rodin Carlin",
#             number_of_championships: 0,
#             number_of_races: 470,
#             headquarters_city: "Farnham",
#             date_of_establishment: 1996,
#             technical_director: "Stephanie Carlin",
#             first_win: 2018,
#             last_championship_win: 0
#         },
#         {
#             name: "Campos Racing",
#             number_of_championships: 0,
#             number_of_races: 90,
#             headquarters_city: "Valencia",
#             date_of_establishment:1998,
#             technical_director: "Adrián Campos Jr.",
#             first_win: 2021,
#             last_championship_win: 0
#         },
#         {
#             name: "Jenzer Motorsport",
#             number_of_championships: 0,
#             number_of_races: 90,
#             headquarters_city: "Lyss",
#             date_of_establishment:1993,
#             technical_director: "Andreas Jenzer",
#             first_win: 2019,
#             last_championship_win: 0
#         },
#         {
#             name: "PHM Racing",
#             number_of_championships: 0,
#             number_of_races: 4,
#             headquarters_city: "Berlin",
#             date_of_establishment: 2021,
#             technical_director: "Paul Muller",
#             first_win: 0,
#             last_championship_win: 0
#         },
# ])
formula_two_drivers