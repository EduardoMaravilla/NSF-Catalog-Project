import { ApiResponseError } from "./TypesErrors";

export interface FetchState<T> {
    data: T | ApiResponseError | null;
    errors: Error | null;
  }