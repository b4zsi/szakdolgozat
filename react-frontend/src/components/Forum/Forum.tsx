import React, { useState } from "react";
import { UserModel } from "../../model/UserModel";
import {
  Link,
  LoaderFunction,
  useLoaderData,
  useNavigate,
} from "react-router-dom";
import { Card, CardContent, Tooltip } from "@mui/material";
import { TextField, Button } from "@mui/material";
import { PostModel } from "../../model/PostModel";
import axios from "axios";
import "../../styles/ForumStyle.css";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import { KommentModel } from "../../model/KommentModel";

let allDataType: {
  user: UserModel;
  posts: PostModel[];
  comments: KommentModel[];
};
const PostURL = "http://localhost:3000/api/v1/posts";
const CommentsURL = "http://localhost:3000/api/v1/comments";

function Forum() {
  const [title, setTitle] = useState<string>();
  const [body, setBody] = useState<string>();

  const loaderData: typeof allDataType = useLoaderData() as typeof allDataType;
  const user: UserModel = loaderData!.user;
  const posts: PostModel[] = loaderData!.posts;

  const navigate = useNavigate();

  const handleTitleChange = (
    event: React.ChangeEvent<HTMLInputElement>
  ): void => {
    setTitle(event.target.value);
  };
  const handleBodyChange = (
    event: React.ChangeEvent<HTMLInputElement>
  ): void => {
    setBody(event.target.value);
  };
  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    await fetch(PostURL, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        post: {
          id: posts.length + 1,
          title: title,
          body: body,
          author_id: user?.id,
        },
      }),
    }).then(async (response) => {
      if (response.ok) {
        await response.json().then((data) => {
          window.location.reload;
          toastNotification(0, data.message).then(() => {
            window.location.reload;
          });
        });
      }
    });
  };

  console.log(posts);

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
    <div className="ForumMainDiv">
      <CustomSnackbar />
      <div className="postCreateDivContainer">
        <div className="postCreateDiv">
          <form onSubmit={handleSubmit}>
            <h2 className="postCreateDivTitle">
              Ha van kérdésed, tedd fel itt:
            </h2>
            <TextField
              style={{ margin: 10, width: "80%" }}
              fullWidth
              label="Cím"
              variant="outlined"
              onChange={handleTitleChange}
            />
            <TextField
              multiline
              style={{ margin: 10, width: "80%", height: "80%" }}
              fullWidth
              label="Szöveg"
              variant="outlined"
              onChange={handleBodyChange}
            />
            <br />
            <Button
              type="submit"
              variant="contained"
              color="success"
              className="uploadButton"
            >
              Poszt
            </Button>
          </form>
        </div>
      </div>
      <div className="postContainer">
        <div className="post">
          {posts.map((post) => (
            <Card key={post.id} className="postCard">
              <p className="postTitle">{post.title}</p>
              <CardContent className="postBody">{post.body}</CardContent>
              <CardContent className="postByName">
                <Tooltip
                  className="tooltip"
                  placement="top-end"
                  title={`Felhasználónév: ${user.username} \nKedvenc csapat: ${user.fav_team}`}
                >
                  <p>
                    {post.user.vezeteknev}&ensp;{post.user.keresztnev}
                  </p>
                </Tooltip>

                <Button
                  onClick={() => {
                    navigate(`comment/${post.id}`);
                  }}
                  className="writeComment"
                >
                  Komment
                </Button>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </div>
  );
}

export const ForumLoader: LoaderFunction<UserModel> = async () => {
  const current_user_url = "http://localhost:3000/current_user";
  const jwt_token = localStorage.getItem("jwt");

  const allData: typeof allDataType = {
    user: {
      id: 0,
      email: "",
      admin: false,
      username: "",
      keresztnev: "",
      vezeteknev: "",
      fav_team: "",
      fav_driver: "",
    },
    posts: [],
    comments: [],
  };
  await fetch(`${current_user_url}`, {
    method: "GET",
    headers: {
      Authorization: `${jwt_token}`,
    },
  }).then(async (response) => {
    if (response.ok) {
      allData.user = await response.json();
    }
  });
  await axios.get(PostURL).then((data) => {
    allData.posts = data.data;
  });
  await axios.get(CommentsURL).then((data) => {
    allData.comments = data.data;
  });
  return allData;
};

export default Forum;
