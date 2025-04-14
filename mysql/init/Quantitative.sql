-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- 主机： dex-mysql:3306
-- 生成日期： 2025-04-12 23:56:12
-- 服务器版本： 8.4.4
-- PHP 版本： 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `Quantitative`
--
CREATE DATABASE IF NOT EXISTS `Quantitative` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Quantitative`;

-- --------------------------------------------------------

--
-- 表的结构 `CoinConfig`
--

DROP TABLE IF EXISTS `CoinConfig`;
CREATE TABLE IF NOT EXISTS `CoinConfig` (
  `_id` int NOT NULL AUTO_INCREMENT COMMENT '配置表',
  `tokenContract` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '合约地址',
  `tokenSymbol` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '合约名称',
  `tokenDecimals` tinyint NOT NULL DEFAULT '0' COMMENT '合约精度',
  `creator` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `isDel` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0未删除 1已删除',
  PRIMARY KEY (`_id`),
  KEY `creator` (`creator`),
  KEY `isDel` (`isDel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `dist`
--

DROP TABLE IF EXISTS `dist`;
CREATE TABLE IF NOT EXISTS `dist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sp` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '起点',
  `ep` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '终点',
  `distance` int NOT NULL DEFAULT '0' COMMENT '距离',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='求最短路径';

--
-- 转存表中的数据 `dist`
--

INSERT INTO `dist` (`id`, `sp`, `ep`, `distance`) VALUES
(1, 'a', 'b', 1),
(2, 'a', 'c', 1),
(3, 'b', 'c', 1),
(4, 'b', 'd', 1),
(5, 'c', 'd', 1),
(6, 'c', 'e', 1),
(7, 'd', 'e', 1),
(8, 'd', 'f', 1);

-- --------------------------------------------------------

--
-- 表的结构 `Pairs`
--

