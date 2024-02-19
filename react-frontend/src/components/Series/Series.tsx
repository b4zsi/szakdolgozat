import { useState } from "react";
import axios from "axios";
import { DriverModel } from "../../model/DriverModel";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import {
  Box,
  Button,
  Dialog,
  DialogTitle,
  ImageList,
  Input,
  MenuItem,
  Select,
  SelectChangeEvent,
  Typography,
} from "@mui/material";
import Drivers from "../Drivers/Drivers";
import { TeamSeriesModel } from "../../model/TeamModel";
import Teams from "../Teams/Teams";
import SeriesStats from "../SeriesStats/SeriesStats";
import { Form, LoaderFunction, useLoaderData } from "react-router-dom";
import { SeriesModel } from "../../model/SeriesModel";
import { ImageModel } from "../../model/ImageModel";
import { SearchBar } from "../SearchBar/SearchBar";
import { SearchResultsList } from "../SearchBar/SearchResultsList";
import {
  getCurrentUser,
  getDrivers,
  getSeries,
  getTeams,
} from "../../api_links";
import { imageInterface } from "../../interface/imageInterface";
import { seriesInterface } from "../../interface/seriesInterface";
import AddIcon from "@mui/icons-material/Add";
import { UserModel } from "../../model/UserModel";
import { userInterface } from "../../interface/userInterface";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import styles from "../../styles/SeriesStyle.module.css";

function driverSort(a: DriverModel, b: DriverModel) {
  return a.id - b.id;
}

type Result = {
  results: string[];
  resultSlugs: string[];
};
type searchType = {
  driverNames: string[];
  driverSlugs: string[];
  teamNames: string[];
  teamSlugs: string[];
};

