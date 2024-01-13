import React from "react";
import { UserModel } from "../../model/UserModel";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import "../../styles/UsersStyle.css";
import {
  Switch,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from "@mui/material";
import axios from "axios";

const usersURL = "http://localhost:3000/api/v1/users";

function Users() {
  const users = useLoaderData() as UserModel[];
  async function moderateUser(banned: boolean, userid: number) {
    const jwt_token = localStorage.getItem("jwt");
    await fetch(usersURL, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Authorization: `${jwt_token}`,
      },
      body: JSON.stringify({
        updatedUser: {
          id: userid,
          banned: banned,
        },
      }),
    });
  }

  return (
    <div className="usersMainDiv">
      <TableContainer>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell align="center">Emaíl cím</TableCell>
              <TableCell align="center">Felhasználónév</TableCell>
              <TableCell align="center">Név</TableCell>
              <TableCell align="center">Kedvenc pilóta</TableCell>
              <TableCell align="center">Kedvenc csapat</TableCell>
              <TableCell align="center">Tiltott?</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {users.map((user) => (
              <TableRow
                key={user.id}
                sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
              >
                <TableCell align="center">{user.email}</TableCell>
                <TableCell align="center">{user.username}</TableCell>
                <TableCell align="center">
                  {user.vezeteknev}&ensp;{user.keresztnev}
                </TableCell>
                <TableCell align="center">{user.fav_driver}</TableCell>
                <TableCell align="center">{user.fav_team}</TableCell>
                <TableCell align="center">
                  <Switch
                    defaultChecked={user.banned}
                    onClick={() => {
                      moderateUser(user.banned, user.id);
                    }}
                  />
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </div>
  );
}

export const UsersLoader: LoaderFunction<UserModel[]> = async () => {
  let users: UserModel[] = [];
  await axios.get(usersURL).then((data) => {
    users = data.data;
  });
  return users;
};

export default Users;
