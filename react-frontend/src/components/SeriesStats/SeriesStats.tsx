import { Divider, Grid } from "@mui/material";
import { FC } from "react";
import { SeriesModel } from "../../model/SeriesModel";

type SeriesType = {
  properties: SeriesModel;
};

const SeriesStats: FC<SeriesType> = (series: SeriesType) => {
  return (
    <Grid
      container
      spacing={4}
      style={{
        fontSize: 100,
        textAlign: "center",
        margin: "auto",
        borderRadius: 20,
        width: 1200,
        height: 200,
        color: "white",
      }}
    >
      <Grid item xs={4} style={{ padding: 0, color: "white" }}>
        {series.properties.number_of_drivers}
        <Divider
          variant="middle"
          style={{ height: 2, backgroundColor: "white" }}
        />
        <p style={{ fontSize: 30 }}>Versenyzők száma</p>
      </Grid>
      <Grid item xs={4} style={{ padding: 0, color: "white" }}>
        {series.properties.number_of_races}
        <Divider
          variant="middle"
          style={{ height: 2, backgroundColor: "white" }}
        />
        <p style={{ fontSize: 30 }}>Versenyek száma</p>
      </Grid>
      <Grid item xs={4} style={{ padding: 0, color: "white" }}>
        {series.properties.number_of_teams}
        <Divider
          variant="middle"
          style={{ height: 2, backgroundColor: "white" }}
        />
        <p style={{ fontSize: 30 }}>Csapatok száma</p>
      </Grid>
    </Grid>
  );
};

export default SeriesStats;
