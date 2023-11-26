import React, { useState } from "react";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import { UserModel } from "../../model/UserModel";
import "../../styles/CommentStyle.css";
import axios from "axios";
import { PostModel } from "../../model/PostModel";
import { Button, Card, CardContent, TextField } from "@mui/material";
import { KommentModel } from "../../model/KommentModel";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";

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

  console.log(user);
  console.log(post);
  console.log(comments);

  return (
    <div className="commentMainDiv">
      <CustomSnackbar />
      <div className="postContainer">
        <div className="post">
          <Card className="mainPostCard">
            <p className="postTitle">{post.title}</p>
            <CardContent className="postBody">{post.body}</CardContent>
            <CardContent className="postAuthor">
              {post.user.vezeteknev}&nbsp;
              {post.user.keresztnev}
            </CardContent>
          </Card>
          <Card className="writeComment">
            <TextField
              className="commentField"
              placeholder="Ide tudsz irni megjegyzést"
              autoFocus
              multiline
              id="comment"
              type="text"
              value={comment}
              onChange={handleCommentChange}
            />
            <Button
              variant="outlined"
              className="submitButton"
              onClick={submitComment}
            >
              OK
            </Button>
          </Card>
          {comments.map((comment) => (
            <Card className="commentCard" key={comment.id}>
              <CardContent>{comment.body}</CardContent>
              <CardContent className="postAuthor">
                {comment.author_id}
              </CardContent>
            </Card>
          ))}
        </div>
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
      allData.user = await response.json();
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
