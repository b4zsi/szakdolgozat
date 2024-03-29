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
import styles from "../../styles/ForumStyle.module.css";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import { KommentModel } from "../../model/KommentModel";
import CommentIcon from "@mui/icons-material/Comment";
import FavoriteIcon from "@mui/icons-material/Favorite";
import { LikeModel } from "../../model/LikeModel";
import FavoriteBorderIcon from "@mui/icons-material/FavoriteBorder";
import {
  getComments,
  getCurrentUser,
  getLikes,
  getPosts,
} from "../../api_links";
import { userInterface } from "../../interface/userInterface";

let allDataType: {
  user: UserModel;
  posts: PostModel[];
  comments: KommentModel[];
  likes: LikeModel[];
};

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
    await fetch(getPosts, {
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
            window.location.reload();
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
      await axios.delete(getLikes + `/${findId(id)}`);
      await axios
        .put(getPosts + `/${id}`, {
          post: {
            id: id,
            like: like - 1,
          },
        })
        .then((response) => {
          if (response.status === 200) {
            window.location.reload();
          }
        });
      return;
    } else {
      await axios.post(getLikes, {
        like: {
          post_id: id,
          user_id: user.id,
        },
      });
      await axios
        .put(getPosts + id, {
          post: {
            id: id,
            like: like + 1,
          },
        })
        .then((response) => {
          if (response.status === 200) {
            window.location.reload();
          }
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
    <div className={styles.userOnly}>
      <Card className={styles.userOnlyCard}>
        A Fórum csak felhasználóknak elérhető.&emsp;
        <Link to="/login">Jelentkezz be</Link>&ensp;vagy ha még nincs fiókod,
        akkor&emsp;
        <Link to="/signup">regisztrálj</Link>!
      </Card>
    </div>
  ) : (
    <div className={styles.ForumMainDiv}>
      <CustomSnackbar />
      <div className={styles.postCreateDivContainer}>
        <div className={styles.postCreateDiv}>
          <form onSubmit={handleSubmit}>
            <h2 className={styles.postCreateDivTitle}>
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
                  required
                  style={{ margin: 10, width: "90%" }}
                  fullWidth
                  label="Adj címet a kérdésednek"
                  variant="outlined"
                  maxRows={2}
                  inputProps={{ maxLength: 55, minLength: 10 }}
                  onChange={handleTitleChange}
                />
                <TextField
                  multiline
                  required
                  style={{ margin: 10, width: "90%", height: "7vw" }}
                  fullWidth
                  label="Fejtsd ki a kérdésed vagy véleményed"
                  inputMode="text"
                  maxRows={5}
                  minRows={4}
                  variant="outlined"
                  inputProps={{ maxLength: 400, minLength: 20 }}
                  onChange={handleBodyChange}
                />
                <br />
                <Button
                  type="submit"
                  variant="contained"
                  color="success"
                  className={styles.uploadButton}
                >
                  Poszt
                </Button>
              </div>
            )}
          </form>
        </div>
      </div>
      <div className={styles.postContainer}>
        <div className={styles.post}>
          {posts.map((post) => (
            <Card key={post.id} className={styles.postCard}>
              <p className={styles.postTitle}>{post.title}</p>
              <CardContent className={styles.postBody}>{post.body}</CardContent>
              <CardContent className={styles.postByName}>
                <Tooltip
                  className={styles.tooltip}
                  placement="top-end"
                  title={`Felhasználónév: ${user.username} Kedvenc csapat: ${user.fav_team}`}
                >
                  <div>
                    {post.user.vezeteknev}&ensp;{post.user.keresztnev}
                  </div>
                </Tooltip>
                <Button
                  onClick={() => {
                    navigate(`comment/${post.id}`);
                  }}
                  className={styles.writeComment}
                >
                  <CommentIcon />
                </Button>
                <div className={styles.postLike}>{post.like}</div>
                {likedByUser(post.id) ? (
                  <Button
                    onClick={() => {
                      setLike(like - 1);
                      switchLike(post.id, post.like);
                    }}
                    className={styles.like}
                  >
                    <FavoriteIcon />
                  </Button>
                ) : (
                  <Button
                    onClick={() => {
                      setLike(like + 1);
                      switchLike(post.id, post.like);
                    }}
                    className={styles.like}
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
  const jwt_token = localStorage.getItem("jwt");

  const allData: typeof allDataType = {
    user: userInterface,
    posts: [],
    comments: [],
    likes: [],
  };
  await fetch(getCurrentUser, {
    method: "GET",
    headers: {
      Authorization: `${jwt_token}`,
    },
  }).then(async (response) => {
    if (response.ok) {
      allData.user = await response.json();
    }
  });
  await axios.get(getPosts).then((data) => {
    allData.posts = data.data;
  });
  await axios.get(getComments).then((data) => {
    allData.comments = data.data;
  });
  await axios.get(getLikes + allData.user.id).then((data) => {
    allData.likes = data.data;
  });
  return allData;
};

export default Forum;
