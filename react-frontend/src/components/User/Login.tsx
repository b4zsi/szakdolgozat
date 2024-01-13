import { Visibility, VisibilityOff } from "@mui/icons-material";
import {
  Box,
  Button,
  Card,
  CardActions,
  CardContent,
  Container,
  Divider,
  FormControl,
  IconButton,
  Input,
  InputAdornment,
  InputLabel,
  Typography,
} from "@mui/material";
import React, { Fragment, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import "../../styles/SignupStyle.css";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";

const api_url = "http://localhost:3000";

function Login() {
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [showPassword, SetShowPassword] = useState<boolean>(false);
  const loading = false;
  const navigate = useNavigate();

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    await fetch(`${api_url}/login`, {
      method: "POST",
      body: JSON.stringify({
        user: {
          email,
          password,
        },
      }),
      headers: {
        "Content-type": "application/json",
      },
    }).then(async (response: Response) => {
      if (response.ok) {
        const jwt = response.headers.get("Authorization");
        localStorage.setItem("jwt", jwt!);
        toastNotification(0, "Sikeres bejelentkezés.").then(() => {
          navigate("/");
        });
      } else {
        toastNotification(1, "Helytelen email cím vagy jelszó.");
      }
    });
  };

  const passwordInput = (
    <Input
      autoComplete="current-password"
      value={password}
      onChange={(e) => {
        setPassword(e.target.value);
      }}
      id="password"
      type={showPassword ? "text" : "password"}
      endAdornment={
        <InputAdornment position="end">
          <IconButton
            aria-label="toggle password visibility"
            onClick={() => SetShowPassword(!showPassword)}
            onMouseDown={() => SetShowPassword(!showPassword)}
            edge="end"
          >
            {showPassword ? <Visibility /> : <VisibilityOff />}
          </IconButton>
        </InputAdornment>
      }
    />
  );

  return (
    <Fragment>
      {/* <div className="backgroundStuff"></div> */}
      <CustomSnackbar />
      <section>
        <Container maxWidth="md" className="container">
          <Card sx={{ boxShadow: 1, maxWidth: "md" }}>
            <CardContent>
              <Container maxWidth="sm" className="container">
                <Typography variant="h2" className="title" gutterBottom>
                  Bejelentkezés
                </Typography>
                <form id="sign_in_form" onSubmit={handleSubmit}>
                  <FormControl fullWidth style={{ marginBottom: "20px" }}>
                    <InputLabel required htmlFor="email" id="email-label">
                      Email cím
                    </InputLabel>
                    <Input
                      autoComplete="email"
                      id="email"
                      type="email"
                      value={email}
                      onChange={(e) => {
                        setEmail(e.target.value);
                      }}
                    />
                  </FormControl>
                  <FormControl fullWidth style={{ marginBottom: "20px" }}>
                    <InputLabel
                      required
                      htmlFor="password"
                      id="password-label"
                      style={{ bottom: "10px" }}
                    >
                      Jelszó
                    </InputLabel>
                    {passwordInput}
                  </FormControl>
                  <FormControl fullWidth>
                    <Button
                      disabled={loading}
                      variant="text"
                      type="submit"
                      id="submit"
                      style={{ backgroundColor: "lightGrey", color: "black" }}
                    >
                      Bejelentkezés
                    </Button>
                  </FormControl>
                </form>
              </Container>
            </CardContent>
            <Divider light={false} />
            <CardActions
              sx={{ marginTop: "1em", justifyContent: "center" }}
              disableSpacing
            >
              <Box>
                <Typography variant="body2" align="center">
                  <Link to="/forgot-password" className="link">
                    Elfelejtett jelszó
                  </Link>
                  <br />
                  <Link to="/signup" className="link">
                    Nincs még fiókod? Regisztrálj most
                  </Link>
                </Typography>
              </Box>
            </CardActions>
          </Card>
        </Container>
      </section>
    </Fragment>
  );
}

export default Login;
