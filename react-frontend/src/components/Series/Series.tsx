import { Fragment, useContext, useEffect, useState } from "react";
import axios from "axios";
import { SeriesModel } from "../../model/SeriesModel";
import { DriverModel } from "../../model/DriverModel";
import "../../styles/seriesStyle.css";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import { Box, ImageList, Typography } from "@mui/material";
import Drivers from "../Drivers/Drivers";
import { TeamModel } from "../../model/TeamModel";
import Teams from "../Teams/Teams";
import "../../styles/loadingAnimation.css";
import { ImageModel } from "../../model/ImageModel";
import SeriesStats from "../SeriesStats/SeriesStats";
import { Link, useNavigate } from "react-router-dom";
import { IsLoadingGlobalState } from "../LoadingContextProvider";

const series_number: number = parseInt(document.URL.split("/")[4]);

const series_url = "http://localhost:3000/api/v1/series/" + series_number;

const drivers_url = "http://localhost:3000/api/v1/drivers/" + series_number;

const teams_url = "http://localhost:3000/api/v1/teams/" + series_number;

const images_url = "http://localhost:3000/api/v1/images";

const Series = () => {
  console.log(series_number);
  let navigate = useNavigate();
  let seriesType: SeriesModel = {
    id: 0,
    name: "",
    number_of_races: 0,
    number_of_drivers: 0,
    number_of_teams: 0,
    slug: "",
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
      team_slug: "",
      team_id: 0,
      slug: "",
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
      slug: "",
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
  const { isPageLoading, setIsPageLoading } = useContext(IsLoadingGlobalState);

  useEffect(() => {
    const fetchData = async () => {
      await axios
        .get(series_url)
        .then((data) => {
          setSeries(data.data);
        })
        .catch(() => navigate("/"));
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
  }, [navigate]);
  return isPageLoading ? (
    <Fragment>
      <div className="text">betöltés...</div>
      <div className="loader"></div>
    </Fragment>
  ) : (
    <Fragment>
      <div className="background">
        <img
          src={`data:image/jpeg;base64,${images[series_number - 1].image_url}`}
          alt="kep"
          className="image"
        />
        <Box sx={{ marginTop: 35 }}>
          <SeriesStats properties={series} />
        </Box>
        <Box sx={{ margin: 5 }}>
          <Typography variant="h2" className="title">
            Versenyzők
          </Typography>
          <Paper
            variant="outlined"
            style={{ background: "transparent", marginTop: 15 }}
          >
            <Grid
              container
              spacing={2}
              alignItems={"center"}
              justifyContent={"center"}
              wrap="nowrap"
              className="driverGrid"
            >
              <div className="oneLineDiv">
                <ImageList className="imageList">
                  {drivers.map((item: DriverModel) => (
                    <Link
                      to={`/drivers/${item.slug}`}
                      key={item.name}
                      className="driverLink"
                      onClick={() => {
                        setIsPageLoading(true);
                      }}
                    >
                      <Drivers
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
                      />
                    </Link>
                  ))}
                </ImageList>
              </div>
            </Grid>
          </Paper>
        </Box>
        <Box sx={{ margin: 5, zIndex: 3 }}>
          <Typography variant="h2" className="title">
            Csapatok
          </Typography>
          <Paper
            variant="outlined"
            style={{
              background: "transparent",
              marginTop: 15,
            }}
          >
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
                    <Link
                      to={`/teams/${item.slug}`}
                      key={item.name}
                      className="driverLink"
                    >
                      <Teams properties={item} />
                    </Link>
                  ))}
                </ImageList>
              </div>
            </Grid>
          </Paper>
        </Box>
      </div>
    </Fragment>
  );
};

export default Series;
