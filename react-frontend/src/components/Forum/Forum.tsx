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
import DeleteIcon from "@mui/icons-material/Delete";
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
  // eslint-disable-next-line
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
  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    console.log(posts.length);
    const jwt = localStorage.getItem("jwt");
    await fetch(getPosts, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `${jwt}`,
      },
      body: JSON.stringify({
        post: {
          id: posts.length + 1,
          title: title,
          body: body,
          author_id: user?.id,
        },
      }),
    })
      .then(async (response) => {
        if (response.status === 200) {
          await response.json().then((data) => {
            posts.push({
              id: posts.length + 1,
              title: title!,
              body: body!,
              author_id: user.id,
              author_name: user.vezeteknev + " " + user.keresztnev,
              like: 0,
              user: user,
            });
            toastNotification(0, data.message);
          });
        } else {
          response.json().then((data) => {
            toastNotification(1, data.message);
          });
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  };

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
      await axios.delete(getLikes + `/${findId(id)}`).then((response) => {
        console.log(response);
        if (response.status === 201) {
          console.log("first");
          likes.splice(id, 1);
          posts[id].like -= 1;
        }
      });
      await axios.put(getPosts + `/${id}`, {
        post: {
          id: id,
          like: like - 1,
        },
      });
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
          if (response.status === 201) {
            likes.push({
              id: likes.length + 1,
              post_id: id,
              user_id: user.id,
            });
            posts[id].like += 1;
          }
        });
    }
  }

  async function handlePostDelete(id: number) {
    const jwt_token = localStorage.getItem("jwt");
    await axios
      .delete(getPosts + id, { headers: { Authorization: `${jwt_token}` } })
      .then((response) => {
        if (response.status === 200) {
          toastNotification(0, response.data.message).then(() => {
            posts.splice(id, 1);
          });
        }
      });
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
    <>
      <div className={styles.postCreateDivContainer}>
        <CustomSnackbar />
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
              <CardContent className={styles.bottom}>
                <Tooltip
                  className={styles.tooltip}
                  placement="top-end"
                  title={`Felhasználónév: ${user.username} Kedvenc csapat: ${user.fav_team}`}
                >
                  <div className={styles.postByName}>
                    {post.user.vezeteknev}&ensp;{post.user.keresztnev}
                  </div>
                </Tooltip>
                {user !== undefined && user.admin && (
                  <Button onClick={() => handlePostDelete(post.id)}>
                    <DeleteIcon color="error" />
                  </Button>
                )}
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
                      setLike(post.like - 1);
                      switchLike(post.id, post.like);
                    }}
                    className={styles.like}
                  >
                    <FavoriteIcon />
                  </Button>
                ) : (
                  <Button
                    onClick={() => {
                      setLike(post.like + 1);
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
    </>
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
  })
    .then(async (response) => {
      if (response.ok) {
        allData.user = await response.json();
      } else {
        window.location.href = "/login";
        return;
      }
    })
    .catch((error) => {
      console.log(error);
      window.location.href = "/login";
      return;
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
