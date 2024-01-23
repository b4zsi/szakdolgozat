import { Fragment, useState } from "react";
import axios from "axios";
import { DriverModel } from "../../model/DriverModel";
import "../../styles/seriesStyle.css";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import { Box, ImageList, Typography } from "@mui/material";
import Drivers from "../Drivers/Drivers";
import { TeamSeriesModel } from "../../model/TeamModel";
import Teams from "../Teams/Teams";
import SeriesStats from "../SeriesStats/SeriesStats";
import { Link, LoaderFunction, useLoaderData } from "react-router-dom";
import { SeriesModel } from "../../model/SeriesModel";
import { ImageModel } from "../../model/ImageModel";
import { SearchBar } from "../SearchBar/SearchBar";
import { SearchResultsList } from "../SearchBar/SearchResultsList";

function driverSort(a: DriverModel, b: DriverModel) {
  return a.id - b.id;
}

type Result = {
  drivers: DriverModel[];
  teams: TeamSeriesModel[];
  //ide majd hozzá lehet adni az autokat, versenyket stb..
};

function getTeamColor(teams: TeamSeriesModel[], driver: DriverModel): string {
  let color = "";
  teams.map((team: TeamSeriesModel) => {
    if (team.slug.match(driver.team_slug)) {
      color = team.team_color;
    }
  });
  return color;
}
let allDataType: {
  series: SeriesModel;
  drivers: DriverModel[];
  teams: TeamSeriesModel[];
  image: ImageModel;
};
const Series = () => {
  const allData: typeof allDataType = useLoaderData() as {
    series: SeriesModel;
    drivers: DriverModel[];
    teams: TeamSeriesModel[];
    image: ImageModel;
  };

  const series: SeriesModel = allData.series;
  const drivers: DriverModel[] = allData.drivers.sort(
    (a: DriverModel, b: DriverModel) => driverSort(a, b)
  );
  const teams: TeamSeriesModel[] = allData.teams;
  const image: ImageModel = allData.image;
  const [results, setResults] = useState<Result>();

  localStorage.setItem("drivers", JSON.stringify(drivers));
  localStorage.setItem("teams", JSON.stringify(teams));
  //lehet hogy itt nem a localstorage a legjobb megoldas
  //TODO szedd ki innen a kepeket es csak a neveket meg a slugokat tedd bele lol

  console.log(results);
  return (
    <Fragment>
      <div className="background">
        <img src={image.image_url} alt="kep" className="image" />
        <Box sx={{ marginTop: "23.5%", color: "white" }}>
          <SeriesStats properties={series} />
        </Box>
        <div className="search-bar-container">
          <SearchBar setResults={setResults} drivers={drivers} teams={teams} />
          {results && (
            <SearchResultsList
              drivers={results.drivers}
              teams={results.teams}
            />
          )}
        </div>
        <Box sx={{ margin: 5 }}>
          <Typography variant="h2" className="title">
            Versenyzők
          </Typography>
          <Paper
            variant="outlined"
            style={{ background: "transparent", marginTop: "3%" }}
            className="driverPaper"
          >
            <Grid
              container
              spacing={2}
              alignItems={"center"}
              justifyContent={"center"}
              wrap="nowrap"
              className="driverGrid"
            >
              <div className="oneLineDiv">
                <ImageList className="imageList">
                  {drivers.map((item: DriverModel) => (
                    <Link
                      to={`/drivers/${item.slug}`}
                      key={item.name}
                      className="driverLink"
                    >
                      <Drivers
                        properties={item}
                        team_color={getTeamColor(teams, item)}
                        team_id={item.team_id}
                      />
                    </Link>
                  ))}
                </ImageList>
              </div>
            </Grid>
          </Paper>
        </Box>
        <Box sx={{ margin: 5 }}>
          <Typography variant="h2" className="title">
            Csapatok
          </Typography>
          <Paper
            variant="outlined"
            style={{
              background: "transparent",
              marginTop: "3%",
            }}
            className="teamPaper"
          >
            <Grid
              container
              spacing={2}
              alignItems={"center"}
              wrap="nowrap"
              className="teamGrid"
            >
              <div className="oneLineDivTeam">
                <ImageList className="imageListTeam">
                  {teams.map((item: TeamSeriesModel) => (
                    <Link
                      to={`/teams/${item.slug}`}
                      key={item.name}
                      className="driverLink"
                    >
                      <Teams properties={item} />
                    </Link>
                  ))}
                </ImageList>
              </div>
            </Grid>
          </Paper>
        </Box>
      </div>
    </Fragment>
  );
};

export const SeriesLoader: LoaderFunction<typeof allDataType> = async ({
  params,
}) => {
  const returnData: typeof allDataType = {
    series: {
      id: 0,
      name: "",
      number_of_teams: 0,
      number_of_drivers: 0,
      number_of_races: 0,
      slug: "",
    },
    drivers: [],
    teams: [],
    image: {
      id: 0,
      image_name: "",
      image_url: "",
      team_slug: "",
      description: "",
    },
  };
  const series_url = "http://localhost:3000/api/v1/series/" + params.id;

  await axios.get(series_url).then((data) => {
    console.log(data.data);
    returnData.drivers = data.data.drivers;
    returnData.series = data.data;
    returnData.teams = data.data.teams;
    returnData.image = data.data.images[0];
  });
  return returnData;
};

export default Series;
