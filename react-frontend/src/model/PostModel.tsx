import { UserModel } from "./UserModel";

export interface PostModel {
  id: number;
  title: string;
  body: string;
  author_id: number;
  author_name: string;
  user: UserModel;
  like: number;
}
