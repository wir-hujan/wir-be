export interface DbPaginationQuery {
  search?: string;
  page?: number;
  size?: number;
}

export interface DbPaginationRawResponse{
  meta: {
    page: {
      current: number;
      total: number;
      size: number;
    };
    data: {
      total: number;
      offsetStart: number;
      offsetEnd: number;
    };
    has_next: boolean;
    has_prev: boolean;
  },
  data: any[];
}

export interface DbResponseInfo {
  message?: string;
}
