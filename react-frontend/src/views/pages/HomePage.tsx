import Typeanimation from "../../components/typeAnimation/typeanimation";
import BackgroundVideo from "../../components/backgroundvideo/backgroundVideo";
import Button from "@mui/material/Button";
import styled from "@emotion/styled";
import { Link } from "react-router-dom";
import { Card, CardContent } from "@mui/material";
import maxHelmet from "../../images/homePageHelmet.png";
import styles from "../../App.module.css";

const CustomButton = styled(Button)({
  margin: "20px",
  backgroundColor: "black",
  padding: "20px 40px",
  fontSize: "20px",
  borderRadius: "10px",
});

const HomePage = () => {
  return (
    <>
      <div className={styles.App}>
        <Typeanimation />
        <div style={{ width: "90%" }}>
          <BackgroundVideo />
        </div>
        <div>
          <CustomButton variant="contained" className={styles.button1}>
            <Link
              to="/gallery"
              style={{ textDecoration: "none", color: "white" }}
            >
              Galéria
            </Link>
          </CustomButton>
          <CustomButton variant="contained" className="button2">
            <Link
              to="/calendar"
              style={{ textDecoration: "none", color: "white" }}
            >
              Naptár
            </Link>
          </CustomButton>
        </div>

        <div className={styles.afterVideo}>
          <Card className={styles.homePageCard}>
            <img
              src={maxHelmet}
              alt="homePageHelmet"
              className={styles.homePageHelmet}
            />
            <CardContent className={styles.text}>
              Nézz szét az oldalon, ismerdd meg a versenyzőket, csapatokat,
              pályákat, ha esetleg kérdésed támad, bátran tedd fel a&nbsp;
              <Link to="/forum">fórum</Link>on!
            </CardContent>
          </Card>
          <Card className={styles.homePageCard}>
            <CardContent className={styles.text}>
              Ha még nem vagy tagja a csapatnak, akkor regisztrálj itt, és
              csatlakozz a forumunkhoz!
              <hr style={{ width: "50%" }} />
              Ha még nem ismered a szabályokat, akkor itt mindent megtalálsz:{" "}
              <Link to="/rules">Szabályok</Link>
            </CardContent>
          </Card>
        </div>
      </div>
    </>
  );
};

export default HomePage;
