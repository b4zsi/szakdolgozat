import axios from "axios";
import React, { Fragment, useEffect, useState } from "react";
import { DriverModel } from "../../model/DriverModel";
import { Link, useNavigate } from "react-router-dom";
import { Divider, Grid, Paper } from "@mui/material";
import "../../styles/Driver_singular.css";
import { TeamModel } from "../../model/TeamModel";
import "../../styles/loadingAnimation.css";
import hexRgb from "hex-rgb";
import Loader from "../loader";

const driver_id: string = document.URL.split("/")[4];
const driver_url = "http://localhost:3000/api/v1/drivers/" + driver_id;

const Driver_singular = () => {
  const [isPageLoading, setIsPageLoading] = useState(true);
  let navigate = useNavigate();
  let driverType: DriverModel = {
    id: 0,
    name: "",
    age: 0,
    nationality: "",
    number_of_wins: 0,
    number_of_podiums: 0,
    description: "",
    profile_picture: "",
    series_id: 0,
    team_slug: "",
    team_id: 0,
    slug: "",
  };
  let teamType: TeamModel = {
    id: 0,
    name: "",
    number_of_championships: 0,
    number_of_races: 0,
    headquarters_city: "",
    technical_director: "",
    first_win: 0,
    last_championship_win: 0,
    date_of_establishment: 0,
    series_id: 1,
    team_picture: "",
    team_color: "ffffff",
    slug: "",
  };
  const [driver, setDriver] = useState(driverType);
  const [team, setTeam] = useState(teamType);
  if (driver_id.match(/[1-9]/g)) {
    window.location.reload();
  }

  useEffect(() => {
    const fetchData = async () => {
      await axios
        .get(driver_url)
        .then((data) => {
          setDriver(data.data[0]);
          return data.data[0];
        })
        .then(async (data) => {
          await axios
            .get("http://localhost:3000/api/v1/teams/" + data.team_slug)
            .then(async (data) => {
              setTeam(data.data[0]);
            });
        })
        .catch(() => navigate("/"));
    };
    fetchData().then(() => {
      setIsPageLoading(false);
    });
  }, [navigate]);
  return isPageLoading ? (
    <Loader />
  ) : (
    <Fragment>
      <div
        className="backgroundStuff"
        style={{
          backgroundColor: `${hexRgb(team.team_color + "B3", {
            format: "css",
          })}`,
        }}
      ></div>
      <div
        style={{
          backgroundColor: `${hexRgb(team.team_color + "B3", {
            format: "css",
          })}`,
        }}
        className="mainDiv"
      >
        <Grid container spacing={3} className="mainGrid">
          <Grid item xs={4}>
            <img
              src={`data:image/jpeg;base64,${driver.profile_picture}`}
              alt="kep"
              className="kep"
            />
          </Grid>
          <Grid item xs={8} container className="propertiesGrid">
            <Grid item xs={4}>
              Életkor
              <Divider variant="middle" className="divider" />
              {driver.age}
            </Grid>
            <Grid item xs={4}>
              Név
              <Divider variant="middle" className="divider" />
              {driver.name}
            </Grid>
            <Grid item xs={4}>
              Pódiumok száma
              <Divider variant="middle" className="divider" />
              {driver.number_of_podiums}
            </Grid>
            <Grid item xs={4}>
              Győzelmek száma
              <Divider variant="middle" className="divider" />
              {driver.number_of_wins}
            </Grid>
            <Grid item xs={4}>
              Nemzetiség
              <Divider variant="middle" className="divider" />
              {driver.nationality}
            </Grid>
            <Grid item xs={4}>
              Csapat
              <Divider variant="middle" className="divider" />
              <Link to={`/teams/${team.slug}`} className="link">
                {team.name}
              </Link>
            </Grid>
          </Grid>
        </Grid>
        <div>
          <Paper className="driverDescripition">{driver.description}</Paper>
        </div>
      </div>
    </Fragment>
  );
};

export default Driver_singular;
