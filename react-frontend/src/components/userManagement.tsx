export const getUser = async () => {
  let user;
  const current_user_url = "http://localhost:3000/current_user";
  const jwt_token = localStorage.getItem("jwt");
  await fetch(`${current_user_url}`, {
    method: "GET",
    headers: {
      Authorization: `${jwt_token}`,
    },
  }).then(async (response) => {
    if (response.ok) {
      user = await response.json();
    }
  });
  return user;
};

export default getUser;
