import { ImageModel } from "./ImageModel";

export interface TrackModel {
  id: number;
  name: string;
  city: string;
  country: string;
  length: number;
  turns: number;
  lap_record: string;
  description: string;
  images: ImageModel[];
  slug: string;
  lap_record_in_seconds: number;
}
