import React, { Fragment, useState } from "react";
import { ImageModel } from "../../model/ImageModel";
import axios from "axios";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import {
  Button,
  ImageList,
  ImageListItem,
  ImageListItemBar,
  Switch,
} from "@mui/material";
import "../../styles/GalleryStyle.css";
import { TeamModel } from "../../model/TeamModel";

let allDataType: {
  teams: TeamModel[];
  images: ImageModel[];
};

function Gallery() {
  const itemData: typeof allDataType = useLoaderData() as {
    teams: TeamModel[];
    images: ImageModel[];
  };
  const [teamFilter, setTeamFilter] = useState<string>("all");
  const [useFilter, setUseFilter] = useState<boolean>(false);

  return (
    <Fragment>
      <Switch
        title="hello"
        onClick={() => {
          setUseFilter(!useFilter);
        }}
        className="filterSwitch"
      />
      {useFilter && (
        <div>
          csapat
          {itemData.teams.map((team: TeamModel) => (
            <Button
              className="teamFilterButton"
              key={team.id}
              variant="contained"
              onClick={() => {
                setTeamFilter(team.slug);
              }}
            >
              {team.name}
            </Button>
          ))}
          <Button
            className="filterRemoveButton"
            variant="text"
            onClick={() => {
              setTeamFilter("all");
            }}
          >
            Szűrők törlése
          </Button>
        </div>
      )}
      <div className="root">
        <ImageList rowHeight={480} className="galleryList" cols={4}>
          {itemData.images
            .filter((image: ImageModel) => {
              if (teamFilter === "all") {
                return itemData.images.map(
                  (image2: ImageModel) => image2.team_slug === image.team_slug
                );
              } else {
                return teamFilter === image.team_slug;
              }
            })
            .map((image: ImageModel) => (
              <ImageListItem key={image.id} className="galleryItem">
                <img
                  src={`data:image/jpeg;base64,${image.image_url}`}
                  alt={image.image_name}
                  className="galleryImage"
                />
                <ImageListItemBar
                  title={image.image_name}
                  subtitle={<span>{image.description}</span>}
                />
              </ImageListItem>
            ))}
        </ImageList>
      </div>
    </Fragment>
  );
}

export const GalleryLoader: LoaderFunction<ImageModel[]> = async () => {
  const images_url = "http://localhost:3000/api/v1/images/";
  const team_url = "http://localhost:3000/api/v1/teams/";
  const allData: typeof allDataType = {
    teams: [],
    images: [],
  };

  await axios
    .get(images_url, {
      maxContentLength: 10000,
      maxBodyLength: 10000,
      responseType: "json",
    })
    .then((data) => {
      data.data.map((image: ImageModel) => {
        if (image.id > 3) {
          allData.images.push(image);
        }
      });
    })
    .then(async () => {
      await axios.get(team_url).then((data) => {
        allData.teams = data.data;
      });
    });
  return allData;
};

export default Gallery;
