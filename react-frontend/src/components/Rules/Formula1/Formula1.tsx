import React from "react";
import "../../../styles/Rules_singular.css";
import { Button, Card, CardContent, Divider } from "@mui/material";

function Formula1() {
  const bookmarks = [
    { id: 1, szoveg: "általános" },
    { id: 2, szoveg: "időmérő" },
    { id: 3, szoveg: "verseny" },
    { id: 4, szoveg: "sprint" },
    { id: 5, szoveg: "versenyzők" },
    { id: 6, szoveg: "csapatok" },
  ];
  return (
    <div className="Rules_singularMainDiv">
      <div className="rulesTitle">Formula 1 Szabályzat</div>
      <Divider variant="middle" className="rulesDivider" />
      <div className="bookmarks">
        {bookmarks.map((bookmark) => (
          <a href={`#${bookmark.szoveg}`} key={bookmark.id}>
            <Button className="bookmarkButton">{bookmark.szoveg}</Button>
          </a>
        ))}
      </div>
      <div className="seriesCardContainer">
        <Card className="seriesRulesCard" id="általános">
          <CardContent className="cardTitle">Általános</CardContent>
        </Card>
        <Card className="seriesRulesCard" id="időmérő">
          <CardContent className="cardTitle">Időmérő</CardContent>
        </Card>
        <Card className="seriesRulesCard" id="verseny">
          <CardContent className="cardTitle">Verseny</CardContent>
        </Card>
        <Card className="seriesRulesCard" id="sprint">
          <CardContent className="cardTitle">Sprint</CardContent>
        </Card>
        <Card className="seriesRulesCard" id="sprint">
          <CardContent className="cardTitle">Versenyzők</CardContent>
        </Card>
        <Card className="seriesRulesCard" id="sprint">
          <CardContent className="cardTitle">Csapatok</CardContent>
        </Card>
      </div>
    </div>
  );
}

export default Formula1;
