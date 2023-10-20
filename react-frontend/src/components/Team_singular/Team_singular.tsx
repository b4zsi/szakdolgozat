import { FC } from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import Divider from "@mui/material/Divider";
import { TeamModel } from "../../model/TeamModel";
import hexRgb from "hex-rgb";
import "../../styles/team_singularStyle.css";

type Team = {
  properties: TeamModel;
};

const TeamSingular: FC<Team> = (team: Team) => {
  return (
    <div className="">
      <Card
        sx={{
          borderRadius: 7,
          position: "relative",
          margin: 1,
          height: "35vh",
          width: 250,
          padding: 0,
          backgroundColor: `${hexRgb(team.properties.team_color + "B3", {
            format: "css",
          })}`,
          backgroundSize: "cover",
          color: "white",
        }}
      >
        <CardMedia
          className="card-media"
          image={`data:image/jpeg;base64,${team.properties.team_picture}`}
          title="drivers"
        />
        <CardContent>
          <Divider variant="middle" style={{ height: 2 }} />
          <Typography
            gutterBottom
            component="div"
            style={{
              textAlign: "center",
              margin: 0,
              padding: 0,
              fontSize: "1.3em",
              fontFamily: "Monaco",
            }}
          >
            {team.properties.name}
          </Typography>
        </CardContent>
      </Card>
    </div>
  );
};

export default TeamSingular;
