import axios from "axios";
import { Link, LoaderFunction, useLoaderData } from "react-router-dom";
import { TrackModel } from "../../model/TrackModel";
import {
  Button,
  Card,
  Dialog,
  DialogContent,
  DialogTitle,
  Divider,
  Grid,
  MenuItem,
  Select,
  SelectChangeEvent,
  TextField,
} from "@mui/material";
import styles from "../../styles/AllTrackStyle.module.css";
import { getDriverNames, getTracks } from "../../api_links";
import AddIcon from "@mui/icons-material/Add";
import { useState } from "react";
import { DriverModel } from "../../model/DriverModel";
import { toastNotification } from "../Snackbar/snackbar";

let allDataType: {
  tracks: TrackModel[];
  drivers: DriverModel[];
};

function AllTrack() {
  const data: typeof allDataType = useLoaderData() as {
    tracks: TrackModel[];
    drivers: DriverModel[];
  };
  const tracks: TrackModel[] = data.tracks;
  const drivers: DriverModel[] = data.drivers;
  const [open, setOpen] = useState<boolean>(false);
  const [name, setName] = useState<string>("");
  const [length, setLength] = useState<string>("");
  const [driverPole, setDriverPole] = useState<DriverModel>(drivers[0]);
  const [poleTime, setPoleTime] = useState<string>("0:00:000");
  const [country, setCountry] = useState<string>("");
  const [city, setCity] = useState<string>("");
  const [turns, setTurns] = useState<number>(0);
  const [description, setDescription] = useState<string>("");
  const image = [] as File[];

  const handleDriverPoleChange = (e: SelectChangeEvent<string>) => {
    setDriverPole(e.target.value as unknown as DriverModel);
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
    setLength(e.target.value);
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

  const openTrack = () => {
    setOpen(true);
  };
  const handleClose = () => {
    setOpen(false);
  };

  const handleSubmit = () => {
    if (poleTime.includes(",")) {
      toastNotification(1, "A pole idő nem tartalmazhat tizedesvesszőt!");
      return;
    }
    if (poleTime.split(":").length != 3) {
      toastNotification(1, "A pole idő formátuma nem megfelelő!");
      return;
    }

    axios
      .post(getTracks, {
        track: {
          id: tracks.length + 1,
          name: name,
          length: length,
          lap_record: driverPole.name,
          lap_record_in_seconds: poleTime,
          country: country,
          city: city,
          turns: turns,
          description: description,
          images: image[0],
        },
      })
      .then((response) => {
        if (response.status === 201) {
          tracks.push({
            id: tracks.length + 1,
            name: name,
            length: length as unknown as number,
            lap_record: driverPole.name,
            lap_record_in_seconds: poleTime as unknown as number,
            country: country,
            city: city,
            turns: turns,
            description: description,
            images: [],
            slug: "",
          });
          toastNotification(0, "Sikeres hozzáadás!");
          setOpen(false);
        }
      });
  };
  return (
    <div className={styles.tracksMainDiv}>
      <Dialog open={open} onClose={handleClose}>
        <DialogTitle id="form-dialog-title">Pálya hozzáadása</DialogTitle>
        <DialogContent>
          <TextField
            required
            autoFocus
            margin="dense"
            id="name"
            label="Pálya neve"
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
            value={driverPole.name}
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
        </DialogContent>
      </Dialog>
      <Grid
        container
        direction="row"
        justifyContent="center"
        style={{ alignContent: "center", marginLeft: "5vw" }}
        alignItems={"center"}
      >
        {tracks.map((track: TrackModel) => {
          return (
            <Grid key={track.id} item xs={4}>
              <Card className={styles.AllTrackCard}>
                <Link to={`/tracks/${track.id}`} className={styles.link}>
                  <div className={styles.textTrack}>{track.name}</div>
                  <Divider variant="middle" className={styles.divider} />
                  <div className={styles.textTrack}>{track.city}</div>
                  <Divider variant="middle" className={styles.divider} />
                  <div className={styles.textTrack}>{track.country}</div>
                </Link>
              </Card>
            </Grid>
          );
        })}
        <Grid item xs={4}>
          <Card className={styles.AllTrackCard}>
            <Button
              variant="outlined"
              onClick={openTrack}
              className={styles.addButton}
            >
              <AddIcon />
            </Button>
          </Card>
        </Grid>
      </Grid>
    </div>
  );
}

export const AllTrackLoader: LoaderFunction<typeof allDataType> = async () => {
  const allData: typeof allDataType = {
    tracks: [],
    drivers: [],
  };
  await axios
    .get(getTracks)
    .then((data) => {
      allData.tracks = data.data;
    })
    .then(async () => {
      await axios.get(getDriverNames).then((data) => {
        allData.drivers = data.data;
      });
    });
  return allData;
};

export default AllTrack;
