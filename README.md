# zsh-tmux-man

Read man in a tmux pane without losing what you've input.

## Install

### Install with zinit (recommended)

```zsh
zinit light sei40kr/zsh-tmux-man
```

### Install with zplug

```zsh
zplug sei40kr/zsh-tmux-man
```

## Customization

| Environment variable       | Default value | Description                                                                                   |
| :------------------------- | :------------ | :-------------------------------------------------------------------------------------------- |
| `ZSH_TMUX_MAN_SPLITW_OPTS` | `-l 30%`      | The options passed to `tmux split-window` when opening a new pane. See `tmux(1)` for details. |
