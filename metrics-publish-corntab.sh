#!/bin/bash

#以下脚本放到crontab中，一分钟执行一次
#生成环境变量，时间戳，实例名，实例id，隔间
time=$(date -u +%Y-%m-%dT%H:%M:%S+00:00)
instanceName=$(curl -s -L http://169.254.169.254/opc/v1/instance/ | jq -r '.displayName')
instanceId=$(curl -s -L http://169.254.169.254/opc/v1/instance/ | jq -r '.id')
compartmentId=$(curl -s -L http://169.254.169.254/opc/v1/instance/ | jq -r '.compartmentId')

#判断gpu是否正常，正常1，否则0
if [ -x "$(command -v nvidia-smi)" ]; then
  status=1
else
  status=0
fi
echo "status = $status"

#生成json文件，publish到monitoring服务
cat << EOF > /home/opc/metrics.json
[
   {
      "namespace":"gpu_status_space",
      "compartmentId":"$compartmentId",
      "resourceGroup":"gpu_status_group",
      "name":"gpu_status",
      "dimensions":{
         "resourceId":"$instanceId",
         "instanceName":"$instanceName"
      },
      "metadata":{
         "unit":"count",
         "displayName":"gpu_count"
      },
      "datapoints":[
         {
            "timestamp":"$time",
    "value": "$status"
         }
      ]
   }
   
]
EOF
#metric推送到monitoring，注意修改成对应的endpoint。
sudo oci monitoring metric-data post --metric-data file:///home/opc/metrics.json --endpoint https://telemetry-ingestion.us-ashburn-1.oraclecloud.com
