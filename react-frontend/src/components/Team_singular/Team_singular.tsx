import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { TeamModel } from "../../model/TeamModel";
import axios from "axios";

const team_id: string = document.URL.split("/")[4];
const team_url = "http://localhost:3000/api/v1/teams/" + team_id;

const Team_singular = () => {
  let navigate = useNavigate();
  let teamType: TeamModel = {
    id: 0,
    name: "",
    number_of_championships: 0,
    number_of_races: 0,
    headquarters_city: "",
    date_of_establishment: 0,
    technical_director: "",
    first_win: 0,
    last_championship_win: 0,
    series_id: 0,
    team_color: "",
    team_picture: "",
    slug: "",
  };
  const [team, setTeam] = useState(teamType);

  if (team_id.match(/[1-9]/g)) {
    window.location.reload();
  }
  useEffect(() => {
    const fetchData = async () => {
      await axios
        .get(team_url)
        .then((data) => {
          setTeam(data.data[0]);
        })
        .catch(() => navigate("/"));
    };
    fetchData();
  }, [navigate]);
  console.log(team);
  return <div>{team.name}</div>;
};

export default Team_singular;
