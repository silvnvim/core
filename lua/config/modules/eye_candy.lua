return {
    plugins = {
        {
            "stevearc/dressing.nvim",
            config = true,
            dependencies = {
                "nvim-telescope/telescope.nvim",
                tag = "0.1.1",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                },
            },
        },
    },
}
