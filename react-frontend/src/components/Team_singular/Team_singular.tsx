import React, { Fragment, useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { TeamModel } from "../../model/TeamModel";
import axios from "axios";
import "../../styles/loadingAnimation.css";
import "../../styles/Team_singular.css";
import hexRgb from "hex-rgb";
import { Divider, Grid, Paper } from "@mui/material";
import { ImageModel } from "../../model/ImageModel";
import Slider from "../imageSlider/imageSlider";
import {
  Animator,
  FadeIn,
  MoveIn,
  ScrollContainer,
  ScrollPage,
  Sticky,
  StickyIn,
  StickyOut,
  ZoomIn,
  batch,
} from "react-scroll-motion";
import Loader from "../loader";

const team_slug: string = document.URL.split("/")[4];
const team_url = "http://localhost:3000/api/v1/teams/" + team_slug;
const images_url = "http://localhost:3000/api/v1/images/";

const Team_singular = () => {
  let imageType: ImageModel[] = [
    {
      id: 0,
      image_url: "",
      image_name: "",
      team_slug: "",
    },
  ];
  let teamType: TeamModel = {
    id: 0,
    name: "",
    number_of_championships: 0,
    number_of_races: 0,
    headquarters_city: "",
    date_of_establishment: 0,
    technical_director: "",
    first_win: 0,
    last_championship_win: 0,
    series_id: 0,
    team_color: "",
    team_picture: "",
    slug: "",
  };
  const [isPageLoading, setIsPageLoading] = useState(true);
  const [team, setTeam] = useState(teamType);
  const [images, setImages] = useState(imageType);
  let navigate = useNavigate();

  if (team_slug.match(/[1-9]/g)) {
    window.location.reload();
  }
  useEffect(() => {
    const fetchData = async () => {
      await axios
        .get(team_url)
        .then((data) => {
          setTeam(data.data[0]);
          return data.data[0].slug;
        })
        .then(async (slug) => {
          await axios.get(images_url + slug).then((data) => {
            setImages(data.data);
          });
        })
        .catch(() => navigate("/"));
    };
    fetchData().then(() => setIsPageLoading(false));
  }, [navigate]);
  return isPageLoading ? (
    <Loader />
  ) : (
    <Fragment>
      <div className="backgroundStuffTeam">
        <Slider images={images} team_name={team.name} />
      </div>
      <div
        className="mainDivTeam"
        style={{
          backgroundColor: `${hexRgb(team.team_color + "00", {
            format: "css",
          })}`,
          zIndex: -1,
          marginTop: "42%",
          height: "125vh",
        }}
      >
        <p className="subTitle">Tudnivalók</p>
        <Grid
          container
          spacing={3}
          className="propertyGrid"
          style={{
            backgroundColor: `${hexRgb(team.team_color + "B3", {
              format: "css",
            })}`,
          }}
        >
          <Grid item xs={4} className="propertyGridItem">
            Megalakulás éve
            <Divider variant="middle" className="dividerTeam" />
            {team.date_of_establishment}
          </Grid>
          <Grid item xs={4} className="propertyGridItem">
            Telephely
            <Divider variant="middle" className="dividerTeam" />
            {team.headquarters_city}
          </Grid>
          <Grid item xs={4} className="propertyGridItem">
            Első győzelem
            <Divider variant="middle" className="dividerTeam" />
            {team.first_win}
          </Grid>
          <Grid item xs={4} className="propertyGridItem">
            Utolsó bajnoki cím
            <Divider variant="middle" className="dividerTeam" />
            {team.last_championship_win}
          </Grid>
          <Grid item xs={4} className="propertyGridItem">
            Rajtok száma
            <Divider variant="middle" className="dividerTeam" />
            {team.number_of_races}
          </Grid>
          <Grid item xs={4} className="propertyGridItem">
            Bajnoki címek száma
            <Divider variant="middle" className="dividerTeam" />
            {team.number_of_championships}
          </Grid>
        </Grid>
        <p className="subTitle">Versenyzők</p>
      </div>
    </Fragment>
  );
};

export default Team_singular;
