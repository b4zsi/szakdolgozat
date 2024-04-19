import { Card } from "@mui/material";
import { Link } from "react-router-dom";
import styles from "../../styles/PageNotFound.module.css";

export default function NotFound() {
  return (
    <div className={styles.background}>
      <Card className={styles.notFoundCard}>
        Ez az oldal nem létezik vagy csak <Link to="signup">regisztráció</Link>{" "}
        után elérhető. Vissza a&ensp;
        <Link to="/" className={styles.link}>
          Főoldalra
        </Link>
        .
      </Card>
    </div>
  );
}
