import { FC } from "react";
import { DriverModel } from "../../model/DriverModel";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import Divider from "@mui/material/Divider";
import "../../styles/DriverStyle.css";
import { ImageModel } from "../../model/ImageModel";

type Driver = {
  properties: DriverModel;
  team_color: string;
  team_id: number;
};

const Drivers: FC<Driver> = (driver: Driver) => {
  driver.properties.images.sort((a: ImageModel, b: ImageModel) => {
    return a.id - b.id;
  });
  return (
    <div style={{ borderRadius: 100 }}>
      <Card sx={{ border: `2px solid #${driver.team_color}` }} className="card">
        <CardMedia
          image={`${driver.properties.images[0].image_url}`}
          title="drivers"
          className="cardMedia"
        />
        <CardContent>
          <Divider variant="middle" style={{ height: 2 }} />
          <Typography gutterBottom component="div" className="name">
            {driver.properties.name}
          </Typography>
        </CardContent>
      </Card>
    </div>
  );
};

export default Drivers;
