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
  OutlinedInput,
  Typography,
} from "@mui/material";
import React, { useState } from "react";
import { Link } from "react-router-dom";
import "../../styles/SignupStyle.css";

const api_url = "http://localhost:3000/users/tokens";
// eslint-disable-next-line @typescript-eslint/no-unused-vars
let access_token: string | null;
// eslint-disable-next-line @typescript-eslint/no-unused-vars
let refresh_token = localStorage.getItem("refresh_token");
// eslint-disable-next-line @typescript-eslint/no-unused-vars
let resource_owner: string | null;

document.addEventListener("DOMContentLoaded", () => {
  console.log("hello");
  const signUpForm = document.querySelector("#sign_up_form");
  console.log(document.forms);
  if (signUpForm) {
    signUpForm?.addEventListener("submit", async (event) => {
      event.preventDefault();
      console.log("first");
      const email = document.querySelector("#email")!.ariaValueText;
      const password = document.querySelector("#new-password")!.ariaValueText;
      const password_confirm =
        document.querySelector("#password-confirm")!.ariaValueText;

      if (password !== password_confirm) {
        alert("passwords do not match");
        return;
      }

      const response = await fetch(`${api_url}/sign_up`, {
        method: "POST",
        body: JSON.stringify({
          email,
          password,
        }),
        headers: { "Content-type": "application/json" },
      });

      await handleAuthResponse(response);
      //userSession();
    });
  } else {
    console.log("sign up not found");
  }
});

// function nullOrUndefined(itemToCheck: string | null) {
//   return itemToCheck == null || itemToCheck === "undefined";
// }

async function handleAuthResponse(response: Response) {
  const data = await response.json();
  console.log(data);

  localStorage.setItem("resource_owner", JSON.stringify(data.resource_owner));
  localStorage.setItem("refresh_token", data.refresh_token);
  access_token = data.token;
  refresh_token = data.refresh_token;
  resource_owner = data.resource_owner;
}

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
  const [showPassword, SetShowPassword] = useState(false);

  const passwordInput = (
    <OutlinedInput
      autoComplete="new-password"
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
    <OutlinedInput
      autoComplete="new-password"
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
    <section>
      <Container maxWidth="md">
        <Card sx={{ boxShadow: 1, maxWidth: "md" }}>
          <CardContent>
            <Container maxWidth="sm">
              <Typography variant="h2" color="text.primary" gutterBottom>
                Regisztráció
              </Typography>
              <form id="sign_up_form" itemID="sign_up_form">
                <FormControl fullWidth>
                  <InputLabel required htmlFor="email" id="email-label">
                    Email cím
                  </InputLabel>
                  <Input id="email" type="email" autoComplete="username" />
                  <FormHelperText id="email-helper-text">
                    A jelszavad nem kerül megosztásra
                  </FormHelperText>
                </FormControl>
                <FormControl fullWidth>
                  <InputLabel required htmlFor="password" id="password-label">
                    Jelszó
                  </InputLabel>
                  {passwordInput}
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
                    variant="contained"
                    color="primary"
                    type="submit"
                    id="submit"
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
              <Link to="/login">Bejelentkezés</Link>
            </Box>
          </CardActions>
        </Card>
      </Container>
    </section>
  );
}

export default SignUp;
