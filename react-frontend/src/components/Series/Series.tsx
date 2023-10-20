import { Fragment, useEffect, useState } from "react";
import axios from "axios";
import { SeriesModel } from "../../model/SeriesModel";
import { DriverModel } from "../../model/DriverModel";
import ResponsiveAppBar from "../navbar/navbar";
import "./seriesStyle.css";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import { Box, ImageList, Typography } from "@mui/material";
import DriverSingular from "../Driver_singular/Driver_singular";
import { TeamModel } from "../../model/TeamModel";
import TeamSingular from "../Team_singular/Team_singular";
import "../../styles/loadingAnimation.css";
import { ImageModel } from "../../model/ImageModel";
import SeriesStats from "../SeriesStats/SeriesStats";

const series_number: number = parseInt(document.URL.split("/")[4]);

const series_url = "http://localhost:3000/api/v1/series/" + series_number;

const drivers_url = "http://localhost:3000/api/v1/drivers/" + series_number;

const teams_url = "http://localhost:3000/api/v1/teams/" + series_number;

const images_url = "http://localhost:3000/api/v1/images";

const Series = () => {
  let seriesType: SeriesModel = {
    id: 0,
    name: "",
    number_of_races: 0,
    number_of_drivers: 0,
    number_of_teams: 0,
  };

  let driverType: DriverModel[] = [
    {
      id: 0,
      name: "",
      age: 0,
      nationality: "",
      number_of_wins: 0,
      number_of_podiums: 0,
      description: "",
      profile_picture: "",
      series_id: 0,
      team_id: 0,
    },
  ];
  let teamType: TeamModel[] = [
    {
      id: 0,
      name: "",
      number_of_championships: 0,
      number_of_races: 0,
      headquarters_city: "",
      technical_director: "",
      first_win: 0,
      last_championship_win: 0,
      date_of_establishment: 0,
      series_id: 1,
      team_picture: "",
      team_color: "ffffff",
    },
  ];
  let imageType: ImageModel[] = [
    {
      id: 0,
      image_name: "",
      image_url: "",
    },
  ];

  const [series, setSeries] = useState(seriesType);
  const [drivers, setDrivers] = useState(driverType);
  const [teams, setTeams] = useState(teamType);
  const [images, setImages] = useState(imageType);
  const [isPageLoading, setIsPageLoading] = useState(true);

  useEffect(() => {
    const fetchData = async () => {
      await axios.get(series_url).then((data) => {
        setSeries(data.data);
      });
      await axios.get(drivers_url).then((data) => {
        setDrivers(data.data);
      });
      await axios.get(teams_url).then((data) => {
        setTeams(data.data);
      });
      await axios.get(images_url).then((data) => {
        setImages(data.data);
      });
    };
    fetchData().then(() => setIsPageLoading(false));
  }, []);
  return isPageLoading ? (
    <Fragment>
      <div className="text">betöltés...</div>
      <div className="loader"></div>
    </Fragment>
  ) : (
    <Fragment>
      <div>
        <ResponsiveAppBar />
        <img
          src={`data:image/jpeg;base64,${images[series_number - 1].image_url}`}
          alt="kep"
          className="image"
        />
        <Box sx={{ margin: 5, marginTop: 30 }}>
          <Typography variant="h1" className="title">
            Versenyzők
          </Typography>
          <Paper variant="outlined">
            <Grid
              container
              spacing={2}
              alignItems={"center"}
              justifyContent={"center"}
              wrap="nowrap"
            >
              <div className="oneLineDiv">
                <ImageList className="imageList">
                  {drivers.map((item: DriverModel) => (
                    <DriverSingular
                      properties={item}
                      team_color={
                        series.id === 1
                          ? teams[item.team_id - 1].team_color
                          : series.id === 2
                          ? teams[item.team_id - 11].team_color
                          : series.id === 3
                          ? teams[item.team_id - 22].team_color
                          : teams[0].team_color
                      }
                      team_id={item.team_id}
                      key={item.name}
                    />
                  ))}
                </ImageList>
              </div>
            </Grid>
          </Paper>
        </Box>
        <Box sx={{ margin: 5 }}>
          <Typography variant="h1" className="title">
            Csapatok
          </Typography>
          <Paper variant="outlined">
            <Grid
              container
              spacing={2}
              alignItems={"center"}
              justifyContent={"center"}
              wrap="nowrap"
            >
              <div className="oneLineDiv">
                <ImageList className="imageList">
                  {teams.map((item: TeamModel) => (
                    <TeamSingular properties={item} key={item.name} />
                  ))}
                </ImageList>
              </div>
            </Grid>
          </Paper>
        </Box>
        <Box>
          <SeriesStats properties={series} />
        </Box>
      </div>
    </Fragment>
  );
};

export default Series;
