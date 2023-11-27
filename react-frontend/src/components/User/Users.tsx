import React from "react";
import { UserModel } from "../../model/UserModel";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import axios from "axios";
import "../../styles/UsersStyle.css";
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from "@mui/material";

const usersURL = "http://localhost:3000/api/v1/users";

function Users() {
  const users = useLoaderData() as UserModel[];
  return (
    <div className="usersMainDiv">
      <TableContainer>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell align="right">Emaíl cím</TableCell>
              <TableCell align="right">Felhasználónév</TableCell>
              <TableCell align="right">Név</TableCell>
              <TableCell align="right">Kedvenc pilóta</TableCell>
              <TableCell align="right">Kedvenc csapat</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {users.map((user) => (
              <TableRow
                key={user.id}
                sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
              >
                <TableCell align="right">{user.email}</TableCell>
                <TableCell align="right">{user.username}</TableCell>
                <TableCell align="right">
                  {user.vezeteknev}&ensp;{user.keresztnev}
                </TableCell>
                <TableCell align="right">{user.fav_driver}</TableCell>
                <TableCell align="right">{user.fav_team}</TableCell>
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
