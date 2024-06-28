.PHONY: test

# default: test

install:
	@echo "====================== Installing PIP ======================"
	python -m pip install -e .
	@echo "====================== Installing PIP NV PLUGIN ======================"
	python -m pip install -e /workspaces/pip_plugin
	@echo "====================== Adjusting PIP config with dev PIP Index ======================"
	@mkdir  -p ${HOME}/.config/pip/
	@echo "[install]" >> ${HOME}/.config/pip/pip.conf
	@echo "index-url = https://dekhtiarjonathan.github.io/pipserver/" >> ${HOME}/.config/pip/pip.conf
	@echo "no-cache-dir = true" >> ${HOME}/.config/pip/pip.conf
	@echo "====================== DONE ======================"
	

test:
	pip install numpy
	@make cleanup

nvtest:
	pip install --arch=nvidia numpy
	@make cleanup

cleanup:
	pip uninstall -y numpy

# pip install numpy  # CPU
# pip install --arch=nvidia numpy # GPU
# pip install --arch=tpu numpy # TPU
# pip install --arch=rocm numpy # ROCM
# etc...
