import { Fragment, useState } from "react";
import { Link, LoaderFunction, useLoaderData } from "react-router-dom";
import axios from "axios";
import styles from "../../styles/Team_singular.module.css";
import hexRgb from "hex-rgb";
import { Button, Dialog, Divider, Grid, TextField } from "@mui/material";
import Slider from "../imageSlider/imageSlider";
import { TeamModel } from "../../model/TeamModel";
import { DriverModel } from "../../model/DriverModel";
import { ImageModel } from "../../model/ImageModel";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import { getCurrentUser, getImages, getTeams } from "../../api_links";
import { teamInterface } from "../../interface/teamInterface";
import { UserModel } from "../../model/UserModel";
import { userInterface } from "../../interface/userInterface";

let allDataType: {
  team: TeamModel;
  drivers: DriverModel[];
  images: ImageModel[];
  user: UserModel;
};

const Team_singular = () => {
  const allData: typeof allDataType = useLoaderData() as {
    team: TeamModel;
    drivers: DriverModel[];
    images: ImageModel[];
    user: UserModel;
  };
  const team: TeamModel = allData.team;
  const drivers: DriverModel[] = allData.drivers;
  const [open, setOpen] = useState<boolean>(false);
  const [engine, setEngine] = useState<string>("");
  const images: ImageModel[] = allData.images;
  const user = allData.user;

  const handleOpen = () => {
    setOpen(true);
  };

  const handleSubmit = async () => {};

  const submitFavTeam = async () => {
    const jwt = localStorage.getItem("jwt");
    await fetch(getCurrentUser, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Authorization: `${jwt}`,
      },
      body: JSON.stringify({
        user: {
          fav_team: team.slug,
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
      <Dialog
        open={open}
        onClose={() => {
          setOpen(false);
        }}
      >
        <form>
          <TextField
            required
            focused
            id="engine"
            label="Motor"
            value={engine}
            onChange={(e) => setEngine(e.target.value)}
          />
          <TextField
            required
            focused
            id="engine"
            label="Motor"
            value={engine}
            onChange={(e) => setEngine(e.target.value)}
          />
          <TextField
            required
            focused
            id="engine"
            label="Motor"
            value={engine}
            onChange={(e) => setEngine(e.target.value)}
          />
          <TextField
            required
            focused
            id="engine"
            label="Motor"
            value={engine}
            onChange={(e) => setEngine(e.target.value)}
          />
          <Button variant="outlined" onSubmit={handleSubmit}>
            Hozzáadás
          </Button>
          <Button variant="outlined" onClick={() => setOpen(false)}>
            Mégse
          </Button>
        </form>
      </Dialog>
      <div>
        <Slider images={images} team_name={team.name} />
      </div>
      <div className={styles.mainDivTeam}>
        <CustomSnackbar />
        {user.id === 0 && user.email === "" && (
          <Button
            variant="outlined"
            className={styles.favTeamButton}
            onClick={() => {
              submitFavTeam();
            }}
          >
            Kedvenc csapat
          </Button>
        )}

        <Divider variant="middle" className={styles.divider} />
        {team.cars.length === 0 && user.admin ? (
          <Button variant="outlined" onClick={handleOpen}>
            Adj hozzá autót a csapathoz
          </Button>
        ) : (
          <Link to={`/cars/${team.cars[0].id}`} className={styles.carLink}>
            <Button className={styles.carButton}>
              nézd meg a csapat autóját
            </Button>
          </Link>
        )}

        <p className={styles.subTitle}>Statisztikák</p>

        <Grid
          container
          spacing={3}
          className={styles.propertyGrid}
          style={{
            backgroundColor: `${hexRgb(team.team_color + "B3", {
              format: "css",
            })}`,
          }}
        >
          <Grid item xs={4} className={styles.propertyGridItem}>
            Megalakulás éve
            <Divider variant="middle" className={styles.dividerTeam} />
            {team.date_of_establishment}
          </Grid>
          <Grid item xs={4} className={styles.propertyGridItem}>
            Telephely
            <Divider variant="middle" className={styles.dividerTeam} />
            {team.headquarters_city}
          </Grid>
          <Grid item xs={4} className={styles.propertyGridItem}>
            Első győzelem
            <Divider variant="middle" className={styles.dividerTeam} />
            {team.first_win}
          </Grid>
          <Grid item xs={4} className={styles.propertyGridItem}>
            Utolsó bajnoki cím
            <Divider variant="middle" className={styles.dividerTeam} />
            {team.last_championship_win}
          </Grid>
          <Grid item xs={4} className={styles.propertyGridItem}>
            Rajtok száma
            <Divider variant="middle" className={styles.dividerTeam} />
            {team.number_of_races}
          </Grid>
          <Grid item xs={4} className={styles.propertyGridItem}>
            Bajnoki címek száma
            <Divider variant="middle" className={styles.dividerTeam} />
            {team.number_of_championships}
          </Grid>
        </Grid>
        <p className={styles.subTitle}>Versenyzők</p>

        {drivers.length === 2 ? (
          <Grid
            container
            spacing={3}
            className={styles.propertyGrid}
            style={{
              backgroundColor: `${hexRgb(team.team_color + "B3", {
                format: "css",
              })}`,
            }}
          >
            {drivers.map((driver) => (
              <Grid
                item
                xs={6}
                className={styles.propertyGridItem}
                key={driver.id}
              >
                {driver.name}
                <Divider variant="middle" className={styles.dividerTeam} />
                <Link to={"/drivers/" + driver.slug}>
                  <img
                    src={driver.images[0].image_url}
                    alt="kep"
                    className={styles.driverImage}
                  />
                </Link>
              </Grid>
            ))}
          </Grid>
        ) : (
          <Grid
            container
            spacing={2}
            className={styles.propertyGrid}
            style={{
              backgroundColor: `${hexRgb(team.team_color + "B3", {
                format: "css",
              })}`,
            }}
          >
            {drivers.map((driver) => (
              <Grid
                item
                xs={4}
                className={styles.propertyGridItem}
                key={driver.id}
              >
                {driver.name}
                <Divider variant="middle" className={styles.dividerTeam} />
                <img
                  src={driver.images[0].image_url}
                  alt="kep"
                  className={styles.driverImage}
                />
              </Grid>
            ))}
          </Grid>
        )}
      </div>
    </Fragment>
  );
};

export const TeamLoader: LoaderFunction<typeof allDataType> = async ({
  params,
}) => {
  const allData: typeof allDataType = {
    team: teamInterface,
    drivers: [],
    images: [],
    user: userInterface,
  };
  await axios
    .get(getTeams + params.slug)
    .then((data) => {
      allData.team = data.data[0];
      allData.drivers = data.data[0].drivers;
      return data.data[0];
    })
    .then(async (data) => {
      let index = 0;
      await axios
        .get(getImages + data.slug)
        .then((data) => {
          console.log(data.data);
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          data.data.map((image: any) => {
            if (
              !image.attributes.image_url.includes("profile") &&
              !image.attributes.image_name.includes("car") &&
              !image.attributes.description.includes("logo") &&
              !image.attributes.image_url.includes("helmet")
            ) {
              allData.images[index] = image.attributes;
              index++;
            } else if (image.attributes.image_name === allData.team.slug) {
              allData.images[index] = image.attributes;
              index++;
            }
          });
        })
        .then(async () => {
          await fetch(getCurrentUser, {
            method: "GET",
            headers: {
              Authorization: `${localStorage.getItem("jwt")}`,
            },
          }).then(async (response) => {
            allData.user = await response.json();
          });
        });
    });
  return allData;
};

export default Team_singular;
