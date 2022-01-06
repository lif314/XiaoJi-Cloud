CREATE DATABASE  IF NOT EXISTS `soa_cloud` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `soa_cloud`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 81.68.236.154    Database: soa_cloud
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',NULL,'com.xiaoji.job.util.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.xiaoji.job.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0,com.xiaoji.common.core.web.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0}\�+(@xpt\0\0pppt\01t\00/10 * * * * ?t\0ryTask.ryNoParamst\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（无参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT',NULL,'com.xiaoji.job.util.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.xiaoji.job.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0,com.xiaoji.common.core.web.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0}\�+(@xpt\0\0pppt\01t\00/15 * * * * ?t\0ryTask.ryParams(\'ry\')t\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（有参）t\03t\01x\0'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT',NULL,'com.xiaoji.job.util.QuartzDisallowConcurrentExecution','0','1','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0TASK_PROPERTIESsr\0com.xiaoji.job.domain.SysJob\0\0\0\0\0\0\0\0L\0\nconcurrentt\0Ljava/lang/String;L\0cronExpressionq\0~\0	L\0invokeTargetq\0~\0	L\0jobGroupq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0jobNameq\0~\0	L\0\rmisfirePolicyq\0~\0	L\0statusq\0~\0	xr\0,com.xiaoji.common.core.web.domain.BaseEntity\0\0\0\0\0\0\0\0L\0createByq\0~\0	L\0\ncreateTimet\0Ljava/util/Date;L\0paramsq\0~\0L\0remarkq\0~\0	L\0searchValueq\0~\0	L\0updateByq\0~\0	L\0\nupdateTimeq\0~\0xpt\0adminsr\0java.util.Datehj�KYt\0\0xpw\0\0}\�+(@xpt\0\0pppt\01t\00/20 * * * * ?t\08ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)t\0DEFAULTsr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0系统默认（多参）t\03t\01x\0');
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler','STATE_ACCESS'),('RuoyiScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler','xiaoji-job-6b749df976-qps5d1640854799159',1641212805629,15000);
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',NULL,1640854800000,-1,5,'PAUSED','CRON',1640854800000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',NULL,1640854815000,-1,5,'PAUSED','CRON',1640854801000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',NULL,1640854820000,-1,5,'PAUSED','CRON',1640854802000,0,NULL,2,'');
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (12,'iot_category','设备分类','','','IotCategory','crud','com.xiaoji.device','device','category','设备分类','xiaoji','0','/','{\"parentMenuId\":\"5\"}','admin','2021-05-06 13:31:29','','2021-05-07 08:22:58',NULL),(14,'iot_device_set','设备配置',NULL,NULL,'IotDeviceSet','crud','com.xiaoji.device','device','set','设备配置','xiaoji','0','/','{\"parentMenuId\":\"5\"}','admin','2021-05-06 13:31:32','','2021-05-06 15:14:45',NULL),(15,'iot_device_status','设备状态',NULL,NULL,'IotDeviceStatus','crud','com.xiaoji.device','device','status','设备状态','xiaoji','0','/','{\"parentMenuId\":\"5\"}','admin','2021-05-06 13:31:35','','2021-05-06 15:15:04',NULL),(17,'iot_group','设备分组',NULL,NULL,'IotGroup','crud','com.xiaoji.device','device','group','分组','xiaoji','0','/','{\"parentMenuId\":\"5\"}','admin','2021-05-18 08:04:15','','2021-05-18 08:13:40',NULL),(18,'t_user_account_info','小程序用户表',NULL,NULL,'TUserAccountInfo','crud','com.xiaoji.device','device','info','小程序用户','xiaoji','0','/',NULL,'admin','2021-08-26 14:45:28','',NULL,NULL),(19,'t_user_login_log','',NULL,NULL,'TUserLoginLog','crud','com.xiaoji.device','device','log',NULL,'xiaoji','0','/',NULL,'admin','2021-08-26 14:45:29','',NULL,NULL),(20,'sys_user','用户信息表',NULL,NULL,'SysUser','crud','com.xiaoji.device','device','user','用户信息','xiaoji','0','/',NULL,'admin','2021-08-26 17:07:44','',NULL,NULL),(21,'iot_device_user_relation','',NULL,NULL,'IotDeviceUserRelation','crud','com.xiaoji.device','device','relation',NULL,'xiaoji','0','/',NULL,'admin','2021-08-27 11:55:05','',NULL,NULL),(22,'iot_device','',NULL,NULL,'IotDevice','crud','com.xiaoji.device','device','device',NULL,'xiaoji','0','/',NULL,'admin','2021-08-27 13:45:40','',NULL,NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (217,'12','category_id','序号','bigint(20)','Long','categoryId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-05-06 13:31:29','','2021-05-07 08:22:58'),(218,'12','category_name','分类名称','varchar(100)','String','categoryName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2021-05-06 13:31:29','','2021-05-07 08:22:58'),(219,'12','del_flag','删除标志（0代表存在 2代表删除）','char(1)','String','delFlag','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',3,'admin','2021-05-06 13:31:29','','2021-05-07 08:22:58'),(220,'12','create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',4,'admin','2021-05-06 13:31:29','','2021-05-07 08:22:58'),(221,'12','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2021-05-06 13:31:29','','2021-05-07 08:22:58'),(222,'12','update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',6,'admin','2021-05-06 13:31:29','','2021-05-07 08:22:58'),(223,'12','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',7,'admin','2021-05-06 13:31:30','','2021-05-07 08:22:59'),(224,'12','remark','备注','varchar(500)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',8,'admin','2021-05-06 13:31:30','','2021-05-07 08:22:59'),(237,'14','device_config_id','序号','bigint(20)','Long','deviceConfigId','1','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-05-06 13:31:32','','2021-05-06 15:14:45'),(238,'14','device_id','设备','bigint(20)','Long','deviceId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2021-05-06 13:31:32','','2021-05-06 15:14:45'),(239,'14','device_num','设备编号','varchar(64)','String','deviceNum','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2021-05-06 13:31:32','','2021-05-06 15:14:45'),(240,'14','is_alarm','报警','tinyint(1)','Integer','isAlarm','0','0',NULL,'1','1','1','1','EQ','radio','sys_yes_no',4,'admin','2021-05-06 13:31:32','','2021-05-06 15:14:45'),(241,'14','is_radar','雷达感应','tinyint(1)','Integer','isRadar','0','0',NULL,'1','1','1','1','EQ','radio','sys_yes_no',5,'admin','2021-05-06 13:31:32','','2021-05-06 15:14:45'),(242,'14','is_host','托管','tinyint(1)','Integer','isHost','0','0',NULL,'1','1','1','1','EQ','radio','sys_yes_no',6,'admin','2021-05-06 13:31:32','','2021-05-06 15:14:46'),(243,'14','is_reset','重启','tinyint(1)','Integer','isReset','0','0',NULL,'1','1','1',NULL,'EQ','radio','sys_yes_no',7,'admin','2021-05-06 13:31:33','','2021-05-06 15:14:46'),(244,'14','is_ap','打开AP','tinyint(1)','Integer','isAp','0','0',NULL,'1','1','1',NULL,'EQ','radio','sys_yes_no',8,'admin','2021-05-06 13:31:33','','2021-05-06 15:14:46'),(245,'14','is_rf_control','射频遥控','tinyint(1)','Integer','isRfControl','0','0',NULL,'1','1','1','1','EQ','radio','sys_yes_no',9,'admin','2021-05-06 13:31:33','','2021-05-06 15:14:46'),(246,'14','is_rf_learn','遥控配对','tinyint(1)','Integer','isRfLearn','0','0',NULL,'1','1','1',NULL,'EQ','radio','sys_yes_no',10,'admin','2021-05-06 13:31:33','','2021-05-06 15:14:46'),(247,'14','is_rf_clear','遥控清码','tinyint(1)','Integer','isRfClear','0','0',NULL,'1','1','1',NULL,'EQ','radio','sys_yes_no',11,'admin','2021-05-06 13:31:33','','2021-05-06 15:14:46'),(248,'14','rf_one_func','按键一','tinyint(10)','Integer','rfOneFunc','0','0',NULL,'1','1','1',NULL,'EQ','select','rf_function',12,'admin','2021-05-06 13:31:33','','2021-05-06 15:14:46'),(249,'14','rf_two_func','按键二','tinyint(10)','Integer','rfTwoFunc','0','0',NULL,'1','1','1',NULL,'EQ','select','rf_function',13,'admin','2021-05-06 13:31:33','','2021-05-06 15:14:47'),(250,'14','rf_three_func','按键三','tinyint(10)','Integer','rfThreeFunc','0','0',NULL,'1','1','1',NULL,'EQ','select','rf_function',14,'admin','2021-05-06 13:31:34','','2021-05-06 15:14:47'),(251,'14','rf_four_func','按键四','tinyint(10)','Integer','rfFourFunc','0','0',NULL,'1','1','1',NULL,'EQ','select','rf_function',15,'admin','2021-05-06 13:31:34','','2021-05-06 15:14:47'),(252,'14','owner_id','用户','varchar(64)','String','ownerId','0','0',NULL,'1','1','1','1','LIKE','input','',16,'admin','2021-05-06 13:31:34','','2021-05-06 15:14:47'),(253,'14','network_address','配网地址','varchar(255)','String','networkAddress','0','0',NULL,'1','1','1','1','LIKE','input','',17,'admin','2021-05-06 13:31:34','','2021-05-06 15:14:47'),(254,'14','network_ip','配网IP','varchar(32)','String','networkIp','0','0',NULL,'1','1','1',NULL,'EQ','input','',18,'admin','2021-05-06 13:31:34','','2021-05-06 15:14:47'),(255,'14','del_flag','删除标志（0代表存在 2代表删除）','char(1)','String','delFlag','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',19,'admin','2021-05-06 13:31:34','','2021-05-06 15:14:47'),(256,'14','create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',20,'admin','2021-05-06 13:31:34','','2021-05-06 15:14:47'),(257,'14','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,'1','BETWEEN','datetime','',21,'admin','2021-05-06 13:31:34','','2021-05-06 15:14:47'),(258,'14','update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',22,'admin','2021-05-06 13:31:35','','2021-05-06 15:14:48'),(259,'14','update_time','更新时间','datetime','Date','updateTime','0','0','1','1','1',NULL,NULL,'EQ','datetime','',23,'admin','2021-05-06 13:31:35','','2021-05-06 15:14:48'),(260,'14','remark','备注','varchar(500)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',24,'admin','2021-05-06 13:31:35','','2021-05-06 15:14:48'),(261,'15','device_status_id','序号','bigint(20)','Long','deviceStatusId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-05-06 13:31:35','','2021-05-06 15:15:04'),(262,'15','device_id','设备','bigint(20)','Long','deviceId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2021-05-06 13:31:35','','2021-05-06 15:15:04'),(263,'15','device_num','设备编号','varchar(64)','String','deviceNum','0','0','1','1','1','1','1','EQ','input','',3,'admin','2021-05-06 13:31:35','','2021-05-06 15:15:04'),(264,'15','relay_status','继电器','tinyint(1)','Integer','relayStatus','0','0',NULL,'1','1','1','1','EQ','radio','sys_yes_no',4,'admin','2021-05-06 13:31:36','','2021-05-06 15:15:05'),(265,'15','light_status','灯状态','tinyint(1)','Integer','lightStatus','0','0',NULL,'1','1','1','1','EQ','radio','sys_yes_no',5,'admin','2021-05-06 13:31:36','','2021-05-06 15:15:05'),(266,'15','is_online','在线','tinyint(1)','Integer','isOnline','0','0',NULL,'1','1','1','1','EQ','radio','sys_yes_no',6,'admin','2021-05-06 13:31:36','','2021-05-06 15:15:05'),(267,'15','device_temperature','设备温度','float(6,2)','BigDecimal','deviceTemperature','0','0',NULL,'1','1','1',NULL,'EQ','input','',7,'admin','2021-05-06 13:31:36','','2021-05-06 15:15:05'),(268,'15','device_humidity','设备湿度','float(6,2)','BigDecimal','deviceHumidity','0','0',NULL,'1','1','1',NULL,'EQ','input','',8,'admin','2021-05-06 13:31:36','','2021-05-06 15:15:05'),(269,'15','air_temperature','空气温度','float(6,2)','BigDecimal','airTemperature','0','0',NULL,'1','1','1',NULL,'EQ','input','',9,'admin','2021-05-06 13:31:36','','2021-05-06 15:15:05'),(270,'15','air_humidity','空气湿度','float(6,2)','BigDecimal','airHumidity','0','0',NULL,'1','1','1',NULL,'EQ','input','',10,'admin','2021-05-06 13:31:36','','2021-05-06 15:15:05'),(271,'15','trigger_source','触发源','tinyint(10)','Integer','triggerSource','0','0',NULL,'1','1','1','1','EQ','select','iot_trigger_source',11,'admin','2021-05-06 13:31:36','','2021-05-06 15:15:05'),(272,'15','brightness','彩灯亮度','tinyint(10) unsigned','Integer','brightness','0','0',NULL,'1','1','1',NULL,'EQ','input','',12,'admin','2021-05-06 13:31:37','','2021-05-06 15:15:05'),(273,'15','light_interval','渐变间隔','smallint(10)','Integer','lightInterval','0','0',NULL,'1','1','1',NULL,'EQ','input','',13,'admin','2021-05-06 13:31:37','','2021-05-06 15:15:06'),(274,'15','light_mode','彩灯模式','tinyint(10)','Integer','lightMode','0','0',NULL,'1','1','1',NULL,'EQ','select','light_mode',14,'admin','2021-05-06 13:31:37','','2021-05-06 15:15:06'),(275,'15','red','红灯','tinyint(255) unsigned','Long','red','0','0',NULL,'1','1','1',NULL,'EQ','input','',15,'admin','2021-05-06 13:31:37','','2021-05-06 15:15:06'),(276,'15','green','绿灯','tinyint(255) unsigned','Long','green','0','0',NULL,'1','1','1',NULL,'EQ','input','',16,'admin','2021-05-06 13:31:37','','2021-05-06 15:15:06'),(277,'15','blue','蓝灯','tinyint(255) unsigned','Long','blue','0','0',NULL,'1','1','1',NULL,'EQ','input','',17,'admin','2021-05-06 13:31:37','','2021-05-06 15:15:06'),(278,'15','del_flag','删除标志（0代表存在 2代表删除）','char(1)','String','delFlag','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',18,'admin','2021-05-06 13:31:37','','2021-05-06 15:15:06'),(279,'15','create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',19,'admin','2021-05-06 13:31:38','','2021-05-06 15:15:06'),(280,'15','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,'1','BETWEEN','datetime','',20,'admin','2021-05-06 13:31:38','','2021-05-06 15:15:06'),(281,'15','update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',21,'admin','2021-05-06 13:31:38','','2021-05-06 15:15:07'),(282,'15','update_time','更新时间','datetime','Date','updateTime','0','0','1','1','1',NULL,NULL,'EQ','datetime','',22,'admin','2021-05-06 13:31:38','','2021-05-06 15:15:07'),(283,'15','remark','备注','varchar(500)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',23,'admin','2021-05-06 13:31:38','','2021-05-06 15:15:07'),(294,'17','group_id','设备分组','bigint(20)','Long','groupId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-05-18 08:04:15','','2021-05-18 08:13:40'),(295,'17','user_id','用户','bigint(20)','Long','userId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2021-05-18 08:04:16','','2021-05-18 08:13:40'),(296,'17','group_name','分组名称','varchar(100)','String','groupName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2021-05-18 08:04:16','','2021-05-18 08:13:40'),(297,'17','group_order','排序','smallint(5) unsigned zerofill','Integer','groupOrder','0','0',NULL,'1','1','1',NULL,'EQ','input','',4,'admin','2021-05-18 08:04:16','','2021-05-18 08:13:41'),(298,'17','del_flag','删除标志（0代表存在 2代表删除）','char(1)','String','delFlag','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',5,'admin','2021-05-18 08:04:16','','2021-05-18 08:13:41'),(299,'17','create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',6,'admin','2021-05-18 08:04:16','','2021-05-18 08:13:41'),(300,'17','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,'1','1','BETWEEN','datetime','',7,'admin','2021-05-18 08:04:17','','2021-05-18 08:13:41'),(301,'17','update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',8,'admin','2021-05-18 08:04:17','','2021-05-18 08:13:41'),(302,'17','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',9,'admin','2021-05-18 08:04:17','','2021-05-18 08:13:41'),(303,'17','remark','备注','varchar(500)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',10,'admin','2021-05-18 08:04:17','','2021-05-18 08:13:42'),(304,'18','id',NULL,'int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-08-26 14:45:28','',NULL),(305,'18','sessionKey','sessionKey','varchar(255)','String','sessionkey','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2021-08-26 14:45:28','',NULL),(306,'18','access_token','accessToken','varchar(255)','String','accessToken','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2021-08-26 14:45:28','',NULL),(307,'18','open_id',NULL,'varchar(50)','String','openId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2021-08-26 14:45:28','',NULL),(308,'18','union_id',NULL,'varchar(50)','String','unionId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2021-08-26 14:45:28','',NULL),(309,'18','nick_name','昵称','varchar(255)','String','nickName','0','0',NULL,'1','1','1','1','LIKE','input','',6,'admin','2021-08-26 14:45:28','',NULL),(310,'18','avatar','头像','varchar(255)','String','avatar','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2021-08-26 14:45:28','',NULL),(311,'18','phone','手机号','varchar(255)','String','phone','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2021-08-26 14:45:28','',NULL),(312,'18','birthday','生日','varchar(255)','String','birthday','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2021-08-26 14:45:28','',NULL),(313,'18','status','用户状态：0-冻结，1-正常','int','Long','status','0','0','1','1','1','1','1','EQ','radio','',10,'admin','2021-08-26 14:45:28','',NULL),(314,'18','country','国家','varchar(255)','String','country','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2021-08-26 14:45:29','',NULL),(315,'18','province','省份','varchar(255)','String','province','0','0',NULL,'1','1','1','1','EQ','input','',12,'admin','2021-08-26 14:45:29','',NULL),(316,'18','city','城市','varchar(255)','String','city','0','0',NULL,'1','1','1','1','EQ','input','',13,'admin','2021-08-26 14:45:29','',NULL),(317,'18','address','地址','varchar(255)','String','address','0','0',NULL,'1','1','1','1','EQ','input','',14,'admin','2021-08-26 14:45:29','',NULL),(318,'18','user_type','用户类型：0-未授权用户，1-消费者，2-商家','int','Long','userType','0','0','1','1','1','1','1','EQ','select','',15,'admin','2021-08-26 14:45:29','',NULL),(319,'18','admin_id','绑定的管理员编号','int','Long','adminId','0','0',NULL,'1','1','1','1','EQ','input','',16,'admin','2021-08-26 14:45:29','',NULL),(320,'18','last_login_time',NULL,'timestamp','Date','lastLoginTime','0','0','1','1','1','1','1','EQ','datetime','',17,'admin','2021-08-26 14:45:29','',NULL),(321,'18','last_login_ip',NULL,'varchar(255)','String','lastLoginIp','0','0',NULL,'1','1','1','1','EQ','input','',18,'admin','2021-08-26 14:45:29','',NULL),(322,'18','gmt_time',NULL,'timestamp','Date','gmtTime','0','0','1','1','1','1','1','EQ','datetime','',19,'admin','2021-08-26 14:45:29','',NULL),(323,'18','gmt_update',NULL,'timestamp','Date','gmtUpdate','0','0','1','1','1','1','1','EQ','datetime','',20,'admin','2021-08-26 14:45:29','',NULL),(324,'19','id',NULL,'int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-08-26 14:45:29','',NULL),(325,'19','user_type','用户类型','varchar(255)','String','userType','0','0',NULL,'1','1','1','1','EQ','select','',2,'admin','2021-08-26 14:45:29','',NULL),(326,'19','user_id',NULL,'int','Long','userId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2021-08-26 14:45:29','',NULL),(327,'19','code',NULL,'varchar(50)','String','code','0','0','1','1','1','1','1','EQ','input','',4,'admin','2021-08-26 14:45:29','',NULL),(328,'19','open_id',NULL,'varchar(50)','String','openId','0','0','1','1','1','1','1','EQ','input','',5,'admin','2021-08-26 14:45:29','',NULL),(329,'19','ip','IP地址','varchar(30)','String','ip','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2021-08-26 14:45:29','',NULL),(330,'19','gmt_time',NULL,'timestamp','Date','gmtTime','0','0',NULL,'1','1','1','1','EQ','datetime','',7,'admin','2021-08-26 14:45:29','',NULL),(331,'19','gmt_update',NULL,'timestamp','Date','gmtUpdate','0','0',NULL,'1','1','1','1','EQ','datetime','',8,'admin','2021-08-26 14:45:29','',NULL),(332,'20','user_id','用户ID','bigint','Long','userId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-08-26 17:07:45','',NULL),(333,'20','dept_id','部门ID','bigint','Long','deptId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2021-08-26 17:07:45','',NULL),(334,'20','open_id','用户OpenId','varchar(40)','String','openId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2021-08-26 17:07:45','',NULL),(335,'20','user_name','用户账号','varchar(30)','String','userName','0','0','1','1','1','1','1','LIKE','input','',4,'admin','2021-08-26 17:07:45','',NULL),(336,'20','nick_name','用户昵称','varchar(30)','String','nickName','0','0','1','1','1','1','1','LIKE','input','',5,'admin','2021-08-26 17:07:45','',NULL),(337,'20','user_type','用户类型（00系统用户）','varchar(2)','String','userType','0','0',NULL,'1','1','1','1','EQ','select','',6,'admin','2021-08-26 17:07:45','',NULL),(338,'20','email','用户邮箱','varchar(50)','String','email','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2021-08-26 17:07:45','',NULL),(339,'20','phonenumber','手机号码','varchar(11)','String','phonenumber','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2021-08-26 17:07:45','',NULL),(340,'20','sex','用户性别（0男 1女 2未知）','char(1)','String','sex','0','0',NULL,'1','1','1','1','EQ','select','',9,'admin','2021-08-26 17:07:45','',NULL),(341,'20','avatar','头像地址','varchar(100)','String','avatar','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2021-08-26 17:07:45','',NULL),(342,'20','password','密码','varchar(100)','String','password','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2021-08-26 17:07:45','',NULL),(343,'20','status','帐号状态（0正常 1停用）','char(1)','String','status','0','0',NULL,'1','1','1','1','EQ','radio','',12,'admin','2021-08-26 17:07:45','',NULL),(344,'20','del_flag','删除标志（0代表存在 2代表删除）','char(1)','String','delFlag','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',13,'admin','2021-08-26 17:07:45','',NULL),(345,'20','login_ip','最后登录IP','varchar(128)','String','loginIp','0','0',NULL,'1','1','1','1','EQ','input','',14,'admin','2021-08-26 17:07:45','',NULL),(346,'20','login_date','最后登录时间','datetime','Date','loginDate','0','0',NULL,'1','1','1','1','EQ','datetime','',15,'admin','2021-08-26 17:07:45','',NULL),(347,'20','create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',16,'admin','2021-08-26 17:07:45','',NULL),(348,'20','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',17,'admin','2021-08-26 17:07:45','',NULL),(349,'20','update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',18,'admin','2021-08-26 17:07:45','',NULL),(350,'20','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',19,'admin','2021-08-26 17:07:45','',NULL),(351,'20','remark','备注','varchar(500)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',20,'admin','2021-08-26 17:07:45','',NULL),(352,'21','id',NULL,'int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-08-27 11:55:05','',NULL),(353,'21','user_id',NULL,'int','Long','userId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2021-08-27 11:55:05','',NULL),(354,'21','device_id',NULL,'int','Long','deviceId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2021-08-27 11:55:06','',NULL),(355,'21','device_num',NULL,'varchar(60)','String','deviceNum','0','0','1','1','1','1','1','EQ','input','',4,'admin','2021-08-27 11:55:06','',NULL),(356,'21','gmt_time',NULL,'timestamp','Date','gmtTime','0','0',NULL,'1','1','1','1','EQ','datetime','',5,'admin','2021-08-27 11:55:06','',NULL),(357,'21','gmt_update',NULL,'timestamp','Date','gmtUpdate','0','0',NULL,'1','1','1','1','EQ','datetime','',6,'admin','2021-08-27 11:55:06','',NULL),(358,'22','device_id','设备ID','bigint','Long','deviceId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2021-08-27 13:45:40','',NULL),(359,'22','device_num','设备编号','varchar(64)','String','deviceNum','0','0','1','1','1','1','1','EQ','input','',2,'admin','2021-08-27 13:45:40','',NULL),(360,'22','category_id','设备分类','bigint','Long','categoryId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2021-08-27 13:45:40','',NULL),(361,'22','device_name','设备名称','varchar(64)','String','deviceName','0','0','1','1','1','1','1','LIKE','input','',4,'admin','2021-08-27 13:45:40','',NULL),(362,'22','firmware_version','固件版本','varchar(32)','String','firmwareVersion','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2021-08-27 13:45:40','',NULL),(363,'22','owner_id','设备用户ID','varchar(64)','String','ownerId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2021-08-27 13:45:40','',NULL),(364,'22','del_flag','删除标志（0代表存在 2代表删除）','char(1)','String','delFlag','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',7,'admin','2021-08-27 13:45:40','',NULL),(365,'22','status','设备状态：未激活，未绑定，已绑定','varchar(255)','String','status','0','0','1','1','1','1','1','EQ','radio','',8,'admin','2021-08-27 13:45:40','',NULL),(366,'22','create_by','创建者','varchar(64)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',9,'admin','2021-08-27 13:45:40','',NULL),(367,'22','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',10,'admin','2021-08-27 13:45:40','',NULL),(368,'22','update_by','更新者','varchar(64)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',11,'admin','2021-08-27 13:45:40','',NULL),(369,'22','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',12,'admin','2021-08-27 13:45:40','',NULL),(370,'22','remark','备注','varchar(500)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',13,'admin','2021-08-27 13:45:40','',NULL);
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2021-12-21 02:47:04','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2021-12-21 02:47:04','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2021-12-21 02:47:04','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2021-12-21 02:47:04','',NULL,'是否开启注册用户功能（true开启，false关闭）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb3 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','小济智能家居科技公司',0,'小济','15888888888','xiaoji.tongji@qq.com','0','0','admin','2021-12-21 02:46:59','',NULL),(101,100,'0,100','同济四平总公司',1,'小济','15888888888','xiaoji.tongji@qq.com','0','0','admin','2021-12-21 02:46:59','',NULL),(102,100,'0,100','黄渡理工分公司',2,'小济','15888888888','xiaoji.tongji@qq.com','0','0','admin','2021-12-21 02:46:59','',NULL),(103,101,'0,100,101','研发部门',1,'小济','15888888888','xiaoji.tongji@qq.com','0','0','admin','2021-12-21 02:46:59','',NULL),(104,101,'0,100,101','市场部门',2,'小济','15888888888','xiaoji.tongji@qq.com','0','0','admin','2021-12-21 02:46:59','',NULL),(105,101,'0,100,101','测试部门',3,'小济','15888888888','xiaoji.tongji@qq.com','0','0','admin','2021-12-21 02:46:59','',NULL),(106,101,'0,100,101','财务部门',4,'小济','15888888888','xiaoji.tongji@qq.com','0','0','admin','2021-12-21 02:46:59','',NULL),(107,101,'0,100,101','运维部门',5,'小济','15888888888','xiaoji.tongji@qq.com','0','0','admin','2021-12-21 02:46:59','',NULL),(108,102,'0,100,102','市场部门',1,'小济','15888888888','xiaoji.tongji@qq.com','0','0','admin','2021-12-21 02:46:59','',NULL),(109,102,'0,100,102','财务部门',2,'小济','15888888888','xiaoji.tongji@qq.com','0','0','admin','2021-12-21 02:46:59','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2021-12-21 02:47:03','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2021-12-21 02:47:03','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2021-12-21 02:47:03','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2021-12-21 02:47:03','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2021-12-21 02:47:03','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2021-12-21 02:47:03','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2021-12-21 02:47:03','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2021-12-21 02:47:03','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2021-12-21 02:47:03','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2021-12-21 02:47:04','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2021-12-21 02:47:04','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2021-12-21 02:47:04','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2021-12-21 02:47:04','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2021-12-21 02:47:04','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2021-12-21 02:47:04','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2021-12-21 02:47:04','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2021-12-21 02:47:04','',NULL,'关闭状态'),(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2021-12-21 02:47:04','',NULL,'新增操作'),(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2021-12-21 02:47:04','',NULL,'修改操作'),(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2021-12-21 02:47:04','',NULL,'删除操作'),(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2021-12-21 02:47:04','',NULL,'授权操作'),(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2021-12-21 02:47:04','',NULL,'导出操作'),(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2021-12-21 02:47:04','',NULL,'导入操作'),(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2021-12-21 02:47:04','',NULL,'强退操作'),(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2021-12-21 02:47:04','',NULL,'生成操作'),(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2021-12-21 02:47:04','',NULL,'清空操作'),(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2021-12-21 02:47:04','',NULL,'正常状态'),(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2021-12-21 02:47:04','',NULL,'停用状态'),(100,0,'按键','1','iot_trigger_source',NULL,NULL,'N','0','admin','2021-05-05 15:53:34','admin','2021-05-05 15:54:17','按键操作'),(101,0,'手机','2','iot_trigger_source',NULL,NULL,'N','0','admin','2021-05-05 15:53:50','',NULL,'手机操作'),(102,0,'浏览器','3','iot_trigger_source',NULL,NULL,'N','0','admin','2021-05-05 15:54:09','',NULL,'浏览器操作'),(103,0,'射频遥控','4','iot_trigger_source',NULL,NULL,'N','0','admin','2021-05-05 15:54:44','',NULL,'433M遥控操作'),(104,0,'雷达','5','iot_trigger_source',NULL,NULL,'N','0','admin','2021-05-05 15:55:03','',NULL,'雷达触发'),(105,0,'报警','6','iot_trigger_source',NULL,NULL,'N','0','admin','2021-05-05 15:55:44','',NULL,'报警触发'),(106,0,'定时','7','iot_trigger_source',NULL,NULL,'N','0','admin','2021-05-05 15:56:03','',NULL,'定时触发'),(107,1,'继电器开关','1','rf_function',NULL,NULL,'N','0','admin','2021-05-05 15:58:36','admin','2021-06-23 22:50:32','继电器通断'),(108,2,'七彩灯开关','2','rf_function',NULL,NULL,'N','0','admin','2021-05-05 15:58:57','admin','2021-06-23 22:50:44','开关灯'),(109,3,'雷达开关','3','rf_function',NULL,NULL,'N','0','admin','2021-05-05 15:59:34','admin','2021-06-23 22:50:21','开关雷达'),(110,4,'报警开关','4','rf_function',NULL,NULL,'N','0','admin','2021-05-05 16:00:01','admin','2021-06-01 15:44:44','报警开关'),(111,5,'智能配网','5','rf_function',NULL,NULL,'N','0','admin','2021-05-05 16:00:16','admin','2021-06-01 15:44:51','智能配网'),(112,0,'固定颜色','0','light_mode',NULL,NULL,'N','0','admin','2021-05-05 16:07:22','',NULL,'固定颜色'),(113,0,'七彩渐变','1','light_mode',NULL,NULL,'N','0','admin','2021-05-05 16:07:41','',NULL,'七彩渐变'),(114,0,'动感模式','2','light_mode',NULL,NULL,'N','0','admin','2021-05-05 16:08:44','',NULL,'动感模式'),(115,0,'单色渐变','3','light_mode',NULL,NULL,'N','0','admin','2021-05-05 16:09:12','',NULL,'单色渐变'),(116,0,'白光','4','light_mode',NULL,NULL,'N','0','admin','2021-05-05 16:09:46','',NULL,'白光'),(117,0,'暖光','5','light_mode',NULL,NULL,'N','0','admin','2021-05-05 16:10:07','',NULL,'暖光'),(118,0,'无','0','rf_function',NULL,NULL,'N','0','admin','2021-06-01 15:43:44','admin','2021-06-01 15:44:21','不进行任何操作');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2021-12-21 02:47:03','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2021-12-21 02:47:03','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2021-12-21 02:47:03','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2021-12-21 02:47:03','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2021-12-21 02:47:03','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2021-12-21 02:47:03','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2021-12-21 02:47:03','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2021-12-21 02:47:03','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2021-12-21 02:47:03','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2021-12-21 02:47:03','',NULL,'登录状态列表'),(100,'设备触发源','iot_trigger_source','0','admin','2021-05-05 15:51:26','',NULL,'设备操作的触发源'),(101,'射频遥控按键功能','rf_function','0','admin','2021-05-05 15:58:05','',NULL,'射频遥控按键功能列表'),(102,'彩灯模式','light_mode','0','admin','2021-05-05 16:04:53','',NULL,'彩灯模式，单色、七彩、渐变、动感');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2021-12-21 02:47:04','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2021-12-21 02:47:04','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2021-12-21 02:47:04','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb3 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','0','登录成功','2021-12-21 11:15:07'),(101,'admin','127.0.0.1','0','退出成功','2021-12-22 07:12:06'),(102,'admin','127.0.0.1','0','退出成功','2021-12-22 07:12:07'),(103,'admin','127.0.0.1','0','登录成功','2021-12-22 07:12:16'),(104,'admin','127.0.0.1','0','退出成功','2021-12-23 09:02:41'),(105,'admin','127.0.0.1','0','登录成功','2021-12-23 09:02:48'),(106,'admin','127.0.0.1','0','退出成功','2021-12-25 05:32:59'),(107,'admin','127.0.0.1','0','登录成功','2021-12-25 05:33:07'),(108,'admin','127.0.0.1','0','退出成功','2021-12-25 11:13:17'),(109,'admin','127.0.0.1','0','登录成功','2021-12-25 11:13:23'),(110,'admin','127.0.0.1','0','退出成功','2021-12-25 11:23:35'),(111,'admin','127.0.0.1','0','登录成功','2021-12-25 11:23:39'),(112,'admin','127.0.0.1','0','退出成功','2021-12-26 02:10:52'),(113,'admin','127.0.0.1','0','登录成功','2021-12-26 02:11:01'),(114,'admin','127.0.0.1','0','退出成功','2021-12-26 06:14:55'),(115,'admin','127.0.0.1','0','登录成功','2021-12-26 06:14:58'),(116,'admin','127.0.0.1','0','退出成功','2021-12-26 06:24:40'),(117,'admin','127.0.0.1','0','登录成功','2021-12-26 06:24:49'),(118,'admin','127.0.0.1','0','退出成功','2021-12-27 04:32:35'),(119,'admin','127.0.0.1','0','登录成功','2021-12-27 04:32:40'),(120,'admin','10.130.59.49','0','登录成功','2021-12-29 05:54:51'),(121,'admin','127.0.0.1','0','退出成功','2021-12-29 06:52:25'),(122,'admin','127.0.0.1','0','登录成功','2021-12-29 08:44:25'),(123,'admin','10.130.59.49','0','登录成功','2021-12-30 02:27:52'),(124,'admin','127.0.0.1','0','退出成功','2021-12-30 04:28:06'),(125,'admin','127.0.0.1','0','登录成功','2021-12-30 04:28:16'),(126,'admin','127.0.0.1','0','退出成功','2021-12-30 04:38:17'),(127,'admin','127.0.0.1','0','登录成功','2021-12-30 04:45:01'),(128,'admin','10.130.59.49','0','退出成功','2021-12-30 07:06:44'),(129,'xiaoji','10.130.59.49','0','登录成功','2021-12-30 07:54:33'),(130,'xiaoji','10.130.59.49','0','退出成功','2021-12-30 07:59:19'),(131,'admin','10.130.59.49','0','登录成功','2021-12-30 07:59:27'),(132,'admin','10.130.59.49','0','退出成功','2021-12-30 08:01:34'),(133,'weixin','10.130.59.49','0','登录成功','2021-12-30 08:01:45'),(134,'weixin','10.130.59.49','0','退出成功','2021-12-30 08:02:56'),(135,'admin','10.130.59.49','0','登录成功','2021-12-30 08:03:02'),(136,'admin','10.130.59.49','0','登录成功','2021-12-30 09:06:58'),(137,'admin','10.130.59.49','0','退出成功','2021-12-30 12:13:12'),(138,'xiaoji','10.130.59.49','0','登录成功','2021-12-30 12:14:00'),(139,'xiaoji','10.130.59.49','0','退出成功','2021-12-30 12:14:45'),(140,'xiaoji','10.130.59.49','0','退出成功','2021-12-30 12:14:46'),(141,'admin','10.130.59.49','0','登录成功','2021-12-30 12:14:49'),(142,'admin','10.130.59.49','0','退出成功','2021-12-30 12:17:50'),(143,'weixin','10.130.59.49','0','登录成功','2021-12-30 12:18:01'),(144,'weixin','10.130.59.49','0','退出成功','2021-12-30 12:18:27'),(145,'admin','10.130.59.49','0','登录成功','2021-12-30 12:40:15'),(146,'admin','10.130.59.49','0','退出成功','2021-12-30 12:50:15'),(147,'admin','10.130.59.49','0','登录成功','2021-12-30 13:03:55'),(148,'admin','10.130.59.49','0','退出成功','2021-12-30 13:04:27'),(149,'admin','10.130.59.49','0','登录成功','2021-12-30 13:13:28'),(150,'admin','10.130.59.49','0','退出成功','2022-01-03 11:38:41'),(151,'admin','10.130.59.49','0','登录成功','2022-01-03 11:45:40');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2009 DEFAULT CHARSET=utf8mb3 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2021-12-21 02:46:59','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2021-12-21 02:46:59','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2021-12-21 02:46:59','',NULL,'系统工具目录'),(4,'小济智能官网',0,5,'https://gitee.com/organizations/xiao-ji-smart-home/projects',NULL,'',0,0,'M','0','0','','guide','admin','2021-12-21 02:46:59','admin','2021-12-30 08:15:42','若依官网地址'),(5,'万物互联',0,0,'iot',NULL,'',1,0,'M','0','0','','client','admin','2021-12-23 09:52:59','admin','2021-12-25 07:31:36','万物互联目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2021-12-21 02:46:59','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2021-12-21 02:47:00','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2021-12-21 02:47:00','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2021-12-21 02:47:00','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2021-12-21 02:47:00','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2021-12-21 02:47:00','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2021-12-21 02:47:00','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2021-12-21 02:47:00','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2021-12-21 02:47:00','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2021-12-21 02:47:00','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2021-12-21 02:47:00','',NULL,'定时任务菜单'),(111,'Sentinel控制台',2,3,'http://139.198.167.224:31267','','',0,0,'C','0','0','monitor:sentinel:list','sentinel','admin','2021-12-21 02:47:00','admin','2021-12-29 12:54:41','流量控制菜单'),(112,'Nacos控制台',2,4,'http://139.198.167.224:30225/nacos/#/configurationManagement?dataId=&group=&appName=&namespace=&pageSize=&pageNo=','','',0,0,'C','0','0','monitor:nacos:list','nacos','admin','2021-12-21 02:47:00','admin','2021-12-30 08:05:20','服务治理菜单'),(113,'Admin控制台',2,5,'http://139.198.167.224:30358','','',0,0,'C','0','0','monitor:server:list','server','admin','2021-12-21 02:47:00','admin','2021-12-30 10:40:11','服务监控菜单'),(114,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2021-12-21 02:47:00','',NULL,'表单构建菜单'),(115,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2021-12-21 02:47:00','',NULL,'代码生成菜单'),(116,'系统接口',3,3,'http://139.198.167.224:31192/swagger-ui/index.html','','',0,0,'C','0','0','tool:swagger:list','swagger','admin','2021-12-21 02:47:00','admin','2021-12-30 12:41:02','系统接口菜单'),(117,'设备分类',5,1,'category','iot/category/index','',1,0,'C','0','0','device:category:list','form','admin','2021-12-23 09:52:59','admin','2021-12-23 16:27:36','设备分类菜单'),(118,'设备列表',5,2,'device','iot/device/index','',1,0,'C','0','0','device:table:list','dict','admin','2021-12-23 09:52:59','admin','2021-12-27 04:50:22','设备菜单'),(119,'配置日志',5,4,'set','iot/set/index','',1,0,'C','0','0','device:set:list','server','admin','2021-12-23 09:52:59','admin','2021-12-23 16:26:37','设备配置菜单'),(120,'状态日志',5,5,'status','iot/status/index','',1,0,'C','0','0','device:status:list','cascader','admin','2021-12-23 09:52:59','admin','2021-12-23 16:26:51','设备状态菜单'),(121,'设备分组',5,3,'group','iot/group/index','',1,0,'C','0','0','device:group:list','row','admin','2021-12-23 09:52:59','admin','2021-12-23 16:26:18','分组菜单'),(122,'EMQ管理',5,6,'http://121.36.229.15:18083/#/',NULL,'',0,0,'C','0','0','','dashboard','admin','2021-12-23 10:06:24','admin','2021-12-23 10:19:06',''),(500,'操作日志',108,1,'operlog','system/operlog/index','',1,0,'C','0','0','system:operlog:list','form','admin','2021-12-21 02:47:00','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','system/logininfor/index','',1,0,'C','0','0','system:logininfor:list','logininfor','admin','2021-12-21 02:47:00','',NULL,'登录日志菜单'),(1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2021-12-21 02:47:00','',NULL,''),(1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2021-12-21 02:47:00','',NULL,''),(1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2021-12-21 02:47:00','',NULL,''),(1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2021-12-21 02:47:00','',NULL,''),(1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2021-12-21 02:47:00','',NULL,''),(1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2021-12-21 02:47:00','',NULL,''),(1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2021-12-21 02:47:00','',NULL,''),(1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2021-12-21 02:47:00','',NULL,''),(1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2021-12-21 02:47:00','',NULL,''),(1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2021-12-21 02:47:00','',NULL,''),(1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2021-12-21 02:47:00','',NULL,''),(1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2021-12-21 02:47:00','',NULL,''),(1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2021-12-21 02:47:00','',NULL,''),(1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2021-12-21 02:47:00','',NULL,''),(1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2021-12-21 02:47:00','',NULL,''),(1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2021-12-21 02:47:00','',NULL,''),(1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2021-12-21 02:47:00','',NULL,''),(1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2021-12-21 02:47:00','',NULL,''),(1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2021-12-21 02:47:00','',NULL,''),(1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2021-12-21 02:47:00','',NULL,''),(1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2021-12-21 02:47:00','',NULL,''),(1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2021-12-21 02:47:00','',NULL,''),(1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2021-12-21 02:47:00','',NULL,''),(1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2021-12-21 02:47:00','',NULL,''),(1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2021-12-21 02:47:00','',NULL,''),(1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2021-12-21 02:47:00','',NULL,''),(1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2021-12-21 02:47:00','',NULL,''),(1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2021-12-21 02:47:00','',NULL,''),(1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2021-12-21 02:47:00','',NULL,''),(1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2021-12-21 02:47:00','',NULL,''),(1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2021-12-21 02:47:00','',NULL,''),(1040,'操作查询',500,1,'#','','',1,0,'F','0','0','system:operlog:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1041,'操作删除',500,2,'#','','',1,0,'F','0','0','system:operlog:remove','#','admin','2021-12-21 02:47:00','',NULL,''),(1042,'日志导出',500,4,'#','','',1,0,'F','0','0','system:operlog:export','#','admin','2021-12-21 02:47:00','',NULL,''),(1043,'登录查询',501,1,'#','','',1,0,'F','0','0','system:logininfor:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1044,'登录删除',501,2,'#','','',1,0,'F','0','0','system:logininfor:remove','#','admin','2021-12-21 02:47:00','',NULL,''),(1045,'日志导出',501,3,'#','','',1,0,'F','0','0','system:logininfor:export','#','admin','2021-12-21 02:47:00','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2021-12-21 02:47:00','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2021-12-21 02:47:00','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2021-12-21 02:47:00','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2021-12-21 02:47:00','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2021-12-21 02:47:00','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2021-12-21 02:47:00','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2021-12-21 02:47:01','',NULL,''),(1054,'任务导出',110,7,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2021-12-21 02:47:01','',NULL,''),(1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2021-12-21 02:47:01','',NULL,''),(1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2021-12-21 02:47:01','',NULL,''),(1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2021-12-21 02:47:01','',NULL,''),(1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2021-12-21 02:47:01','',NULL,''),(1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2021-12-21 02:47:01','',NULL,''),(1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2021-12-21 02:47:01','',NULL,''),(1061,'设备分类查询',117,1,'','','',1,0,'F','0','0','device:category:query','#','admin','2021-12-23 09:52:59','admin','2021-12-23 16:25:46',''),(1062,'设备分类新增',117,2,'','','',1,0,'F','0','0','device:category:add','#','admin','2021-12-23 09:52:59','',NULL,''),(1063,'设备分类修改',117,3,'','','',1,0,'F','0','0','device:category:edit','#','admin','2021-12-23 09:52:59','',NULL,''),(1064,'设备分类删除',117,4,'','','',1,0,'F','0','0','device:category:remove','#','admin','2021-12-23 09:52:59','',NULL,''),(1065,'设备分类导出',117,5,'','','',1,0,'F','0','0','device:category:export','#','admin','2021-12-23 09:52:59','',NULL,''),(1066,'设备查询',118,1,'','','',1,0,'F','0','0','device:table:query','#','admin','2021-12-23 09:52:59','admin','2021-12-27 04:50:40',''),(1067,'设备新增',118,2,'','','',1,0,'F','0','0','device:table:add','#','admin','2021-12-23 09:52:59','admin','2021-12-27 04:50:57',''),(1068,'设备修改',118,3,'','','',1,0,'F','0','0','device:table:edit','#','admin','2021-12-23 09:52:59','admin','2021-12-27 04:51:12',''),(1069,'设备删除',118,4,'','','',1,0,'F','0','0','device:table:remove','#','admin','2021-12-23 09:52:59','admin','2021-12-27 04:51:25',''),(1070,'设备导出',118,5,'','','',1,0,'F','0','0','device:table:export','#','admin','2021-12-23 09:52:59','admin','2021-12-27 04:51:39',''),(1071,'设备配置查询',119,1,'','','',1,0,'F','0','0','device:set:query','#','admin','2021-12-23 09:52:59','',NULL,''),(1072,'设备配置新增',119,2,'','','',1,0,'F','0','0','device:set:add','#','admin','2021-12-23 09:52:59','',NULL,''),(1073,'设备配置修改',119,3,'','','',1,0,'F','0','0','device:set:edit','#','admin','2021-12-23 09:52:59','',NULL,''),(1074,'设备配置删除',119,4,'','','',1,0,'F','0','0','device:set:remove','#','admin','2021-12-23 09:52:59','',NULL,''),(1075,'设备配置导出',119,5,'','','',1,0,'F','0','0','device:set:export','#','admin','2021-12-23 09:52:59','',NULL,''),(1076,'设备状态查询',120,1,'','','',1,0,'F','0','0','device:status:query','#','admin','2021-12-23 09:52:59','',NULL,''),(1077,'设备状态新增',120,2,'','','',1,0,'F','0','0','device:status:add','#','admin','2021-12-23 09:52:59','',NULL,''),(1078,'设备状态修改',120,3,'','','',1,0,'F','0','0','device:status:edit','#','admin','2021-12-23 09:53:00','',NULL,''),(1079,'设备状态删除',120,4,'','','',1,0,'F','0','0','device:status:remove','#','admin','2021-12-23 09:53:00','',NULL,''),(1080,'设备状态导出',120,5,'','','',1,0,'F','0','0','device:status:export','#','admin','2021-12-23 09:53:00','',NULL,''),(1081,'分组查询',121,1,'','','',1,0,'F','0','0','device:group:query','#','admin','2021-12-23 09:53:00','',NULL,''),(1082,'分组新增',121,2,'','','',1,0,'F','0','0','device:group:add','#','admin','2021-12-23 09:53:00','',NULL,''),(1083,'分组修改',121,3,'','','',1,0,'F','0','0','device:group:edit','#','admin','2021-12-23 09:53:00','',NULL,''),(1084,'分组删除',121,4,'','','',1,0,'F','0','0','device:group:remove','#','admin','2021-12-23 09:53:00','',NULL,''),(1085,'分组导出',121,5,'','','',1,0,'F','0','0','device:group:export','#','admin','2021-12-23 09:53:00','',NULL,''),(2001,'MinIO控制台',2,6,'http://121.36.229.15:9001/dashboard',NULL,NULL,0,0,'M','0','0','','button','admin','2021-12-26 06:47:46','admin','2021-12-26 06:48:37',''),(2003,'DevOps',0,4,'devops',NULL,NULL,1,0,'M','0','0','','chart','admin','2021-12-30 08:15:30','admin','2021-12-30 08:15:51',''),(2004,'Jenkens',2003,1,'http://81.68.236.154:10240/login?from=%2F',NULL,NULL,1,0,'M','0','0',NULL,'job','admin','2021-12-30 08:17:57','',NULL,''),(2005,'镜像仓库',2003,2,'https://cr.console.aliyun.com/cn-shanghai/instance/repositories',NULL,NULL,0,0,'M','0','0',NULL,'bug','admin','2021-12-30 08:19:11','',NULL,''),(2006,'gitee',2003,3,'https://gitee.com/organizations/xiao-ji-smart-home/projects',NULL,NULL,0,0,'M','0','0','','code','admin','2021-12-30 08:20:55','admin','2021-12-30 08:21:47',''),(2007,'github',2003,4,'https://github.com/lif314/XiaoJi-Cloud',NULL,NULL,0,0,'M','0','0',NULL,'code','admin','2021-12-30 08:21:38','',NULL,''),(2008,'Jira',2003,5,'https://xiaoji.atlassian.net/jira/your-work',NULL,NULL,0,0,'M','0','0',NULL,'build','admin','2021-12-30 08:22:42','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2021-12-30 小济科技上市了啦','2',_binary '新版本内容','0','admin','2021-12-21 02:47:05','admin','2021-12-29 17:42:19','管理员'),(2,'维护通知：2021-12-30 小济系统凌晨维护','1',_binary '<p>维护内容</p>','0','admin','2021-12-21 02:47:05','admin','2021-12-29 17:42:41','管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb3 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"小济智能官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://gitee.com/organizations/xiao-ji-smart-home/projects\",\"children\":[],\"createTime\":1640026019000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-21 12:03:36'),(101,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"小济智能官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://gitee.com/organizations/xiao-ji-smart-home/projects\",\"children\":[],\"createTime\":1640026019000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-21 12:04:22'),(102,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"iot\",\"orderNum\":\"0\",\"menuName\":\"万物互联\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"iot\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":5,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 09:57:54'),(103,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"iot\",\"orderNum\":\"0\",\"menuName\":\"万物互联\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"iot\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":5,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 09:57:54'),(104,'用户管理',2,'com.xiaoji.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/user','127.0.0.1','','{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1640026019000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"tongji@qq.com\",\"nickName\":\"小济\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1640026019000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 10:07:58'),(105,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"client\",\"orderNum\":\"0\",\"menuName\":\"万物互联\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"device\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":5,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 10:09:51'),(106,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"category\",\"orderNum\":\"1\",\"menuName\":\"设备分类\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"category\",\"component\":\"device/category/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":117,\"menuType\":\"C\",\"perms\":\"device:category:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 10:10:52'),(107,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"client\",\"orderNum\":\"0\",\"menuName\":\"万物互联\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"device\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":5,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 10:12:19'),(108,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"form\",\"orderNum\":\"1\",\"menuName\":\"设备分类\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"category\",\"component\":\"device/category/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":117,\"menuType\":\"C\",\"perms\":\"device:category:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 10:16:37'),(109,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"dict\",\"orderNum\":\"2\",\"menuName\":\"设备列表\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"device\",\"component\":\"device/device/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":118,\"menuType\":\"C\",\"perms\":\"device:device:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 10:17:03'),(110,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"row\",\"orderNum\":\"3\",\"menuName\":\"设备分组\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"group\",\"component\":\"device/group/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":121,\"menuType\":\"C\",\"perms\":\"device:group:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 10:17:28'),(111,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"server\",\"orderNum\":\"4\",\"menuName\":\"配置日志\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"set\",\"component\":\"device/set/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":119,\"menuType\":\"C\",\"perms\":\"device:set:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 10:18:38'),(112,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"cascader\",\"orderNum\":\"5\",\"menuName\":\"状态日志\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"status\",\"component\":\"device/status/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":120,\"menuType\":\"C\",\"perms\":\"device:status:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 10:18:49'),(113,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"dashboard\",\"orderNum\":\"6\",\"menuName\":\"EMQ管理\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"http://121.36.229.15:18083/#/\",\"children\":[],\"createTime\":1640225184000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":122,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 10:19:06'),(114,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"dict\",\"orderNum\":\"2\",\"menuName\":\"设备列表\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"list\",\"component\":\"device/list/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":118,\"menuType\":\"C\",\"perms\":\"device:device:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 15:33:00'),(115,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"dict\",\"orderNum\":\"2\",\"menuName\":\"设备列表\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"list\",\"component\":\"device/list/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":118,\"menuType\":\"C\",\"perms\":\"device:device:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 15:35:27'),(116,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"dict\",\"orderNum\":\"2\",\"menuName\":\"设备列表\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"device\",\"component\":\"device/device/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":118,\"menuType\":\"C\",\"perms\":\"device:device:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 15:37:58'),(117,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"client\",\"orderNum\":\"0\",\"menuName\":\"万物互联\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"device\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":5,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 16:06:14'),(118,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"client\",\"orderNum\":\"0\",\"menuName\":\"万物互联\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"iot\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":5,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 16:23:59'),(119,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"form\",\"orderNum\":\"1\",\"menuName\":\"设备分类\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"category\",\"component\":\"iot/category/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":117,\"menuType\":\"C\",\"perms\":\"device:category:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 16:25:29'),(120,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"client\",\"orderNum\":\"0\",\"menuName\":\"万物互联\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"iot\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":5,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 16:25:33'),(121,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"form\",\"orderNum\":\"1\",\"menuName\":\"设备分类\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"category\",\"component\":\"iot/category/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":117,\"menuType\":\"C\",\"perms\":\"device:category:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 16:25:40'),(122,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"设备分类查询\",\"params\":{},\"parentId\":117,\"isCache\":\"0\",\"path\":\"\",\"component\":\"\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1061,\"menuType\":\"F\",\"perms\":\"device:category:query\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 16:25:46'),(123,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"dict\",\"orderNum\":\"2\",\"menuName\":\"设备列表\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"device\",\"component\":\"iot/device/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":118,\"menuType\":\"C\",\"perms\":\"device:device:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 16:26:01'),(124,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"row\",\"orderNum\":\"3\",\"menuName\":\"设备分组\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"group\",\"component\":\"iot/group/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":121,\"menuType\":\"C\",\"perms\":\"device:group:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 16:26:18'),(125,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"server\",\"orderNum\":\"4\",\"menuName\":\"配置日志\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"set\",\"component\":\"iot/set/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":119,\"menuType\":\"C\",\"perms\":\"device:set:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 16:26:37'),(126,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"cascader\",\"orderNum\":\"5\",\"menuName\":\"状态日志\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"status\",\"component\":\"iot/status/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":120,\"menuType\":\"C\",\"perms\":\"device:status:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 16:26:51'),(127,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"form\",\"orderNum\":\"1\",\"menuName\":\"设备分类\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"category\",\"component\":\"iot/category/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":117,\"menuType\":\"C\",\"perms\":\"device:category:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-23 16:27:37'),(128,'菜单管理',1,'com.xiaoji.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"icon\":\"client\",\"orderNum\":\"0\",\"menuName\":\"万物互联\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"iot\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"新增菜单\'万物互联\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2021-12-25 05:33:49'),(129,'菜单管理',1,'com.xiaoji.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"icon\":\"client\",\"orderNum\":\"0\",\"menuName\":\"设备管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"iot\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-25 05:34:12'),(130,'菜单管理',3,'com.xiaoji.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2000','127.0.0.1','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-25 05:36:36'),(131,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"client\",\"orderNum\":\"0\",\"menuName\":\"万物互联\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"iot\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":5,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-25 07:31:36'),(132,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-25 11:20:47'),(133,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-25 11:20:49'),(134,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/25/58bb40b1-ac89-4308-a44d-744d7ceb76be.jpeg\",\"code\":200}',0,NULL,'2021-12-25 11:21:24'),(135,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/25/9f3fec7d-d287-4856-bfb2-21fdd5f49643.jpeg\",\"code\":200}',0,NULL,'2021-12-25 11:22:28'),(136,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-26 06:05:06'),(137,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-26 06:05:08'),(138,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-26 06:05:09'),(139,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/26/ef6b05fd-0072-4e6c-9837-1fcd82661fdb.jpeg\",\"code\":200}',0,NULL,'2021-12-26 06:06:54'),(140,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/26/3f9b0d6e-9297-4632-babf-42b1aca11e65.jpeg\",\"code\":200}',0,NULL,'2021-12-26 06:09:43'),(141,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/26/548fc417-c541-45b4-abfe-02ee61dc4a16.jpeg\",\"code\":200}',0,NULL,'2021-12-26 06:13:28'),(142,'个人信息',2,'com.xiaoji.system.controller.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/user/profile','127.0.0.1','','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1640401632000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"xiaoji@163.com\",\"nickName\":\"小济智能\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"http://127.0.0.1:9300/statics/2021/12/25/9f3fec7d-d287-4856-bfb2-21fdd5f49643.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"小济\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1640401632000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-26 06:13:41'),(143,'个人信息',2,'com.xiaoji.system.controller.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/user/profile','127.0.0.1','','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1640401632000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"xiaoji@163.com\",\"nickName\":\"小济智能\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"http://127.0.0.1:9300/statics/2021/12/25/9f3fec7d-d287-4856-bfb2-21fdd5f49643.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"小济\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1640401632000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-26 06:13:43'),(144,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/26/3dfd456c-145b-4ffe-8427-5a24e0061e12.jpeg\",\"code\":200}',0,NULL,'2021-12-26 06:15:29'),(145,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/26/355b5f0d-886d-4ab7-bff5-bf581c481b23.jpeg\",\"code\":200}',0,NULL,'2021-12-26 06:25:08'),(146,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/26/a1bceec2-f71d-45cc-abfe-57630d80cd7c.jpeg\",\"code\":200}',0,NULL,'2021-12-26 06:27:21'),(147,'个人信息',2,'com.xiaoji.system.controller.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/user/profile','127.0.0.1','','{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1640401632000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"xiaoji@163.com\",\"nickName\":\"小济智能\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"http://127.0.0.1:9300/statics/2021/12/26/3dfd456c-145b-4ffe-8427-5a24e0061e12.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"小济\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1640401632000,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-26 06:27:24'),(148,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/26/e94a60db-2a69-4803-ba10-69d85e008778.jpeg\",\"code\":200}',0,NULL,'2021-12-26 06:39:04'),(149,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/26/0a686730-b3b6-40ed-9516-034108f3b4b0.jpeg\",\"code\":200}',0,NULL,'2021-12-26 06:41:40'),(150,'菜单管理',1,'com.xiaoji.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"6\",\"menuName\":\"MinIO文件服务\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"http://121.36.229.15:9001/dashboard\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"0\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-26 06:47:46'),(151,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"6\",\"menuName\":\"MinIO控制台\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"http://121.36.229.15:9001/dashboard\",\"children\":[],\"createTime\":1640472466000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-26 06:48:37'),(152,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"nacos\",\"orderNum\":\"4\",\"menuName\":\"Nacos控制台\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"http://121.36.229.15:8848/nacos\",\"component\":\"\",\"children\":[],\"createTime\":1640026020000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":112,\"menuType\":\"C\",\"perms\":\"monitor:nacos:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-26 06:50:06'),(153,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"dict\",\"orderNum\":\"2\",\"menuName\":\"设备列表\",\"params\":{},\"parentId\":5,\"isCache\":\"0\",\"path\":\"device\",\"component\":\"iot/device/index\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":118,\"menuType\":\"C\",\"perms\":\"device:table:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-27 04:50:22'),(154,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"设备查询\",\"params\":{},\"parentId\":118,\"isCache\":\"0\",\"path\":\"\",\"component\":\"\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1066,\"menuType\":\"F\",\"perms\":\"device:table:query\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-27 04:50:40'),(155,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"设备新增\",\"params\":{},\"parentId\":118,\"isCache\":\"0\",\"path\":\"\",\"component\":\"\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1067,\"menuType\":\"F\",\"perms\":\"device:table:add\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-27 04:50:57'),(156,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"设备修改\",\"params\":{},\"parentId\":118,\"isCache\":\"0\",\"path\":\"\",\"component\":\"\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1068,\"menuType\":\"F\",\"perms\":\"device:table:edit\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-27 04:51:12'),(157,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":\"4\",\"menuName\":\"设备删除\",\"params\":{},\"parentId\":118,\"isCache\":\"0\",\"path\":\"\",\"component\":\"\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1069,\"menuType\":\"F\",\"perms\":\"device:table:remove\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-27 04:51:26'),(158,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":\"5\",\"menuName\":\"设备导出\",\"params\":{},\"parentId\":118,\"isCache\":\"0\",\"path\":\"\",\"component\":\"\",\"children\":[],\"createTime\":1640224379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1070,\"menuType\":\"F\",\"perms\":\"device:table:export\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-27 04:51:39'),(159,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 08:53:26'),(160,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 09:34:55'),(161,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"sentinel\",\"orderNum\":\"3\",\"menuName\":\"Sentinel控制台\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"http://139.198.167.224:31267\",\"component\":\"\",\"children\":[],\"createTime\":1640026020000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":111,\"menuType\":\"C\",\"perms\":\"monitor:sentinel:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 12:54:42'),(162,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"nacos\",\"orderNum\":\"4\",\"menuName\":\"Nacos控制台\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"http://121.36.229.15:8848/nacos\",\"component\":\"\",\"children\":[],\"createTime\":1640026020000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":112,\"menuType\":\"C\",\"perms\":\"monitor:nacos:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 17:04:23'),(163,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"server\",\"orderNum\":\"5\",\"menuName\":\"Admin控制台\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"http://:9100/login\",\"component\":\"\",\"children\":[],\"createTime\":1640026020000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":113,\"menuType\":\"C\",\"perms\":\"monitor:server:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 17:04:48'),(164,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 17:05:52'),(165,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 17:07:04'),(166,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 17:07:05'),(167,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 17:07:16'),(168,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 17:07:18'),(169,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 17:07:18'),(170,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 17:07:20'),(171,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 17:09:21'),(172,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 17:09:21'),(173,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}',0,NULL,'2021-12-29 17:09:38'),(174,'通知公告',2,'com.xiaoji.system.controller.SysNoticeController.edit()','PUT',1,'admin',NULL,'/notice','10.130.59.49','','{\"noticeContent\":\"新版本内容\",\"createBy\":\"admin\",\"createTime\":1640026025000,\"updateBy\":\"admin\",\"noticeType\":\"2\",\"remark\":\"管理员\",\"params\":{},\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2021-12-30 小济科技上市了啦\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 17:42:19'),(175,'通知公告',2,'com.xiaoji.system.controller.SysNoticeController.edit()','PUT',1,'admin',NULL,'/notice','10.130.59.49','','{\"noticeContent\":\"<p>维护内容</p>\",\"createBy\":\"admin\",\"createTime\":1640026025000,\"updateBy\":\"admin\",\"noticeType\":\"1\",\"remark\":\"管理员\",\"params\":{},\"noticeId\":2,\"noticeTitle\":\"维护通知：2021-12-30 小济系统凌晨维护\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-29 17:42:41'),(176,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834550067,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:31'),(177,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834552059,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:32'),(178,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834554364,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:34'),(179,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834555806,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:35'),(180,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834556025,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:36'),(181,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834558746,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:39'),(182,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834558882,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:39'),(183,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834559052,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:39'),(184,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834559571,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:39'),(185,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834559755,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:39'),(186,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834559913,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:40'),(187,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834558383,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:40'),(188,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834564829,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:44'),(189,'设备',2,'com.xiaoji.device.controller.IotDeviceController.edit()','PUT',1,'admin',NULL,'/device','10.130.59.49','','{\"deviceTemp\":36.52,\"remark\":\"小济空调就是好！\",\"updateTime\":1640834564832,\"ownerId\":\"1\",\"params\":{},\"categoryName\":\"智能灯\",\"deviceId\":1,\"deviceName\":\"小济空调\",\"deviceNum\":\"7CDFA1049ADA\",\"createBy\":\"\",\"createTime\":1621751198000,\"updateBy\":\"\",\"firmwareVersion\":\"1.0\",\"categoryId\":5,\"status\":\"未激活\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 03:22:45'),(190,'设备状态',1,'com.xiaoji.device.controller.IotDeviceStatusController.add()','POST',1,'admin',NULL,'/status','127.0.0.1','','{\"lightMode\":2,\"isOnline\":1,\"lightStatus\":1,\"deviceId\":1,\"deviceNum\":\"2\",\"red\":1,\"airHumidity\":34,\"triggerSource\":2,\"lightInterval\":212,\"rssi\":1,\"deviceTemperature\":34,\"relayStatus\":1,\"fadeTime\":23,\"params\":{},\"airTemperature\":12,\"brightness\":12,\"createTime\":1640840092410,\"deviceStatusId\":2879}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 04:54:53'),(191,'角色管理',2,'com.xiaoji.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','10.130.59.49','','{\"flag\":false,\"roleId\":101,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1629970012000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"mp\",\"roleName\":\"小程序用户\",\"menuIds\":[5,117,1061,1062,1063,1064,1065,118,1066,1067,1068,1069,1070,121,1081,1082,1083,1084,1085,119,1071,1072,1073,1074,1075,120,1076,1077,1078,1079,1080,122,4],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:00:04'),(192,'用户管理',1,'com.xiaoji.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/user','10.130.59.49','','{\"admin\":false,\"password\":\"$2a$10$xTBQ5VOuca4yOCCK5vVSzuQho.C7cnZg5jwADn86wQNOv7Q9YO0fi\",\"postIds\":[],\"nickName\":\"weixin\",\"params\":{},\"userName\":\"weixin\",\"userId\":117,\"createBy\":\"admin\",\"roleIds\":[101],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:01:11'),(193,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"nacos\",\"orderNum\":\"4\",\"menuName\":\"Nacos控制台\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"http://139.198.167.224:30225/nacos/#/configurationManagement?dataId=&group=&appName=&namespace=&pageSize=&pageNo=\",\"component\":\"\",\"children\":[],\"createTime\":1640026020000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":112,\"menuType\":\"C\",\"perms\":\"monitor:nacos:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:05:20'),(194,'菜单管理',1,'com.xiaoji.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":\"4\",\"menuName\":\"镜像仓库\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"https://cr.console.aliyun.com/cn-shanghai/instance/repositories\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:10:48'),(195,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":\"4\",\"menuName\":\"镜像仓库\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"https://cr.console.aliyun.com/cn-shanghai/instance/repositories\",\"children\":[],\"createTime\":1640823048000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":2002,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:11:18'),(196,'菜单管理',3,'com.xiaoji.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2002','10.130.59.49','',NULL,'{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:12:29'),(197,'菜单管理',1,'com.xiaoji.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"5\",\"menuName\":\"DevOps\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"devops\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:15:30'),(198,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":\"5\",\"menuName\":\"小济智能官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://gitee.com/organizations/xiao-ji-smart-home/projects\",\"children\":[],\"createTime\":1640026019000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:15:42'),(199,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"4\",\"menuName\":\"DevOps\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"devops\",\"children\":[],\"createTime\":1640823330000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:15:51'),(200,'菜单管理',1,'com.xiaoji.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"icon\":\"job\",\"orderNum\":\"1\",\"menuName\":\"Jenkens\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"http://81.68.236.154:10240/login?from=%2F\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:17:57'),(201,'菜单管理',1,'com.xiaoji.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"2\",\"menuName\":\"镜像仓库\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"https://cr.console.aliyun.com/cn-shanghai/instance/repositories\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"0\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:19:11'),(202,'菜单管理',1,'com.xiaoji.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"icon\":\"code\",\"orderNum\":\"3\",\"menuName\":\"gitee\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"https://gitee.com/organizations/xiao-ji-smart-home/projects\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:20:55'),(203,'菜单管理',1,'com.xiaoji.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"icon\":\"code\",\"orderNum\":\"4\",\"menuName\":\"github\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"https://github.com/lif314/XiaoJi-Cloud\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"0\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:21:38'),(204,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"icon\":\"code\",\"orderNum\":\"3\",\"menuName\":\"gitee\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"https://gitee.com/organizations/xiao-ji-smart-home/projects\",\"children\":[],\"createTime\":1640823655000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:21:47'),(205,'菜单管理',1,'com.xiaoji.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"5\",\"menuName\":\"Jira\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"path\":\"https://xiaoji.atlassian.net/jira/your-work\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"0\",\"menuType\":\"M\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 08:22:42'),(206,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"server\",\"orderNum\":\"5\",\"menuName\":\"Admin控制台\",\"params\":{},\"parentId\":2,\"isCache\":\"0\",\"path\":\"http://139.198.167.224:30358\",\"component\":\"\",\"children\":[],\"createTime\":1640026020000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":113,\"menuType\":\"C\",\"perms\":\"monitor:server:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 10:40:12'),(207,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"swagger\",\"orderNum\":\"3\",\"menuName\":\"系统接口\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"http://xiaoyaoji.cn/dashboard?personal\",\"component\":\"\",\"children\":[],\"createTime\":1640026020000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":116,\"menuType\":\"C\",\"perms\":\"tool:swagger:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 11:06:18'),(208,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/30/85f51723-1f4c-4738-adb4-aaa58b126190.jpeg\",\"code\":200}',0,NULL,'2021-12-30 12:12:01'),(209,'用户头像',2,'com.xiaoji.system.controller.SysProfileController.avatar()','POST',1,'admin',NULL,'/user/profile/avatar','10.130.59.49','','','{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/12/30/b04b5dec-5ec3-4d19-8f96-f85c97b34783.jpeg\",\"code\":200}',0,NULL,'2021-12-30 12:13:02'),(210,'菜单管理',2,'com.xiaoji.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','10.130.59.49','','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"swagger\",\"orderNum\":\"3\",\"menuName\":\"系统接口\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"http://139.198.167.224:31192/swagger-ui/index.html\",\"component\":\"\",\"children\":[],\"createTime\":1640026020000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":116,\"menuType\":\"C\",\"perms\":\"tool:swagger:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2021-12-30 12:41:02');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2021-12-21 02:46:59','',NULL,''),(2,'se','项目经理',2,'0','admin','2021-12-21 02:46:59','',NULL,''),(3,'hr','人力资源',3,'0','admin','2021-12-21 02:46:59','',NULL,''),(4,'user','普通员工',4,'0','admin','2021-12-21 02:46:59','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2021-12-21 02:46:59','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2021-12-21 02:46:59','',NULL,'普通角色'),(101,'小程序用户','mp',3,'1',1,1,'0','0','admin','2021-08-26 17:26:52','admin','2021-12-30 08:00:04',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,5),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,118),(2,119),(2,120),(2,121),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(101,4),(101,5),(101,117),(101,118),(101,119),(101,120),(101,121),(101,122),(101,1061),(101,1062),(101,1063),(101,1064),(101,1065),(101,1066),(101,1067),(101,1068),(101,1069),(101,1070),(101,1071),(101,1072),(101,1073),(101,1074),(101,1075),(101,1076),(101,1077),(101,1078),(101,1079),(101,1080),(101,1081),(101,1082),(101,1083),(101,1084),(101,1085);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','小济智能','00','xiaoji@163.com','15888888888','1','http://121.36.229.15:9000/xiaoji/github.png','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2021-12-25 11:07:12','admin','2021-12-25 11:07:12','','2021-12-26 06:27:24','管理员'),(2,105,'xiaoji','小济','00','tongji@qq.com','15666666666','1','http://121.36.229.15:9000/xiaoji/github.png','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2021-12-25 11:07:12','admin','2021-12-25 11:07:12','',NULL,'测试员'),(100,NULL,'public','访客','00','','','0','','$2a$10$E8d4gZ3.QQzDE7LBfY7XpuuGX.LvWFcA982AAdAzk24u91bQ1nete','0','0','',NULL,'admin','2021-12-25 11:07:12','admin','2021-12-25 11:07:12',NULL),(101,NULL,'aaa','xxx','00','','','0','','$2a$10$f.KtWGpaUsdvl2E427/H4OnPi2dYx8HetxnBs1uasSNwCBBUDSwjO','0','0','',NULL,'admin','2021-12-25 11:07:12','',NULL,NULL),(114,NULL,'EB5312FB4A26','微信注册用户','00','','','0','','$2a$10$iWySi4cYQ.0DFSMFCzofbu1H13Dd03WW7h/0OZPzQcBd.7f1fWjV.','0','0','',NULL,'微信小程序','2021-12-25 11:07:12','',NULL,NULL),(115,NULL,'A1BB9722086A','微信注册用户','00','','','0','','$2a$10$rAoFt5nuPw/2CXhRsa/uoOjExW0XH3xM009kcWWo12rzFiSgIK.n2','0','0','',NULL,'微信小程序','2021-12-25 11:07:12','',NULL,NULL),(116,NULL,'6F1B3F33DD38','微信注册用户','00','','','0','','$2a$10$SUR7vd7YIiMkFBFSTKba7uTc5FdpAdwyMuzUsUpMjkgTC0NfiRpqK','0','0','',NULL,'微信小程序','2021-12-25 11:07:12','',NULL,NULL),(117,NULL,'weixin','weixin','00','','','0','http://121.36.229.15:9000/xiaoji/logo.png','$2a$10$xTBQ5VOuca4yOCCK5vVSzuQho.C7cnZg5jwADn86wQNOv7Q9YO0fi','0','0','',NULL,'admin','2021-12-30 08:01:11','',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(117,101);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-03 20:26:58