function getTeamColor(teams: TeamSeriesModel[], driver: DriverModel): string {
  let color = "";
  teams.map((team: TeamSeriesModel) => {
    if (team.slug.match(driver.team_slug)) {
      color = team.team_color;
    }
  });
  return color;
}
let allDataType: {
  user: UserModel;
  series: SeriesModel;
  drivers: DriverModel[];
  teams: TeamSeriesModel[];
  image: ImageModel;
};
const Series = () => {
  const allData: typeof allDataType = useLoaderData() as {
    user: UserModel;
    series: SeriesModel;
    drivers: DriverModel[];
    teams: TeamSeriesModel[];
    image: ImageModel;
  };
  console.log(allData.drivers);

  const series: SeriesModel = allData.series;
  const drivers: DriverModel[] = allData.drivers.sort(
    (a: DriverModel, b: DriverModel) => driverSort(a, b)
  );
  const teams: TeamSeriesModel[] = allData.teams;
  const image: ImageModel = allData.image;
  const user: UserModel = allData.user;
  const [results, setResults] = useState<Result>();
  const [openDriverAdd, setOpenDriverAdd] = useState<boolean>(false);
  const [teamCreateOpen, setTeamCreateOpen] = useState<boolean>(false);
  const [newDriverTeam, setNewDriverTeam] = useState<string>("");
  const [newDriverName, setNewDriverName] = useState<string>("");
  const [newDriverAge, setNewDriverAge] = useState<number>(15);
  const [newDriverNationality, setNewDriverNationality] = useState<string>("");
  const [newDriverWins, setNewDriverWins] = useState<number>(0);
  const [newDriverPodiums, setNewDriverPodiums] = useState<number>(0);
  const [newDriverDescription, setNewDriverDescription] = useState<string>("");

  const [newTeamName, setNewTeamName] = useState<string>("");
  const [newTeamColor, setNewTeamColor] = useState("000000");
  const [newNumberOfChampionships, setNewNumberOfChampionships] =
    useState<number>(0);
  const [newNumberOfRaces, setNewNumberOfRaces] = useState<number>(0);
  const [newHeadquartersCity, setNewHeadquartersCity] = useState<string>("");
  const [newTechnicalDirector, setNewTechnicalDirector] = useState<string>("");
  const [newFirstWin, setNewFirstWin] = useState<number>(0);
  const [newLastChampionshipWin, setNewLastChampionshipWin] =
    useState<number>(0);
  const [newDateOfEstablishment, setNewDateOfEstablishment] =
    useState<number>(0);

  async function handleTeamAdd(): Promise<void> {
    await axios.post(getTeams, {
      team: {
        name: newTeamName,
        team_color: newTeamColor,
        number_of_championships: newNumberOfChampionships,
        number_of_race: newNumberOfRaces,
        headquarters_city: newHeadquartersCity,
        technical_director: newTechnicalDirector,
        first_win: newFirstWin,
        last_championship_win: newLastChampionshipWin,
        date_of_establishment: newDateOfEstablishment,
        series_id: series.id,
      },
    });
  }

  const searchTeamMembers = (teamName: string): number => {
    let teamMembers = 0;
    teams.map((team: TeamSeriesModel) => {
      if (team.name === teamName) {
        teamMembers++;
      }
    });
    return teamMembers;
  };

  const submitDriverAdd = async () => {
    if (
      newDriverName === "" ||
      newDriverTeam === "" ||
      newDriverNationality === ""
    ) {
      toastNotification(1, "Minden mezőt tölts ki");
    } else {
      if (searchTeamMembers(newDriverTeam) >= 2) {
        toastNotification(1, "A csapat már megtelt!, Válassz másikat!");
      } else {
        await axios
          .post(getDrivers, {
            drivers: {
              name: newDriverName,
              age: newDriverAge,
              natianality: newDriverNationality,
              number_of_wins: newDriverWins,
              number_of_podiums: newDriverPodiums,
              description: newDriverDescription,
              series_id: series.id,
              team_slug: newDriverTeam,
            },
          })
          .then((data) => {
            console.log(data);
          });
      }
    }
  };

  const searchItems: searchType = {
    driverNames: [],
    driverSlugs: [],
    teamNames: [],
    teamSlugs: [],
  };
  drivers.map((driver: DriverModel) => {
    searchItems.driverNames.push(driver.name);
    searchItems.driverSlugs.push(driver.slug);
  });
  teams.map((team: TeamSeriesModel) => {
    searchItems.teamNames.push(team.name);
    searchItems.teamSlugs.push(team.slug);
  });
  localStorage.setItem("searchItems", JSON.stringify(searchItems));

  function handleTeamChange(event: SelectChangeEvent<string>): void {
    setNewDriverTeam(event.target.value);
  }

  return (
    <div className={styles.background}>
      <CustomSnackbar />
      <Dialog open={openDriverAdd} className={styles.driverAddDialog}>
        <Form className={styles.driverAddForm}>
          <Input
            required
            className={styles.addDriverInput}
            type="text"
            value={newDriverName}
            onChange={(e) => setNewDriverName(e.target.value)}
            name="versenyző neve"
            aria-label="Versenyző neve"
            autoFocus
            placeholder="Versenyző neve"
            inputProps={{ maxLength: 40 }}
          />
          <Input
            value={newDriverAge}
            onChange={(e) => setNewDriverAge(parseInt(e.target.value))}
            className={styles.addDriverInput}
            type="number"
            name="Életkor"
            aria-label="Életkor"
            required
            autoFocus
            inputProps={{ min: 15, max: 99 }}
            placeholder="Életkor"
          />
          <Input
            value={newDriverNationality}
            onChange={(e) => setNewDriverNationality(e.target.value)}
            inputProps={{ maxLength: 40 }}
            className={styles.addDriverInput}
            type="text"
            name="Nemzetiség"
            aria-label="Nemzetiség"
            required
            autoFocus
            placeholder="Nemzetiség"
          />
          <Input
            value={newDriverWins}
            onChange={(e) => setNewDriverWins(parseInt(e.target.value))}
            className={styles.addDriverInput}
            type="number"
            name="Győzelmek"
            aria-label="Győzelmek"
            required
            inputProps={{ min: 0 }}
            autoFocus
            placeholder="Győzelmek"
          />
          <Input
            value={newDriverPodiums}
            onChange={(e) => setNewDriverPodiums(parseInt(e.target.value))}
            className={styles.addDriverInput}
            type="number"
            name="Pódiumok"
            aria-label="Pódiumok"
            required
            inputProps={{ min: 0 }}
            autoFocus
            placeholder="Pódiumok"
          />
          <Select
            className={styles.addDriverInput}
            name="Csapat"
            type="text"
            autoFocus
            margin="dense"
            id="team_slug"
            required
            placeholder="Csapat"
            aria-label="Csapat"
            value={newDriverTeam}
            onChange={handleTeamChange}
          >
            {teams.map((team: TeamSeriesModel) => (
              <MenuItem key={team.slug} value={team.slug}>
                {team.name}
              </MenuItem>
            ))}
          </Select>
          <Input
            value={newDriverDescription}
            onChange={(e) => setNewDriverDescription(e.target.value)}
            className={styles.addDriverInput}
            type="text"
            name="Leírás"
            aria-label="Leírás"
            required
            multiline
            minRows={3}
            maxRows={4}
            inputProps={{ maxLength: 400 }}
            autoFocus
            placeholder="Leírás"
          />
        </Form>

        <Button
          className={styles.addDriverButton}
          variant="contained"
          color="success"
          onClick={() => submitDriverAdd()}
        >
          Hozzáadás
        </Button>
        <Button
          className={styles.addDriverButton}
          variant="contained"
          color="error"
          onClick={() => setOpenDriverAdd(false)}
        >
          Bezárás
        </Button>
      </Dialog>

      <Dialog open={teamCreateOpen}>
        <DialogTitle>Új csapat hozzáadása</DialogTitle>
        <form className={styles.newTeamForm}>
          <Input
            type="text"
            placeholder="Csapatnév"
            name="csapatnev"
            id="csapatnev"
            required
            autoFocus
            inputProps={{ maxLength: 60, minLength: 5 }}
            value={newTeamName}
            onChange={(e) => {
              setNewTeamName(e.target.value);
            }}
          />
          <Input
            type="number"
            autoFocus
            required
            placeholder="Megnyert bajnokságok száma"
            name="bajnoksagok_szama"
            id="bajnoksagok_szama"
            value={newNumberOfChampionships}
            onChange={(e) => {
              setNewNumberOfChampionships(parseInt(e.target.value));
            }}
          />
          <Input
            type="number"
            autoFocus
            required
            placeholder="Futamok száma"
            name="futamok_szama"
            id="futamok_szama"
            value={newNumberOfRaces}
            onChange={(e) => {
              setNewNumberOfRaces(parseInt(e.target.value));
            }}
          />
          <Input
            type="text"
            autoFocus
            required
            placeholder="Csapat székhelye"
            name="csapat_szekhelye"
            id="csapat_szekhelye"
            value={newHeadquartersCity}
            onChange={(e) => {
              setNewHeadquartersCity(e.target.value);
            }}
          />
          <Input
            type="text"
            autoFocus
            required
            placeholder="Technikai igazgató"
            name="technikai_igazgato"
            id="technikai_igazgato"
            value={newTechnicalDirector}
            onChange={(e) => {
              setNewTechnicalDirector(e.target.value);
            }}
          />
          <Input
            type="number"
            autoFocus
            required
            placeholder="Első győzelem"
            name="elso_gyozelem"
            id="elso_gyozelem"
            value={newFirstWin}
            onChange={(e) => {
              setNewFirstWin(parseInt(e.target.value));
            }}
          />
          <Input
            type="number"
            autoFocus
            required
            placeholder="Utolsó bajnoki győzelem"
            name="utolso_bajnoki_gyozelem"
            id="utolso_bajnoki_gyozelem"
            value={newLastChampionshipWin}
            onChange={(e) => {
              setNewLastChampionshipWin(parseInt(e.target.value));
            }}
          />
          <Input
            type="number"
            autoFocus
            required
            placeholder="Alapítás éve"
            name="alapitas_eve"
            id="alapitas_eve"
            value={newDateOfEstablishment}
            onChange={(e) => {
              setNewDateOfEstablishment(parseInt(e.target.value));
            }}
          />
          <Input
            type="text"
            autoFocus
            required
            placeholder="Csapat színe"
            name="csapat_szine"
            id="csapat_szine"
            value={newTeamColor}
            onChange={(e) => {
              setNewTeamColor(e.target.value);
            }}
          />
          <Button
            onClick={(e) => {
              e.preventDefault();
              setTeamCreateOpen(false);
            }}
          >
            Mégsem
          </Button>
          <Button
            onClick={(e) => {
              e.preventDefault();
              handleTeamAdd();
            }}
          >
            Mentés
          </Button>
        </form>
      </Dialog>
      <img src={image.image_url} alt="kep" className={styles.image} />
      <Box sx={{ marginTop: "23.5%", color: "white" }}>
        <SeriesStats properties={series} />
      </Box>
      <div className={styles.searchBarContainer}>
        <SearchBar setResults={setResults} />
        {results && (
          <SearchResultsList
            results={results as unknown as string[]}
            resultSlugs={[]}
          />
        )}
      </div>
      <Box sx={{ margin: 5 }}>
        <div className={styles.title}>
          <Typography variant="h2" className={styles.subTitle}>
            Versenyzők
          </Typography>
          {user !== undefined && user.admin && (
            <Button
              variant="contained"
              className={styles.addButton}
              onClick={() => setOpenDriverAdd(true)}
            >
              <AddIcon />
            </Button>
          )}
        </div>

        <Paper variant="outlined" className={styles.driverPaper}>
          <Grid
            container
            spacing={3}
            alignItems={"center"}
            justifyContent={"center"}
            wrap="nowrap"
            className={styles.driverGrid}
          >
            <div className={styles.oneLineDiv}>
              <ImageList className={styles.imageList}>
                {drivers.map((item: DriverModel) => (
                  <Drivers
                    key={item.name}
                    properties={item}
                    team_color={getTeamColor(teams, item)}
                    team_id={item.team_id}
                    user={user}
                  />
                ))}
              </ImageList>
            </div>
          </Grid>
        </Paper>
      </Box>
      <Box sx={{ margin: 5 }}>
        <div className={styles.title}>
          <Typography variant="h2" className={styles.subTitle}>
            Csapatok
          </Typography>
          {user !== undefined && user.admin && (
            <Button
              variant="contained"
              className={styles.addButton}
              onClick={() => setTeamCreateOpen(true)}
            >
              <AddIcon />
            </Button>
          )}
        </div>
        <Paper variant="outlined" className={styles.teamPaper}>
          <Grid
            container
            spacing={2}
            alignItems={"center"}
            wrap="nowrap"
            className={styles.teamGrid}
          >
            <div className={styles.oneLineDivTeam}>
              <ImageList className={styles.imageListTeam}>
                {teams.map((item: TeamSeriesModel) => (
                  <Teams properties={item} user={user} key={item.name} />
                ))}
              </ImageList>
            </div>
          </Grid>
        </Paper>
      </Box>
    </div>
  );
};

export const SeriesLoader: LoaderFunction<typeof allDataType> = async ({
  params,
}) => {
  const returnData: typeof allDataType = {
    user: userInterface,
    series: seriesInterface,
    drivers: [],
    teams: [],
    image: imageInterface,
  };
  const jwt = localStorage.getItem("jwt");

  await axios.get(getSeries + params.id).then((data) => {
    returnData.drivers = data.data.drivers;
    returnData.series = data.data;
    returnData.teams = data.data.teams;
    returnData.image = data.data.images[0];
  });
  await axios
    .get(getCurrentUser, {
      headers: {
        "Content-type": "application/json",
        Authorization: `${jwt}`,
      },
    })
    .then((data) => {
      console.log(data.data);
      returnData.user = data.data;
    })
    .catch((err) => {
      console.log(err);
    });
  return returnData;
};

export default Series;
