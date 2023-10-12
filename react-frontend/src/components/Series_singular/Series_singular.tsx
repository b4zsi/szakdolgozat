import React from "react";
import { DriverModel } from "../../model/DriverModel";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";

type Driver = {
  driver: DriverModel;
};

const SeriesSingular: React.FC<Driver> = (driver: Driver) => {
  return (
    <div className="">
      <Card
        sx={{ maxWidth: 345, borderRadius: 10, position: "relative", top: 100 }}
      >
        <CardMedia
          sx={{ height: 140 }}
          image="/static/images/cards/contemplative-reptile.jpg"
          title="green iguana"
        />
        <CardContent>
          <Typography gutterBottom variant="h5" component="div">
            {driver.driver.name}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Lizards are a widespread group of squamate reptiles, with over 6,000
            species, ranging across all continents except Antarctica
          </Typography>
        </CardContent>
      </Card>
    </div>
  );
};

export default SeriesSingular;
