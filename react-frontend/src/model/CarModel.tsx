import { ImageModel } from "./ImageModel";

export interface CarModel {
  id: number;
  team_slug: string;
  images: ImageModel[];
  engine: string;
  battery: string;
  chassis: string;
  races_won: number;
  pole_positions: number;
  podiums: number;
  horsepower: number;
  fuel: string;
  description: string;
  slug: string;
}
