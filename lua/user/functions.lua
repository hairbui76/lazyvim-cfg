local M = {}

-- Function definition
function M.jump_out_first_pair()
  -- Get the current line content
  local line = vim.api.nvim_get_current_line()
  -- Get the current cursor position (row and column)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  local stack = {}

  -- Define matching pairs of brackets and quotes
  local pairs = { ["("] = ")", ["["] = "]", ["{"] = "}", ["<"] = ">", ["'"] = "'", ['"'] = '"' }
  -- String containing all opening characters
  local opening = "([{<'\""
  -- String containing all closing characters
  local closing = ")]}>'\""

  -- Search backwards for opening character
  for i = 1, col do
    local char = line:sub(i, i)
    if opening:find(char, 1, true) then
      local quote_or_double = stack[#stack]
      if quote_or_double == char then
        table.remove(stack)
      else
        table.insert(stack, char)
      end
    elseif closing:find(char, 1, true) then
      local open_pair = stack[#stack]
      if char == pairs[open_pair] then
        table.remove(stack)
      end
    end
  end

  local last_open = table.remove(stack)

  -- Search forward for matching closing character
  for i = col + 1, #line do
    if line:sub(i, i) == pairs[last_open] then
      -- Move cursor and enter insert mode
      vim.api.nvim_win_set_cursor(0, { row, i })
      vim.cmd("startinsert")
      --vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", false)
      return
    end
  end
end

return M
