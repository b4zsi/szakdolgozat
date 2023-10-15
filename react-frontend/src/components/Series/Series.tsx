import React, { useEffect, useState } from "react";
import axios from "axios";
import { SeriesModel } from "../../model/SeriesModel";
import { DriverModel } from "../../model/DriverModel";
import ResponsiveAppBar from "../navbar/navbar";
import "../../styles/seriesStyle.css";
import SeriesSingular from "../Series_singular/Series_singular";
import Grid from "@mui/material/Grid";
import { styled } from "@mui/material/styles";
import Paper from "@mui/material/Paper";
import { Box, Typography } from "@mui/material";

const series_url =
  "http://localhost:3000/api/v1/series/" + document.URL.split("/")[4];

const drivers_url =
  "http://localhost:3000/api/v1/drivers/" + document.URL.split("/")[4];

async function getAPIData1() {
  const series_data = await axios.get(series_url);
  return series_data.data;
}

async function getAPIData2() {
  const drivers_data = await axios.get(drivers_url);
  return drivers_data.data;
}

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === "dark" ? "#1A2027" : "#fff",
  ...theme.typography.body2,
  //padding: theme.spacing(2),
  //textAlign: "center",
  color: theme.palette.text.secondary,
}));

const Series = () => {
  let seriesType: SeriesModel = {
    id: 0,
    name: "",
    number_of_races: 0,
    number_of_drivers: 0,
    number_of_teams: 0,
  };
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

  useEffect(() => {
    let mounted = false;
    getAPIData1().then((items: any) => {
      if (!mounted) {
        setSeries(items);
      }
    });
    getAPIData2().then((items: any) => {
      if (!mounted) {
        setDrivers(items);
      }
    });
    return () => {
      mounted = true;
    };
  }, []);
  return (
    <>
      <div>
        <ResponsiveAppBar />
        <img
          src={require(".././../Series_f1.jpeg")}
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
              marginTop: 10,
              color: "grey",
            }}
          >
            Drivers
          </Typography>
          <Grid
            container
            spacing={1}
            style={{
              backgroundColor: "grey",
              borderRadius: 15,
              paddingLeft: 30,
            }}
          >
            {drivers.map((item: DriverModel) => (
              <SeriesSingular driver={item} key={item.name} />
            ))}
          </Grid>
        </Box>
      </div>
    </>
  );
};

export default Series;
