interface FormatSettings {
  status: boolean;
  message: string;
}

interface FormatPaginationSettings extends Partial<FormatSettings> {
  page: number;
  total_page: number;
  count: number;
}

export class FormatHook {
  serialize(data: { [key: string]: any; }[]) {
    // data.for
  }

  normal(data: any | any[], settings?: FormatSettings) {
    return {
      status: settings?.status || true,
      message: settings?.message || "success",
      data,
    };
  }

  pagination(data: any[], settings?: FormatPaginationSettings) {
    return {
      page: settings?.page,
      total_page: settings?.total_page,
      count: settings?.count,
      status: settings?.status || true,
      message: settings?.message || "success",
      data,
    };
  }
}
