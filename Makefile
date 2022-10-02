.PHONY:all get-deps compile compile-deps compile-all clean clean-deps clean-all test test-deps test-all help

# 读取上级配制（可选）。没上级时可以注释
-include ./../../bash/makefile_config.mk
ifdef Path_Epm
	EPM = $(Path_Root_MF)/../../$(Path_Epm)
endif
APP_NAME = ranch
-include ./../../bash/project_include.mk

# 入口
all:compile

# 编译
compile:
	@mkdir -p $(EBIN__DEPS_DIR)
	@mkdir -p $(ETEST_DEPS_DIR)
	@$(ERL) -pa $(EBIN__DEPS_DIR) -noshell -make -j 10
	@cp -r $(Path_Root_MF)/src/$(APP_NAME).app.src $(EBIN__DEPS_DIR)/$(APP_NAME).app
	@echo ">>\033[32m 编译$(APP_NAME) 完成 \033[0m "
	@#$(EPM) -C $(ROOT)/epm.config compile

# 清理
clean:
	@rm -rf $(EBIN__DEPS_DIR)/*.beam
	@rm -rf $(ETEST_DEPS_DIR)/*.beam
	@rm -rf $(EBIN__DEPS_DIR)/*.app
	@rm -rf erl_crash.dump
	@echo ">>\033[91m 清理$(APP_NAME) 完成 \033[0m "
	@#$(EPM) clean

# 测试
test:
	@echo ">>\033[91m 测试$(APP_NAME) 完成(暂) \033[0m "
	@#$(EPM) -C epm.test.config eunit skip_deps=true

include $(Path_Root_MF)/../../bash/project_help.mk
