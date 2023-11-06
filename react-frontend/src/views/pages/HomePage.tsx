import React from "react";
import "../../App.css";
import Typeanimation from "../../components/typeAnimation/typeanimation";
import BackgroundVideo from "../../components/backgroundvideo/backgroundVideo";
import Button from "@mui/material/Button";
import styled from "@emotion/styled";
import { Link } from "react-router-dom";

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
      <div className="App">
        <Typeanimation />

        <div style={{ width: "90%" }}>
          <BackgroundVideo />
        </div>

        <div>
          <CustomButton variant="contained" className="button1">
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
      </div>
    </>
  );
};

export default HomePage;
