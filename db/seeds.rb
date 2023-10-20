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
#         description:"xdddd",
#         profile_picture:"",
#         team_id:0
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
formula_two_drivers = Driver.create([
        {
            name: "Dennis Hauger",
            age: 20,
            number: 1,
            height: 181,
            nationality: "Norvégia",
            number_of_championships: 0,
            number_of_wins: 4,
            number_of_podiums: 8,
            series_id:2,
            description:"Shook off a difficult debut season in Formula 3 to win the title at a canter in his sophomore year. Led from start to finish with PREMA Racing, taking three pole positions and nine podiums, including four wins, from 20 races.",
            profile_picture:"",
            team_id:11

        },
        {
            name: "Jehan Daruvala",
            age: 25,
            number: 2,
            height: 176,
            nationality: "India",
            number_of_championships: 0,
            number_of_wins: 4,
            number_of_podiums: 14,
            series_id:2,
            description:"A title challenger with PREMA Racing in the 2019 Formula 3 campaign, Jehan Daruvala will return to the Italian team for his third year of Formula 2, having spent the past two seasons with Carlin.",
            profile_picture:"",
            team_id:11

        },
        {
            name: "Zane Maloney",
            age: 20,
            number: 3,
            height: 165,
            nationality: "Barbadosz",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 3,
            series_id:2,
            description:"On 18 January 2023, Maloney was announced as a part of the team line-up for Rodin Carlin for 2023 season, alongside Brazilian driver and fellow Red Bull Junior Enzo Fittipaldi.",
            profile_picture:"",
            team_id:12

        },
        {
            name: "Enzo Fittipaldi",
            age: 22,
            number: 4,
            height: 168,
            nationality: "Brazília",
            number_of_championships: 0,
            number_of_wins: 1,
            number_of_podiums: 10,
            series_id:2,
            description:"Affectionally known as the ‘little shark’ by his legion of passionate fans, Enzo Fittipaldi will be attacking his first full-season of Formula 2 with Charouz Racing System.",
            profile_picture:"",
            team_id:12

        },
        {
            name: "Théo Pourchaire",
            age: 20,
            number: 5,
            height: 185,
            nationality: "Franciaország",
            number_of_championships: 0,
            number_of_wins: 6,
            number_of_podiums: 20,
            series_id:2,
            description:"In the last 18 months alone, Théo Pourchaire has become Formula 2 and Formula 3’s youngest ever race winner, taken pole at Monaco and been linked with an F1 seat. In 2022, he’s hoping to add the Formula 2 title to that list.",
            profile_picture:"",
            team_id:13

        },
        {
            name: "Victor Martins",
            age: 22,
            number: 6,
            height: 173,
            nationality: "Franciaország",
            number_of_championships: 0,
            number_of_wins: 1,
            number_of_podiums: 6,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:13

        },
        {
            name: "Frederik Vesti",
            age: 21,
            number: 7,
            height: 184,
            nationality: "Dánia",
            number_of_championships: 0,
            number_of_wins: 1,
            number_of_podiums: 5,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:14

        },
        {
            name: "Oliver Bearman",
            age: 18,
            number: 8,
            height: 177,
            nationality: "Nagy Britannia",
            number_of_championships: 0,
            number_of_wins: 4,
            number_of_podiums: 4,
            series_id:2,
            description:"Oliver James Bearman (born 8 May 2005) is a British racing driver competing in the 2023 Formula 2 Championship for Prema Racing. He was the 2021 Italian and ADAC Formula 4 champion and is a member of the Ferrari Driver Academy. In the 2022 FIA Formula 3 Championship, he finished the season in third place, seven points off winner Victor Martins.",
            profile_picture:"",
            team_id:14

        },
        {
            name: "Jak Crawford",
            age: 18,
            number: 9,
            height: 183,
            nationality: "USA",
            number_of_championships: 0,
            number_of_wins: 1,
            number_of_podiums: 4,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:15

        },
        {
            name: "Isack Hadjar",
            age: 19,
            number: 10,
            height: 167,
            nationality: "Franciaország",
            number_of_championships: 0,
            number_of_wins: 3,
            number_of_podiums: 5,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:15

        },
        {
            name: "Ayumu Iwasa",
            age: 22,
            number: 11,
            height: 166,
            nationality: "Japán",
            number_of_championships: 0,
            number_of_wins: 2,
            number_of_podiums: 5,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:16

        },
        {
            name: "Arthur Leclerc",
            age: 23,
            number: 12,
            height: 180,
            nationality: "Monaco",
            number_of_championships: 0,
            number_of_wins: 3,
            number_of_podiums: 5,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:16

        },
        {
            name: "Jack Doohan",
            age: 20,
            number: 14,
            height: 183,
            nationality: "Ausztrália",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 0,
            series_id:2,
            description:"Struggled during his rookie season of F3, failing to take any points, but was rejuvenated by a switch to Trident. Won four times and notched seven podiums in a breakthrough year as Dennis Hauger’s strongest championship challenger, ending the year as vice-champion.",
            profile_picture:"",
            team_id:17

        },
        {
            name: "Amaury Cordeel",
            age: 21,
            number: 15,
            height: 172,
            nationality: "Belgium",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 0,
            series_id:2,
            description:"Amaury Cordeel will make the step up to Formula 2 in 2022 with Newcomers Van Amersfoort Racing.",
            profile_picture:"",
            team_id:17

        },
        {
            name: "Roy Nissany",
            age: 28,
            number: 16,
            height: 176,
            nationality: "Izrael",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 1,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:18

        },
        {
            name: "Joshua Mason",
            age: 21,
            number: 17,
            height: 176,
            nationality: "Nagy-Britannia",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 0,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:18

        },
        {
            name: "Roman Stanek",
            age: 19,
            number: 20,
            height: 180,
            nationality: "Csehország",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 0,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:19

        },
        {
            name: "Clément Novalak",
            age: 23,
            number: 21,
            height: 177,
            nationality: "Franciaország",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 0,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:19

        },
        {
            name: "Richard Verschoor",
            age: 22,
            number: 22,
            height: 187,
            nationality: "Hollandia",
            number_of_championships: 0,
            number_of_wins: 2,
            number_of_podiums: 5,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:20

        },
        {
            name: "Juan Manuel Correa",
            age: 24,
            number: 23,
            height: 184,
            nationality: "USA",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 0,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:20

        },
        {
            name: "Kush Maini",
            age: 23,
            number: 24,
            height: 171,
            nationality: "India",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 0,
            series_id:2,
            description:"",
            profile_picture:"",
            team_id:21
        },
        {
            name: "Ralph Boschung",
            age: 26,
            number: 25,
            height: 186,
            nationality: "Svájc",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 4,
            series_id:2,
            description:"Back for a second full season with Campos Racing in Formula 2, Ralph Boschung is one of the most experienced drivers on the grid. Technically entering his fifth year of F2, Boschung has only ever completed a full-campaign once.",
            profile_picture:"",
            team_id:21
        },
])