DROP TABLE IF EXISTS `Pairs`;
CREATE TABLE IF NOT EXISTS `Pairs` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '索引',
  `pairs_id` int NOT NULL COMMENT '交易对ID',
  `token0` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token0地址',
  `token0_decimal` int NOT NULL,
  `token0_symbol` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token0 symbol',
  `token1` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token1 地址',
  `token1_decimal` int NOT NULL,
  `token1_symbol` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token_pair` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易对地址',
  `platform` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_pair` (`token_pair`),
  KEY `token0` (`token0`),
  KEY `token1` (`token1`),
  KEY `platform` (`platform`),
  KEY `pairs_id` (`pairs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='交易对';

-- --------------------------------------------------------

--
-- 表的结构 `plate_pairs`
--

DROP TABLE IF EXISTS `plate_pairs`;
CREATE TABLE IF NOT EXISTS `plate_pairs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token_pair` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '交易对地址',
  `pair_name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易对名称',
  `token0` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT 'token0地址',
  `token0_decimal` int NOT NULL DEFAULT '0' COMMENT '精度',
  `token0_symbol` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '代币符号',
  `token1` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT 'token1 地址',
  `token1_decimal` int NOT NULL DEFAULT '0' COMMENT 'token1 精度',
  `token1_symbol` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT 'token1 符号',
  `creator` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `created_at` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pair` (`creator`,`token_pair`),
  KEY `creator` (`creator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='交易对信息';

-- --------------------------------------------------------

--
-- 表的结构 `SystemLog`
--

DROP TABLE IF EXISTS `SystemLog`;
CREATE TABLE IF NOT EXISTS `SystemLog` (
  `_id` int NOT NULL AUTO_INCREMENT COMMENT '系统日志表',
  `pair` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '交易对地址',
  `creator` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `account` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '账户',
  `approveContract` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '授权合约地址',
  `approveSpender` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '授权到账户',
  `approveCount` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '授权数量',
  `callContract` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '回调合约',
  `callMethod` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '回调方法',
  `amountIn` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '转入数量',
  `amountOutMin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '兑换最小数量',
  `path_one` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '转入币种',
  `path_two` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '转出数量',
  `toAccount` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '兑换地址',
  `deadline` int NOT NULL DEFAULT '0' COMMENT '交易结束时间',
  `createTime` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易hash或错误信息',
  PRIMARY KEY (`_id`),
  KEY `pair` (`pair`),
  KEY `creator` (`creator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='交易日志';

-- --------------------------------------------------------

--
-- 表的结构 `SystemMarket`
--

DROP TABLE IF EXISTS `SystemMarket`;
CREATE TABLE IF NOT EXISTS `SystemMarket` (
  `_id` int NOT NULL AUTO_INCREMENT COMMENT '交易对表',
  `adminId` int NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `pair` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '交易对地址',
  `minTime` int NOT NULL DEFAULT '1' COMMENT '最小刷单间隔秒数',
  `maxTime` int NOT NULL DEFAULT '1' COMMENT '最大刷单间隔秒数',
  `minToken0Count` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'token0消费最小数量',
  `maxToken0Count` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'token0消费最大数量',
  `minToken1Count` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'token1消费最小数量',
  `maxToken1Count` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'token1消费最大数量',
  `slippage` int NOT NULL DEFAULT '0' COMMENT '交易滑点',
  `slippageTotal` int NOT NULL DEFAULT '1000' COMMENT '交易滑点总数 1000',
  `lastTime` int NOT NULL DEFAULT '0' COMMENT '最近刷单时间戳(s)',
  `nextPeriod` int NOT NULL DEFAULT '0' COMMENT '下一单刷单间隔',
  `token0Contract` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token0 合约地址',
  `token0Symbol` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token0 名称',
  `token0Decimals` tinyint NOT NULL DEFAULT '0' COMMENT 'token0 精度',
  `token1Contract` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token1 合约地址',
  `token1Symbol` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token1 名称',
  `token1Decimals` tinyint NOT NULL DEFAULT '0' COMMENT 'token1 精度',
  `token0_token1_price` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '交易对价格',
  `token1_token0_price` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '交易对价格',
  `type` tinyint NOT NULL DEFAULT '2' COMMENT '0是 token0->token1 \r\n1是 token1 -> token0 \r\n2是随机',
  `creator` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人地址',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '启停状态',
  `isDel` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除规则\r\n0未删除\r\n1已删除',
  PRIMARY KEY (`_id`),
  KEY `adminId` (`adminId`),
  KEY `pair` (`pair`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `creator` (`creator`),
  KEY `isDel` (`isDel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='交易市场表';

-- --------------------------------------------------------

--
-- 表的结构 `trade_block`
--

DROP TABLE IF EXISTS `trade_block`;
CREATE TABLE IF NOT EXISTS `trade_block` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_num` int NOT NULL DEFAULT '0' COMMENT '开始区块号',
  `end_num` int NOT NULL DEFAULT '0' COMMENT '结束区块号',
  `block_num` int NOT NULL DEFAULT '0' COMMENT '每次查询区块数量',
  `created_at` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='交易区块信息';

-- --------------------------------------------------------

--
-- 表的结构 `trade_log`
--

DROP TABLE IF EXISTS `trade_log`;
CREATE TABLE IF NOT EXISTS `trade_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `block_num` int NOT NULL DEFAULT '0' COMMENT '区块ID',
  `hash` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '交易hash',
  `from_address` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '转入币种地址',
  `to_address` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '转出币种地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='交易日志';

-- --------------------------------------------------------

--
-- 表的结构 `UserAddress`
--

DROP TABLE IF EXISTS `UserAddress`;
CREATE TABLE IF NOT EXISTS `UserAddress` (
  `_id` int NOT NULL AUTO_INCREMENT COMMENT '账户id',
  `pid` int NOT NULL DEFAULT '0' COMMENT '上级ID',
  `privateKey` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '私钥',
  `publicKey` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公钥',
  `creator` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `isDel` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0 正常 1 已删除',
  PRIMARY KEY (`_id`),
  KEY `creator` (`creator`),
  KEY `pid` (`pid`),
  KEY `isDel` (`isDel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='账户表';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
