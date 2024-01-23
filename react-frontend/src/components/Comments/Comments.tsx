import React, { useState } from "react";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import { UserModel } from "../../model/UserModel";
import "../../styles/CommentStyle.css";
import axios from "axios";
import { PostModel } from "../../model/PostModel";
import { Button, Card, CardContent, TextField } from "@mui/material";
import { KommentModel } from "../../model/KommentModel";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
//import FavoriteBorderIcon from '@mui/icons-material/FavoriteBorder';
//import FavoriteIcon from "@mui/icons-material/Favorite";

let allDataType: {
  user: UserModel;
  post: PostModel;
  comments: KommentModel[];
};
const CommentsURL = "http://localhost:3000/api/v1/comments/";
const PostURL = "http://localhost:3000/api/v1/posts/";

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
    await fetch(CommentsURL, {
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
    <div className="commentMainDiv">
      <div className="post">
        <Card className="mainPostCard">
          <CustomSnackbar />
          <p className="postTitle">{post.title}</p>
          <CardContent className="postBody">{post.body}</CardContent>
          {post.like} kedvelés
          <CardContent className="postAuthor">
            {post.user.vezeteknev}&nbsp;
            {post.user.keresztnev}
          </CardContent>
        </Card>
        <Card className="writeCommentonPage">
          <TextField
            className="commentField"
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
            className="submitButton"
            onClick={submitComment}
          >
            Válasz
          </Button>
        </Card>
        {comments.map((comment) => (
          <Card className="commentCard" key={comment.id}>
            <CardContent className="commentBody">{comment.body}</CardContent>
            <CardContent className="postAuthor">
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
    post: {
      id: 0,
      title: "",
      body: "",
      author_id: 0,
      author_name: "",
      like: 0,
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
    },
    comments: [],
  };
  await fetch(`${current_user_url}`, {
    method: "GET",
    headers: {
      Authorization: `${jwt_token}`,
    },
  }).then(async (response) => {
    if (response.ok) {
      const data = await response.json();
      console.log(data);
      allData.user = data;
    }
  });
  await axios.get(PostURL + params.id).then((data) => {
    allData.post = data.data;
  });
  await axios.get(CommentsURL + params.id).then((data) => {
    allData.comments = data.data;
  });

  return allData;
};
export default Comments;
