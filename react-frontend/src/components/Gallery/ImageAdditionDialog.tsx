import React, { useState } from "react";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  TextField,
} from "@material-ui/core";

function ImageAdditionDialog() {
  const [open, setOpen] = useState<boolean>(false);
  const [name, setName] = useState<string>("");
  const [image, setImage] = useState<string>("null");

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  const handleNameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setName(event.target.value);
  };

  const handleImageChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setImage(URL.createObjectURL(event.target.files![0]));
  };

  const handleSubmit = () => {
    // Handle the submission of the form here
    // You might want to send a POST request to your server with the form data
  };

  return (
    <div>
      <Button variant="outlined" color="primary" onClick={handleClickOpen}>
        Kép hozzáadása
      </Button>
      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="image-addition-dialog-title"
      >
        <DialogTitle id="form-dialog-title">Upload Image</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            id="name"
            label="Image Name"
            type="text"
            fullWidth
            value={name}
            onChange={handleNameChange}
          />
          <input
            accept="image/*"
            style={{ display: "none" }}
            id="raised-button-file"
            type="file"
            onChange={handleImageChange}
          />
          <label htmlFor="raised-button-file">
            <Button variant="text" component="span">
              Kép feltöltés
            </Button>
          </label>
          {image && <img src={image} alt="Preview" />}
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose} color="primary">
            Mégse
          </Button>
          <Button onClick={handleSubmit} color="primary">
            Feltöltés
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
}

export default ImageAdditionDialog;
