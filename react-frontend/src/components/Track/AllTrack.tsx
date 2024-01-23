import axios from "axios";
import React from "react";
import { Link, LoaderFunction, useLoaderData } from "react-router-dom";
import { TrackModel } from "../../model/TrackModel";
import { Card, Divider, Grid } from "@mui/material";
import "../../styles/AllTrackStyle.css";

let allDataType: {
  tracks: TrackModel[];
};

function AllTrack() {
  const data: typeof allDataType = useLoaderData() as {
    tracks: TrackModel[];
  };
  const tracks: TrackModel[] = data.tracks;
  return (
    <div className="tracksMainDiv">
      <Grid
        container
        direction="row"
        justifyContent="center"
        style={{ alignContent: "center", marginLeft: "5vw" }}
        alignItems={"center"}
      >
        {tracks.map((track: TrackModel) => {
          return (
            <Grid key={track.id} item xs={4}>
              <Card className="AllTrackCard">
                <Link to={`/tracks/${track.id}`}>
                  <div className="textTrack">{track.name}</div>
                  <Divider variant="middle" className="divider" />
                  <div className="textTrack">{track.city}</div>
                  <Divider variant="middle" className="divider" />
                  <div className="textTrack">{track.country}</div>
                </Link>
              </Card>
            </Grid>
          );
        })}
      </Grid>
    </div>
  );
}

export const AllTrackLoader: LoaderFunction<typeof allDataType> = async () => {
  const allData: typeof allDataType = {
    tracks: [],
  };
  await axios.get("http://localhost:3000/api/v1/tracks").then((data) => {
    allData.tracks = data.data;
  });
  return allData;
};

export default AllTrack;
