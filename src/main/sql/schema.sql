-- DDL
-- 创建数据库
CREATE DATABASE seckill;

USE seckill;
-- 秒杀商品表
CREATE TABLE seckill (
  `seckill_id`  BIGINT       NOT NULL AUTO_INCREMENT,
  `NAME`        VARCHAR(120) NOT NULL DEFAULT '',
  `number`      INT          NOT NULL DEFAULT '-1',
  `start_time`  TIMESTAMP    NOT NULL DEFAULT current_timestamp,
  `end_time`    TIMESTAMP    NOT NULL DEFAULT current_timestamp,
  `create_time` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (seckill_id),
  KEY idx_start_time(start_time),
  KEY idx_end_time(end_time),
  KEY idx_create_time(create_time)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8
  COMMENT = '秒杀商品表';

-- 初始化数据
INSERT INTO seckill (name, number, start_time, end_time)
VALUES
  ('1000秒杀iphoneX', 10, '2015-11-1 00:00:00', '2018-11-1 00:00:00'),
  ('600秒杀ipad4', 8, '2015-11-1 00:00:00', '2018-11-1 00:00:00'),
  ('300秒杀小米', 6, '2015-11-1 00:00:00', '2018-11-1 00:00:00'),
  ('100秒杀红米3', 6, '2015-11-1 00:00:00', '2018-11-1 00:00:00');

-- 秒杀明显表
CREATE TABLE success_killed (
  `seckill_id`  BIGINT    NOT NULL,
  `user_phone`  BIGINT    NOT NULL,
  `state`       TINYINT   NOT NULL DEFAULT -1
  COMMENT '-1 无效，0 成功，1已付款',
  `start_time`  TIMESTAMP NOT NULL DEFAULT current_timestamp,
  `end_time`    TIMESTAMP NOT NULL DEFAULT current_timestamp,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (seckill_id, user_phone), /*联合主键*/
  KEY idx_create_time(create_time)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8
  COMMENT = '秒杀明细表';