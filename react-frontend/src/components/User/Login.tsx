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

const api_url = "http://localhost:3000/users/tokens";
// eslint-disable-next-line @typescript-eslint/no-unused-vars
let access_token: string | null;
// eslint-disable-next-line @typescript-eslint/no-unused-vars
//let refresh_token = localStorage.getItem("refresh_token");
// eslint-disable-next-line @typescript-eslint/no-unused-vars
let resource_owner: string | null;

async function handleAuthResponse(response: Response) {
  const data = await response.json();
  console.log("elsodata");
  console.log(data);
  localStorage.setItem("access_token", data.token);
  localStorage.setItem("resource_owner", JSON.stringify(data.resource_owner));
  localStorage.setItem("refresh_token", data.refresh_token);
  return response;
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
//   const stored_resource = localStorage.getItem("resource_owner");
//   if (nullOrUndefined(stored_resource)) {
//     console.log("stored resource empty");
//     return;
//   } else {
//     resource_owner = JSON.parse(stored_resource!);
//   }
// }

// async function refreshToken() {
//   refresh_token = localStorage.getItem("refresh_token");
//   if (nullOrUndefined(refresh_token)) {
//     return;
//   }
//   console.log(refresh_token);
//   console.log("first");

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
//         console.log("response no good");
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

// async function userCanAccess() {
//   if (nullOrUndefined(access_token)) {
//     return;
//   }
//   const response = await fetch(`http://localhost:3000/pages/restricted`, {
//     method: "GET",
//     headers: {
//       "Content-Type": "application/json",
//       Authorization: `Bearer ${access_token}`,
//     },
//   });
//   const data = await response.json();

//   console.log("%c" + data.message, "color: cyan");
//   if (data.error) {
//     console.log("Error: ", data.error);
//     resetTokens();
//     userSession();
//   }
// }

// function nullOrUndefined(itemToCheck: string | null) {
//   return itemToCheck == null || itemToCheck === "undefined";
// }

//#endregion

function Login() {
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [showPassword, SetShowPassword] = useState<boolean>(false);
  const loading = false;
  const navigate = useNavigate();

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    const response = await fetch(`${api_url}/sign_in`, {
      method: "POST",
      body: JSON.stringify({
        email,
        password,
      }),
      headers: { "Content-type": "application/json" },
    });

    await handleAuthResponse(response).then((data: Response) => {
      if (data.ok) {
        console.log(data);
        navigate("/");
      } else {
        console.log(data);
      }
    });
    //userSession();
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
      <div className="backgroundStuff"></div>

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
                    Itt kérhetsz új jelszavat, ha még neked is túl erős volt az
                    előző.
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
