help: 
	@echo 'Makefile for dotfiles 					'
	@echo ' 															'
	@echo 'Usage to be added later 				'
	@echo ' 															'
	

install_vim: clean_vim
	@echo 'Installing vim dotfiles 				'
	git clone https://github.com/gmarik/Vundle.vim.git `pwd`/.vim/bundle/Vundle.vim
	ln -sf `pwd`/.vim ~/.vim
	ln -sf `pwd`/.vimrc ~/.vimrc
	vim +PluginInstall +qall

clean_vim:
	rm -Rf ~/.vimrc
	rm -Rf ~/.vim/bundle/
	rm -Rf ~.vim

install_zsh: clean_zsh
	curl https://cdn.rawgit.com/zsh-users/antigen/v1.2.0/bin/antigen.zsh > `pwd`/antigen.zsh
	ln -sf `pwd`/.zshrc ~/.zshrc

clean_zsh:
	rm -Rf ~/.zshrc
