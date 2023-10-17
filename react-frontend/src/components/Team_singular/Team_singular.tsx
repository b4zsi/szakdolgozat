import { FC } from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import Divider from "@mui/material/Divider";
import { TeamModel } from "../../model/TeamModel";

type Team = {
  team: TeamModel;
};

const TeamSingular: FC<Team> = (team: Team) => {
  return (
    <div className="">
      <Card
        sx={{
          borderRadius: 7,
          position: "relative",
          margin: 1,
          height: 250,
          width: 250,
          padding: 0,
          backgroundColor: "rgba(300, 300,300, 0.7)",
        }}
      >
        <CardMedia
          style={{
            height: 180,
            width: 170,
            alignContent: "center",
            marginLeft: "15%",
            borderRadius: 5,
            position: "relative",
            top: 10,
          }}
          image={`data:image/jpeg;base64,${team.team.team_picture}`}
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
            {team.team.name}
          </Typography>
        </CardContent>
      </Card>
    </div>
  );
};

export default TeamSingular;
