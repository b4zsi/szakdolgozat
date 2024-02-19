import React, { useState } from "react";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import { UserModel } from "../../model/UserModel";
import styles from "../../styles/CommentStyle.module.css";
import axios from "axios";
import { PostModel } from "../../model/PostModel";
import { Button, Card, CardContent, TextField } from "@mui/material";
import { KommentModel } from "../../model/KommentModel";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import { getComments, getCurrentUser, getPosts } from "../../api_links";
import { userInterface } from "../../interface/userInterface";
import { postInterface } from "../../interface/postInterface";
//import FavoriteBorderIcon from '@mui/icons-material/FavoriteBorder';
//import FavoriteIcon from "@mui/icons-material/Favorite";

let allDataType: {
  user: UserModel;
  post: PostModel;
  comments: KommentModel[];
};

function Comments() {
  const loaderData: typeof allDataType = useLoaderData() as typeof allDataType;
  const user: UserModel = loaderData.user;
  const post: PostModel = loaderData.post;
  const comments: KommentModel[] = loaderData.comments;
  const [comment, setComment] = useState<string>();

  const handleCommentChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setComment(event.target.value);
  };

  const submitComment = async () => {
    await fetch(getComments, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        comment: {
          body: comment,
          author_id: user.id,
          post_id: post.id,
        },
      }),
    }).then(async (response) => {
      if (response.ok) {
        window.location.reload();
        await response.json().then((data) => {
          toastNotification(0, data.message);
        });
      }
    });
  };

  return (
    <div className={styles.commentMainDiv}>
      <div className={styles.post}>
        <Card className={styles.mainPostCard}>
          <CustomSnackbar />
          <p className={styles.postTitle}>{post.title}</p>
          <CardContent className={styles.postBody}>{post.body}</CardContent>
          {post.like} kedvelés
          <CardContent className={styles.postAuthor}>
            {post.user.vezeteknev}&nbsp;
            {post.user.keresztnev}
          </CardContent>
        </Card>
        <Card className={styles.writeCommentonPage}>
          <TextField
            className={styles.commentField}
            placeholder="Komment"
            autoFocus
            multiline
            minRows={4}
            maxRows={5}
            inputProps={{ maxLength: 400 }}
            id="comment"
            type="text"
            value={comment}
            onChange={handleCommentChange}
          />
          <Button
            variant="contained"
            color="success"
            className={styles.submitButton}
            onClick={submitComment}
          >
            Válasz
          </Button>
        </Card>
        {comments.map((comment) => (
          <Card className={styles.commentCard} key={comment.id}>
            <CardContent className={styles.commentBody}>
              {comment.body}
            </CardContent>
            <CardContent className={styles.postAuthor}>
              {comment.user.vezeteknev}
              &nbsp;
              {comment.user.keresztnev}
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}

export const CommentLoader: LoaderFunction<UserModel> = async ({ params }) => {
  console.log(params);
  const jwt_token = localStorage.getItem("jwt");

  const allData: typeof allDataType = {
    user: userInterface,
    post: postInterface,
    comments: [],
  };
  await fetch(getCurrentUser, {
    method: "GET",
    headers: {
      Authorization: `${jwt_token}`,
    },
  }).then(async (response) => {
    if (response.ok) {
      const data = await response.json();
      allData.user = data;
    }
  });
  await axios.get(getPosts + params.id).then((data) => {
    allData.post = data.data;
  });
  await axios.get(getComments + params.id).then((data) => {
    allData.comments = data.data;
  });

  return allData;
};
export default Comments;
