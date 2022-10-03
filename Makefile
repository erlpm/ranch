.PHONY:all compile clean test build-plt dialyzer help

# app name
App_Name = ranch

# 读取上级配制（可选）。没上级时可以注释
include ./../../bash/makefile_config.mk
Ebin=$(Root_Ebin)/deps/${App_Name}
Etest=$(Root_Etest)/deps/${App_Name}

# 入口
all:compile

# 编译
compile:
	@mkdir -p $(Ebin)
	@mkdir -p $(Etest)
	@$(Erlc) -pa $(Ebin) -o $(Ebin) -I $(Root_Curr)/include $(Root_Curr)/src/ranch_protocol.erl
	@$(Erl) -pa $(Ebin) -noshell -make -j 10
	@cp -r $(Root_Curr)/src/$(App_Name).app.src $(Ebin)/$(App_Name).app
	@echo ">>\033[32m 编译$(App_Name) 完成 \033[0m "
	@#$(Epm) -C $(Root)/epm.config compile

# 清理
clean:
	@rm -rf $(Ebin)/*.beam
	@rm -rf $(Ebin)/*.app
	@rm -rf $(Etest)/*.beam
	@rm -rf erl_crash.dump
	@echo ">>\033[91m 清理$(App_Name) 完成 \033[0m "
	@#$(Epm) clean

# 测试
test:
	@echo ">>\033[91m 测试$(App_Name) 完成(暂) \033[0m "
	@#$(Epm) -C epm.test.config eunit skip_deps=true

include $(Root)/bash/project_help.mk
