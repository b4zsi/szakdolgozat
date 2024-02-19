import { Card, CardContent, Divider, Grid } from "@mui/material";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import { TrackModel } from "../../model/TrackModel";
import styles from "../../styles/TrackStyle.module.css";
import axios from "axios";
import { getTracks } from "../../api_links";
import { trackInterface } from "../../interface/trackInterface";

let allDataType: {
  track: TrackModel;
};
function Track() {
  const data: typeof allDataType = useLoaderData() as {
    track: TrackModel;
  };
  const track: TrackModel = data.track;
  return (
    <div className={styles.mainTrackDiv}>
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
          <img
            src={track.images[0].image_url}
            alt="trackImage"
            className={styles.trackImage}
          />
        </Grid>
        <Grid item xs={3}>
          <Grid container direction="column" spacing={3} minHeight={600}>
            <Grid item>
              <Card className={`${styles.trackCard}, ${styles.right}`}>
                <p className={styles.cardTitle}>Ország</p>
                <Divider variant="middle" className={styles.divider} />
                <CardContent className={styles.cardContent}>
                  {track.country}
                </CardContent>
              </Card>
            </Grid>
            <Grid item>
              <Card className={`${styles.trackCard}, ${styles.right}`}>
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
              <Card className={`${styles.trackCard}, ${styles.right}`}>
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
  };
  await axios.get(getTracks + params.id).then((data) => {
    allData.track = data.data[0];
  });
  return allData;
};

export default Track;
