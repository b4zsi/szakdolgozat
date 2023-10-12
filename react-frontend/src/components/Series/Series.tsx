import React, { useEffect, useState } from "react";
import axios from "axios";
import { SeriesModel } from "../../model/SeriesModel";
import { DriverModel } from "../../model/DriverModel";
import ResponsiveAppBar from "../navbar/navbar";
import "../../styles/seriesStyle.css";
import SeriesSingular from "../Series_singular/Series_singular";
import Grid from "@mui/material/Grid";

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
        <div>
          <div className="title">{series.name}</div>
          {/* <img src="../../McLaren-MCL35M.jpeg" alt="kep" /> */}
        </div>
        <Grid container spacing={2}>
          {drivers.map((item: DriverModel) => (
            //<</>div key={item.name}>{item.name}</div>
            <SeriesSingular driver={item} key={item.name} />
          ))}
        </Grid>
      </div>
    </>
  );
};

export default Series;
