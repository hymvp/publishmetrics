#!/bin/bash

# 设置要执行的脚本和定时规则
SCRIPT="sh /home/opc/publishmetrics/metrics-publish-corntab.sh"
CRON_SCHEDULE="* * * * *"

# 将新的定时任务添加到临时文件中
echo "$CRON_SCHEDULE $SCRIPT" >> temp_crontab

# 将临时文件中的内容导入到 crontab 中
crontab temp_crontab

# 删除临时文件
rm temp_crontab
