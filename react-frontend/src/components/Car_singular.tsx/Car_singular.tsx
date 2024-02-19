import "./Car_singular.css";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import { CarModel } from "../../model/CarModel";
import axios from "axios";
import { Card, CardContent, Divider, Grid } from "@mui/material";
import { getCars } from "../../api_links";
import { carInterface } from "../../interface/carInterface";

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
          <Grid container direction="column" spacing={3} minHeight={600}>
            <Grid item>
              <Card className="carCard left">
                <p className="cardTitle">Motor</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent">{car.engine}</CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="carCard left">
                <p className="cardTitle">Lóerő</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent number">
                  {car.horsepower} HP
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="carCard left">
                <p className="cardTitle">Üzemanyag</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent">{car.fuel}</CardContent>
              </Card>
            </Grid>
          </Grid>
        </Grid>
        <Grid xs={6}>
          <Grid item>
            <img
              src={`${car.images[0].image_url}`}
              alt="autó"
              width={740}
              className="carImage"
            />
          </Grid>
        </Grid>
        <Grid item xs={3}>
          <Grid container direction="column" spacing={3} minHeight={600}>
            <Grid item>
              <Card className="carCard right">
                <p className="cardTitle">Győzelmek</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent number">
                  {car.races_won}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="carCard right">
                <p className="cardTitle">Pódiumok</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent number">
                  {car.podiums}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="carCard right">
                <p className="cardTitle">Pole pozíciók</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent number">
                  {car.pole_positions}
                </CardContent>
              </Card>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
      <Card className="carCard carDescription">
        <CardContent className="cardContent">{car.description}</CardContent>
      </Card>
    </div>
  );
}

export const CarLoader: LoaderFunction<typeof allDataType> = async ({
  params,
}) => {
  const allData: typeof allDataType = {
    car: carInterface,
  };
  await axios.get(getCars + params.id).then((data) => {
    allData.car = data.data[0];
  });
  return allData;
};

export default Car_singular;
