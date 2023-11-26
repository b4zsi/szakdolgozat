import { FC } from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import Divider from "@mui/material/Divider";
import { TeamModel } from "../../model/TeamModel";
import hexRgb from "hex-rgb";
import "../../styles/teamsStyle.css";

type Team = {
  properties: TeamModel;
};

const Teams: FC<Team> = (team: Team) => {
  return (
    <div>
      <Card
        sx={{
          backgroundColor: `${hexRgb(team.properties.team_color + "B3", {
            format: "css",
          })}`,
        }}
        className="cardContainer"
      >
        <CardMedia className="card-media" title="drivers">
          <img
            src={`data:image/jpeg;base64,${team.properties.team_picture}`}
            alt="kep"
            className="card-image"
          />
        </CardMedia>
        <CardContent>
          <Divider variant="middle" style={{ height: 2 }} />
          <Typography
            gutterBottom
            component="div"
            style={{
              textAlign: "center",
              margin: 0,
              padding: 0,
              fontSize: "0.75em",
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

export default Teams;
