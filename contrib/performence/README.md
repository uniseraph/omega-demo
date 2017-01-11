# 性能测试

Ruby测试脚本环境准备：

- brew install ruby
- gem i sequel
- gem i mysql2

- 执行扩展名rb的文件
  - ruby 10000_user_insert.rb

### 注意

脚本里面可能会把数据库的端口写死，执行测试之前，要根据实际端口使用情况改一下。