formula3_drivers =  Driver.create([
    {
            name: "Paul Aron",
            age: 19,
            number: 1,
            height: 171,
            nationality: "Észtország",
            number_of_championships: 0,
            number_of_wins: 1,
            number_of_podiums: 4,
            series_id:3,
            description:"",
            profile_picture:"",
            team_id:22
    },
    {
            name: "Dino Beganovic",
            age: 19,
            number: 2,
            height: 173,
            nationality: "Swédország",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 4,
            series_id:3,
            description:"",
            profile_picture:"",
            team_id:22
    },
    {
            name: "Leonardo Fornaroli",
            age: 18,
            number: 4,
            height: 173,
            nationality: "Olaszország",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 3,
            series_id:3,
            description:"",
            profile_picture:"",
            team_id:23
    },
    {
            name: "Gabriel Bortoleto",
            age: 19,
            number: 5,
            height: 173,
            nationality: "Brazília",
            number_of_championships: 1,
            number_of_wins: 2,
            number_of_podiums: 6,
            series_id:3,
            description:"",
            profile_picture:"",
            team_id:23
    },
    {
            name: "Oliver Goethe",
            age: 19,
            number: 6,
            height: 173,
            nationality: "Dánia",
            number_of_championships: 0,
            number_of_wins: 1,
            number_of_podiums: 2,
            series_id:3,
            description:"",
            profile_picture:"",
            team_id:23
    },
    {
            name: "Kaylen Frederick",
            age: 21,
            number: 7,
            height: 175,
            nationality: "USA",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 0,
            series_id:3,
            description:"",
            profile_picture:"",
            team_id:24
    },
    {
            name: "Grégoire Saucy",
            age: 23,
            number: 8,
            height: 180,
            nationality: "Svájc",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 3,
            series_id:3,
            description:"",
            profile_picture:"",
            team_id:24
    },
    {
            name: "Nikola Tsolov",
            age: 16,
            number: 9,
            height: 180,
            nationality: "Bulgária",
            number_of_championships: 0,
            number_of_wins: 0,
            number_of_podiums: 0,
            series_id:3,
            description:"",
            profile_picture:"",
            team_id:24
    },
    {
        name: "Franco Colapinto",
        age: 20,
        number: 10,
        height: 174,
        nationality: "Argentína",
        number_of_championships: 0,
        number_of_wins: 4,
        number_of_podiums: 10,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:25
    },
    {
        name: "Mari Boya",
        age: 19,
        number: 11,
        height: 0,
        nationality: "Spanyolország",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 1,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:25
    },
    {
        name: "Jonny Edgar",
        age: 19,
        number: 12,
        height: 177,
        nationality: "Nagy Britannia",
        number_of_championships: 0,
        number_of_wins: 1,
        number_of_podiums: 1,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:25
    },
    {
        name: "Sebastián Montoya",
        age: 18,
        number: 14,
        height: 0,
        nationality: "Kolumbia",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 0,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:26
    },
    {
        name: "Gabriele Minì",
        age: 18,
        number: 15,
        height: 0,
        nationality: "Olaszország",
        number_of_championships: 0,
        number_of_wins: 2,
        number_of_podiums: 4,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:26
    },
    {
        name: "Luke Browning",
        age: 21,
        number: 16,
        height: 0,
        nationality: "Nagy Britannia",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 1,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:26
    },
    {
        name: "Caio Collet",
        age: 21,
        number: 17,
        height: 176,
        nationality: "Brazília",
        number_of_championships: 0,
        number_of_wins: 3,
        number_of_podiums: 11,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:27
    },
    {
        name: "Rafael Villagómez",
        age: 22,
        number: 18,
        height: 168,
        nationality: "Mexikó",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 0,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:27
    },
    {
        name: "Tommy Smith",
        age: 21,
        number: 19,
        height: 0,
        nationality: "Ausztrália",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 0,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:27
    },
    {
        name: "Oliver Gray",
        age: 18,
        number: 20,
        height: 0,
        nationality: "Nagy Britannia",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 0,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:28
    },
    {
        name: "Francesco Simonazzi",
        age: 19,
        number: 21,
        height: 0,
        nationality: "Olaszország",
        number_of_championships: 0,
        number_of_wins: 2,
        number_of_podiums: 11,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:28
    },
    {
        name: "Ido Cohen",
        age: 22,
        number: 22,
        height: 180,
        nationality: "Izrael",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 0,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:28
    },
    {
        name: "Josep María Martí",
        age: 18,
        number: 23,
        height: 185,
        nationality: "Spanyolország",
        number_of_championships: 0,
        number_of_wins: 3,
        number_of_podiums: 4,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:29
    },
    {
        name: "Christian Mansell",
        age: 18,
        number: 24,
        height: 0,
        nationality: "Ausztrália",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 2,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:29
    },
    {
        name: "Joshua Dufek",
        age: 19,
        number: 25,
        height: 0,
        nationality: "Svájc",
        number_of_championships: 0,
        number_of_wins: 99999,
        number_of_podiums: 99999,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:29
    },
    {
        name: "Nikita Bedrin",
        age: 17,
        number: 26,
        height: 0,
        nationality: "Olaszország",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 2,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:30
    },
    {
        name: "Taylor Barnard",
        age: 19,
        number: 27,
        height: 0,
        nationality: "Nagy Britannia",
        number_of_championships: 0,
        number_of_wins: 1,
        number_of_podiums: 3,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:30
    },
    {
        name: "Alejandro García",
        age: 20,
        number: 28,
        height: 0,
        nationality: "Mexikó",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 0,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:30
    },
    {
        name: "Sophia Floersch",
        age: 22,
        number: 29,
        height: 173,
        nationality: "Németország",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 0,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:31
    },
    {
        name: "Roberto Faria",
        age: 19,
        number: 30,
        height: 0,
        nationality: "Brazília",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 0,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:31
    },
    {
        name: "Woohyun Shin",
        age: 19,
        number: 31,
        height: 0,
        nationality: "Korea",
        number_of_championships: 0,
        number_of_wins: 0,
        number_of_podiums: 0,
        series_id:3,
        description:"",
        profile_picture:"",
        team_id:31
    },





])