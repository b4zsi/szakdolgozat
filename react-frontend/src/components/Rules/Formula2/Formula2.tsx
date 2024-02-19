import styles from "../../../styles/Rules_singular.module.css";
import { Button, Card, CardContent, Divider } from "@mui/material";
import { Link } from "react-router-dom";

function Formula2() {
  const bookmarks = [
    { id: 1, szoveg: "általános" },
    { id: 2, szoveg: "hétvége" },
    { id: 3, szoveg: "gumiabroncsok" },
    { id: 4, szoveg: "pontozás" },
    { id: 5, szoveg: "zászlók" },
  ];
  return (
    <div className={styles.Rules_singularMainDiv}>
      <div className={styles.rulesTitle}>Formula 2 Szabályzat</div>
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
            A Forma 2-es széria a Forma-1-nek egy gyermek szériája, amelyben a
            fiatal tehetségeknek van lehetőségük bizonyítani. Ebben a szériában
            nincs különbség az autók között, itt az összes autó megegyezik, így
            jóval kiegyenlítettebb a mezőny. Az autóknak a karosszériáját, a
            Dallara Automobili készíti, a motor pedig egy 3.4 literes V6-os
            Mecachrome motor.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="hétvége">
          <CardContent className={styles.cardTitle}>
            Hétvégi formátum
          </CardContent>
          <CardContent className={styles.cardContent}>
            Pénteken van egy 45 perces szabadedzés és egy 30 perces időmérő
            edzés. Egy sprintversenyre szombaton kerül sor, és 120 kilométerből
            vagy 45 percből áll, attól függően, hogy melyik van előbb. A főfutam
            vasárnap délelőtt kerül sor a Forma-1-es Nagydíj előtt, és 170
            kilométeres vagy 60 perces, attól függően, hogy melyik következik
            van előbb. A főfutam tartalmaz egy kötelező boxkiállást. Legalább
            egy garnitúrát kell használnia minden száraz időjárási
            gumiabroncsból a versenyzőknek a főfutam alatt. A pénteki időmérő
            végső besorolásának eredményei határozzák meg a vasárnapi főfutam
            rajtrácsát. A szombati sprintverseny rajtrácsát a pénteki időmérő
            eredményeinek első 10 helyezettjének megfordításával határozzák meg.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="gumiabroncsok">
          <CardContent className={styles.cardTitle}>Gumiabroncsok</CardContent>
          <CardContent className={styles.cardContent}>
            A sportszabályzat azt mondja, hogy minden versenyző hétvégenként öt
            garnitúra száraz időjárási gumiabroncsot kap. Három „elsődleges”
            specifikációkészlettel és kettő „opcionális” specifikációval
            rendelkeznek. Minden versenyző három garnitúra nedves időjárási
            gumiabroncsot is kap a szárazak mellé.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="pontozás">
          <CardContent className={styles.cardTitle}>Pontozás</CardContent>
          <CardContent className={styles.cardContent}>
            Két pontot kap az a pilóta, aki megnyeri az időmérőt. A Sprint
            versenyen az első nyolc helyezett 10, 8, 6, 5, 4, 3, 2 és 1 pontot
            kap. A főfutamon az első 10 helyezett 25, 18, 15, 12, 10, 8, 6, 4, 2
            és 1 pontot kap. Minden versenyen egy pontot adnak az a pilóta, aki
            a leggyorsabb köridőt éri el, feltéve, hogy a végső versenybesorolás
            első 10 helyezettje volt.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="zászló">
          <CardContent className={styles.cardTitle}>Zászlók</CardContent>
          <Link to="/rules/formula-1#zászlók" className={styles.cardContent}>
            Lásdd a Forma-1-es szabályzatban. Ott minden részletesen le van
            írva.
          </Link>
        </Card>
      </div>
    </div>
  );
}

export default Formula2;
