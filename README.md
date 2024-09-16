## minimal nvim config
This repo is just some stuff for basic usage of my own nvim casual 1337 usecase.
Below are some useful tips and info on mappings - if I ever forget and have to regain 
all the muscle memory back lol. 
### **General Settings**

#### **1. Setting the Leader Key**

```lua
vim.g.mapleader = " "
```

- **Description:** Sets the leader key to `<Space>`.
- **Usage:** Press `<Space>` followed by other keys to trigger leader-based mappings.

---

### **File Explorer and Navigation**

#### **2. Open File Explorer**

```lua
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Space>pv`
- **Action:** Opens the file explorer (`:Ex` command).
- **Usage:** Press `<Space>`, then `p`, then `v` in normal mode to open the file explorer.

---

### **Moving Lines of Text**

#### **3. Move Selected Text Down**

```lua
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
```

- **Mode:** Visual (`v`)
- **Key Mapping:** `J`
- **Action:** Moves the selected lines **down** by one line.
- **Usage:** While in visual mode, select lines and press `J` to move them down.

#### **4. Move Selected Text Up**

```lua
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
```

- **Mode:** Visual (`v`)
- **Key Mapping:** `K`
- **Action:** Moves the selected lines **up** by one line.
- **Usage:** While in visual mode, select lines and press `K` to move them up.

---

### **Improving Navigation**

#### **5. Join Lines and Keep Cursor Position**

```lua
vim.keymap.set("n", "J", "mzJ`z")
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `J`
- **Action:** Joins the current line with the next line but keeps the cursor at the original position.
- **Usage:** Press `J` in normal mode to join lines without moving the cursor.

#### **6. Scroll Down Half a Page and Center Cursor**

```lua
vim.keymap.set("n", "<C-d>", "<C-d>zz")
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Ctrl-d>`
- **Action:** Scrolls down half a page and centers the cursor vertically in the window.
- **Usage:** Press `<Ctrl-d>` to scroll down and center the cursor.

#### **7. Scroll Up Half a Page and Center Cursor**

```lua
vim.keymap.set("n", "<C-u>", "<C-u>zz")
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Ctrl-u>`
- **Action:** Scrolls up half a page and centers the cursor.
- **Usage:** Press `<Ctrl-u>` to scroll up and center the cursor.

#### **8. Next Search Match and Center Screen**

```lua
vim.keymap.set("n", "n", "nzzzv")
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `n`
- **Action:** Jumps to the next search match, centers the screen, and opens any folds.
- **Usage:** After searching, press `n` to go to the next match and center it.

#### **9. Previous Search Match and Center Screen**

```lua
vim.keymap.set("n", "N", "Nzzzv")
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `N`
- **Action:** Jumps to the previous search match, centers the screen, and opens any folds.
- **Usage:** Press `N` to go to the previous match and center it.

---

### **Language Server Protocol (LSP)**

#### **10. Restart LSP Server**

```lua
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Space>zig`
- **Action:** Restarts the LSP server.
- **Usage:** Press `<Space>`, then `z`, `i`, `g` to restart the LSP.

---

### **Collaboration with vim-with-me Plugin**

*(Requires the `vim-with-me` plugin)*

#### **11. Start Collaborative Editing**

```lua
vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Space>vwm`
- **Action:** Starts a collaborative editing session.
- **Usage:** Press `<Space>vwm` to start sharing your session.

#### **12. Stop Collaborative Editing**

```lua
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Space>svwm`
- **Action:** Stops the collaborative editing session.
- **Usage:** Press `<Space>svwm` to stop sharing.

---

### **Clipboard and Registers**

#### **13. Paste Over Selection Without Overwriting Clipboard**

```lua
vim.keymap.set("x", "<leader>p", [["_dP]])
```

- **Mode:** Visual (`x`)
- **Key Mapping:** `<Space>p`
- **Action:** Pastes over the selected text without changing the unnamed register.
- **Usage:** In visual mode, select text and press `<Space>p` to replace it without affecting your clipboard.

#### **14. Copy to System Clipboard**

```lua
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
```

- **Mode:** Normal and Visual (`n`, `v`)
- **Key Mapping:** `<Space>y` (for copying), `<Space>Y` (for copying the entire line)
- **Action:** Copies text to the system clipboard.
- **Usage:**
  - In normal mode, press `<Space>Y` to copy the current line.
  - In visual mode, select text and press `<Space>y` to copy to clipboard.

