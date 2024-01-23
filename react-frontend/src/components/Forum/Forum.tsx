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
import CommentIcon from "@mui/icons-material/Comment";
import FavoriteIcon from "@mui/icons-material/Favorite";
import { LikeModel } from "../../model/LikeModel";
import FavoriteBorderIcon from "@mui/icons-material/FavoriteBorder";

let allDataType: {
  user: UserModel;
  posts: PostModel[];
  comments: KommentModel[];
  likes: LikeModel[];
};
const PostURL = "http://localhost:3000/api/v1/posts";
const LikeURL = "http://localhost:3000/api/v1/likes";
const CommentsURL = "http://localhost:3000/api/v1/comments";

function Forum() {
  const [title, setTitle] = useState<string>();
  const [body, setBody] = useState<string>();
  const [like, setLike] = useState<number>(0);

  const loaderData: typeof allDataType = useLoaderData() as typeof allDataType;
  const user: UserModel = loaderData!.user;
  const posts: PostModel[] = loaderData!.posts;
  const likes: LikeModel[] = loaderData!.likes;

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
  console.log(posts[0].like);
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

  console.log(likes);

  function findId(post_id: number): number {
    let id = 0;
    likes.map((like) => {
      if (like.user_id === user.id && post_id === like.post_id) {
        id = like.id;
      }
    });
    return id;
  }

  async function switchLike(id: number, like: number) {
    if (likedByUser(id)) {
      await axios.delete(LikeURL + `/${findId(id)}`);
      await axios
        .put(PostURL + `/${id}`, {
          post: {
            id: id,
            like: like - 1,
          },
        })
        .then((response) => {
          console.log(response);
        });
      return;
    } else {
      await axios.post(LikeURL, {
        like: {
          post_id: id,
          user_id: user.id,
        },
      });
      await axios.put(PostURL + `/${id}`, {
        post: {
          id: id,
          like: like + 1,
        },
      });
    }
  }

  function likedByUser(post_id: number): boolean {
    let counter = 0;
    likes.map((like) => {
      if (like.user_id === user.id && post_id === like.post_id) {
        ++counter;
      }
    });
    return counter > 0 ? true : false;
  }

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
              {user.banned ? (
                <p>
                  Sajnos a fiókod tiltva lett, ezért nem tudsz ide posztolni.
                </p>
              ) : (
                <p>Ha van kérdésed, tedd fel itt:</p>
              )}
            </h2>
            {user.banned ? (
              <div></div>
            ) : (
              <div>
                <TextField
                  style={{ margin: 10, width: "90%" }}
                  fullWidth
                  label="Adj címet a kérdésednek"
                  variant="outlined"
                  maxRows={2}
                  inputProps={{ maxLength: 55 }}
                  onChange={handleTitleChange}
                />
                <TextField
                  multiline
                  style={{ margin: 10, width: "90%", height: "7vw" }}
                  fullWidth
                  label="Fejtsd ki a kérdésed vagy véleményed"
                  inputMode="text"
                  maxRows={5}
                  minRows={4}
                  variant="outlined"
                  inputProps={{ maxLength: 400 }}
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
              </div>
            )}
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
                  <div>
                    {post.user.vezeteknev}&ensp;{post.user.keresztnev}
                  </div>
                </Tooltip>
                <Button
                  onClick={() => {
                    navigate(`comment/${post.id}`);
                  }}
                  className="writeComment"
                >
                  <CommentIcon />
                </Button>
                <div className="postLike">{post.like}</div>
                {likedByUser(post.id) ? (
                  <Button
                    onClick={() => {
                      setLike(like - 1);
                      switchLike(post.id, post.like);
                    }}
                    className="like"
                  >
                    <FavoriteIcon />
                  </Button>
                ) : (
                  <Button
                    onClick={() => {
                      setLike(like + 1);
                      switchLike(post.id, post.like);
                    }}
                    className="like"
                  >
                    <FavoriteBorderIcon />
                  </Button>
                )}
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
      banned: false,
      images: [],
    },
    posts: [],
    comments: [],
    likes: [],
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
  await axios.get(LikeURL + `/${allData.user.id}`).then((data) => {
    allData.likes = data.data;
  });
  return allData;
};

export default Forum;
