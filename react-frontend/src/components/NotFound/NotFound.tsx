import { Card } from "@mui/material";
import { Link } from "react-router-dom";
import "../../styles/PageNotFound.css";

export default function NotFound() {
  return (
    <div className="background">
      <Card className="notFoundCard">
        Ez az oldal nem létezik. Vissza a&ensp;
        <Link to="/" className="link">
          Főoldalra
        </Link>
        .
      </Card>
    </div>
  );
}
