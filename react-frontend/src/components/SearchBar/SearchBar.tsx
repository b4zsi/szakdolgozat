import { SetStateAction, useEffect, useState } from "react";
import { FaSearch } from "react-icons/fa";

import "./SearchBar.css";
import { DriverModel } from "../../model/DriverModel";
import { TeamSeriesModel } from "../../model/TeamModel";

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const SearchBar = ({ setResults }: any) => {
  const [input, setInput] = useState<string>("");
  const [searchValue, setSearchValue] = useState<string>("");
  const drivers = localStorage.getItem("drivers");
  const teams = localStorage.getItem("teams");
  const resultDrivers: DriverModel[] = JSON.parse(drivers!);
  const resultTeams: TeamSeriesModel[] = JSON.parse(teams!);

  type Result = {
    drivers: DriverModel[];
    teams: TeamSeriesModel[];
    //ide majd hozzá lehet adni az autokat, versenyket stb..
  };

  useEffect(() => {
    if (input !== "") {
      fetchData();
    }
  }, [input]);

  function matchesWithInputDriver(driver: DriverModel) {
    return driver.name.toLowerCase().includes(searchValue);
  }
  function matchesWithInputTeam(team: TeamSeriesModel) {
    return team.name.toLowerCase().includes(searchValue);
  }

  const fetchData = async () => {
    const returnArray: Result = { drivers: [], teams: [] };
    returnArray.drivers = resultDrivers.filter(matchesWithInputDriver);
    returnArray.teams = resultTeams.filter(matchesWithInputTeam);
    setResults(returnArray);
  };

  const handleChange = (value: SetStateAction<string>) => {
    setInput(value);
    setSearchValue(value);
  };

  return (
    <div className="input-wrapper">
      <FaSearch id="search-icon" />
      <input
        placeholder="Keress versenyzők és csapatok között"
        value={input}
        onChange={(e) => handleChange(e.target.value)}
      />
    </div>
  );
};
