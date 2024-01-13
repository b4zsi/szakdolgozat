import React from "react";
import "./Car_singular.css";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import { CarModel } from "../../model/CarModel";
import axios from "axios";
import { Card, CardContent, Grid } from "@mui/material";

let allDataType: {
  car: CarModel;
};

function Car_singular() {
  const data: typeof allDataType = useLoaderData() as {
    car: CarModel;
  };
  const car: CarModel = data.car;
  console.log(car);
  return (
    <div className="mainCarDiv">
      <Grid container spacing={3}>
        <Grid item xs={3}>
          <Grid container direction="column" spacing={3} maxHeight={900}>
            <Grid item>
              <Card className="carCard">
                <p className="cardTitle">Motor</p>
                <CardContent className="cardContent">{car.engine}</CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="carCard">
                <p className="cardTitle">Lóerő</p>
                <CardContent className="cardContent">
                  {car.horsepower} HP
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="carCard">
                <p className="cardTitle">Üzemanyag</p>
                <CardContent className="cardContent">{car.fuel}</CardContent>
              </Card>
            </Grid>
          </Grid>
        </Grid>
        <Grid xs={6} direction="column" spacing={3}>
          <Grid item>
            <img
              src={`${car.images[0].image_url}`}
              alt="autó"
              width={740}
              className="carImage"
            />
          </Grid>
          <Grid item style={{}}>
            <Card className="carCard" style={{ width: "80%" }}>
              <p className="cardTitle">Leírás</p>
              <CardContent className="cardContent">
                {car.description}
              </CardContent>
            </Card>
          </Grid>
        </Grid>
        <Grid item xs={3}>
          <Grid container direction="column" spacing={3} minHeight={600}>
            <Grid item>
              <Card className="carCard">
                <p className="cardTitle">Győzelmek</p>
                <CardContent className="cardContent">
                  {car.races_won}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="carCard">
                <p className="cardTitle">Pódiumok</p>
                <CardContent className="cardContent">{car.podiums}</CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="carCard">
                <p className="cardTitle">Pole pozíciók</p>
                <CardContent className="cardContent">
                  {car.pole_positions}
                </CardContent>
              </Card>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    </div>
  );
}

export const CarLoader: LoaderFunction<typeof allDataType> = async ({
  params,
}) => {
  const allData: typeof allDataType = {
    car: {
      id: 0,
      team_slug: "",
      images: [],
      engine: "",
      battery: "",
      chassis: "",
      races_won: 0,
      pole_positions: 0,
      podiums: 0,
      horsepower: 0,
      fuel: "",
      description: "",
    },
  };
  await axios
    .get("http://localhost:3000/api/v1/cars/" + params.id)
    .then((data) => {
      allData.car = data.data[0];
    });
  return allData;
};

export default Car_singular;

//racetracks database
//id
//name
//country
//city
//length
//turns
//description
//lap_record
//lap_record_driver
//first_gp
//street_circuit
