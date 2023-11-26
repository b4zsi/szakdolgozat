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
import { Link, useNavigate } from "react-router-dom";
import "../../styles/SignupStyle.css";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";

const api_url = "http://localhost:3000";

//#region faszsag
// async function userSession() {
//   await refreshToken();
//   await requestNewAccessToken();

//   if (nullOrUndefined(access_token)) {
//     console.log("access token is null or undefined");
//   } else {
//     console.log(access_token);
//   }
//   getUser();
// }

// function getUser() {
//   let stored_resource = localStorage.getItem("resource_owner");
//   if (nullOrUndefined(stored_resource)) {
//     console.log("stored resource empty");
//     return;
//   }
//   stored_resource = "";
//   resource_owner = JSON.parse(stored_resource);
// }

// async function refreshToken() {
//   refresh_token = localStorage.getItem("refresh_token");
//   if (nullOrUndefined(refresh_token)) {
//     return;
//   }
//   console.log(refresh_token);

//   try {
//     const response = await fetch(`${api_url}/refresh`, {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//         Authorization: `Bearer ${refresh_token}`,
//       },
//     });
//     if (!response.ok) {
//       if (response.status === 401) {
//         console.log("hello");
//       } else {
//         throw new Error(response.statusText);
//       }
//     }
//     const data = await response.json();
//     console.log("Setting access token to: ", data.token);
//     localStorage.setItem("resource_owner", JSON.stringify(data.resource_owner));
//     localStorage.setItem("refresh_token", data.refresh_token);
//     access_token = data.token;
//     refresh_token = data.refresh_token;
//     resource_owner = data.resource_owner;
//   } catch (err) {
//     console.log("Error refreshing token: ", err);
//     resetTokens();
//     userSession();
//   }
// }

// function resetTokens() {
//   localStorage.removeItem("refresh_token");
//   localStorage.removeItem("resource_owner");
//   access_token = null;
//   refresh_token = null;
//   resource_owner = null;
// }

// async function requestNewAccessToken() {
//   if (nullOrUndefined(refresh_token)) {
//     return;
//   }
//   if (access_token) {
//     return;
//   }
//   try {
//     const response = await fetch(`${api_url}/refresh`, {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//         Authorization: `Bearer ${refresh_token}`,
//       },
//     });
//     handleAuthResponse(response);
//   } catch (err) {
//     console.log("Error refreshing token: ", err);
//     resetTokens();
//     userSession();
//   }
// }

//#endregion

function SignUp() {
  const [email, setEmail] = useState<string>("");
  const [username, setUsername] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [passwordConfirm, setPasswordConfirm] = useState<string>("");
  const [showPassword, SetShowPassword] = useState(false);
  const navigate = useNavigate();

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
    const response = await fetch(`${api_url}/signup`, {
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
      navigate("/");
      toastNotification(0, "Sikeres regisztráció");
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
      <div className="backgroundStuff"></div>
      <section>
        <Container maxWidth="md" className="container">
          <Card sx={{ boxShadow: 1, maxWidth: "md" }}>
            <CardContent>
              <Container maxWidth="sm">
                <Typography className="title" gutterBottom>
                  Regisztráció
                </Typography>
                <form id="sign_up_form" onSubmit={handleSubmit}>
                  <FormControl fullWidth className="signUpForm">
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
                  <FormControl fullWidth className="signUpForm">
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
                <Link className="link" to="/login">
                  Ha van már fiókod, <br />
                  ide kattinta bejelentkezhetsz
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
