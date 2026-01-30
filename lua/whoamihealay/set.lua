local opt = vim.opt

opt.autowrite = true
opt.backup = false
opt.colorcolumn = "80"
opt.expandtab = true
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"
opt.hlsearch = false
opt.incsearch = true
opt.isfname:append("@-@")
opt.nu = true
opt.relativenumber = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.smartindent = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.updatetime = 50
opt.virtualedit = "block"
opt.wrap = false
