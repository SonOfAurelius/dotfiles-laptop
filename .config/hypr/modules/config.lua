return {
    hl.config({
        general = {
            gaps_in = 0,
            gaps_out = 0,
            border_size = 1,

            col = {
                active_border = "rgba(808080FF)",
                inactive_border = "rgba(000000FF)",
            },

            resize_on_border = true,
            allow_tearing = false,
            layout = "dwindle",
        },
        dwindle = {
            preserve_split = true,
        },
        misc = {
            force_default_wallpaper = 0,
            disable_hyprland_logo = true,
        },
        render = {
            direct_scanout = false,
        }
    }),
}
