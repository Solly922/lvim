--
-- Load Which-key config
--
reload("user.keymaps.which_key")
--
--
-- Other GENERIC keymaps not specific to any plugin
--
lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.insert_mode["<C-s>"] = "<C-c>:w<cr>a"
lvim.keys.insert_mode["<C-H>"] = "<C-W>"
