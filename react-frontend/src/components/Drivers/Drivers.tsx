import { FC, Fragment, useState } from "react";
import { DriverModel } from "../../model/DriverModel";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import Divider from "@mui/material/Divider";
import styles from "../../styles/DriverStyle.module.css";
import { ImageModel } from "../../model/ImageModel";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  Input,
  MenuItem,
  Select,
} from "@mui/material";
import DeleteIcon from "@mui/icons-material/Delete";
import EditIcon from "@mui/icons-material/Edit";
import { UserModel } from "../../model/UserModel";
import noHelmet from "../../images/nohelmet.png";
import { getDrivers } from "../../api_links";
import { Link } from "react-router-dom";
import axios from "axios";
import { toastNotification } from "../Snackbar/snackbar";
import nemzetek from "../../nemzetek.js";

type Driver = {
  properties: DriverModel;
  team_color: string;
  team_id: number;
  user: UserModel;
};

const Drivers: FC<Driver> = (driver: Driver) => {
  const nations = nemzetek.split(",");
  const [driverDeleteOpen, setDriverDeleteOpen] = useState<boolean>(false);
  const [driverEditOpen, setDriverEditOpen] = useState<boolean>(false);

  const [driverName, setDriverName] = useState<string>(driver.properties.name);
  const [driverAge, setDriverAge] = useState<number>(driver.properties.age);
  const [driverWins, setDriverWins] = useState<number>(
    driver.properties.number_of_wins
  );
  const [driverNationality, setDriverNationality] = useState<string>(
    driver.properties.nationality
  );
  const [driverPodiums, setDriverPodiums] = useState<number>(
    driver.properties.number_of_podiums
  );

  driver.properties.images.sort((a: ImageModel, b: ImageModel) => {
    return a.id - b.id;
  });
  async function handleDriverDelete(): Promise<void> {
    await axios.delete(getDrivers + driver.properties.id).then((response) => {
      console.log(response);
      toastNotification(0, "Sikeres törlés!");
      setDriverDeleteOpen(false);
      window.location.reload();
    });
  }
  async function handleDriverEdit(): Promise<void> {
    await axios
      .put(getDrivers + driver.properties.id, {
        drivers: {
          name: driverName,
          age: driverAge,
          number_of_wins: driverWins,
          nationality: driverNationality,
          number_of_podiums: driverPodiums,
        },
      })
      .then((response) => {
        console.log(response);
        toastNotification(0, "Sikeres módosítás!");
        setDriverEditOpen(false);
        window.location.reload();
      });
  }

  return (
    <div style={{ borderRadius: 100 }}>
      <Dialog open={driverDeleteOpen}>
        <DialogTitle>Biztosan törlöd?</DialogTitle>
        <DialogActions>
          <Button
            onClick={(e) => {
              e.preventDefault();
              handleDriverDelete();
            }}
          >
            Törlés
          </Button>
          <Button
            onClick={(e) => {
              e.preventDefault();
              setDriverDeleteOpen(false);
            }}
          >
            Mégsem
          </Button>
        </DialogActions>
      </Dialog>
      <Dialog open={driverDeleteOpen}>
        <DialogTitle>Biztosan törlöd?</DialogTitle>
        <DialogActions>
          <Button
            onClick={(e) => {
              e.preventDefault();
              handleDriverDelete();
            }}
          >
            Törlés
          </Button>
          <Button
            onClick={(e) => {
              e.preventDefault();
              setDriverDeleteOpen(false);
            }}
          >
            Mégsem
          </Button>
        </DialogActions>
      </Dialog>

      <Dialog open={driverEditOpen}>
        <DialogTitle>Versenyző módosítása</DialogTitle>
        <DialogContent>
          <form className={styles.driverEditForm}>
            <label>Versenyző neve: </label>
            <Input
              type="text"
              required
              autoFocus
              id="nev"
              name="nev"
              value={driverName}
              onChange={(e) => {
                e.preventDefault();
                setDriverName(e.target.value);
              }}
            />
            <label>Versenyző életkora: </label>
            <Input
              type="number"
              required
              autoFocus
              id="eletkor"
              name="eletkor"
              value={driverAge}
              onChange={(e) => {
                e.preventDefault();
                setDriverAge(parseInt(e.target.value));
              }}
            />
            <label>Győzelmek száma: </label>
            <Input
              type="number"
              required
              autoFocus
              id="gyozelmek"
              name="gyozelmek"
              value={driverWins}
              inputProps={{ min: "0" }}
              onChange={(e) => {
                e.preventDefault();
                setDriverWins(parseInt(e.target.value));
              }}
            />
            <label>Pódiumok száma: </label>
            <Input
              type="number"
              required
              autoFocus
              id="podiumok"
              name="podiumok"
              inputProps={{ min: "0" }}
              value={driverPodiums}
              onChange={(e) => {
                e.preventDefault();
                setDriverPodiums(parseInt(e.target.value));
              }}
            />
            <label>Nemzetiség: </label>
            <Select
              required
              autoFocus
              id="nemzetiseg"
              name="nemzetiseg"
              value={driverNationality}
              onChange={(e) => {
                e.preventDefault();
                setDriverNationality(e.target.value);
              }}
            >
              {nations.map((nation) => {
                return <MenuItem key={nation}>{nation}</MenuItem>;
              })}
            </Select>
          </form>
        </DialogContent>
        <DialogActions>
          <Button
            onClick={(e) => {
              e.preventDefault();
              handleDriverEdit();
            }}
          >
            Mentés
          </Button>
          <Button
            onClick={(e) => {
              e.preventDefault();
              setDriverEditOpen(false);
            }}
          >
            Mégsem
          </Button>
        </DialogActions>
      </Dialog>
      <Link to={`/drivers/${driver.properties.id}`}>
        <Card
          sx={{ border: `2px solid #${driver.team_color}` }}
          className={styles.card}
        >
          {driver.user !== null && driver.user.admin === true && (
            <Fragment>
              <Button
                onClick={(e) => {
                  e.preventDefault();
                  setDriverDeleteOpen(true);
                }}
                style={{ zIndex: 999, margin: 0, padding: 0 }}
              >
                <DeleteIcon color="error" />
              </Button>
              <Button
                onClick={(e) => {
                  e.preventDefault();
                  setDriverEditOpen(true);
                }}
                style={{ zIndex: 999, marginLeft: 70, padding: 0 }}
              >
                <EditIcon />
              </Button>
            </Fragment>
          )}
          {driver.properties.images.length > 0 ? (
            <CardMedia
              image={driver.properties.images[0].image_url}
              title="drivers"
              className={styles.cardMedia}
            />
          ) : (
            <CardMedia
              image={noHelmet}
              title="drivers"
              className={styles.cardMedia}
            />
          )}
          <CardContent>
            <Divider variant="middle" style={{ height: 2 }} />
            <Typography gutterBottom component="div" className={styles.name}>
              {driver.properties.name}
            </Typography>
          </CardContent>
        </Card>
      </Link>
    </div>
  );
};

export default Drivers;
