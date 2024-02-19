import { SetStateAction, useEffect, useState } from "react";
import { FaSearch } from "react-icons/fa";
import "./SearchBar.css";

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const SearchBar = ({ setResults }: any) => {
  type searchType = {
    driverNames: string[];
    driverSlugs: string[];
    teamNames: string[];
    teamSlugs: string[];
  };
  const [input, setInput] = useState<string>("");
  const [searchValue, setSearchValue] = useState<string>("");
  const searchItems = localStorage.getItem("searchItems");
  const searchResults: searchType = JSON.parse(searchItems!);

  useEffect(() => {
    if (input !== "") {
      fetchData();
    }
  }, [input]);

  function matchesWithInputDriver(driverName: string) {
    return driverName.toLowerCase().includes(searchValue);
  }
  function matchesWithInputTeam(teamName: string) {
    return teamName.toLowerCase().includes(searchValue);
  }

  const fetchData = async () => {
    let returnArray: string[] = [];
    returnArray = searchResults.driverNames.filter(matchesWithInputDriver);
    const teamResults = searchResults.teamNames.filter(matchesWithInputTeam);
    returnArray.push(...teamResults);
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
