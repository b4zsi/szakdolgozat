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
  FormHelperText,
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
import { signup } from "../../api_links";

function SignUp() {
  const [email, setEmail] = useState<string>("");
  const [username, setUsername] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [passwordConfirm, setPasswordConfirm] = useState<string>("");
  const [showPassword, SetShowPassword] = useState(false);

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    if (!password.match(passwordConfirm)) {
      toastNotification(1, "A megadott jelszavak nem egyeznek.");
      return;
    }
    if (!(password && passwordConfirm)) {
      toastNotification(1, "Hiányzó jelszó.");
      return;
    }
    const response = await fetch(signup, {
      method: "POST",
      body: JSON.stringify({
        user: {
          email,
          password,
          username,
        },
      }),
      headers: { "Content-type": "application/json" },
    });

    if (response.ok) {
      toastNotification(0, "Sikeres regisztráció");
      location.href = "/";
    } else {
      toastNotification(1, response.statusText);
    }
  };

  const passwordInput = (
    <Input
      value={password}
      onChange={(e) => {
        setPassword(e.target.value);
      }}
      autoComplete="new-password"
      style={{ marginBottom: "10px" }}
      id="new-password"
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

  const passwordConfirmInput = (
    <Input
      value={passwordConfirm}
      onChange={(e) => {
        setPasswordConfirm(e.target.value);
      }}
      autoComplete="new-password"
      style={{ marginBottom: "20px" }}
      id="password-confirm"
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
      <div className={styles.backgroundStuff}></div>
      <section>
        <Container maxWidth="md" className={styles.container}>
          <Card sx={{ boxShadow: 1, maxWidth: "md" }}>
            <CardContent>
              <Container maxWidth="sm">
                <Typography className={styles.title} gutterBottom>
                  Regisztráció
                </Typography>
                <form id="sign_up_form" onSubmit={handleSubmit}>
                  <FormControl fullWidth className={styles.signUpForm}>
                    <InputLabel required htmlFor="email" id="email-label">
                      Email cím
                    </InputLabel>
                    <Input
                      id="email"
                      type="email"
                      autoComplete="username"
                      value={email}
                      onChange={(e) => {
                        setEmail(e.target.value);
                      }}
                    />
                  </FormControl>
                  <FormControl fullWidth className={styles.signUpForm}>
                    <InputLabel required htmlFor="username" id="username-label">
                      Felhasználónév
                    </InputLabel>
                    <Input
                      id="username"
                      type="text"
                      value={username}
                      onChange={(e) => {
                        setUsername(e.target.value);
                      }}
                    />
                  </FormControl>

                  <FormControl fullWidth>
                    <InputLabel required htmlFor="password" id="password-label">
                      Jelszó
                    </InputLabel>
                    {passwordInput}
                    <FormHelperText id="email-helper-text">
                      A jelszavad nem kerül megosztásra
                    </FormHelperText>
                  </FormControl>
                  <FormControl fullWidth>
                    <InputLabel
                      required
                      htmlFor="password-confirm"
                      id="password-confirm-label"
                    >
                      Jelszó újra
                    </InputLabel>
                    {passwordConfirmInput}
                  </FormControl>
                  <FormControl fullWidth>
                    <Button
                      variant="outlined"
                      type="submit"
                      id="submit"
                      style={{ backgroundColor: "lightGrey", color: "black" }}
                    >
                      Regisztráció
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
                <Link className={styles.link} to="/login">
                  Ha van már fiókod, <br />
                  ide kattintva bejelentkezhetsz
                </Link>
              </Box>
            </CardActions>
          </Card>
        </Container>
        <CustomSnackbar />
      </section>
    </Fragment>
  );
}

export default SignUp;
