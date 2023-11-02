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
  OutlinedInput,
  Typography,
} from "@mui/material";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import "../../styles/LoginStyle.css";

const api_url = "http://localhost:3000/users/tokens";

let access_token: string | null;
let refresh_token = localStorage.getItem("refresh_token");
let resource_owner: string | null;

const signInForm = document.querySelector("#sign_in_form");
signInForm?.addEventListener("submit", async (event) => {
  event.preventDefault();

  const email = document.querySelector("#email")!.ariaValueText;
  console.log(email);
  const password = document.querySelector("#password")!.ariaValueText;
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
  userSession();
});

async function handleAuthResponse(response: Response) {
  const data = await response.json();
  console.log(data);
  console.log("first");

  localStorage.setItem("resource_owner", JSON.stringify(data.resource_owner));
  localStorage.setItem("refresh_token", data.refresh_token);
  access_token = data.token;
  refresh_token = data.refresh_token;
  resource_owner = data.resource_owner;
}

async function userSession() {
  await refreshToken();
  await requestNewAccessToken();

  if (nullOrUndefined(access_token)) {
    console.log("access token is null or undefined");
  } else {
    console.log(access_token);
  }
  getUser();
}

function getUser() {
  const stored_resource = localStorage.getItem("resource_owner");
  if (nullOrUndefined(stored_resource)) {
    console.log("stored resource empty");
    return;
  } else {
    resource_owner = JSON.parse(stored_resource!);
  }
}

async function refreshToken() {
  refresh_token = localStorage.getItem("refresh_token");
  if (nullOrUndefined(refresh_token)) {
    return;
  }
  console.log(refresh_token);
  console.log("first");

  try {
    const response = await fetch(`${api_url}/refresh`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${refresh_token}`,
      },
    });
    if (!response.ok) {
      if (response.status === 401) {
        console.log("response no good");
      } else {
        throw new Error(response.statusText);
      }
    }
    const data = await response.json();
    console.log("Setting access token to: ", data.token);
    localStorage.setItem("resource_owner", JSON.stringify(data.resource_owner));
    localStorage.setItem("refresh_token", data.refresh_token);
    access_token = data.token;
    refresh_token = data.refresh_token;
    resource_owner = data.resource_owner;
  } catch (err) {
    console.log("Error refreshing token: ", err);
    resetTokens();
    userSession();
  }
}

function resetTokens() {
  localStorage.removeItem("refresh_token");
  localStorage.removeItem("resource_owner");
  access_token = null;
  refresh_token = null;
  resource_owner = null;
}

async function requestNewAccessToken() {
  if (nullOrUndefined(refresh_token)) {
    return;
  }
  if (access_token) {
    return;
  }
  try {
    const response = await fetch(`${api_url}/refresh`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${refresh_token}`,
      },
    });
    handleAuthResponse(response);
  } catch (err) {
    console.log("Error refreshing token: ", err);
    resetTokens();
    userSession();
  }
}

async function userCanAccess() {
  if (nullOrUndefined(access_token)) {
    return;
  }
  const response = await fetch(`http://localhost:3000/pages/restricted`, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${access_token}`,
    },
  });
  const data = await response.json();

  console.log("%c" + data.message, "color: cyan");
  if (data.error) {
    console.log("Error: ", data.error);
    resetTokens();
    userSession();
  }
}

function nullOrUndefined(itemToCheck: string | null) {
  return itemToCheck == null || itemToCheck === "undefined";
}

function Login() {
  const [showPassword, SetShowPassword] = useState<boolean>(false);
  const loading = false;
  useEffect(() => {
    async function hello() {
      await userSession().then(() => {
        console.log(
          "%cUser session complete. Begin application logic",
          "color: grseen"
        );
        if (resource_owner) {
          userCanAccess();
        } else {
          console.log("No user");
        }
      });
    }
    hello();
  }, [signInForm]);

  const passwordInput = (
    <OutlinedInput
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
    <section>
      <Container maxWidth="md">
        <Card sx={{ boxShadow: 1, maxWidth: "md" }}>
          <CardContent>
            <Container maxWidth="sm">
              <Typography variant="h2" color="text.primary" gutterBottom>
                Login
              </Typography>
              <form id="sign_in_form">
                <FormControl fullWidth>
                  <InputLabel required htmlFor="email" id="email-label">
                    Email cím
                  </InputLabel>
                  <Input id="email" type="email" />
                </FormControl>
                <FormControl fullWidth>
                  <InputLabel required htmlFor="password" id="password-label">
                    Jelszó
                  </InputLabel>
                  {passwordInput}
                </FormControl>
                <FormControl fullWidth>
                  <Button
                    disabled={loading}
                    variant="contained"
                    color="primary"
                    type="submit"
                    id="submit"
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
              <Typography variant="body2" color="text.secondary" align="center">
                <Link to="/forgot-password">Elfelejtett jelszó</Link>
              </Typography>
              <Link to="/signup">Regisztráció</Link>
            </Box>
          </CardActions>
        </Card>
      </Container>
    </section>
  );
}

export default Login;
