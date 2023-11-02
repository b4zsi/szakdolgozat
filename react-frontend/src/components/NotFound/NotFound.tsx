import { Link } from "react-router-dom";

export default function NotFound() {
  return (
    <div>
      Page Not Found.
      <Link to="/">Go back to main page</Link>
    </div>
  );
}
