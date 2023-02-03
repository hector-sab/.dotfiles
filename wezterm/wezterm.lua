local wezterm = require 'wezterm'

local function system_colorscheme()
    appearance = wezterm.gui.get_appearance()
    if appearance:find 'Dark' then
        -- return 'Custom Aci (Gogh)'
        return 'Aci (Gogh)'
    else
        -- return 'Custom Fruit Soda (base16)'
        return 'Fruit Soda (base16)'
    end
end

return {
    enable_tab_bar = true,
    color_scheme = system_colorscheme(),
}
