import { Link } from "react-router-dom";
import styles from "../../styles/Rules.module.css";
import { Card, CardContent } from "@mui/material";

function Rules() {
  return (
    <div className={styles.rulesMainDiv}>
      <div style={{ marginTop: "2em" }}>
        <Link to="formula-1">
          <Card className={`${styles.rulesMainDiv} ${styles.formula1Image}`}>
            <CardContent className={styles.rulesCardTitle}>
              Forma 1 Szabályok
            </CardContent>
          </Card>
        </Link>
        <Link to="formula-2">
          <Card className={`${styles.rulesCard} ${styles.formula2Image}`}>
            <CardContent className={styles.rulesCardTitle}>
              Forma 2 Szabályok
            </CardContent>
          </Card>
        </Link>
        <Link to="formula-3">
          <Card className={`${styles.rulesCard} ${styles.formula3Image}`}>
            <CardContent className={styles.rulesCardTitle}>
              Forma 3 Szabályok
            </CardContent>
          </Card>
        </Link>
        <Link to="formula-esport">
          <Card className={`${styles.rulesCard} ${styles.formula1EsportImage}`}>
            <CardContent
              className={styles.rulesCardTitle}
              style={{ fontSize: "4em" }}
            >
              Forma 1 Esport Szabályok
            </CardContent>
          </Card>
        </Link>
      </div>
    </div>
  );
}

export default Rules;
