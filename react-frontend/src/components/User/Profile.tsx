import React, { useState } from "react";
import { UserModel } from "../../model/UserModel";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import styles from "../../styles/ProfileStyle.module.css";
import {
  Button,
  Card,
  CardActions,
  CardContent,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  MenuItem,
  Select,
  SelectChangeEvent,
  TextField,
} from "@mui/material";
import EditIcon from "@mui/icons-material/Edit";
import axios from "axios";
import { TeamModel } from "../../model/TeamModel";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import { DriverModel } from "../../model/DriverModel";
import {
  getCurrentUser,
  getDriverNames,
  getImages,
  getTeamNames,
} from "../../api_links";
import { userInterface } from "../../interface/userInterface";

let allDataType: {
  teams: TeamModel[];
  drivers: DriverModel[];
  user: UserModel;
};

function Profile() {
  const itemData: typeof allDataType = useLoaderData() as {
    teams: TeamModel[];
    drivers: DriverModel[];
    user: UserModel;
  };
  const user: UserModel = itemData.user;
  const teams: TeamModel[] = itemData.teams;
  const jwt_token = localStorage.getItem("jwt");
  const [email, setEmail] = useState<string>(user.email);
  const [vezeteknev, setVezeteknev] = useState<string>(user.keresztnev);
  const [keresztnev, setKeresztnev] = useState<string>(user.vezeteknev);
  const [username, setUsername] = useState<string>(user.username);
  const [favTeam, setFavTeam] = useState<string>(
    user.fav_team == undefined ? "Oracle Red Bull Racing" : user.fav_team
  );
  const [image, setImage] = useState("");
  const [base64Image, setBase64Image] = useState<File>();
  const [favDriver, setFavDriver] = useState<string>();
  const [open, setOpen] = useState(false);
  const [nameDialogOpen, setNameDialogOpen] = useState<boolean>(false);
  const [usernameDialogOpen, setUsernameDialogOpen] = useState<boolean>(false);
  const [emailDialogOpen, setEmailDialogOpen] = useState<boolean>(false);
  const [favTeamDialogOpen, setFavTeamDialogOpen] = useState<boolean>(false);
  const [favDriverDialogOpen, setFavDriverDialogOpen] =
    useState<boolean>(false);
  const [deleteOpen, setDeleteOpen] = useState<boolean>(false);
  const handleClose = () => {
    setNameDialogOpen(false);
    setEmailDialogOpen(false);
    setUsernameDialogOpen(false);
    setFavTeamDialogOpen(false);
    setFavDriverDialogOpen(false);
  };
  //#region handleFunctions
  const handleNameChangeOpen = () => {
    setNameDialogOpen(true);
  };
  const handleUserNameChangeOpen = () => {
    setUsernameDialogOpen(true);
  };
  const handleEmailChangeOpen = () => {
    setEmailDialogOpen(true);
  };
  const handleFavTeamChangeOpen = () => {
    setFavTeamDialogOpen(true);
  };
  const handleFavDriverChangeOpen = () => {
    setFavDriverDialogOpen(true);
  };
  const handleClickOpen = () => {
    setOpen(true);
  };
  const handleImageClose = () => {
    setOpen(false);
  };
  const handleVeznevChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    event.preventDefault();
    setVezeteknev(event.target.value);
  };
  const handleKernevChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    event.preventDefault();
    setKeresztnev(event.target.value);
  };
  const handleUsernameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    event.preventDefault();
    setUsername(event.target.value);
  };
  const handleEmailChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    event.preventDefault();
    setEmail(event.target.value);
  };
  const handleFavTeamChange = (event: SelectChangeEvent<string>) => {
    event.preventDefault();
    setFavTeam(event.target.value);
  };
  const handleFavDriverChange = (event: SelectChangeEvent<string>) => {
    event.preventDefault();
    setFavDriver(event.target.value);
  };
  //#endregion
  const handleDelete = async () => {
    await fetch(getCurrentUser, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        Authorization: `${jwt_token}`,
      },
      body: JSON.stringify({
        user_params: {
          id: user.id,
        },
      }),
    }).then(async (response) => {
      if (response.ok) {
        await response.json().then((data) => {
          console.log(data);
        });
      } else {
        console.log(response);
      }
    });
  };

  const handleImageChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setImage(URL.createObjectURL(event.target.files![0]));
    setBase64Image(event.target.files![0]);
  };

  const handleSubmit = async () => {
    await fetch(getCurrentUser, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Authorization: `${jwt_token}`,
      },
      body: JSON.stringify({
        user: {
          id: user.id,
          email: email,
          username: username,
          admin: user.admin,
          keresztnev: keresztnev,
          vezeteknev: vezeteknev,
          fav_team: favTeam,
          fav_driver: favDriver,
        },
      }),
    }).then(async (response) => {
      if (response.ok) {
        setUsernameDialogOpen(false);
        setEmailDialogOpen(false);
        setFavTeamDialogOpen(false);
        await response.json().then((data) => {
          toastNotification(0, data.message).then(() => {
            window.location.reload();
          });
        });
      } else {
        console.log(response);
      }
    });
  };
  const handleImageSubmit = async (event: React.MouseEvent) => {
    event.preventDefault();

    const formData = new FormData();

    formData.append("imagesForm[image_name]", email);
    formData.append("imagesForm[image]", base64Image!);
    formData.append("imagesForm[team_slug]", "none");

    if (user.images.length > 0) {
      await fetch(getImages + user.images[0].id, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
          Authorization: `${jwt_token}`,
        },
        body: JSON.stringify({
          images: {
            id: user.images[0].id,
          },
        }),
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
            await fetch(getTeamNames, {
              method: "PUT",
              headers: {
                Authorization: `${jwt_token}`,
              },
              body: JSON.stringify({
                drivers: {
                  id: email,
                  image: base64Image,
                },
              }),
            }).then((response) => {
              console.log(response);
            });
          });
          setOpen(false);
          //window.location.reload();
        } else {
          console.log(response);
        }
      })
      .catch((response: Response) => {
        response.json().then((data) => {
          console.log(data);
        });
      });
  };

  const handleDeleteOpen = () => {
    setDeleteOpen(true);
  };
  const handleCancelButton = () => {
    setDeleteOpen(false);
  };

  function searchFavoriteDriver(fav_driver: string): React.ReactNode {
    let favDriverName: string = "";
    itemData.drivers.forEach((driver) => {
      if (driver.slug === fav_driver) {
        favDriverName = driver.name;
      }
    });
    return favDriverName;
  }

  return (
    <div className={styles.ProfileMainDiv}>
      <CustomSnackbar />
      <Dialog open={nameDialogOpen} onClose={handleClose}>
        <DialogTitle>Név módosítása</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            id="vezeteknev"
            label="Vezetéknév"
            type="text"
            fullWidth
            value={vezeteknev}
            onChange={handleVeznevChange}
          />
          <TextField
            autoFocus
            margin="dense"
            id="keresztnev"
            label="Keresztnév"
            type="text"
            fullWidth
            value={keresztnev}
            onChange={handleKernevChange}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleSubmit}>Módosítás</Button>
        </DialogActions>
      </Dialog>
      ;
      <Dialog open={usernameDialogOpen} onClose={handleClose}>
        <DialogTitle>Felhasználónév módosítása</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            id="username"
            label="Felhasználónév"
            type="text"
            fullWidth
            value={username}
            onChange={handleUsernameChange}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleSubmit}>Módosítás</Button>
        </DialogActions>
      </Dialog>
      ;
      <Dialog open={emailDialogOpen} onClose={handleClose}>
        <DialogTitle>Email cím módosítása</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            id="email"
            label="Email cím"
            type="text"
            fullWidth
            value={email}
            onChange={handleEmailChange}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleSubmit}>Módosítás</Button>
        </DialogActions>
      </Dialog>
      <Dialog open={favTeamDialogOpen} onClose={handleClose}>
        <DialogTitle>Kedvenc csapat váltása</DialogTitle>
        <DialogContent>
          <Select
            required
            autoFocus
            margin="dense"
            id="team_slug"
            label="Csapat"
            type="text"
            fullWidth
            value={favTeam}
            onChange={handleFavTeamChange}
          >
            {teams.map((team: TeamModel) => (
              <MenuItem value={team.slug} key={team.slug}>
                {team.name}
              </MenuItem>
            ))}
          </Select>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleSubmit}>Módosítás</Button>
        </DialogActions>
      </Dialog>
      <Dialog open={favDriverDialogOpen} onClose={handleClose}>
        <DialogTitle>Kedvenc versenyző</DialogTitle>
        <DialogContent>
          <Select
            required
            autoFocus
            margin="dense"
            id="driver_slug"
            label="Versenyző"
            type="text"
            fullWidth
            value={favDriver}
            onChange={handleFavDriverChange}
          >
            {itemData.drivers.map((driver: DriverModel) => (
              <MenuItem value={driver.name} key={driver.slug}>
                {driver.name}
              </MenuItem>
            ))}
          </Select>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleSubmit}>Módosítás</Button>
        </DialogActions>
      </Dialog>
      ;
      <div className={styles.ProfileCardContainer}>
        <Card className={styles.profileCard}>
          <p className={styles.profilHeader}>Profilom</p>
          <CardContent className={styles.profileItem}>
            Név:&ensp;{user.vezeteknev}&ensp;{user.keresztnev}
            <Button onClick={handleNameChangeOpen}>
              <EditIcon />
            </Button>
          </CardContent>
          <CardContent className={styles.profileItem}>
            Felhasználónév:&ensp;
            {user.username}
            <Button onClick={handleUserNameChangeOpen}>
              <EditIcon />
            </Button>
          </CardContent>
          <CardContent className={styles.profileItem}>
            Email cím:&ensp;{user.email}
            <Button onClick={handleEmailChangeOpen}>
              <EditIcon />
            </Button>
          </CardContent>
          <CardContent className={styles.profileItem}>
            Kedvenc csapat:&ensp;{user.fav_team}
            <Button onClick={handleFavTeamChangeOpen}>
              <EditIcon />
            </Button>
          </CardContent>
          <CardContent className={styles.profileItem}>
            Kedvenc versenyző:&ensp;{searchFavoriteDriver(user.fav_driver)}
            <Button onClick={handleFavDriverChangeOpen}>
              <EditIcon />
            </Button>
          </CardContent>
          <CardContent className={styles.profileItem}>
            <Button
              variant="contained"
              style={{
                backgroundColor: "#5C8E5E",
                borderRadius: 0,
                margin: "auto",
              }}
              onClick={handleClickOpen}
            >
              Profilkép feltöltése
            </Button>
          </CardContent>
          <CardActions className={styles.profileItem}>
            <Button
              variant="contained"
              color="error"
              onClick={handleDeleteOpen}
              className={styles.userDeleteButton}
            >
              Fiók törlése
            </Button>
            <Dialog open={deleteOpen}>
              <DialogTitle>Biztosan törli a fiókját?</DialogTitle>
              <DialogContent>
                <Button
                  variant="outlined"
                  color="error"
                  onClick={handleDelete}
                  style={{ margin: "5px" }}
                >
                  Törlés
                </Button>
                <Button
                  variant="outlined"
                  color="primary"
                  onClick={handleCancelButton}
                >
                  Mégse
                </Button>
              </DialogContent>
            </Dialog>
            <Dialog
              open={open}
              onClose={handleImageClose}
              aria-labelledby="form-dialog-title"
            >
              <DialogTitle id="form-dialog-title">Képfeltöltés</DialogTitle>
              <DialogContent>
                <input
                  required
                  accept="image/*"
                  id="upload-image"
                  type="file"
                  onChange={handleImageChange}
                />
                <label htmlFor="raised-button-file"></label>
                {image && <img src={`${image}`} alt="Preview" />}
              </DialogContent>
              <DialogActions>
                <Button onClick={handleImageClose} color="primary">
                  Mégse
                </Button>
                <Button
                  onClick={(e) => {
                    handleImageSubmit(e);
                  }}
                  color="primary"
                >
                  Feltöltés
                </Button>
              </DialogActions>
            </Dialog>
          </CardActions>
        </Card>
      </div>
    </div>
  );
}

export const ProfilLoader: LoaderFunction<UserModel> = async () => {
  const jwt_token = localStorage.getItem("jwt");
  const allData: typeof allDataType = {
    teams: [],
    drivers: [],
    user: userInterface,
  };
  await fetch(`${getCurrentUser}`, {
    method: "GET",
    headers: {
      Authorization: `${jwt_token}`,
    },
  })
    .then(async (response) => {
      await axios
        .get(getTeamNames)
        .then((data) => {
          allData.teams = data.data;
        })
        .then(async () => {
          await axios.get(getDriverNames).then((data) => {
            allData.drivers = data.data;
          });
        });
      return response;
    })
    .then(async (response) => {
      if (response.ok) {
        allData.user = await response.json();
      }
    });
  return allData;
};
export default Profile;
