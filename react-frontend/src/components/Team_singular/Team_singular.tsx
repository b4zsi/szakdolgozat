import { Fragment } from "react";
import { Link, LoaderFunction, useLoaderData } from "react-router-dom";
import axios from "axios";
import "../../styles/Team_singular.css";
import hexRgb from "hex-rgb";
import { Button, Divider, Grid } from "@mui/material";
import Slider from "../imageSlider/imageSlider";
import { TeamModel } from "../../model/TeamModel";
import { DriverModel } from "../../model/DriverModel";
import { ImageModel } from "../../model/ImageModel";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
let allDataType: {
  team: TeamModel;
  drivers: DriverModel[];
  images: ImageModel[];
};
const current_user_url = "http://localhost:3000/current_user/";

const Team_singular = () => {
  const allData: typeof allDataType = useLoaderData() as {
    team: TeamModel;
    drivers: DriverModel[];
    images: ImageModel[];
  };
  const team: TeamModel = allData.team;
  const drivers: DriverModel[] = allData.drivers;
  const images: ImageModel[] = allData.images;
  console.log(images);

  const submitFavTeam = async () => {
    const jwt = localStorage.getItem("jwt");
    await fetch(current_user_url, {
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
      <CustomSnackbar />
      <div>
        <Slider images={images} team_name={team.name} />
      </div>
      <div className="mainDivTeam">
        <Button
          variant="outlined"
          className="favTeamButton"
          onClick={() => {
            submitFavTeam();
          }}
        >
          Kedvenc csapat
        </Button>
        <Divider variant={"middle"} className="divider" />
        <Link to={`/cars/${team.cars[0].id}`} className="carLink">
          <Button>nézd meg a csapat autóját</Button>
        </Link>
        <p className="subTitle">Statisztikák</p>

        <Grid
          container
          spacing={3}
          className="propertyGrid"
          style={{
            backgroundColor: `${hexRgb(team.team_color + "B3", {
              format: "css",
            })}`,
          }}
        >
          <Grid item xs={4} className="propertyGridItem">
            Megalakulás éve
            <Divider variant="middle" className="dividerTeam" />
            {team.date_of_establishment}
          </Grid>
          <Grid item xs={4} className="propertyGridItem">
            Telephely
            <Divider variant="middle" className="dividerTeam" />
            {team.headquarters_city}
          </Grid>
          <Grid item xs={4} className="propertyGridItem">
            Első győzelem
            <Divider variant="middle" className="dividerTeam" />
            {team.first_win}
          </Grid>
          <Grid item xs={4} className="propertyGridItem">
            Utolsó bajnoki cím
            <Divider variant="middle" className="dividerTeam" />
            {team.last_championship_win}
          </Grid>
          <Grid item xs={4} className="propertyGridItem">
            Rajtok száma
            <Divider variant="middle" className="dividerTeam" />
            {team.number_of_races}
          </Grid>
          <Grid item xs={4} className="propertyGridItem">
            Bajnoki címek száma
            <Divider variant="middle" className="dividerTeam" />
            {team.number_of_championships}
          </Grid>
        </Grid>
        <p className="subTitle">Versenyzők</p>

        <Grid
          container
          spacing={3}
          className="propertyGrid"
          style={{
            backgroundColor: `${hexRgb(team.team_color + "B3", {
              format: "css",
            })}`,
          }}
        >
          <Grid item xs={6} className="propertyGridItem">
            {drivers[0].name}
            <Divider variant="middle" className="dividerTeam" />
            <img
              src={drivers[0].images[1].image_url}
              alt="kep"
              style={{ height: "200px" }}
            />
          </Grid>
          <Grid item xs={6} className="propertyGridItem">
            {drivers[1].name}
            <Divider variant="middle" className="dividerTeam" />
            <img
              src={drivers[1].images[0].image_url}
              alt="kep"
              style={{ height: "200px" }}
            />
          </Grid>
        </Grid>
      </div>
    </Fragment>
  );
};

export const TeamLoader: LoaderFunction<typeof allDataType> = async ({
  params,
}) => {
  const team_url = "http://localhost:3000/api/v1/teams/" + params.slug;
  const images_url = "http://localhost:3000/api/v1/images/";
  const allData: typeof allDataType = {
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
    drivers: [],
    images: [],
  };
  await axios
    .get(team_url)
    .then((data) => {
      allData.team = data.data[0];
      allData.drivers = data.data[0].drivers;
      return data.data[0];
    })
    .then(async (data) => {
      let index = 0;
      await axios.get(images_url + data.slug).then((data) => {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        data.data.map((image: any) => {
          if (
            !image.attributes.image_url.includes("profile") &&
            !image.attributes.image_name.includes("car") &&
            !image.attributes.image_url.includes("helmet")
          ) {
            allData.images[index] = image.attributes;
            index++;
          }
        });
      });
    });
  return allData;
};

export default Team_singular;
