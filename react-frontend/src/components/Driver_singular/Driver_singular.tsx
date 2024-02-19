import axios from "axios";
import React, { Fragment, useState } from "react";
import { Link, LoaderFunction, useLoaderData } from "react-router-dom";
import { Button, Divider, Grid, Paper } from "@mui/material";
import styles from "../../styles/Driver_singular.module.css";
import { DriverModel } from "../../model/DriverModel";
import hexRgb from "hex-rgb";
import { TeamModel } from "../../model/TeamModel";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import ReactCardFlip from "react-card-flip";
import noCar from "../../images/nocar.png";
import noHelmet from "../../images/nohelmet.png";
import { getCurrentUser, getTeams, getDrivers } from "../../api_links";
import { driverInterface } from "../../interface/driverInterface";
import { teamInterface } from "../../interface/teamInterface";

let allDataType: {
  driver: DriverModel;
  team: TeamModel;
};
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
    await fetch(getCurrentUser, {
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

  return (
    <Fragment>
      <div
        className={styles.backgroundStuff}
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
        <Grid container spacing={3} className={styles.mainGrid}>
          <Grid item xs={4}>
            <ReactCardFlip isFlipped={isFlipped2} flipDirection="vertical">
              <div onClick={handleClick2}>
                <img
                  src={driver.images[0].image_url}
                  alt="kep"
                  className={styles.kep}
                />
                <figcaption className={styles.infoText}>
                  kattints a sisakhoz
                </figcaption>
              </div>
              <div onClick={handleClick2}>
                {driver.images[1] !== undefined ? (
                  <img
                    src={driver.images[1].image_url}
                    alt="sisak"
                    className={styles.kep}
                  />
                ) : (
                  <img src={noHelmet} alt="sisak" className={styles.kep} />
                )}

                <figcaption className={styles.infoText}>
                  kattints a versenyzőhöz
                </figcaption>
              </div>
            </ReactCardFlip>
          </Grid>
          <CustomSnackbar />
          <Grid item xs={8} container className={styles.propertiesGrid}>
            <Grid item xs={4}>
              Életkor
              <Divider variant="middle" className={styles.divider} />
              {driver.age}
            </Grid>
            <Grid item xs={4}>
              Név
              <Divider variant="middle" className={styles.divider} />
              {driver.name}
            </Grid>
            <Grid item xs={4}>
              Pódiumok száma
              <Divider variant="middle" className={styles.divider} />
              {driver.number_of_podiums}
            </Grid>
            <Grid item xs={4}>
              Győzelmek száma
              <Divider variant="middle" className={styles.divider} />
              {driver.number_of_wins}
            </Grid>
            <Grid item xs={4}>
              Nemzetiség
              <Divider variant="middle" className={styles.divider} />
              {driver.nationality}
            </Grid>
            <Grid item xs={4}>
              Csapat
              <Divider variant="middle" className={styles.divider} />
              <Link to={`/teams/${team.slug}`} className={styles.link}>
                {team.name}
              </Link>
            </Grid>
          </Grid>
        </Grid>
        <Button
          variant="contained"
          className={styles.fav_driverButton}
          onClick={() => {
            submitFavDriver();
          }}
        >
          Kedvenc versenyző
        </Button>

        <ReactCardFlip isFlipped={isFlipped} flipDirection="vertical">
          <div className={styles.flipCard} onClick={handleClick}>
            {team.cars[0].images[0] !== undefined ? (
              <img
                src={team.cars[0].images[0].image_url}
                alt="kep"
                width={1080}
                className={styles.driversCarImage}
              />
            ) : (
              <img
                src={noCar}
                alt="kep"
                width={1080}
                style={{ marginTop: "5%", marginLeft: "10%" }}
              />
            )}

            <figcaption className={styles.infoText}>
              kattints a részletes leírásért
            </figcaption>
          </div>

          <div onClick={handleClick}>
            <Paper className={styles.driverDescripition}>
              {driver.description}
            </Paper>
          </div>
        </ReactCardFlip>
      </div>
    </Fragment>
  );
};

export const DriverLoader: LoaderFunction<typeof allDataType> = async ({
  params,
}) => {
  const allData: typeof allDataType = {
    driver: driverInterface,
    team: teamInterface,
  };
  await axios
    .get(getDrivers + params.slug)
    .then((data) => {
      allData.driver = data.data[0];
      allData.driver.images[0] = data.data[0].images[0];
      return data.data[0];
    })
    .then(async (data) => {
      await axios.get(getTeams + data.team_slug).then(async (data) => {
        allData.team = data.data[0];
      });
    });
  return allData;
};

export default Driver_singular;
