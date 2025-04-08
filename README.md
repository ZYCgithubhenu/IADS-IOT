# HarmonyOS 物联网智慧农业检测平台

![HarmonyOS](https://img.shields.io/badge/HarmonyOS-5.0.0-%23000000.svg)
![IoT](https://img.shields.io/badge/IoT-Platform-%23007EC6.svg)

## 项目概述
基于HarmonyOS的分布式能力与物联网技术构建的智慧农业监测系统，实现农业环境参数实时采集、远程控制、数据可视化和智能预警。支持多设备协同工作，提供端云一体化解决方案。

## 功能特性
- 🌱 多参数实时监测
  - 温湿度/光照强度/土壤湿度/CO₂浓度
- ☁️ 云端数据同步
  - 华为云IoT平台数据存储与分析
- 📲 跨端协同
  - 手机、平板、智能屏多设备协同查看
- 🚨 智能预警
  - 阈值设置与微信/短信告警联动
- 📊 数据可视化
  - 历史数据曲线/热力图展示

## 技术架构
```mermaid
graph TD
A[设备层] -->|HiLink协议| B(通信层)
B --> C{平台层}
C --> D[应用层]
A -->|传感器数据| C
D --> E[移动终端]
D --> F[Web后台]

设备层 --> G[HarmonyOS传感器]
通信层 --> H[MQTT/CoAP]
平台层 --> I[华为云IoT]
应用层 --> J[ArkUI前端]
