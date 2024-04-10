import {
  Button,
  Card,
  CardContent,
  Dialog,
  DialogTitle,
  Divider,
  Grid,
  MenuItem,
  Select,
  SelectChangeEvent,
  TextField,
} from "@mui/material";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import { TrackModel } from "../../model/TrackModel";
import styles from "../../styles/TrackStyle.module.css";
import axios from "axios";
import { getDriverNames, getTracks } from "../../api_links";
import { trackInterface } from "../../interface/trackInterface";
import { useState } from "react";
import EditIcon from "@mui/icons-material/Edit";
import DeleteIcon from "@mui/icons-material/Delete";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import { DriverModel } from "../../model/DriverModel";
import noHelmet from "../../images/nohelmet.png";

let allDataType: {
  track: TrackModel;
  drivers: DriverModel[];
};
function Track() {
  const data: typeof allDataType = useLoaderData() as {
    track: TrackModel;
    drivers: DriverModel[];
  };
  const track: TrackModel = data.track;
  const drivers: DriverModel[] = data.drivers;
  const [open, setOpen] = useState<boolean>(false);
  const [deleteOpen, setDeleteOpen] = useState<boolean>(false);
  const [name, setName] = useState<string>(track.name);
  const [length, setLength] = useState<number>(track.length);
  const [driverPole, setDriverPole] = useState<string>(track.lap_record);
  const [poleTime, setPoleTime] = useState<string>(
    track.lap_record_in_seconds.toString()
  );
  const [country, setCountry] = useState<string>(track.country);
  const [city, setCity] = useState<string>(track.city);
  const [turns, setTurns] = useState<number>(track.turns);
  const [description, setDescription] = useState<string>(track.description);
  const image = [] as File[];

  const handleOpen = () => {
    setOpen(true);
  };
  const handleClose = () => {
    setOpen(false);
  };
  const handleDeleteOpen = () => {
    setDeleteOpen(true);
  };
  const handleDeleteClose = () => {
    setDeleteOpen(false);
  };
  const handleDriverPoleChange = (e: SelectChangeEvent<string>) => {
    setDriverPole(e.target.value);
  };
  const handleImageChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    console.log(e.target.files);
  };
  const handlePoleTimeChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setPoleTime(e.target.value);
  };
  const handleNameChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setName(e.target.value);
  };
  const handleLengthChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setLength(e.target.value as unknown as number);
  };
  const handleCountryChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setCountry(e.target.value);
  };
  const handleCityChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setCity(e.target.value);
  };
  const handleTurnsChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setTurns(e.target.valueAsNumber);
  };
  const handeDescriptionChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setDescription(e.target.value);
  };

  const handleDelete = async () => {
    await axios
      .delete(getTracks + track.id)
      .then((response) => {
        if (response.status === 200) {
          toastNotification(0, "Sikeres törlés!");
          setDeleteOpen(false);
          window.location.href = "/tracks";
        } else {
          console.log(response);
        }
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const handleSubmit = () => {
    if (poleTime.includes(",")) {
      toastNotification(1, "A pole idő nem tartalmazhat tizedesvesszőt!");
      return;
    }
    if (poleTime.split(".").length != 2 || poleTime.split(".")[1].length != 3) {
      toastNotification(1, "A pole idő formátuma nem megfelelő!");
      return;
    }

    axios
      .put(getTracks + track.id, {
        track: {
          id: track.id,
          name: name,
          length: length,
          lap_record: driverPole,
          lap_record_in_seconds: poleTime,
          country: country,
          city: city,
          turns: turns,
          description: description,
          images: image[0],
        },
      })
      .then((response) => {
        if (response.status === 200) {
          track.name = name;
          track.length = length;
          track.city = city;
          track.country = country;
          track.lap_record = driverPole;
          track.lap_record_in_seconds = poleTime as unknown as number;
          track.description = description;
          toastNotification(0, "Sikeres módosítás!");
          setOpen(false);
        } else {
          console.log(response);
        }
      });
  };

  return (
    <div className={styles.mainTrackDiv}>
      <Dialog open={open}>
        <DialogTitle>Pálya módosítása</DialogTitle>
        <TextField
          required
          autoFocus
          margin="dense"
          id="name"
          label="Pálya neve"
          placeholder="Monza"
          type="text"
          fullWidth
          value={name}
          onChange={handleNameChange}
        />
        <TextField
          required
          autoFocus
          margin="dense"
          id="length"
          label="Pálya hossza (méter)"
          placeholder="2345"
          type="text"
          fullWidth
          value={length}
          onChange={handleLengthChange}
        />
        <TextField
          required
          autoFocus
          margin="dense"
          id="country"
          label="Ország"
          type="text"
          fullWidth
          value={country}
          onChange={handleCountryChange}
        />
        <TextField
          required
          autoFocus
          margin="dense"
          id="city"
          label="Város"
          type="text"
          fullWidth
          value={city}
          onChange={handleCityChange}
        />
        <TextField
          required
          autoFocus
          margin="dense"
          id="length"
          label="Kanyarok száma"
          type="number"
          inputProps={{ min: 0, max: 100 }}
          fullWidth
          value={turns}
          onChange={handleTurnsChange}
        />
        <TextField
          required
          autoFocus
          margin="dense"
          id="pole_time"
          label="Pole idő (mp)"
          placeholder="0:00:000"
          type="text"
          fullWidth
          value={poleTime}
          onChange={handlePoleTimeChange}
        />
        <Select
          required
          autoFocus
          margin="dense"
          id="driver_on_pole"
          label="Versenyző"
          placeholder="Versenyző"
          type="text"
          fullWidth
          value={driverPole}
          onChange={handleDriverPoleChange}
        >
          {drivers.map((driver: DriverModel) => (
            <MenuItem value={driver.name} key={driver.id}>
              {driver.name}
            </MenuItem>
          ))}
        </Select>
        <TextField
          required
          autoFocus
          margin="dense"
          id="length"
          label="Kanyarok száma"
          type="number"
          inputProps={{ min: 0, max: 100 }}
          fullWidth
          value={turns}
          onChange={handleTurnsChange}
        />
        <TextField
          multiline
          required
          autoFocus
          margin="dense"
          id="description"
          label="Leírás"
          type="text"
          fullWidth
          value={description}
          onChange={handeDescriptionChange}
        />
        <input
          required
          accept="image/*"
          id="upload-image"
          type="file"
          onChange={handleImageChange}
        />
        <Button onClick={handleSubmit}>Hozzáadás</Button>
        <Button onClick={handleClose}>Mégse</Button>
      </Dialog>
      <Dialog open={deleteOpen}>
        <DialogTitle> Biztosan törlöd a pályát?</DialogTitle>
        <Button variant="contained" color="error" onClick={handleDelete}>
          Törlés
        </Button>
        <Button variant="outlined" onClick={handleDeleteClose}>
          Mégse
        </Button>
      </Dialog>
      <CustomSnackbar />
      <Grid container spacing={3}>
        <Grid item xs={3}>
          <Grid container direction="column" spacing={3} minHeight={600}>
            <Grid item>
              <Card className={`${styles.trackCard} ${styles.left}`}>
                <p className={styles.cardTitle}>Név</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent className={styles.cardContent}>
                  {track.name}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className={`${styles.trackCard} ${styles.left}`}>
                <p className={styles.cardTitle}>Pálya hossz</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent
                  className={`${styles.number} ${styles.cardContent}`}
                >
                  {track.length} méter
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className={`${styles.trackCard} ${styles.left}`}>
                <p className={styles.cardTitle}>Város</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent className={styles.cardContent}>
                  {track.city}
                </CardContent>
              </Card>
            </Grid>
          </Grid>
        </Grid>
        <Grid item xs={6} container>
          {track.images.length === 0 && (
            <img src={noHelmet} alt="nohelmet" className={styles.trackImage} />
          )}
          {track.images.length !== 0 && (
            <img
              src={track.images[0].image_url}
              alt="trackImage"
              className={styles.trackImage}
            />
          )}
        </Grid>
        <Grid item xs={3}>
          <Grid container direction="column" spacing={3} minHeight={600}>
            <Grid item>
              <Card className={`${styles.trackCard} ${styles.right}`}>
                <p className={styles.cardTitle}>Ország</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent className={styles.cardContent}>
                  {track.country}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className={`${styles.trackCard} ${styles.right}`}>
                <p className={styles.cardTitle}>Pályacsúcs</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent className={styles.cardContent}>
                  {Math.floor(track.lap_record_in_seconds / 60)} perc{" "}
                  {(
                    track.lap_record_in_seconds -
                    Math.floor(track.lap_record_in_seconds / 60) * 60
                  ).toPrecision(5)}{" "}
                  másodperc{<br />}
                  {track.lap_record}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className={`${styles.trackCard} ${styles.right}`}>
                <p className={styles.cardTitle}>Kanyarok száma</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent
                  className={`${styles.cardContent} ${styles.number}`}
                >
                  {track.turns}
                </CardContent>
              </Card>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
      <div
        style={{ display: "flex", flexDirection: "column", marginLeft: "40%" }}
      >
        <Button
          variant="contained"
          onClick={handleOpen}
          className={styles.editButton}
        >
          <EditIcon />
        </Button>
        <Button
          variant="outlined"
          onClick={handleDeleteOpen}
          className={styles.editButton}
        >
          <DeleteIcon />
        </Button>
      </div>
      <Card className={styles.description}>
        <CardContent className={styles.cardContent}>
          {track.description}
        </CardContent>
      </Card>
    </div>
  );
}

export const TrackLoader: LoaderFunction<typeof allDataType> = async ({
  params,
}) => {
  const allData: typeof allDataType = {
    track: trackInterface,
    drivers: [],
  };
  await axios
    .get(getTracks + params.id)
    .then((data) => {
      allData.track = data.data[0];
    })
    .then(async () => {
      await axios.get(getDriverNames).then((data) => {
        allData.drivers = data.data;
      });
    });
  return allData;
};

export default Track;
