import { useEffect, useState } from "react";
import axios from "axios";
import { SeriesModel } from "../../model/SeriesModel";
import { DriverModel } from "../../model/DriverModel";
import ResponsiveAppBar from "../navbar/navbar";
import "../../styles/seriesStyle.css";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import { Box, ImageList, Typography } from "@mui/material";
import DriverSingular from "../Driver_singular/Driver_singular";
import { TeamModel } from "../../model/TeamModel";
import TeamSingular from "../Team_singular/Team_singular";

const series_url =
  "http://localhost:3000/api/v1/series/" + document.URL.split("/")[4];

const drivers_url =
  "http://localhost:3000/api/v1/drivers/" + document.URL.split("/")[4];

const teams_url =
  "http://localhost:3000/api/v1/teams/" + document.URL.split("/")[4];

async function getSeriesData() {
  const series_data = await axios.get(series_url);
  return series_data.data;
}

async function getDriverData() {
  const drivers_data = await axios.get(drivers_url);
  return drivers_data.data;
}
async function getTeamData() {
  const teams_data = await axios.get(teams_url);
  return teams_data.data;
}

const Series = () => {
  console.log("hello");
  let seriesType: SeriesModel = {
    id: 0,
    name: "",
    number_of_races: 0,
    number_of_drivers: 0,
    number_of_teams: 0,
  };
  let teamType: TeamModel[] = [
    {
      id: 0,
      name: "",
      number_of_championships: 0,
      number_of_races: 0,
      headquarters_city: "",
      technical_director: "",
      first_win: 0,
      last_championship_win: 0,
      date_of_establishment: 0,
      series_id: 0,
      team_picture: "",
      team_color: "",
    },
  ];
  let driverType: DriverModel[] = [
    {
      id: 0,
      name: "",
      age: 0,
      nationality: "",
      number_of_wins: 0,
      number_of_podiums: 0,
      description: "",
      profile_picture: "",
      series_id: 0,
      team_id: 0,
    },
  ];
  const [series, setSeries] = useState(seriesType);
  const [drivers, setDrivers] = useState(driverType);
  const [teams, setTeams] = useState(teamType);

  useEffect(() => {
    let mounted = false;
    getSeriesData().then((items: any) => {
      if (!mounted) {
        setSeries(items);
      }
    });
    getDriverData().then((items: any) => {
      if (!mounted) {
        setDrivers(items);
      }
    });
    getTeamData().then((items: any) => {
      if (!mounted) {
        setTeams(items);
      }
    });
    return () => {
      mounted = true;
    };
  }, []);
  console.log(teams);
  return (
    <>
      <div>
        <ResponsiveAppBar />
        <img
          src={require("../../black-image.jpeg")}
          alt="kep"
          className="image"
        />
        <div>
          <Typography
            sx={{
              fontWeight: "400",
              fontSize: "13em",
              fontFamily: "Monaco",
              zIndex: 2,
            }}
            variant="h1"
            style={{ textAlign: "center", marginTop: 50 }}
            color="white"
          >
            {series.name}
          </Typography>
        </div>
        <Box sx={{ margin: 5 }}>
          <Typography
            variant="h1"
            sx={{
              fontWeight: "400",
              fontSize: "4em",
              fontFamily: "Monaco",
              marginTop: 4,
              color: "grey",
            }}
          >
            Drivers
          </Typography>
          <Paper variant="outlined">
            <Grid
              container
              spacing={2}
              alignItems={"center"}
              justifyContent={"center"}
              wrap="nowrap"
            >
              <div
                style={{
                  display: "flex",
                  flexWrap: "wrap",
                  justifyContent: "space-around",
                  overflow: "hidden",
                }}
              >
                <ImageList
                  style={{
                    display: "flex",
                    flexWrap: "nowrap",
                    transform: "translateZ(0)",
                  }}
                >
                  {drivers.map((item: DriverModel) => (
                    <DriverSingular driver={item} key={item.name} />
                  ))}
                </ImageList>
              </div>
            </Grid>
          </Paper>
        </Box>
        <Box sx={{ margin: 5 }}>
          <Typography
            variant="h1"
            sx={{
              fontWeight: "400",
              fontSize: "4em",
              fontFamily: "Monaco",
              marginTop: 4,
              color: "grey",
            }}
          >
            Teams
          </Typography>
          <Paper variant="outlined">
            <Grid
              container
              spacing={2}
              alignItems={"center"}
              justifyContent={"center"}
              wrap="nowrap"
            >
              <div
                style={{
                  display: "flex",
                  flexWrap: "wrap",
                  justifyContent: "space-around",
                  overflow: "hidden",
                }}
              >
                <ImageList
                  style={{
                    display: "flex",
                    flexWrap: "nowrap",
                    transform: "translateZ(0)",
                  }}
                >
                  {teams.map((item: TeamModel) => (
                    <TeamSingular team={item} key={item.name} />
                  ))}
                </ImageList>
              </div>
            </Grid>
          </Paper>
        </Box>
      </div>
    </>
  );
};

export default Series;
