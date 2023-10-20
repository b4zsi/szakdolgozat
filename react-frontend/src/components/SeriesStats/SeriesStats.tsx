import { Grid } from "@mui/material";
import React, { FC } from "react";
import { SeriesModel } from "../../model/SeriesModel";

type SeriesType = {
  properties: SeriesModel;
};

const SeriesStats: FC<SeriesType> = (series: SeriesType) => {
  return <Grid>{series.properties.name}</Grid>;
};

export default SeriesStats;