#### **15. Delete Without Affecting Clipboard**

```lua
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
```

- **Mode:** Normal and Visual (`n`, `v`)
- **Key Mapping:** `<Space>d`
- **Action:** Deletes text into the black hole register (doesn't affect clipboard).
- **Usage:** Use `<Space>d` instead of `d` to delete without overwriting your yank buffer.

---

### **Miscellaneous Remappings**

#### **16. Exit Insert Mode with `<Ctrl-c>`**

```lua
vim.keymap.set("i", "<C-c>", "<Esc>")
```

- **Mode:** Insert (`i`)
- **Key Mapping:** `<Ctrl-c>`
- **Action:** Exits insert mode (acts like `<Esc>`).
- **Usage:** Press `<Ctrl-c>` to exit insert mode.

#### **17. Disable Ex Mode**

```lua
vim.keymap.set("n", "Q", "<nop>")
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `Q`
- **Action:** Disables the `Q` key to prevent accidental entry into Ex mode.
- **Usage:** Pressing `Q` will do nothing.

#### **18. Open tmux-sessionizer in New tmux Window**

*(Requires tmux and a script named `tmux-sessionizer`)*

```lua
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Ctrl-f>`
- **Action:** Opens `tmux-sessionizer` in a new tmux window.
- **Usage:** Press `<Ctrl-f>` to run the script in a new tmux window.

#### **19. Format Code Using LSP**

```lua
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Space>f`
- **Action:** Formats the current buffer using LSP.
- **Usage:** Press `<Space>f` to format your code.

---

### **Navigating Quickfix and Location Lists**

#### **20. Navigate Quickfix List**

```lua
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
```

- **Mode:** Normal (`n`)
- **Key Mappings:**
  - `<Ctrl-k>`: Go to the **next** item in the quickfix list.
  - `<Ctrl-j>`: Go to the **previous** item.
- **Action:** Moves through quickfix errors and centers the cursor.
- **Usage:** Use these to navigate compiler or linter errors.

#### **21. Navigate Location List**

```lua
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
```

- **Mode:** Normal (`n`)
- **Key Mappings:**
  - `<Space>k`: Go to the **next** item in the location list.
  - `<Space>j`: Go to the **previous** item.
- **Action:** Moves through items in the location list and centers the cursor.
- **Usage:** Useful when working with search results or diagnostics that populate the location list.

---

### **Search and Replace**

#### **22. Replace Word Under Cursor**

```lua
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Space>s`
- **Action:** Initiates a search and replace for the word under the cursor throughout the file.
- **Usage:**
  1. Place the cursor on the word you want to replace.
  2. Press `<Space>s`.
  3. The command line will show a substitution command; you can edit the replacement text.
  4. Press `<Enter>` to execute.

#### **23. Make Current File Executable**

```lua
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Space>x`
- **Action:** Changes the file permissions to make the current file executable.
- **Usage:** Press `<Space>x` to make a script executable.

---

### **Coding Shortcuts**

#### **24. Insert Error Handling in Go**

*(Assuming you're writing Go code)*

```lua
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Space>ee`
- **Action:** Inserts an `if err != nil { return err }` block below the current line.
- **Usage:** Press `<Space>ee` while coding in Go to quickly insert error handling.

---

### **Configuration and Plugins**

#### **25. Open Neovim Plugin Configuration**

```lua
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Space>vpp`
- **Action:** Opens your Neovim `packer.lua` plugin configuration file.
- **Usage:** Press `<Space>vpp` to edit your plugin configurations.

#### **26. Run Cellular Automaton Animation**

*(Requires the `CellularAutomaton` plugin)*

```lua
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Space>mr`
- **Action:** Runs the `make_it_rain` animation from the `CellularAutomaton` plugin.
- **Usage:** Press `<Space>mr` to see the animation.

---

### **Reload Configuration**

#### **27. Source Current File**

```lua
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
```

- **Mode:** Normal (`n`)
- **Key Mapping:** `<Space><Space>`
- **Action:** Sources (reloads) the current file.
- **Usage:** Press `<Space><Space>` to reload your configuration after making changes.

---

### **Summary Table of Key Mappings**

| Key Mapping             | Mode    | Action                                           |
|-------------------------|---------|--------------------------------------------------|
| `<Space>pv`             | Normal  | Open file explorer (`:Ex`)                       |
| `J`                     | Visual  | Move selected lines **down**                     |
| `K`                     | Visual  | Move selected lines **up**                       |
| `J`                     | Normal  | Join lines without moving the cursor             |
| `<Ctrl-d>`              | Normal  | Scroll down half a page and center cursor        |
| `<Ctrl-u>`              | Normal  | Scroll up half a page and center cursor          |
| `n`                     | Normal  | Next search match and center screen              |
| `N`                     | Normal  | Previous search match and center screen          |
| `<Space>zig`            | Normal  | Restart LSP server                               |
| `<Space>vwm`            | Normal  | Start collaborative editing (`vim-with-me`)      |
| `<Space>svwm`           | Normal  | Stop collaborative editing                       |
| `<Space>p`              | Visual  | Paste over selection without changing clipboard  |
| `<Space>y`              | Normal/Visual | Copy to system clipboard                     |
| `<Space>Y`              | Normal  | Copy line to system clipboard                    |
| `<Space>d`              | Normal/Visual | Delete without affecting clipboard          |
| `<Ctrl-c>`              | Insert  | Exit insert mode                                 |
| `Q`                     | Normal  | Disable Ex mode                                  |
| `<Ctrl-f>`              | Normal  | Open `tmux-sessionizer` in new tmux window       |
| `<Space>f`              | Normal  | Format code using LSP                            |
| `<Ctrl-k>`              | Normal  | Next item in quickfix list                       |
| `<Ctrl-j>`              | Normal  | Previous item in quickfix list                   |
| `<Space>k`              | Normal  | Next item in location list                       |
| `<Space>j`              | Normal  | Previous item in location list                   |
| `<Space>s`              | Normal  | Replace word under cursor                        |
| `<Space>x`              | Normal  | Make current file executable                     |
| `<Space>ee`             | Normal  | Insert Go error handling snippet                 |
| `<Space>vpp`            | Normal  | Open Neovim plugin configuration                 |
| `<Space>mr`             | Normal  | Run Cellular Automaton animation                 |
| `<Space><Space>`        | Normal  | Reload current file                              |

---

### **Notes**

- **Leader Key (`<Space>`):** The leader key is a way to create custom shortcuts in Vim. It's set to `<Space>` in your configuration.
  
- **Modes:**
  - **Normal Mode (`n`):** Default mode for navigation and commands.
  - **Visual Mode (`v`):** Mode for selecting text.
  - **Visual Block Mode (`x`):** Used in some mappings (similar to visual mode).
  - **Insert Mode (`i`):** Mode for inserting text.

- **Dependencies:**
  - Some mappings depend on external plugins (e.g., `vim-with-me`, `CellularAutomaton`).
  - Ensure these plugins are installed and configured correctly for the mappings to work.

- **System Clipboard:**
  - Using `"+y` or `"+Y` interacts with the system clipboard.
  - On some systems, you might need to install additional packages (e.g., `xclip` on Linux) for clipboard support.

- **tmux Integration:**
  - The `<Ctrl-f>` mapping integrates with `tmux`. Make sure you're using `tmux` and have the `tmux-sessionizer` script available.

- **Quickfix and Location Lists:**
  - Quickfix list is used for compiler errors or search results.
  - Location list is similar but specific to a window.

---

### **How to Customize**

If you'd like to customize any of these mappings:

- **Change the Key Mapping:** Modify the key sequence in the `vim.keymap.set` function.
- **Change the Action:** Modify the command or function being executed.
- **Change the Mode:** Adjust the mode parameter (`"n"`, `"v"`, `"i"`, etc.) to change when the mapping is active.

---

### **Example of Customization**

**Change the Key Mapping for Copying to Clipboard:**

- **Original Mapping:**

  ```lua
  vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
  ```

- **Customized to Use `<leader>c`:**

  ```lua
  vim.keymap.set({"n", "v"}, "<leader>c", [["+y]])
  ```

- **Usage:** Now, press `<Space>c` in normal or visual mode to copy to the system clipboard.
