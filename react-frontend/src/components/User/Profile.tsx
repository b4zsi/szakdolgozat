import React, { useState } from "react";
import { UserModel } from "../../model/UserModel";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import "../../styles/ProfileStyle.css";
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
  const updateUserURL = "http://localhost:3000/current_user";
  const jwt_token = localStorage.getItem("jwt");
  const [email, setEmail] = useState<string>(user.email);
  const [vezeteknev, setVezeteknev] = useState<string>(user.keresztnev);
  const [keresztnev, setKeresztnev] = useState<string>(user.vezeteknev);
  const [username, setUsername] = useState<string>(user.username);
  const [favTeam, setFavTeam] = useState<string>(
    user.fav_team == undefined ? "Oracle Red Bull Racing" : user.fav_team
  );
  const [favDriver, setFavDriver] = useState<string>();
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
  const handleDelete = async () => {
    await fetch(updateUserURL, {
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

  const handleSubmit = async () => {
    await fetch(updateUserURL, {
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
  const handleDeleteOpen = () => {
    setDeleteOpen(true);
  };
  const handleCancelButton = () => {
    setDeleteOpen(false);
  };

  return (
    <div className="ProfileMainDiv">
      <CustomSnackbar />
      <Dialog open={nameDialogOpen} onClose={handleClose}>
        <DialogTitle>Név módosítása</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            id="vezeteknev"
            label="Keresztnév"
            type="text"
            fullWidth
            value={vezeteknev}
            onChange={handleVeznevChange}
          />
          <TextField
            autoFocus
            margin="dense"
            id="keresztnev"
            label="Vezetéknév"
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
      <div className="ProfileCardContainer">
        <Card className="profileCard">
          <p className="profilHeader">Profilom</p>
          <CardContent className="profileItem">
            Név:&ensp;{user.keresztnev}&ensp;{user.vezeteknev}
            <Button onClick={handleNameChangeOpen}>
              <EditIcon />
            </Button>
          </CardContent>
          <CardContent className="profileItem">
            Felhasználónév:&ensp;
            {user.username}
            <Button onClick={handleUserNameChangeOpen}>
              <EditIcon />
            </Button>
          </CardContent>
          <CardContent className="profileItem">
            Email cím:&ensp;{user.email}
            <Button onClick={handleEmailChangeOpen}>
              <EditIcon />
            </Button>
          </CardContent>
          <CardContent className="profileItem">
            Kedvenc csapat:&ensp;{user.fav_team}
            <Button onClick={handleFavTeamChangeOpen}>
              <EditIcon />
            </Button>
          </CardContent>
          <CardContent className="profileItem">
            Kedvenc versenyző:&ensp;{user.fav_driver}
            <Button onClick={handleFavDriverChangeOpen}>
              <EditIcon />
            </Button>
          </CardContent>
          <CardActions className="profileItem">
            <Button
              variant="contained"
              color="error"
              onClick={handleDeleteOpen}
              className="userDeleteButton"
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
          </CardActions>
        </Card>
      </div>
    </div>
  );
}

export const ProfilLoader: LoaderFunction<UserModel> = async () => {
  const current_user_url = "http://localhost:3000/current_user";
  const teams_url = "http://localhost:3000/api/v1/teams";
  const driver_url = "http://localhost:3000/api/v1/drivers";
  const jwt_token = localStorage.getItem("jwt");
  const allData: typeof allDataType = {
    teams: [],
    drivers: [],
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
  await fetch(`${current_user_url}`, {
    method: "GET",
    headers: {
      Authorization: `${jwt_token}`,
    },
  })
    .then(async (response) => {
      await axios
        .get(teams_url)
        .then((data) => {
          allData.teams = data.data;
        })
        .then(async () => {
          await axios.get(driver_url).then((data) => {
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
