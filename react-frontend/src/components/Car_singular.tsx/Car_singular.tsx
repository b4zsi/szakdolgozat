import styles from "../../styles/Car_singular.module.css";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import { CarModel } from "../../model/CarModel";
import axios from "axios";
import {
  Button,
  Card,
  CardContent,
  Dialog,
  DialogTitle,
  Divider,
  Grid,
  TextField,
} from "@mui/material";
import { getCars } from "../../api_links";
import { carInterface } from "../../interface/carInterface";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import { useState } from "react";
import EditIcon from "@mui/icons-material/Edit";
import DeleteIcon from "@mui/icons-material/Delete";

let allDataType: {
  car: CarModel;
};

function Car_singular() {
  const data: typeof allDataType = useLoaderData() as {
    car: CarModel;
  };

  const car: CarModel = data.car;
  const [open, setOpen] = useState<boolean>(false);
  const [deleteOpen, setDeleteOpen] = useState<boolean>(false);
  const [engine, setEngine] = useState<string>(car.engine);
  const [fuel, setFuel] = useState<string>(car.fuel);
  const [horsepower, setHorsepower] = useState<number>(car.horsepower);
  const [wins, setWins] = useState<number>(car.races_won);
  const [podiums, setPodiums] = useState<number>(car.podiums);
  const [poles, setPoles] = useState<number>(car.pole_positions);
  const [description, setDescription] = useState<string>(car.description);
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
  const handleImageChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    console.log(e.target.files);
  };
  const handleEngineChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setEngine(e.target.value);
  };
  const handleFuelChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFuel(e.target.value);
  };
  const handleHorsepowerChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setHorsepower(e.target.value as unknown as number);
  };
  const handleWinsChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setWins(e.target.valueAsNumber);
  };
  const handlePodiumChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setPodiums(e.target.valueAsNumber);
  };
  const handlePolesChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setPoles(e.target.valueAsNumber);
  };
  const handeDescriptionChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setDescription(e.target.value);
  };

  const handleDelete = async () => {
    await axios
      .delete(getCars + car.id)
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
    axios
      .put(getCars + car.id, {
        car: {
          id: car.id,
          engine: engine,
          fuel: fuel,
          horsepower: horsepower,
          wins: wins,
          podiums: podiums,
          poles: poles,
          description: description,
          images: image[0],
        },
      })
      .then((response) => {
        if (response.status === 200) {
          car.engine = engine;
          car.fuel = fuel;
          car.horsepower = horsepower;
          car.races_won = wins;
          car.podiums = podiums;
          car.pole_positions = poles;
          car.description = description;

          toastNotification(0, "Sikeres módosítás!");
          setOpen(false);
        } else {
          console.log(response);
        }
      });
  };
  return (
    <div className={styles.mainCarDiv}>
      <Dialog open={open}>
        <DialogTitle>Autó módosítása</DialogTitle>
        <TextField
          required
          autoFocus
          margin="dense"
          id="engine"
          label="Motor"
          type="text"
          fullWidth
          value={engine}
          onChange={handleEngineChange}
        />
        <TextField
          required
          autoFocus
          margin="dense"
          id="fuel"
          label="Üzemanyag"
          placeholder="Petronas"
          type="text"
          fullWidth
          value={fuel}
          onChange={handleFuelChange}
        />
        <TextField
          required
          autoFocus
          margin="dense"
          id="horsepower"
          label="Lóerő"
          type="number"
          fullWidth
          value={horsepower}
          onChange={handleHorsepowerChange}
        />
        <TextField
          required
          autoFocus
          margin="dense"
          id="wins"
          label="Győzelmek száma"
          type="number"
          fullWidth
          value={wins}
          onChange={handleWinsChange}
        />
        <TextField
          required
          autoFocus
          margin="dense"
          id="podiums"
          label="Pódiumok száma"
          type="number"
          inputProps={{ min: 0, max: 48 }}
          fullWidth
          value={podiums}
          onChange={handlePodiumChange}
        />
        <TextField
          required
          autoFocus
          margin="dense"
          id="poles"
          label="Pole pozíciók száma"
          inputProps={{ min: 0, max: 48 }}
          type="number"
          fullWidth
          value={poles}
          onChange={handlePolesChange}
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
              <Card className={`${styles.carCard} ${styles.left}`}>
                <p className={styles.cardTitle}>Motor</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent className={styles.cardContent}>
                  {car.engine}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className={`${styles.carCard} ${styles.left}`}>
                <p className={styles.cardTitle}>Lóerő</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent
                  className={`${styles.cardContent} ${styles.number}`}
                >
                  {car.horsepower} Lóerő
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className={`${styles.carCard} ${styles.left}`}>
                <p className={styles.cardTitle}>Üzemanyag</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent className={styles.cardContent}>
                  {car.fuel}
                </CardContent>
              </Card>
            </Grid>
          </Grid>
        </Grid>
        <Grid xs={6}>
          <Grid item>
            <img
              src={`${car.images[0].image_url}`}
              alt="autó"
              width={740}
              className={styles.carImage}
            />
          </Grid>
        </Grid>
        <Grid item xs={3}>
          <Grid container direction="column" spacing={3} minHeight={600}>
            <Grid item>
              <Card className={`${styles.carCard} ${styles.right}`}>
                <p className={styles.cardTitle}>Győzelmek</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent
                  className={`${styles.cardContent} ${styles.number}`}
                >
                  {car.races_won}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className={`${styles.carCard} ${styles.right}`}>
                <p className={styles.cardTitle}>Pódiumok</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent
                  className={`${styles.cardContent} ${styles.number}`}
                >
                  {car.podiums}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className={`${styles.carCard} ${styles.right}`}>
                <p className={styles.cardTitle}>Pole pozíciók</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent
                  className={`${styles.cardContent} ${styles.number}`}
                >
                  {car.pole_positions}
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
          color="error"
          onClick={handleDeleteOpen}
          className={styles.editButton}
        >
          <DeleteIcon />
        </Button>
      </div>
      <Card className={`${styles.carCard} ${styles.carDescription}`}>
        <CardContent>{car.description}</CardContent>
      </Card>
    </div>
  );
}

export const CarLoader: LoaderFunction<typeof allDataType> = async ({
  params,
}) => {
  const allData: typeof allDataType = {
    car: carInterface,
  };
  await axios.get(getCars + params.id).then((data) => {
    allData.car = data.data[0];
  });
  return allData;
};

export default Car_singular;
