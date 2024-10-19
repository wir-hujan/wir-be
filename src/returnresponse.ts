export const result = (res: Object) => {
  return {
    response: {
      by: "@Hujan",
      status: res.status,
      data: res.data,
    },
  };
};
