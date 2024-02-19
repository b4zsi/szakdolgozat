import { PostModel } from "../model/PostModel";
import { userInterface } from "./userInterface";

export const postInterface: PostModel = {
  id: 0,
  title: "",
  body: "",
  author_id: 0,
  author_name: "",
  like: 0,
  user: userInterface,
};
