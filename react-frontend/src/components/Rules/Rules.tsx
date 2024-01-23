import React from "react";
import { Link } from "react-router-dom";
import "../../styles/Rules.css";
import { Card, CardContent } from "@mui/material";

function Rules() {
  return (
    <div className="rulesMainDiv">
      <div style={{ marginTop: "2em" }}>
        <Link to="formula-1">
          <Card className="rulesCard formula1Image">
            <CardContent className="rulesCardTitle">
              Forma 1 Szabályok
            </CardContent>
          </Card>
        </Link>
        <Link to="formula-2">
          <Card className="rulesCard formula2Image">
            <CardContent className="rulesCardTitle">
              Forma 2 Szabályok
            </CardContent>
          </Card>
        </Link>
        <Link to="formula-3">
          <Card className="rulesCard formula3Image">
            <CardContent className="rulesCardTitle">
              Forma 3 Szabályok
            </CardContent>
          </Card>
        </Link>
        <Link to="formula-esport">
          <Card className="rulesCard formula1EsportImage">
            <CardContent className="rulesCardTitle" style={{ fontSize: "4em" }}>
              Forma 1 Esport Szabályok
            </CardContent>
          </Card>
        </Link>
      </div>
    </div>
  );
}

export default Rules;
