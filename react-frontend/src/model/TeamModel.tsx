import { CarModel } from "./CarModel";
import { ImageModel } from "./ImageModel";

export interface TeamModel {
  id: number;
  name: string;
  number_of_championships: number;
  number_of_races: number;
  headquarters_city: string;
  technical_director: string;
  first_win: number;
  last_championship_win: number;
  date_of_establishment: number;
  series_id: number;
  team_picture: string;
  team_color: string;
  // prettier-ignore
  slug: string;
  images: ImageModel[];
  cars: CarModel[];
}

export interface TeamSeriesModel {
  id: number;
  name: string;
  number_of_championships: number;
  number_of_races: number;
  headquarters_city: string;
  technical_director: string;
  first_win: number;
  last_championship_win: number;
  date_of_establishment: number;
  series_id: number;
  team_picture: string;
  team_color: string;
  // prettier-ignore
  slug: string;
  first_image: ImageModel;
}
