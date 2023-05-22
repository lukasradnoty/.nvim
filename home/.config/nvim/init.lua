-- Plugins from ~/.local/share/nvim/site/pack/*/opt/
    -- https://github.com/tpope/vim-commentary
    -- <gcc> comment/uncomment
    -- <gc> comment/uncomment a motion
    -- vim.cmd [[packadd vim-commentary]]

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    use 'tpope/vim-commentary'
end)

-- Config bellow this doesn't apply to VSCode
-- if vim.g.vscode then
--     do
--         return
--     end
-- end

-- Line numbers
    vim.opt.number = true
    -- Relative numbers for lines other than the current line
    vim.opt.relativenumber = true
    
-- Line highlighting
    vim.opt.cursorline = true
    
-- Mouse: enable in all modes
    vim.opt.mouse = 'a'
    
-- Statusline
    local function statusline()
        local filename = '%f'
        local flag_changes = '%m'
        local flag_ro_mode = '%r'
        local flag_preview_mode = '%w'
        local flag_help_buffer = '%H'
        local filepath = '%F'
        local filetail = '%t'
        local truncate_point = '%<' -- (BOL by default)
        local window_number = ' %{winnr()}'
        local separation_point = '%='
        local argument_list_status = '%a'
        local buffer_number = '%n'
        local fileformat = '%{&ff}'
        local filetype = '%y'
        local above_viewport_window = '%P'
        local above_viewport_lines = '%p%%'
        local encoding = "%{&fileencoding?&fileencoding:&encoding}"
        local line_current = '%l'
        local line_total = '%L'
        local column = '%c' -- or %v
        local fugitive = '%{fugitive#statusline()}'
        local warning_file_not_unix = "%#warningmsg#%{&ff!='unix'?'['.&ff.']':''}%*"
        local warning_file_not_utf8 = "%#warningmsg#%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%*"
        
        local left = ''
        -- .. fugitive
        .. filename
        .. flag_changes
        .. flag_ro_mode
        .. flag_preview_mode
        .. flag_help_buffer
        -- .. filepath
        -- .. filetail

        local center = truncate_point .. separation_point
        .. argument_list_status
        .. warning_file_not_unix
        .. warning_file_not_utf8


        local right = '' .. separation_point
        -- .. window_number
        .. string.format('Buf:%s', buffer_number)
        .. string.format(' Ln:%s(%s)', line_current, line_total)
        .. string.format(' Col:%s', column)
        -- .. above_viewport_window
        -- .. above_viewport_lines
        -- .. fileformat
        -- .. encoding
        .. string.format(' %s', filetype)

        return left .. center .. right
    end
    vim.opt.statusline = statusline()

    -- Single fullwidth statusline,
    -- even with multiple panes open
    vim.opt.laststatus = 3
    