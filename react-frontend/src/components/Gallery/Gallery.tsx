import React, { useState } from "react";
import { ImageModel } from "../../model/ImageModel";
import axios from "axios";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import {
  Button,
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
import styles from "../../styles/GalleryStyle.module.css";
import { TeamModel } from "../../model/TeamModel";
import getUser from "../userManagement";
import { UserModel } from "../../model/UserModel";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import {
  getCars,
  getDrivers,
  getImages,
  getTeams,
  getTracks,
} from "../../api_links";
import { userInterface } from "../../interface/userInterface";
import { DriverModel } from "../../model/DriverModel";
import { CarModel } from "../../model/CarModel";
import { TrackModel } from "../../model/TrackModel";

let allDataType: {
  teams: TeamModel[];
  drivers: DriverModel[];
  cars: CarModel[];
  tracks: TrackModel[];
  images: ImageModel[];
  user: UserModel;
};

const Gallery = () => {
  const jwt_token = localStorage.getItem("jwt");
  const itemData: typeof allDataType = useLoaderData() as {
    teams: TeamModel[];
    drivers: DriverModel[];
    cars: CarModel[];
    tracks: TrackModel[];
    images: ImageModel[];
    user: UserModel;
  };
  const [teamFilter, setTeamFilter] = useState<string>("all");
  const [useFilter, setUseFilter] = useState<boolean>(false);
  const [open, setOpen] = useState(false);
  const [name, setName] = useState("");
  const [image, setImage] = useState("");
  const [base64Image, setBase64Image] = useState<File>();
  const [teamSlug, setTeamSlug] = useState<string>(itemData.teams[0].slug);
  const [driverSlug, setDriverSlug] = useState<string>(
    itemData.drivers[0].slug
  );
  const [track, setTrack] = useState<string>("");
  const [description, setDescription] = useState<string>("");
  const [imageValue, setImageValue] = useState<string>("other");
  const [filename, setFilename] = useState<string>("");
  const options = [
    { name: "Versenyző profil", value: "driver" },
    { name: "Versenyző sisak", value: "helmet" },
    { name: "Csapat logó", value: "logo" },
    { name: "Egyéb", value: "other" },
    { name: "Autó", value: "car" },
    { name: "Pálya", value: "track" },
  ];

  const handleClickOpen = () => {
    setOpen(true);
  };
  const findDriver = (driverSlug: string): DriverModel => {
    let a: DriverModel | undefined = undefined;
    itemData.drivers.map((driver) => {
      if (driver.slug === driverSlug) {
        a = driver;
      } else {
        return undefined;
      }
    });
    return a as unknown as DriverModel;
  };
  const findTeam = (): TeamModel => {
    let a: TeamModel | undefined = undefined;
    itemData.teams.map((team) => {
      if (team.slug === teamSlug) {
        a = team;
      } else {
        return undefined;
      }
    });
    return a as unknown as TeamModel;
  };
  const findLogo = (): number => {
    findTeam().images.map((image) => {
      if (image.image_url.includes(teamSlug + "-profile")) {
        return image.id;
      }
    });
    return 0;
  };
  const findImage = (images: ImageModel[], a: string): number => {
    images.map((image) => {
      if (image.image_url.includes(a)) {
        return image.id;
      }
    });
    return 0;
  };
  const findCar = (teamSlug: string): CarModel | undefined => {
    itemData.cars.map((car) => {
      if (car.team_slug === teamSlug) {
        return car;
      }
    });
    return undefined;
  };
  const findTrack = (trackSlug: string): TrackModel | undefined => {
    itemData.tracks.map((track) => {
      if (track.slug === trackSlug) {
        return track;
      }
    });
    return undefined;
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleNameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setName(event.target.value);
  };
  const handleTeamChange = (event: SelectChangeEvent<string>) => {
    setTeamSlug(event.target.value);
  };
  const handleDriverChange = (event: SelectChangeEvent<string>) => {
    setDriverSlug(event.target.value);
  };
  const handledescriptionChange = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setDescription(event.target.value);
  };
  const handleImageChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setImage(URL.createObjectURL(event.target.files![0]));
    setBase64Image(event.target.files![0]);
  };
  const handleValueChange = (event: SelectChangeEvent<string>) => {
    setImageValue(event.target.value);
  };
  const handleTrackChange = (event: SelectChangeEvent<string>) => {
    setTrack(event.target.value);
  };

  const handleSubmit = async (event: React.MouseEvent) => {
    event.preventDefault();
    const formData = new FormData();

    if (imageValue === "driver") {
      setName(driverSlug);
      console.log(findDriver(driverSlug));
      setTeamSlug(findDriver(driverSlug)!.team_slug);
      setFilename(driverSlug + "-profile");
    } else if (imageValue === "helmet") {
      setName(driverSlug);
      setTeamSlug(findDriver(driverSlug)!.team_slug);
      setFilename(driverSlug + "-profile");
    } else if (imageValue === "car") {
      setName(teamSlug + "-car");
      setFilename(teamSlug + "-car");
    } else if (imageValue === "team") {
      setName(teamSlug);
    } else if (imageValue === "logo") {
      setName(teamSlug);
      setFilename(teamSlug + "-profile");
    }

    formData.append("imagesForm[image_name]", name);
    formData.append("imagesForm[team_slug]", teamSlug);
    formData.append("imagesForm[description]", description);
    formData.append("imagesForm[image]", base64Image!);
    formData.append("imagesForm[filename]", filename);

    console.log(findDriver(driverSlug)!.images);
    if (imageValue === "driver" || imageValue === "helmet") {
      if (findDriver(driverSlug)!.images.length > 0) {
        await fetch(
          getImages +
            findDriver(driverSlug)!.images[
              findImage(findDriver(driverSlug)!.images, "profile")
            ].id,
          {
            method: "DELETE",
            headers: {
              "Content-Type": "application/json",
              Authorization: `${jwt_token}`,
            },
          }
        ).then(async (response) => {
          if (response.ok) {
            await response.json().then((data) => {
              toastNotification(0, data.message);
            });
          }
        });
      }
      if (findDriver(driverSlug)!.images.length > 0) {
        await fetch(
          getImages +
            findDriver(driverSlug)!.images[
              findImage(findDriver(driverSlug)!.images, "helmet")
            ].id,
          {
            method: "DELETE",
            headers: {
              "Content-Type": "application/json",
              Authorization: `${jwt_token}`,
            },
          }
        ).then(async (response) => {
          if (response.ok) {
            await response.json().then((data) => {
              toastNotification(0, data.message);
            });
          }
        });
      }
    }
    console.log(findTeam());
    if (imageValue === "logo" && findTeam()!.images.length > 0) {
      await fetch(getImages + findTeam()!.images[findLogo()].id, {
        method: "DELETE",
        headers: {
          Authorization: `${jwt_token}`,
        },
      }).then(async (response) => {
        if (response.ok) {
          await response.json().then((data) => {
            toastNotification(0, data.message);
          });
        }
      });
    }
    if (imageValue === "car" && findCar(teamSlug)!.images.length > 0) {
      await fetch(
        getImages +
          findDriver(driverSlug)!.images[
            findImage(findDriver(driverSlug)!.images, "car")
          ].id,
        {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
            Authorization: `${jwt_token}`,
          },
        }
      ).then(async (response) => {
        if (response.ok) {
          await response.json().then((data) => {
            toastNotification(0, data.message);
          });
        }
      });
    }
    if (imageValue === "track" && findTrack(track)!.images.length > 0) {
      await fetch(getImages + findTrack(track)!.images[0].id, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
          Authorization: `${jwt_token}`,
        },
      }).then(async (response) => {
        if (response.ok) {
          await response.json().then((data) => {
            toastNotification(0, data.message);
          });
        }
      });
    }

    await fetch(getImages, {
      method: "POST",
      headers: {
        Authorization: `${jwt_token}`,
      },
      body: formData,
    })
      .then(async (response) => {
        if (response.ok) {
          await response.json().then(async (data) => {
            toastNotification(0, data.message);
          });
          setOpen(false);
          window.location.reload();
        } else {
          toastNotification(1, "Hiba történt a kép feltöltésekor!");
          await response.json().then((data) => {
            console.log(data);
          });
        }
      })
      .catch(async (response: Response) => {
        await response.json().then((data) => {
          console.log(data);
        });
      });
  };
  const handleImageDelete = async (imageID: number) => {
    await fetch(getImages + imageID, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        Authorization: `${jwt_token}`,
      },
    }).then(async (response) => {
      if (response.ok) {
        await response.json().then((data) => {
          toastNotification(0, data.message);
        });
        window.location.reload();
      }
    });
  };

  return (
    <div className={styles.wrapper}>
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
              maxRows={1}
              inputProps={{ minLength: 5, maxLength: 50 }}
              fullWidth
              disabled={imageValue !== "other"}
              value={name}
              onChange={handleNameChange}
            />
            <input
              required
              accept="image/*"
              id="upload-image"
              type="file"
              onChange={handleImageChange}
            />
            {(imageValue === "logo" ||
              imageValue === "car" ||
              imageValue === "other") && (
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
                  <MenuItem value={team.slug} key={team.name}>
                    {team.name}
                  </MenuItem>
                ))}
              </Select>
            )}
            {(imageValue === "driver" || imageValue === "helmet") && (
              <Select
                required
                autoFocus
                margin="dense"
                id="driver_slug"
                label="Versenyző"
                type="text"
                fullWidth
                value={driverSlug}
                onChange={handleDriverChange}
              >
                {itemData.drivers.map((driver: DriverModel) => (
                  <MenuItem value={driver.slug} key={driver.slug}>
                    {driver.name}
                  </MenuItem>
                ))}
              </Select>
            )}

            <TextField
              required
              autoFocus
              margin="dense"
              id="description"
              label="Képleírás"
              type="text"
              inputProps={{ maxLength: 200 }}
              fullWidth
              value={description}
              onChange={handledescriptionChange}
              maxRows={2}
            />
            {imageValue === "track" && (
              <Select
                required
                autoFocus
                margin="dense"
                id="track"
                label="Pálya"
                type="text"
                fullWidth
                value={track}
                onChange={handleTrackChange}
              >
                {itemData.tracks.map((track: TrackModel) => (
                  <MenuItem value={track.slug} key={track.name}>
                    {track.name}
                  </MenuItem>
                ))}
              </Select>
            )}

            <Select
              required
              autoFocus
              margin="dense"
              id="image-type"
              label="Kép típusa"
              type="text"
              fullWidth
              value={imageValue}
              onChange={handleValueChange}
            >
              {options.map((option) => (
                <MenuItem value={option.value} key={option.value}>
                  {option.name}
                </MenuItem>
              ))}
            </Select>

            <label htmlFor="raised-button-file"></label>
            {image && (
              <img src={`${image}`} alt="Preview" width={400} height={400} />
            )}
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose} color="primary">
              Mégse
            </Button>
            <Button
              onClick={(e) => {
                handleSubmit(e);
              }}
              color="primary"
            >
              Feltöltés
            </Button>
          </DialogActions>
        </Dialog>
      </div>
      <Button
        variant="contained"
        style={{ backgroundColor: "#5C8E5E", borderRadius: 0 }}
        onClick={handleClickOpen}
      >
        Kép hozzáadása
      </Button>
      <div className={styles.filterSwitch}>
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
            className={styles.filterRemoveButton}
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
        <ImageList rowHeight={480} className={styles.galleryList} cols={4}>
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
              <ImageListItem key={image.id} className={styles.galleryItem}>
                <img
                  src={image.image_url}
                  className={styles.galleryImage}
                  loading="lazy"
                />
                <ImageListItemBar
                  title={image.description}
                  subtitle={
                    <span>
                      <Button
                        variant="outlined"
                        color="error"
                        className={styles.imageDeleteButton}
                        onClick={() => handleImageDelete(image.id)}
                      >
                        törlés
                      </Button>
                    </span>
                  }
                />
              </ImageListItem>
            ))}
          <CustomSnackbar />
        </ImageList>
      </div>
    </div>
  );
};

export const GalleryLoader: LoaderFunction<ImageModel[]> = async () => {
  const allData: typeof allDataType = {
    teams: [],
    images: [],
    drivers: [],
    cars: [],
    tracks: [],
    user: userInterface,
  };

  await getUser().then((data) => {
    if (data === undefined) {
      window.location.href = "/";
      return;
    }
    allData.user = data!;
  });
  if (allData.user.admin === true) {
    await axios
      .get(getImages, {
        maxContentLength: 10000,
        maxBodyLength: 10000,
        responseType: "json",
      })
      .then((data) => {
        data.data.map((data: ImageModel) => {
          const image = data;
          allData.images.push(image);
        });
      })
      .then(async () => {
        await axios.get(getTeams).then((data) => {
          allData.teams = data.data;
        });
        await axios.get(getDrivers).then((data) => {
          allData.drivers = data.data;
        });
        await axios.get(getCars).then((data) => {
          allData.cars = data.data;
        });
        await axios.get(getTracks).then((data) => {
          allData.tracks = data.data;
        });
      });
    return allData;
  } else {
    window.location.href = "/";
  }
};

export default Gallery;
