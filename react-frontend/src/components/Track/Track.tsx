import React from "react";
import { Card, CardContent, Divider, Grid } from "@mui/material";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import { TrackModel } from "../../model/TrackModel";
import "../../styles/TrackStyle.css";
import axios from "axios";

let allDataType: {
  track: TrackModel;
};
function Track() {
  const data: typeof allDataType = useLoaderData() as {
    track: TrackModel;
  };
  const track: TrackModel = data.track;
  console.log(track.images[0].image_url);
  return (
    <div className="mainTrackDiv">
      <Grid container spacing={3}>
        <Grid item xs={3}>
          <Grid container direction="column" spacing={3} maxHeight={900}>
            <Grid item>
              <Card className="trackCard left">
                <p className="cardTitle">Név</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent">{track.name}</CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="trackCard left">
                <p className="cardTitle">Pálya hossz</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent number">
                  {track.length} méter
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="trackCard left">
                <p className="cardTitle">Város</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent">{track.city}</CardContent>
              </Card>
            </Grid>
          </Grid>
        </Grid>
        <Grid item xs={6} container className="imageContainer">
          <img
            src={track.images[0].image_url}
            alt="trackImage"
            width={650}
            height={550}
            className="trackImage"
          />
        </Grid>
        <Grid item xs={3}>
          <Grid container direction="column" spacing={3} minHeight={600}>
            <Grid item>
              <Card className="trackCard right">
                <p className="cardTitle">Ország</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent">
                  {track.country}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="trackCard right">
                <p className="cardTitle">Pályacsúcs</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent">
                  {Math.floor(track.lap_record_in_seconds / 60)} perc{" "}
                  {(
                    track.lap_record_in_seconds -
                    Math.floor(track.lap_record_in_seconds / 60) * 60
                  ).toPrecision(5)}{" "}
                  másodperc{<br />}
                  {track.lap_record}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className="trackCard right">
                <p className="cardTitle">Kanyarok száma</p>
                <Divider variant="middle" className="divider" />
                <CardContent className="cardContent number">
                  {track.turns}
                </CardContent>
              </Card>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
      <Card className="description">
        <CardContent className="cardContent">{track.description}</CardContent>
      </Card>
    </div>
  );
}

export const TrackLoader: LoaderFunction<typeof allDataType> = async ({
  params,
}) => {
  const allData: typeof allDataType = {
    track: {
      id: 1,
      name: "Hungaroring",
      length: 4381,
      city: "Mogyoród",
      country: "Magyarország",
      lap_record: "Lewis Hamilton",
      turns: 14,
      description: "",
      images: [],
      slug: "",
      lap_record_in_seconds: 0,
    },
  };
  await axios
    .get("http://localhost:3000/api/v1/tracks/" + params.id)
    .then((data) => {
      allData.track = data.data[0];
    });
  return allData;
};

export default Track;
