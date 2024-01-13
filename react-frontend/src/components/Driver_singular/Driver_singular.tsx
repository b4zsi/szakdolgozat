import axios from "axios";
import React, { Fragment, useState } from "react";
import { Link, LoaderFunction, useLoaderData } from "react-router-dom";
import { Button, Divider, Grid, Paper } from "@mui/material";
import "../../styles/Driver_singular.css";
import { DriverModel } from "../../model/DriverModel";
import hexRgb from "hex-rgb";
import { TeamModel } from "../../model/TeamModel";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import ReactCardFlip from "react-card-flip";

let allDataType: {
  driver: DriverModel;
  team: TeamModel;
};
const current_user_url = "http://localhost:3000/current_user/";
const Driver_singular = () => {
  const allData: typeof allDataType = useLoaderData() as {
    driver: DriverModel;
    team: TeamModel;
  };
  const driver = allData.driver;
  const team = allData.team;
  const [isFlipped, setIsFlipped] = useState<boolean>(false);
  const [isFlipped2, setIsFlipped2] = useState<boolean>(false);
  const handleClick = (event: React.MouseEvent) => {
    event.preventDefault();
    setIsFlipped(!isFlipped);
  };
  const handleClick2 = (event: React.MouseEvent) => {
    event.preventDefault();
    setIsFlipped2(!isFlipped2);
  };

  const submitFavDriver = async () => {
    const jwt = localStorage.getItem("jwt");
    await fetch(current_user_url, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Authorization: `${jwt}`,
      },
      body: JSON.stringify({
        user: {
          fav_driver: driver.slug,
        },
      }),
    }).then(async (response) => {
      if (response.ok) {
        await response.json().then((data) => {
          toastNotification(0, data.message);
        });
      }
    });
  };

  console.log(team);
  return (
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
            <ReactCardFlip isFlipped={isFlipped2} flipDirection="vertical">
              <div onClick={handleClick2}>
                <img
                  src={driver.images[0].image_url}
                  alt="kep"
                  className="kep"
                />
                <figcaption className="infoText">
                  kattints a sisakhoz
                </figcaption>
              </div>
              <div onClick={handleClick2}>
                <img
                  src={driver.images[1].image_url}
                  alt="sisak"
                  className="kep"
                />
                <figcaption className="infoText">
                  kattints a versenyzőhöz
                </figcaption>
              </div>
            </ReactCardFlip>
          </Grid>
          <CustomSnackbar />
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
        <Button
          variant="contained"
          className="fav_driverButton"
          onClick={() => {
            submitFavDriver();
          }}
        >
          Kedvenc versenyző
        </Button>

        <ReactCardFlip isFlipped={isFlipped} flipDirection="vertical">
          <div className="helmetImage" onClick={handleClick}>
            <img
              src={team.cars[0].images[0].image_url}
              alt="kep"
              width={1080}
              style={{ marginTop: "5%", marginLeft: "10%" }}
            />
            <figcaption className="infoText">
              kattints a részletes leírásért
            </figcaption>
          </div>

          <div onClick={handleClick}>
            <Paper className="driverDescripition">{driver.description}</Paper>
          </div>
        </ReactCardFlip>
      </div>
    </Fragment>
  );
};

export const DriverLoader: LoaderFunction<typeof allDataType> = async ({
  params,
}) => {
  const driver_url = "http://localhost:3000/api/v1/drivers/" + params.slug;
  const allData: typeof allDataType = {
    driver: {
      id: 0,
      name: "",
      nationality: "",
      age: 0,
      number_of_wins: 0,
      number_of_podiums: 0,
      description: "",
      profile_picture: "",
      series_id: 0,
      team_id: 0,
      team_slug: "",
      slug: "",
      images: [],
    },
    team: {
      id: 0,
      number_of_championships: 0,
      number_of_races: 0,
      name: "",
      headquarters_city: "",
      technical_director: "",
      first_win: 0,
      date_of_establishment: 0,
      series_id: 0,
      team_picture: "",
      last_championship_win: 0,
      team_color: "",
      slug: "",
      images: [],
      cars: [],
    },
  };
  await axios
    .get(driver_url)
    .then((data) => {
      console.log(data.data);
      allData.driver = data.data[0];
      allData.driver.images[0] = data.data[0].images[0];
      return data.data[0];
    })
    .then(async (data) => {
      await axios
        .get("http://localhost:3000/api/v1/teams/" + data.team_slug)
        .then(async (data) => {
          allData.team = data.data[0];
        });
    });
  return allData;
};

export default Driver_singular;
