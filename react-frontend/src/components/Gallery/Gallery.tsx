import React, { useState, memo } from "react";
import { ImageModel } from "../../model/ImageModel";
import axios from "axios";
import { Link, LoaderFunction, useLoaderData } from "react-router-dom";
import {
  Button,
  Card,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  FormControl,
  ImageList,
  ImageListItem,
  ImageListItemBar,
  InputLabel,
  MenuItem,
  Select,
  SelectChangeEvent,
  Switch,
  TextField,
} from "@mui/material";
import "../../styles/GalleryStyle.css";
import { TeamModel } from "../../model/TeamModel";
import getUser from "../userManagement";
import { UserModel } from "../../model/UserModel";

let allDataType: {
  teams: TeamModel[];
  images: ImageModel[];
  user: UserModel;
};

const Gallery = () => {
  const imageEventURL = "http://localhost:3000/api/v1/images";
  const jwt_token = localStorage.getItem("jwt");
  const itemData: typeof allDataType = useLoaderData() as {
    teams: TeamModel[];
    images: ImageModel[];
    user: UserModel;
  };
  const [teamFilter, setTeamFilter] = useState<string>("all");
  const [useFilter, setUseFilter] = useState<boolean>(false);
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const [user, setUser] = useState<UserModel | null>(itemData.user);
  const [open, setOpen] = useState(false);
  const [name, setName] = useState("");
  const [image, setImage] = useState("");
  const [base64Image, setBase64Image] = useState<string | ArrayBuffer | null>(
    ""
  );
  const [teamSlug, setTeamSlug] = useState<string>(itemData.teams[0].name);
  const [description, setDescription] = useState<string>("");

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleNameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setName(event.target.value);
  };
  const handleTeamChange = (event: SelectChangeEvent<string>) => {
    console.log(event.target.value);
    setTeamSlug(event.target.value);
  };
  const handledescriptionChange = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setDescription(event.target.value);
  };

  const handleImageChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const reader = new FileReader();
    setImage(URL.createObjectURL(event.target.files![0]));
    reader.onloadend = () => {
      console.log(reader.result);
      setBase64Image(reader.result);
    };
    reader.readAsDataURL(event.target.files![0]);
  };

  const handleSubmit = async () => {
    const imagesForm = new FormData();
    if (base64Image) {
      imagesForm.append("imagesForm[image_url]", base64Image.toString());
    }
    imagesForm.append("imagesForm[image_name]", name);
    imagesForm.append("imagesForm[team_slug]", teamSlug);
    imagesForm.append("imagesForm[description]", description);
    await fetch(imageEventURL, {
      method: "POST",
      headers: {
        Authorization: `${jwt_token}`,
      },
      body: imagesForm,
    })
      .then((response) => {
        if (response.ok) {
          setOpen(false);
        }
        console.log(response);
      })
      .catch((response: Response) => {
        response.json().then((data) => {
          console.log(data);
        });
      });
  };

  return !user ? (
    <div className="userOnly">
      <Card className="userOnlyCard">
        A galéria csak felhasználóknak elérhető.&emsp;
        <Link to="/login">Jelentkezz be</Link>&ensp;vagy ha még nincs fiókod,
        akkor&emsp;
        <Link to="/signup">regisztrálj</Link>!
      </Card>
    </div>
  ) : (
    <div className="wrapper">
      <div>
        <Dialog
          open={open}
          onClose={handleClose}
          aria-labelledby="form-dialog-title"
        >
          <DialogTitle id="form-dialog-title">Képfeltöltés</DialogTitle>
          <DialogContent>
            <TextField
              required
              autoFocus
              margin="dense"
              id="name"
              label="Kép neve"
              type="text"
              fullWidth
              value={name}
              onChange={handleNameChange}
            />
            <input
              required
              accept="image/*"
              style={{ display: "none" }}
              id="raised-button-file"
              type="file"
              onChange={handleImageChange}
            />
            <Select
              required
              autoFocus
              margin="dense"
              id="team_slug"
              label="Csapat"
              type="text"
              fullWidth
              value={teamSlug}
              onChange={handleTeamChange}
            >
              {itemData.teams.map((team: TeamModel) => (
                <MenuItem value={team.slug} key={team.slug}>
                  {team.name}
                </MenuItem>
              ))}
            </Select>
            <TextField
              required
              autoFocus
              margin="dense"
              id="description"
              label="Képleírás"
              type="text"
              fullWidth
              value={description}
              onChange={handledescriptionChange}
              maxRows={2}
            />
            <label htmlFor="raised-button-file">
              <Button variant="contained" component="span">
                Kép feltöltés
              </Button>
            </label>
            {image && <img src={`${image}`} alt="Preview" />}
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose} color="primary">
              Mégse
            </Button>
            <Button onClick={handleSubmit} color="primary">
              Feltöltés
            </Button>
          </DialogActions>
        </Dialog>
      </div>
      <Button variant="contained" color="primary" onClick={handleClickOpen}>
        Kép hozzáadása
      </Button>
      <div className="filterSwitch">
        Szűrők:
        <Switch
          defaultChecked={false}
          onClick={() => {
            setUseFilter(!useFilter);
          }}
        />
      </div>

      {useFilter && (
        <div>
          <FormControl>
            <InputLabel id="csapat-select-label">Csapat</InputLabel>
            <Select
              style={{
                color: "black",
                backgroundColor: "white",
                width: "220px",
              }}
              id="csapat-select"
              label="csapat"
              defaultValue={itemData.teams[0].name}
              value={teamFilter}
              onChange={(data) => {
                setTeamFilter(data.target.value);
              }}
            >
              {itemData.teams.map((team: TeamModel) => (
                <MenuItem value={team.slug} key={team.id}>
                  {team.name}
                </MenuItem>
              ))}
            </Select>
          </FormControl>
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
        <MemoImageList
          itemDataImages={itemData.images}
          teamFilter={teamFilter}
        />
      </div>
    </div>
  );
};

export const GalleryLoader: LoaderFunction<ImageModel[]> = async () => {
  const images_url = "http://localhost:3000/api/v1/images/";
  const team_url = "http://localhost:3000/api/v1/teams/";
  const allData: typeof allDataType = {
    teams: [],
    images: [],
    user: {
      id: 0,
      email: "",
      admin: false,
      username: "",
      keresztnev: "",
      vezeteknev: "",
      fav_team: "",
      fav_driver: "",
    },
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
    })
    .then(async () => {
      getUser().then((data) => {
        allData.user = data!;
      });
    });
  return allData;
};

const MemoImageList = memo(function listImages({
  itemDataImages,
  teamFilter,
}: {
  itemDataImages: ImageModel[];
  teamFilter: string;
}) {
  return (
    <ImageList rowHeight={480} className="galleryList" cols={4}>
      {itemDataImages
        .filter((image: ImageModel) => {
          if (teamFilter === "all") {
            return itemDataImages.map(
              (image2: ImageModel) => image2.team_slug === image.team_slug
            );
          } else {
            return teamFilter === image.team_slug;
          }
        })
        .map((image: ImageModel) => (
          <ImageListItem key={image.id} className="galleryItem">
            <img
              src={`data:image/jpeg;base64, ${image.image_url}`}
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
  );
});

export default Gallery;
