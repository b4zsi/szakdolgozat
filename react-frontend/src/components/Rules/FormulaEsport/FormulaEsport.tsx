import styles from "../../../styles/Rules_singular.module.css";
import { Button, Card, CardContent, Divider } from "@mui/material";
import { Link } from "react-router-dom";

function Formula1Esport() {
  const bookmarks = [
    { id: 1, szoveg: "általános" },
    { id: 2, szoveg: "formátum" },
    { id: 3, szoveg: "többi" },
  ];
  return (
    <div className={styles.Rules_singularMainDiv}>
      <div className={styles.rulesTitle}>Formula 1 Esport Szabályzat</div>
      <Divider variant="middle" className={styles.rulesDivider} />
      <div className={styles.bookmarks}>
        {bookmarks.map((bookmark) => (
          <a href={`#${bookmark.szoveg}`} key={bookmark.id}>
            <Button className={styles.bookmarkButton}>{bookmark.szoveg}</Button>
          </a>
        ))}
      </div>
      <div className={styles.seriesCardContainer}>
        <Card className={styles.seriesRulesCard} id="általános">
          <CardContent className={styles.cardTitle}>Általános</CardContent>
          <CardContent className={styles.cardContent}>
            Az FIA Formula 1 Esports Series egy professzionális e-sport program,
            amelyet a Forma-1 hirdet. A programot 2017-ben hozták létre, hogy
            bevonja a hivatalos Forma-1-es videojátékot és játékosközösségét, új
            utat biztosítva a Forma-1 sporttal való nagyobb elköteleződéshez.
            2018-ban a hivatalos Forma-1-es csapatok először csatlakoztak a
            programhoz, hogy saját sportcsapatokat hozzanak létre a Formula 1
            Esports Series bajnokságban való részvételhez.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="formátum">
          <CardContent className={styles.cardTitle}>A formátum</CardContent>
          <CardContent className={styles.cardContent}>
            Pro Széria: Minden résztvevő játékos 25-50%-os versenyeken versenyez
            egy élő közvetítés során. Pontokat szereznek maguknak és F1-es
            csapataiknak. Ezek a pontok beleszámítanak a bajnokságba, amely után
            a győztes csapat és a játékos az F1 New Balance Esports Series
            csapatok és a pilóták világbajnokává koronázzák meg, a nyereményalap
            egy részét pedig a helyezéseik alapján osztják szét a csapatok
            között.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="többi">
          <CardContent className={styles.cardTitle}>
            A többi szabályról
          </CardContent>
          <CardContent className={styles.cardContent}>
            A többi szabályról a{" "}
            <Link to="/rules/formula-1" className={styles.link}>
              Forma 1 szabály
            </Link>{" "}
            oldalon olvashatsz.
          </CardContent>
        </Card>
      </div>
    </div>
  );
}

export default Formula1Esport;
