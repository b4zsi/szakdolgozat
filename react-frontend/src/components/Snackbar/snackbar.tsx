import React from "react";
import toast, { ToastBar, Toaster } from "react-hot-toast";

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export const toastNotification = (status: number, szoveg: string) => {
  if (status === 0) {
    toast.success(szoveg, {
      duration: 3500,
      position: "bottom-center",
      style: {
        backgroundColor: "black",
        color: "white",
      },
    });
  } else if (status === 1) {
    toast.error(szoveg, {
      duration: 3500,
      position: "bottom-center",
      style: {
        backgroundColor: "black",
        color: "white",
      },
    });
  }
};

function CustomSnackbar() {
  return (
    <div>
      <Toaster>
        {(t) => (
          <ToastBar
            toast={t}
            style={{
              ...t.style,
              animation: t.visible
                ? "custom-enter 3s ease"
                : "custom-exit 3s ease",
            }}
          />
        )}
      </Toaster>
    </div>
  );
}

export default CustomSnackbar;
