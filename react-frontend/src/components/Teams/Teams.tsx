import { FC, Fragment, useState } from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import Divider from "@mui/material/Divider";
import hexRgb from "hex-rgb";
import { TeamSeriesModel } from "../../model/TeamModel";
import { Link } from "react-router-dom";
import { UserModel } from "../../model/UserModel";
import {
  Button,
  Dialog,
  DialogActions,
  DialogTitle,
  Input,
} from "@mui/material";
import DeleteIcon from "@mui/icons-material/Delete";
import EditIcon from "@mui/icons-material/Edit";
import { toastNotification } from "../Snackbar/snackbar";
import axios from "axios";
import { getTeams } from "../../api_links";
import "react-color-palette/css";
import noHelmet from "../../images/nohelmet.png";
import styles from "../../styles/TeamStyle.module.css";

type Team = {
  properties: TeamSeriesModel;
  user: UserModel;
};

const Teams: FC<Team> = (team: Team) => {
  const [teamDeleteOpen, setTeamDeleteOpen] = useState<boolean>(false);
  const [teamEditOpen, setTeamEditOpen] = useState<boolean>(false);

  //#region TeamEdit States
  const [teamName, setTeamName] = useState<string>(team.properties.name);
  const [teamColor, setTeamColor] = useState<string>(
    team.properties.team_color
  );
  const [numberOfChampionships, setNumberOfChampionships] = useState<number>(
    team.properties.number_of_championships
  );
  const [numberOfRaces, setNumberOfRaces] = useState<number>(
    team.properties.number_of_races
  );
  const [headquartersCity, setHeadquartersCity] = useState<string>(
    team.properties.headquarters_city
  );
  const [technicalDirector, setTechnicalDirector] = useState<string>(
    team.properties.technical_director
  );
  const [firstWin, setFirstWin] = useState<number>(team.properties.first_win);
  const [lastChampionshipWin, setLastChampionshipWin] = useState<number>(
    team.properties.last_championship_win
  );
  const [dateOfEstablishment, setDateOfEstablishment] = useState<number>(
    team.properties.date_of_establishment
  );
  //#endregion

  async function handleTeamDelete(): Promise<void> {
    await axios.delete(getTeams + team.properties.id).then((response) => {
      console.log(response);
      toastNotification(0, "Sikeres törlés!");
      setTeamDeleteOpen(false);
    });
  }

  async function handleTeamEdit(): Promise<void> {
    await axios
      .put(getTeams + team.properties.id, {
        team: {
          name: teamName,
          team_color: teamColor,
          number_of_championships: numberOfChampionships,
          number_of_races: numberOfRaces,
          headquarters_city: headquartersCity,
          technical_director: technicalDirector,
          first_win: firstWin,
          last_championship_win: lastChampionshipWin,
          date_of_establishment: dateOfEstablishment,
          series_id: team.properties.series_id,
        },
      })
      .then((response) => {
        console.log(response);
        toastNotification(0, "Sikeres módosítás!");
        setTeamEditOpen(false);
        window.location.reload();
      });
  }

  return (
    <div>
      <Dialog open={teamDeleteOpen}>
        <DialogTitle>Biztosan törlöd?</DialogTitle>
        <DialogActions>
          <Button
            onClick={(e) => {
              e.preventDefault();
              handleTeamDelete();
            }}
          >
            Törlés
          </Button>
          <Button
            onClick={(e) => {
              e.preventDefault();
              setTeamDeleteOpen(false);
            }}
          >
            Mégsem
          </Button>
        </DialogActions>
      </Dialog>

      <Dialog open={teamEditOpen}>
        <DialogTitle>Csapat módosítása</DialogTitle>
        <Input
          placeholder="Csapatnév"
          name="csapatnev"
          id="csapatnev"
          autoFocus
          value={teamName}
          onChange={(e) => {
            setTeamName(e.target.value);
          }}
        />
        <Input
          placeholder="Megnyert bajnokságok száma"
          name="bajnoksagok_szama"
          id="bajnoksagok_szama"
          autoFocus
          required
          value={numberOfChampionships}
          onChange={(e) => {
            setNumberOfChampionships(parseInt(e.target.value));
          }}
        />
        <Input
          placeholder="Futamok száma"
          name="futamok_szama"
          id="futamok_szama"
          autoFocus
          required
          value={numberOfRaces}
          onChange={(e) => {
            setNumberOfRaces(parseInt(e.target.value));
          }}
        />
        <Input
          placeholder="Csapat székhelye"
          name="csapat_szekhelye"
          id="csapat_szekhelye"
          autoFocus
          required
          value={headquartersCity}
          onChange={(e) => {
            setHeadquartersCity(e.target.value);
          }}
        />
        <Input
          placeholder="Technikai igazgató"
          name="technikai_igazgato"
          id="technikai_igazgato"
          autoFocus
          required
          value={technicalDirector}
          onChange={(e) => {
            setTechnicalDirector(e.target.value);
          }}
        />
        <Input
          placeholder="Első győzelem"
          name="elso_gyozelem"
          id="elso_gyozelem"
          autoFocus
          required
          inputProps={{ min: 1950, max: 2023 }}
          value={firstWin}
          onChange={(e) => {
            setFirstWin(parseInt(e.target.value));
          }}
        />
        <Input
          placeholder="Utolsó bajnoki győzelem"
          name="utolso_bajnoki_gyozelem"
          id="utolso_bajnoki_gyozelem"
          autoFocus
          required
          value={lastChampionshipWin}
          onChange={(e) => {
            setLastChampionshipWin(parseInt(e.target.value));
          }}
        />
        <Input
          placeholder="Alapítás éve"
          name="alapitas_eve"
          id="alapitas_eve"
          autoFocus
          required
          value={dateOfEstablishment}
          onChange={(e) => {
            setDateOfEstablishment(parseInt(e.target.value));
          }}
        />
        <Input
          type="color"
          placeholder="Csapat színe"
          name="csapat_szine"
          id="csapat_szine"
          autoFocus
          required
          value={teamColor}
          onChange={(e) => {
            setTeamColor(e.target.value);
          }}
        />

        <DialogActions>
          <Button
            onClick={(e) => {
              e.preventDefault();
              handleTeamEdit();
            }}
          >
            Mentés
          </Button>
          <Button
            onClick={(e) => {
              e.preventDefault();
              setTeamEditOpen(false);
            }}
          >
            Mégsem
          </Button>
        </DialogActions>
      </Dialog>
      <Link to={`/teams/${team.properties.slug}`}>
        <Card
          sx={{
            backgroundColor: `${hexRgb(team.properties.team_color + "C3", {
              format: "css",
            })}`,
          }}
          className={styles.cardContainer}
        >
          {team.user !== null && team.user.admin === true && (
            <Fragment>
              <Button
                onClick={(e) => {
                  e.preventDefault();
                  setTeamDeleteOpen(true);
                }}
                style={{ zIndex: 999, margin: 0, padding: 0 }}
              >
                <DeleteIcon color="error" />
              </Button>
              <Button
                onClick={(e) => {
                  e.preventDefault();
                  setTeamEditOpen(true);
                }}
                style={{ zIndex: 999, marginLeft: 110, padding: 0 }}
              >
                <EditIcon />
              </Button>
            </Fragment>
          )}
          {team.properties.first_image === null ? (
            <CardMedia
              image={noHelmet}
              title="teams"
              className={styles.cardMedia}
            />
          ) : (
            <CardMedia className={styles.cardMedia} title="teams">
              <img
                src={`${team.properties.first_image.image_url}`}
                alt="kep"
                className={styles.cardImage}
              />
            </CardMedia>
          )}

          <CardContent>
            <Divider variant="middle" style={{ height: 2 }} />
            <Typography gutterBottom className={styles.name}>
              {team.properties.name}
            </Typography>
          </CardContent>
        </Card>
      </Link>
    </div>
  );
};

export default Teams;
