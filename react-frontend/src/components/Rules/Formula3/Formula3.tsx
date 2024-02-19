import styles from "../../../styles/Rules_singular.module.css";
import { Button, Card, CardContent, Divider } from "@mui/material";
import { Link } from "react-router-dom";

function Formula3() {
  const bookmarks = [
    { id: 1, szoveg: "általános" },
    { id: 2, szoveg: "hétvége" },
    { id: 3, szoveg: "gumiabroncsok" },
    { id: 4, szoveg: "pontozás" },
    { id: 5, szoveg: "zászlók" },
  ];
  return (
    <div className={styles.Rules_singularMainDiv}>
      <div className={styles.rulesTitle}>Formula 3 Szabályzat</div>
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
            A Forma 3-as széria a Forma-2-nek egy gyermek szériája, amelyben a
            tini tehetségeknek van lehetőségük bizonyítani. Ebben a szériában
            sincs különbség az autók között(mint a Forma 2-ben), itt is az
            összes autó megegyezik, így jóval kiegyenlítettebb a mezőny. Az
            autóknak a karosszériáját, a Dallara Automobili készíti, a motor
            pedig ugyanaz a 3.4 literes V6-os Mecachrome motor mint a Forma
            2-ben csak turbó nélkül. A bajnokságban résztvevő valamennyi
            versenyzőnek A vagy B fokozatú nemzetközi FIA licenccel kell
            rendelkeznie.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="hétvége">
          <CardContent className={styles.cardTitle}>Hétvége menete</CardContent>
          <CardContent className={styles.cardContent}>
            Pénteken van egy 45 perces szabadedzés és egy 30 perces időmérő
            edzés. Egy sprint futamra szombaton kerül sor, és 40 perc + egy
            körből áll. A főfutam vasárnap reggel, a Forma-1-es Nagydíj előtt
            kerül megrendezésre, és 45 perc + egy körből áll. A pénteki
            kvalifikáció végső eredményei határozzák meg a vasárnapi főfutam
            rajtrácsát. A szombati sprintverseny rajtrácsát a pénteki
            kvalifikáció első 12 helyezettjének megfordításával határozzák meg.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="gumiabroncsok">
          <CardContent className={styles.cardTitle}>Gumiabroncsok</CardContent>
          <CardContent className={styles.cardContent}>
            Minden versenyzőnek hétvégenként 4 garnitúra száraz és 2 garnitúra
            nedves időjárásű gumiabroncsot kapnak.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="pontozás">
          <CardContent className={styles.cardTitle}>Pontozás</CardContent>
          <CardContent className={styles.cardContent}>
            Két pontot kap az a pilóta, aki az időmérőt nyeri. A Sprint
            versenyen a legjobb 10 versenyző 10, 9, 8, 7, 6, 5, 4, 3, 2 és 1
            pontot kap ilyen sorrendben. A főfutamon az első 10 helyezett 25,
            18, 15, 12, 10, 8, 6, 4, 2 és 1 pontot kap. Minden versenyen egy
            pontot adnak az a pilóta, aki a leggyorsabb köridőt éri el, feltéve,
            hogy a végső versenybesorolás első 10 helyezettje volt.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="zászlók">
          <CardContent className={styles.cardTitle}>Zászlók</CardContent>
          <CardContent className={styles.cardContent}>
            <Link to="rules/formula-1#zászlók" className={styles.link}>
              Lásdd a Forma-1-es szabályzatban. Ott minden részletesen le van
              írva.
            </Link>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}

export default Formula3;
