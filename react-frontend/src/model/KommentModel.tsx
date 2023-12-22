import { UserModel } from "./UserModel";

export interface KommentModel {
  id: number;
  body: string;
  post_id: number;
  author_id: number;
  user: UserModel;
}
