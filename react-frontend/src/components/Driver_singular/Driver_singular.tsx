import { FC } from "react";
import { DriverModel } from "../../model/DriverModel";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import Divider from "@mui/material/Divider";
import "../../styles/driver_singularStyle.css";

type Driver = {
  properties: DriverModel;
  team_color: string;
  team_id: number;
};

const Driver_Singular: FC<Driver> = (driver: Driver) => {
  return (
    <div>
      <Card sx={{ border: `2px solid #${driver.team_color}` }} className="card">
        <CardMedia
          image={`data:image/jpeg;base64,${driver.properties.profile_picture}`}
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

export default Driver_Singular;
