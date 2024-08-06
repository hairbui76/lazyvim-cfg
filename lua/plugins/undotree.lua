-- set PowerShell as main shell
if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.opt.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
  vim.opt.shellcmdflag =
    "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
  vim.opt.shellredir = "2>&1 | %%{ '$_' } | Out-File %s; exit $LastExitCode"
  vim.opt.shellpipe = "2>&1 | %%{ '$_' } | tee %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""

  vim.g.undotree_DiffCommand = "FC"
end

-- UndoTree Lazy configuration
return {
  "mbbill/undotree",
}
