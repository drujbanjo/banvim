return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    override_by_filename = {
      ["Cargo.toml"] = {
        icon = "",
        color = "#ffb454",
        name = "RustProject",
      },
      ["Dockerfile.prod"] = {
        icon = "󰡨",
        color = "#458ee6",
        name = "DockerfileProd",
      },
    },
  },
}
