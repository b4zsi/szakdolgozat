/* eslint-disable @typescript-eslint/no-explicit-any */
import "./SearchResultsList.css";
import { SearchResult } from "./SearchResult";
import { FC } from "react";
import { DriverModel } from "../../model/DriverModel";
import { TeamSeriesModel } from "../../model/TeamModel";

type Result = {
  drivers: DriverModel[];
  teams: TeamSeriesModel[];
  //ide majd hozzá lehet adni az autokat, versenyket stb..
};
export const SearchResultsList: FC<Result> = (result: Result) => {
  return (
    <div className="results-list">
      {result.drivers.map((driver: DriverModel, id: number) => {
        return <SearchResult name={driver.name} slug={driver.slug} key={id} />;
      })}
      {result.teams.map((team: TeamSeriesModel, id: number) => {
        return <SearchResult name={team.name} slug={team.slug} key={id} />;
      })}
    </div>
  );
};
