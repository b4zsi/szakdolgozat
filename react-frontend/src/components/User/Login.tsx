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
import { Link } from "react-router-dom";
import styles from "../../styles/SignupStyle.module.css";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import { login } from "../../api_links";

function Login() {
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [showPassword, SetShowPassword] = useState<boolean>(false);
  const loading = false;

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    await fetch(`${login}`, {
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
    })
      .then(async (response) => {
        if (response.ok) {
          const data = await response.json();
          const jwt = response.headers.get("Authorization");
          localStorage.setItem("jwt", jwt!);
          toastNotification(0, data.status.message).then(() => {
            location.href = "/";
          });
        } else {
          throw new Error(await response.text());
        }
      })
      .catch((error: Error) => {
        toastNotification(1, error.message);
      });
  };

  const passwordInput = (
    <Input
      autoComplete="current-password"
      value={password}
      required
      inputProps={{}}
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
      <CustomSnackbar />
      <section>
        <Container maxWidth="md" className={styles.container}>
          <Card sx={{ boxShadow: 1, maxWidth: "md" }}>
            <CardContent>
              <Container maxWidth="sm" className={styles.container}>
                <Typography variant="h2" className={styles.title} gutterBottom>
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
                      required
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
                  <Link to="/forgot-password" className={styles.link}>
                    Elfelejtett jelszó
                  </Link>
                  <br />
                  <Link to="/signup" className={styles.link}>
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
