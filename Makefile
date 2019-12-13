DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
EXCLUSIONS := .git .gitignore .config
CANDIDATES := $(wildcard .??*)
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DOTDIRS    := .config bin
INDIRFILES := $(foreach val, $(DOTDIRS), $(wildcard $(val)/?[!.]*))

# NOTE: If you create "Initialize", you must execute 'mkdir ~/bin'

list:
	@$(foreach val, $(DOTFILES), echo $(HOME)/$(val) "->" $(abspath $(val));)
	@$(foreach val, $(INDIRFILES), echo $(HOME)/$(val) "->" $(abspath $(val));)

deploy:
	@$(foreach val, $(DOTFILES), ln -snfv $(abspath $(val)) $(HOME)/$(val);)
	@$(foreach val, $(INDIRFILES), ln -snfv $(abspath $(val)) $(HOME)/$(val);)
