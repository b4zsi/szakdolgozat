import * as React from "react";
import AppBar from "@mui/material/AppBar";
import Box from "@mui/material/Box";
import { styled } from "@mui/material/styles";
import Toolbar from "@mui/material/Toolbar";
import IconButton from "@mui/material/IconButton";
import Typography from "@mui/material/Typography";
import Menu, { MenuProps } from "@mui/material/Menu";
import MenuIcon from "@mui/icons-material/Menu";
import Container from "@mui/material/Container";
import Button from "@mui/material/Button";
import Tooltip from "@mui/material/Tooltip";
import MenuItem from "@mui/material/MenuItem";
import KeyboardArrowDownIcon from "@mui/icons-material/KeyboardArrowDown";
import { useState } from "react";
import axios from "axios";
import { SeriesModel } from "../../model/SeriesModel";
import { Link, useNavigate } from "react-router-dom";
import { UserModel } from "../../model/UserModel";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import styles from "../../styles/NavBarStyle.module.css";
import PermIdentityIcon from "@mui/icons-material/PermIdentity";
import { getCurrentUser, getSeriesNames, logout } from "../../api_links";

function ResponsiveAppBar() {
  const noUserPages = [
    { name: "Főoldal", url: "/" },
    { name: "Szeriák", url: "/series" },
    { name: "Bejelentkezés", url: "/login" },
    { name: "Regisztráció", url: "/signup" },
  ];
  const [pages, setPages] =
    useState<{ name: string; url: string }[]>(noUserPages);
  const userPages = [
    { name: "Főoldal", url: "/" },
    { name: "Szeriák", url: "/series" },
    { name: "Fórum", url: "/forum" },
    { name: "Naptár", url: "/calendar" },
    { name: "Szabálykönyv", url: "/rules" },
    { name: "Pályák", url: "/tracks" },
  ];
  const adminPages = [
    { name: "Főoldal", url: "/" },
    { name: "Szeriák", url: "/series" },
    { name: "Fórum", url: "/forum" },
    { name: "Naptár", url: "/calendar" },
    { name: "Galéria", url: "/gallery" },
    { name: "Fiókok", url: "/fiokok" },
  ];
  const [user, setUser] = useState<UserModel | null>(null);

  const StyledMenu = styled((props: MenuProps) => (
    <Menu
      elevation={0}
      anchorOrigin={{
        vertical: "bottom",
        horizontal: "right",
      }}
      transformOrigin={{
        vertical: "top",
        horizontal: "right",
      }}
      {...props}
    />
  ))(({ theme }) => ({
    "& .MuiPaper-root": {
      borderRadius: 3,
      marginTop: theme.spacing(1),
      minWidth: 150,
      maxWidth: 150,
      color: theme.palette.mode === "light" ? "black" : theme.palette.grey[300],
      boxShadow:
        "rgb(255, 255, 255) 0px 0px 0px 0px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px, rgba(0, 0, 0, 0.1) 0px 10px 15px -3px, rgba(0, 0, 0, 0.05) 0px 4px 6px -2px",
      "& .MuiMenu-list": {
        padding: "4px 0",
      },
      "& .MuiMenuItem-root": {
        "& .MuiSvgIcon-root": {
          fontSize: 18,
          marginRight: theme.spacing(1.5),
        },
        "&:active": {
          backgroundColor: "light-grey",
        },
      },
    },
  }));

  const [series, setSeries] = useState<SeriesModel[]>([]);
  const [anchorElNav, setAnchorElNav] = React.useState<null | HTMLElement>(
    null
  );
  const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null);
  const [anchorElUser, setAnchorElUser] = React.useState<null | HTMLElement>(
    null
  );
  const navigate = useNavigate();
  async function getAPIData() {
    const response = await axios.get(getSeriesNames);
    return response.data;
  }
  async function getUser() {
    const jwt_token = localStorage.getItem("jwt");
    await axios(getCurrentUser, {
      method: "GET",
      headers: {
        Authorization: `${jwt_token}`,
      },
    })
      .then((response) => {
        if (response.status === 200) {
          setUser(response.data);
          if (response.data.admin) {
            setPages(adminPages);
          } else {
            setPages(userPages);
          }
        }
      })
      .catch((error) => {
        console.log(error.response.data.message);
      });
  }
  React.useEffect(() => {
    let mounted = true;
    getAPIData().then((series) => {
      if (mounted) {
        setSeries(series);
      }
    });
    getUser();
    return () => {
      mounted = false;
    };
  }, []);

  const handleOpenNavMenu = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorElNav(event.currentTarget);
  };
  const handleOpenUserMenu = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorElUser(event.currentTarget);
  };

  const navigateAndCloseMenu = (url: string) => {
    navigate(url);
    setAnchorElNav(null);
  };
  const handleCloseNavMenu = () => {
    setAnchorElNav(null);
  };

  const handleCloseUserMenu = () => {
    setAnchorElUser(null);
  };
  const open = Boolean(anchorEl);

  const handleClick = (event: React.MouseEvent<HTMLElement>) => {
    setAnchorEl(event.currentTarget);
  };
  const handleClose = () => {
    setAnchorEl(null);
  };

  async function handleLogout(event: React.MouseEvent<HTMLElement>) {
    event.preventDefault();
    const jwt = localStorage.getItem("jwt");
    await fetch(logout, {
      method: "DELETE",
      headers: {
        "Content-type": "application/json",
        Authorization: `${jwt}`,
      },
    }).then(async (response) => {
      if (response.status === 200) {
        setUser(null);
        toastNotification(0, "Sikeres kijelentkezés").then(() => {
          location.href = "/";
        });
      } else {
        toastNotification(1, "Hiba a kijelentkezés során");
      }
    });
  }

  return (
    <AppBar
      position="static"
      style={{
        background: "inherit",
        boxShadow: "none",
        zIndex: 1,
        display: "flex",
        justifyContent: "center",
        margin: "auto",
        color: "black",
      }}
    >
      <Container>
        <Toolbar disableGutters>
          <Box sx={{ flexGrow: 1, display: { xs: "flex", md: "none" } }}>
            <IconButton
              size="large"
              aria-label="account of current user"
              aria-controls="menu-appbar"
              aria-haspopup="true"
              onClick={handleOpenNavMenu}
              color="inherit"
            >
              <MenuIcon />
            </IconButton>
            <Menu
              id="menu-appbar"
              anchorEl={anchorElNav}
              anchorOrigin={{
                vertical: "bottom",
                horizontal: "left",
              }}
              keepMounted
              transformOrigin={{
                vertical: "top",
                horizontal: "left",
              }}
              open={Boolean(anchorElNav)}
              onClose={handleCloseNavMenu}
              sx={{
                display: { xs: "block", md: "none" },
              }}
            >
              {pages.map((page, index) => (
                <MenuItem
                  key={index}
                  onClick={() => navigateAndCloseMenu(page.url)}
                >
                  <Typography className={styles.navbarLink}>
                    {page.name}
                  </Typography>
                </MenuItem>
              ))}
            </Menu>
          </Box>
          <Box
            sx={{
              flexGrow: 1,
              display: { xs: "none", md: "flex" },
              margin: "auto",
              justifyContent: "center",
            }}
          >
            {pages.map((page, index) =>
              !page.name.match("Szeriák") ? (
                <Button
                  key={index}
                  className={styles.navItem}
                  onClick={() => navigateAndCloseMenu(page.url)}
                  sx={{ my: 2, color: "white", display: "block" }}
                >
                  {page.name}
                </Button>
              ) : (
                <div key={index}>
                  <Button
                    sx={{ mt: "15px", color: "white" }}
                    id="demo-customized-button"
                    aria-controls={open ? "demo-customized-menu" : undefined}
                    aria-haspopup="true"
                    aria-expanded={open ? "true" : undefined}
                    variant="text"
                    disableElevation
                    onClick={handleClick}
                    endIcon={<KeyboardArrowDownIcon />}
                  >
                    Szériák
                  </Button>
                  <StyledMenu
                    id="demo-customized-menu"
                    MenuListProps={{
                      "aria-labelledby": "demo-customized-button",
                    }}
                    anchorEl={anchorEl}
                    open={open}
                    onClose={handleClose}
                  >
                    {series.map((series: SeriesModel, index) => (
                      <div key={index}>
                        <MenuItem onClick={handleClose} disableRipple>
                          <Link
                            className={styles.navbarLink}
                            to={"/series/" + series.id}
                          >
                            {series.name}
                          </Link>
                        </MenuItem>
                      </div>
                    ))}
                  </StyledMenu>
                </div>
              )
            )}
          </Box>
          <CustomSnackbar />
          {user && (
            <Box sx={{ flexGrow: 0 }}>
              <Tooltip title="Fiók">
                <IconButton onClick={handleOpenUserMenu} sx={{ p: 0 }}>
                  {user.images.length > 0 ? (
                    <img
                      src={user.images[0].image_url}
                      alt="profilkep"
                      width={65}
                      style={{
                        borderRadius: "3vh",
                        objectFit: "cover",
                      }}
                    />
                  ) : (
                    <PermIdentityIcon
                      fontSize="large"
                      style={{ backgroundColor: "white", borderRadius: "2vh" }}
                    />
                  )}
                </IconButton>
              </Tooltip>
              <Menu
                sx={{ mt: "45px" }}
                id="menu-appbar"
                anchorEl={anchorElUser}
                anchorOrigin={{
                  vertical: "top",
                  horizontal: "right",
                }}
                keepMounted
                transformOrigin={{
                  vertical: "top",
                  horizontal: "right",
                }}
                open={Boolean(anchorElUser)}
                onClose={handleCloseUserMenu}
              >
                <MenuItem className={styles.profileOptions}>
                  {user.vezeteknev}&ensp;
                  {user.keresztnev}
                </MenuItem>
                <MenuItem onClick={handleCloseUserMenu}>
                  <Link to="/profile" className={styles.navbarLink}>
                    <Typography className={styles.profileOptions}>
                      Profil
                    </Typography>
                  </Link>
                </MenuItem>
                <MenuItem onClick={handleLogout}>
                  <Typography className={styles.profileOptions}>
                    Kijelentkezés
                  </Typography>
                </MenuItem>
              </Menu>
            </Box>
          )}
        </Toolbar>
      </Container>
    </AppBar>
  );
}
export default ResponsiveAppBar;
