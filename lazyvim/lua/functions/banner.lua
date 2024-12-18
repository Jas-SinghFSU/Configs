local M = {}

-- Function to create a TypeScript-style centered banner
function M.create_ts_banner(text, width)
  width = width or 45 -- Default width set to 45 characters
  local border_char = "*"
  local comment_start = "/"
  local comment_end = "/" -- Changed from "*/" to "/"

  -- Ensure the width is sufficient to accommodate the text
  if width < (#text + 4) then -- 4 accounts for '* ' and ' *'
    width = #text + 4
  end

  -- Calculate the number of '*' characters in the top and bottom borders
  local top_bottom_border_stars = width - 2 -- Adjust for '/' at the beginning and end
  local top_border = comment_start .. string.rep(border_char, top_bottom_border_stars) -- "/" + "*" * (width-2)

  -- Prepare the bottom border
  local bottom_border = string.rep(border_char, top_bottom_border_stars) .. comment_end -- "*" * (width-2) + "/"

  -- Calculate padding to center the text
  local text_length = #text
  if text_length > (width - 4) then -- Adjust for '* ' and ' *'
    -- Truncate text if it's too long and append '...'
    text = text:sub(1, width - 7) .. "..."
    text_length = #text
  end
  local padding_total = width - 4 - text_length
  local padding_left = math.floor(padding_total / 2)
  local padding_right = padding_total - padding_left

  -- Create the middle line with centered text
  local middle = "* " .. string.rep(" ", padding_left - 1) .. text .. string.rep(" ", padding_right - 1) .. " *"

  -- Combine all parts
  return table.concat({ top_border, middle, bottom_border }, "\n")
end

-- Function to prompt for input and insert the TypeScript banner
function M.insert_ts_banner()
  vim.ui.input({ prompt = "Banner Text: " }, function(input)
    if input and input ~= "" then
      local banner = M.create_ts_banner(input, 45) -- Adjust width here if needed
      -- Split the banner into lines
      local banner_lines = vim.split(banner, "\n")
      -- Get the current cursor position
      local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
      -- Insert the banner lines below the current line
      vim.api.nvim_buf_set_lines(0, row, row, true, banner_lines)
    end
  end)
end

-- Create a user command :TSBanner
vim.api.nvim_create_user_command("TSBanner", M.insert_ts_banner, {})

-- Map <leader>ib to the :TSBanner command in normal mode
vim.api.nvim_set_keymap("n", "<leader>ib", ":TSBanner<CR>", { noremap = true, silent = true })

return M
