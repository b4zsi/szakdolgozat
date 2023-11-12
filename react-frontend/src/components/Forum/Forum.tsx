import React, { useState } from "react";
import { UserModel } from "../../model/UserModel";
import getUser from "../userManagement";
import { Link } from "react-router-dom";
import { Card } from "@mui/material";

function Forum() {
  const [user, setUser] = useState<UserModel | null>(null);

  getUser().then((data) => {
    setUser(data!);
  });

  return !user ? (
    <div className="userOnly">
      <Card className="userOnlyCard">
        A Fórum csak felhasználóknak elérhető.&emsp;
        <Link to="/login">Jelentkezz be</Link>&ensp;vagy ha még nincs fiókod,
        akkor&emsp;
        <Link to="/signup">regisztrálj</Link>!
      </Card>
    </div>
  ) : (
    <div>Forum</div>
  );
}

export default Forum;
