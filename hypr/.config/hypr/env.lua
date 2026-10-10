-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("NVD_BACKEND", "direct")

-- Render on the NVIDIA dGPU; Intel iGPU (which owns all outputs) is secondary.
-- Symlinks come from /etc/udev/rules.d/99-dri-names.rules
hl.env("AQ_DRM_DEVICES", "/dev/dri/nvidia-dgpu:/dev/dri/intel-igpu")

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
    xwayland = {
        force_zero_scaling = true
    },
})
