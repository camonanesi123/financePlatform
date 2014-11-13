/*
Navicat PGSQL Data Transfer

Source Server         : mars
Source Server Version : 90305
Source Host           : 192.168.1.95:5432
Source Database       : sunlightsdev
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90305
File Encoding         : 65001

Date: 2014-11-12 16:07:45
*/


-- ----------------------------
-- Sequence structure for cust_seq
-- ----------------------------
DROP SEQUENCE "public"."cust_seq";
CREATE SEQUENCE "public"."cust_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9999999999
 START 22
 CACHE 1
 CYCLE;
COMMENT ON SEQUENCE "public"."cust_seq" IS 
'客户号序列';
SELECT setval('"public"."cust_seq"', 22, true);

-- ----------------------------
-- Sequence structure for hibernate_sequence
-- ----------------------------
DROP SEQUENCE "public"."hibernate_sequence";
CREATE SEQUENCE "public"."hibernate_sequence"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 14
 CACHE 1;
SELECT setval('"public"."hibernate_sequence"', 14, true);

-- ----------------------------
-- Sequence structure for seq_base_model
-- ----------------------------
DROP SEQUENCE "public"."seq_base_model";
CREATE SEQUENCE "public"."seq_base_model"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9999999999
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for src
-- ----------------------------
DROP SEQUENCE "public"."src";
CREATE SEQUENCE "public"."src"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 392
 CACHE 1;
SELECT setval('"public"."src"', 392, true);

-- ----------------------------
-- Sequence structure for trade_seq
-- ----------------------------
DROP SEQUENCE "public"."trade_seq";
CREATE SEQUENCE "public"."trade_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9999
 START 19
 CACHE 1
 CYCLE;
COMMENT ON SEQUENCE "public"."trade_seq" IS 
'交易流水号';
SELECT setval('"public"."trade_seq"', 19, true);

-- ----------------------------
-- Table structure for c_bank
-- ----------------------------
DROP TABLE IF EXISTS "public"."c_bank";
CREATE TABLE "public"."c_bank" (
"id" int8 NOT NULL,
"bank_code" varchar(40) COLLATE "default",
"bank_name" varchar(50) COLLATE "default",
"create_time" timestamp(6),
"en_name" varchar(50) COLLATE "default",
"status" varchar(1) COLLATE "default",
"update_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."c_bank"."bank_code" IS '银行编码';
COMMENT ON COLUMN "public"."c_bank"."bank_name" IS '银行名称';
COMMENT ON COLUMN "public"."c_bank"."en_name" IS '英文名';
COMMENT ON COLUMN "public"."c_bank"."status" IS '状态';

-- ----------------------------
-- Table structure for c_bank_card
-- ----------------------------
DROP TABLE IF EXISTS "public"."c_bank_card";
CREATE TABLE "public"."c_bank_card" (
"id" int8 NOT NULL,
"bank_card_no" varchar(40) COLLATE "default",
"bank_code" varchar(40) COLLATE "default",
"status" varchar(1) COLLATE "default",
"bank_type" varchar(1) COLLATE "default",
"create_time" timestamp(6),
"customer_id" varchar(30) COLLATE "default",
"update_time" timestamp(6),
"bank_id" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for c_customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."c_customer";
CREATE TABLE "public"."c_customer" (
"id" int8 NOT NULL,
"customer_id" varchar(30) COLLATE "default",
"customer_type" varchar(1) COLLATE "default",
"device_no" varchar(50) COLLATE "default",
"email" varchar(50) COLLATE "default",
"identity_number" varchar(30) COLLATE "default",
"identity_typer" varchar(1) COLLATE "default",
"login_id" varchar(20) COLLATE "default",
"login_password" varchar(40) COLLATE "default",
"mobile" varchar(11) COLLATE "default",
"nick_name" varchar(20) COLLATE "default",
"pic_way" varchar(40) COLLATE "default",
"property" varchar(1) COLLATE "default",
"qq" varchar(20) COLLATE "default",
"real_name" varchar(20) COLLATE "default",
"referral_code" varchar(10) COLLATE "default",
"reg_channel" varchar(1) COLLATE "default",
"reg_way" varchar(1) COLLATE "default",
"status" varchar(1) COLLATE "default",
"weibo" varchar(30) COLLATE "default",
"weixin" varchar(30) COLLATE "default",
"create_by" varchar(30) COLLATE "default",
"create_time" timestamp(6),
"update_by" varchar(30) COLLATE "default",
"update_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."c_customer"."customer_id" IS '客户号';
COMMENT ON COLUMN "public"."c_customer"."customer_type" IS '客户类型';
COMMENT ON COLUMN "public"."c_customer"."device_no" IS '注册设备号';
COMMENT ON COLUMN "public"."c_customer"."email" IS '绑定邮箱';
COMMENT ON COLUMN "public"."c_customer"."identity_number" IS '证件号码';
COMMENT ON COLUMN "public"."c_customer"."identity_typer" IS '证件类型';
COMMENT ON COLUMN "public"."c_customer"."login_id" IS '登陆号';
COMMENT ON COLUMN "public"."c_customer"."login_password" IS '登陆密码';
COMMENT ON COLUMN "public"."c_customer"."mobile" IS '绑定手机';
COMMENT ON COLUMN "public"."c_customer"."nick_name" IS '昵称';
COMMENT ON COLUMN "public"."c_customer"."pic_way" IS '用户图像存放路径';
COMMENT ON COLUMN "public"."c_customer"."property" IS '用户属性';
COMMENT ON COLUMN "public"."c_customer"."qq" IS '绑定QQ';
COMMENT ON COLUMN "public"."c_customer"."real_name" IS '真实姓名';
COMMENT ON COLUMN "public"."c_customer"."referral_code" IS '推荐码';
COMMENT ON COLUMN "public"."c_customer"."reg_channel" IS '注册渠道';
COMMENT ON COLUMN "public"."c_customer"."reg_way" IS '注册方式';
COMMENT ON COLUMN "public"."c_customer"."status" IS '用户状态';
COMMENT ON COLUMN "public"."c_customer"."weibo" IS '绑定微博号';
COMMENT ON COLUMN "public"."c_customer"."weixin" IS '绑定微信号';
COMMENT ON COLUMN "public"."c_customer"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."c_customer"."create_time" IS '创建时间';

-- ----------------------------
-- Table structure for c_customer_gesture
-- ----------------------------
DROP TABLE IF EXISTS "public"."c_customer_gesture";
CREATE TABLE "public"."c_customer_gesture" (
"id" int8 NOT NULL,
"device_no" varchar(40) COLLATE "default",
"gesture_password" varchar(40) COLLATE "default",
"status" varchar(1) COLLATE "default",
"customer_id" varchar(30) COLLATE "default",
"update_time" timestamp(6),
"create_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."c_customer_gesture"."device_no" IS '设备号';
COMMENT ON COLUMN "public"."c_customer_gesture"."gesture_password" IS '手势密码';
COMMENT ON COLUMN "public"."c_customer_gesture"."status" IS 'Y失效 N有效';
COMMENT ON COLUMN "public"."c_customer_gesture"."customer_id" IS '客户号';
COMMENT ON COLUMN "public"."c_customer_gesture"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."c_customer_gesture"."create_time" IS '创建时间';

-- ----------------------------
-- Table structure for c_customer_session
-- ----------------------------
DROP TABLE IF EXISTS "public"."c_customer_session";
CREATE TABLE "public"."c_customer_session" (
"id" int8 NOT NULL,
"client_address" varchar(40) COLLATE "default",
"device_name" varchar(40) COLLATE "default",
"device_no" varchar(40) COLLATE "default",
"status" varchar(1) COLLATE "default",
"token" varchar(400) COLLATE "default",
"customer_id" varchar(30) COLLATE "default",
"create_time" timestamp(6),
"update_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."c_customer_session"."client_address" IS '客户端Ip地址';
COMMENT ON COLUMN "public"."c_customer_session"."device_name" IS '设备名称';
COMMENT ON COLUMN "public"."c_customer_session"."device_no" IS '设备号';
COMMENT ON COLUMN "public"."c_customer_session"."status" IS 'Y失效 N有效';
COMMENT ON COLUMN "public"."c_customer_session"."customer_id" IS '客户号';

-- ----------------------------
-- Table structure for c_customer_verify_code
-- ----------------------------
DROP TABLE IF EXISTS "public"."c_customer_verify_code";
CREATE TABLE "public"."c_customer_verify_code" (
"id" int8 NOT NULL,
"device_no" varchar(40) COLLATE "default",
"mobile" varchar(11) COLLATE "default",
"status" varchar(1) COLLATE "default",
"verify_code" varchar(40) COLLATE "default",
"verify_type" varchar(20) COLLATE "default",
"create_time" timestamp(6),
"update_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."c_customer_verify_code"."device_no" IS '设备号';
COMMENT ON COLUMN "public"."c_customer_verify_code"."mobile" IS '手机号';
COMMENT ON COLUMN "public"."c_customer_verify_code"."status" IS 'Y失效 N有效';
COMMENT ON COLUMN "public"."c_customer_verify_code"."verify_code" IS '验证码';
COMMENT ON COLUMN "public"."c_customer_verify_code"."verify_type" IS '类型';

-- ----------------------------
-- Table structure for c_feedback
-- ----------------------------
DROP TABLE IF EXISTS "public"."c_feedback";
CREATE TABLE "public"."c_feedback" (
"id" int8 NOT NULL,
"customer_id" varchar(30) COLLATE "default",
"context" text COLLATE "default",
"mobile" varchar(20) COLLATE "default",
"remark" text COLLATE "default",
"status" varchar(50) COLLATE "default",
"device_no" varchar(50) COLLATE "default",
"create_time" timestamp(6),
"update_time" timestamp(6),
"update_by" varchar(30) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for c_fund_open_account
-- ----------------------------
DROP TABLE IF EXISTS "public"."c_fund_open_account";
CREATE TABLE "public"."c_fund_open_account" (
"id" int8,
"bank_card_no" varchar(32) COLLATE "default",
"bank_code" varchar(20) COLLATE "default",
"bank_buyer_name" varchar(10) COLLATE "default",
"branch_bank_name" varchar(60) COLLATE "default",
"customer_id" varchar(30) COLLATE "default",
"create_time" timestamp(6),
"update_time" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for c_login_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."c_login_history";
CREATE TABLE "public"."c_login_history" (
"id" int8 NOT NULL,
"device_no" varchar(40) COLLATE "default",
"gesture_ind" varchar(1) COLLATE "default",
"log_num" int8,
"pwd_ind" varchar(1) COLLATE "default",
"social_ind" varchar(1) COLLATE "default",
"success_ind" varchar(1) COLLATE "default",
"customer_id" varchar(30) COLLATE "default",
"create_time" timestamp(6),
"login_time" timestamp(6),
"logout_time" timestamp(6),
"update_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."c_login_history"."device_no" IS '设备号';
COMMENT ON COLUMN "public"."c_login_history"."gesture_ind" IS 'Y手势登录 ';
COMMENT ON COLUMN "public"."c_login_history"."log_num" IS '登录失败次数';
COMMENT ON COLUMN "public"."c_login_history"."pwd_ind" IS 'Y密码登录';
COMMENT ON COLUMN "public"."c_login_history"."success_ind" IS '成功登录标志';
COMMENT ON COLUMN "public"."c_login_history"."customer_id" IS '客户号';
COMMENT ON COLUMN "public"."c_login_history"."login_time" IS '登录时间';
COMMENT ON COLUMN "public"."c_login_history"."logout_time" IS '登出时间';

-- ----------------------------
-- Table structure for c_open_account_pact
-- ----------------------------
DROP TABLE IF EXISTS "public"."c_open_account_pact";
CREATE TABLE "public"."c_open_account_pact" (
"agreement_no" varchar(20) COLLATE "default" NOT NULL,
"sign_channel" varchar(10) COLLATE "default",
"agreement_start_date" timestamp(6),
"agreement_end_date" timestamp(6),
"agreement_effect_date" timestamp(6),
"agreement_expiry_date" timestamp(6),
"agreement_status" varchar(1) COLLATE "default",
"sale_property" varchar(1) COLLATE "default",
"user_attribution" varchar(1) COLLATE "default",
"agreement_name" varchar(40) COLLATE "default",
"agreement_file_type" varchar(10) COLLATE "default",
"file_name" varchar(100) COLLATE "default",
"file_path" varchar(200) COLLATE "default",
"status" varchar(1) COLLATE "default",
"create_date" timestamp(6),
"update_date" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."dict";
CREATE TABLE "public"."dict" (
"id" int8 NOT NULL,
"code_cat" varchar(50) COLLATE "default",
"code_key" varchar(50) COLLATE "default",
"code_val" varchar(100) COLLATE "default",
"seq_no" int4,
"create_by" varchar(255) COLLATE "default",
"create_time" timestamp(6),
"status" varchar(1) COLLATE "default",
"sys_ind" varchar(1) COLLATE "default",
"magic" varchar(255) COLLATE "default",
"remarks" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for f_acct_chang_flow
-- ----------------------------
DROP TABLE IF EXISTS "public"."f_acct_chang_flow";
CREATE TABLE "public"."f_acct_chang_flow" (
"id" int8 NOT NULL,
"product_code" varchar(8) COLLATE "default",
"trade_no" varchar(20) COLLATE "default",
"subject_no" varchar(6) COLLATE "default",
"amount" numeric(18,4),
"create_time" timestamp(6),
"customer_id" varchar(30) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."f_acct_chang_flow" IS '账户变动流水表';
COMMENT ON COLUMN "public"."f_acct_chang_flow"."id" IS '账户变动流水ID';
COMMENT ON COLUMN "public"."f_acct_chang_flow"."product_code" IS '产品编码';
COMMENT ON COLUMN "public"."f_acct_chang_flow"."trade_no" IS '交易流水号';
COMMENT ON COLUMN "public"."f_acct_chang_flow"."subject_no" IS '科目号';
COMMENT ON COLUMN "public"."f_acct_chang_flow"."amount" IS '变动金额';
COMMENT ON COLUMN "public"."f_acct_chang_flow"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."f_acct_chang_flow"."customer_id" IS '客户号';

-- ----------------------------
-- Table structure for f_basic_account
-- ----------------------------
DROP TABLE IF EXISTS "public"."f_basic_account";
CREATE TABLE "public"."f_basic_account" (
"id" int8 NOT NULL,
"account_no" varchar(30) COLLATE "default",
"status" char(1) COLLATE "default",
"balance" numeric(18,4),
"create_time" timestamp(6),
"update_time" timestamp(6),
"delete_time" timestamp(6),
"trade_password" varchar(50) COLLATE "default",
"cust_id" varchar(30) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."f_basic_account" IS '基本账户';
COMMENT ON COLUMN "public"."f_basic_account"."id" IS '基本账户Id';
COMMENT ON COLUMN "public"."f_basic_account"."account_no" IS '基本账户号';
COMMENT ON COLUMN "public"."f_basic_account"."status" IS 'N表示正常';
COMMENT ON COLUMN "public"."f_basic_account"."balance" IS '余额';
COMMENT ON COLUMN "public"."f_basic_account"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."f_basic_account"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."f_basic_account"."delete_time" IS '删除时间';
COMMENT ON COLUMN "public"."f_basic_account"."trade_password" IS '交易密码';
COMMENT ON COLUMN "public"."f_basic_account"."cust_id" IS '客户号';

-- ----------------------------
-- Table structure for f_fund_agreement
-- ----------------------------
DROP TABLE IF EXISTS "public"."f_fund_agreement";
CREATE TABLE "public"."f_fund_agreement" (
"id" int8 NOT NULL,
"customer_id" varchar(30) COLLATE "default",
"company_code" varchar(20) COLLATE "default" NOT NULL,
"create_time" timestamp(6),
"update_time" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for f_holdcapital
-- ----------------------------
DROP TABLE IF EXISTS "public"."f_holdcapital";
CREATE TABLE "public"."f_holdcapital" (
"id" int8 NOT NULL,
"create_time" timestamp(6),
"cust_id" varchar(255) COLLATE "default",
"delete_time" timestamp(6),
"hold_capital" numeric(18,4),
"product_code" varchar(8) COLLATE "default",
"product_name" varchar(100) COLLATE "default",
"settle_date" timestamp(6),
"status" varchar(1) COLLATE "default",
"total_profit" numeric(18,4),
"trade_amount" numeric(18,4),
"update_time" timestamp(6),
"yesterday_profit" numeric(18,4),
"product_type" varchar(50) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."f_holdcapital"."cust_id" IS '客户号';
COMMENT ON COLUMN "public"."f_holdcapital"."hold_capital" IS '持有资产';
COMMENT ON COLUMN "public"."f_holdcapital"."settle_date" IS '结算日期';
COMMENT ON COLUMN "public"."f_holdcapital"."total_profit" IS '累计收益';
COMMENT ON COLUMN "public"."f_holdcapital"."trade_amount" IS '申赎资产';
COMMENT ON COLUMN "public"."f_holdcapital"."yesterday_profit" IS '昨日收益';

-- ----------------------------
-- Table structure for f_sub_account
-- ----------------------------
DROP TABLE IF EXISTS "public"."f_sub_account";
CREATE TABLE "public"."f_sub_account" (
"id" int8 NOT NULL,
"sub_account" varchar(10) COLLATE "default",
"status" char(1) COLLATE "default",
"balance" numeric(18,4),
"profit" numeric(18,4),
"yesterday_profit" numeric(18,4),
"create_time" timestamp(6),
"update_time" timestamp(6),
"delete_time" timestamp(6),
"cust_id" varchar(30) COLLATE "default",
"basic_account" varchar(30) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."f_sub_account" IS '子账户';
COMMENT ON COLUMN "public"."f_sub_account"."id" IS '子账户ID';
COMMENT ON COLUMN "public"."f_sub_account"."sub_account" IS '子账户号';
COMMENT ON COLUMN "public"."f_sub_account"."status" IS '子账户状态';
COMMENT ON COLUMN "public"."f_sub_account"."balance" IS '余额';
COMMENT ON COLUMN "public"."f_sub_account"."profit" IS '累计收益';
COMMENT ON COLUMN "public"."f_sub_account"."yesterday_profit" IS '昨日收益';
COMMENT ON COLUMN "public"."f_sub_account"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."f_sub_account"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."f_sub_account"."delete_time" IS '删除时间';
COMMENT ON COLUMN "public"."f_sub_account"."cust_id" IS '客户号';
COMMENT ON COLUMN "public"."f_sub_account"."basic_account" IS '基本账户号';

-- ----------------------------
-- Table structure for f_subject
-- ----------------------------
DROP TABLE IF EXISTS "public"."f_subject";
CREATE TABLE "public"."f_subject" (
"id" int8 NOT NULL,
"subject_no" varchar(6) COLLATE "default",
"description" varchar(20) COLLATE "default",
"dc_flag" varchar(50) COLLATE "default",
"create_time" timestamp(6),
"update_time" timestamp(6),
"delete_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."f_subject" IS '科目表';
COMMENT ON COLUMN "public"."f_subject"."id" IS '科目ID';
COMMENT ON COLUMN "public"."f_subject"."subject_no" IS '科目号';
COMMENT ON COLUMN "public"."f_subject"."description" IS '科目说明';
COMMENT ON COLUMN "public"."f_subject"."dc_flag" IS '借贷标志  增加资金记贷方 C  较少资金记借方 D';
COMMENT ON COLUMN "public"."f_subject"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."f_subject"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."f_subject"."delete_time" IS '删除时间';

-- ----------------------------
-- Table structure for m_logging_event
-- ----------------------------
DROP TABLE IF EXISTS "public"."m_logging_event";
CREATE TABLE "public"."m_logging_event" (
"log_event_id" int8 NOT NULL,
"log_event_arg0" varchar(10) COLLATE "default",
"log_event_arg1" varchar(10) COLLATE "default",
"log_event_arg2" varchar(10) COLLATE "default",
"log_event_arg3" varchar(10) COLLATE "default",
"log_event_caller_class" varchar(10) COLLATE "default",
"log_event_caller_filename" varchar(10) COLLATE "default",
"log_event_caller_line" varchar(10) COLLATE "default",
"log_event_caller_method" varchar(10) COLLATE "default",
"log_event_format_msg" varchar(10) COLLATE "default",
"log_event_level" varchar(10) COLLATE "default",
"log_event_logger_name" varchar(10) COLLATE "default",
"log_event_ref_flag" int4,
"log_event_thread_name" varchar(10) COLLATE "default",
"log_event_timestmp" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for m_logging_event_exception
-- ----------------------------
DROP TABLE IF EXISTS "public"."m_logging_event_exception";
CREATE TABLE "public"."m_logging_event_exception" (
"log_event_id" int8 NOT NULL,
"log_event_i" int4,
"log_event_trace_line" varchar(10) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for m_logging_event_property
-- ----------------------------
DROP TABLE IF EXISTS "public"."m_logging_event_property";
CREATE TABLE "public"."m_logging_event_property" (
"log_event_id" int8 NOT NULL,
"log_mapped_key" varchar(10) COLLATE "default",
"log_mapped_value" varchar(10) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for p_fund
-- ----------------------------
DROP TABLE IF EXISTS "public"."p_fund";
CREATE TABLE "public"."p_fund" (
"id" int8 NOT NULL,
"min_apply_amount" numeric(18,4),
"lowest_redemption" int8,
"one_year_profit" numeric(18,4),
"million_of_profit" numeric(18,4),
"one_week_profit" numeric(18,4),
"nav_date" timestamp(6),
"is_apply" varchar(50) COLLATE "default",
"is_redemption" varchar(50) COLLATE "default",
"product_status" varchar(50) COLLATE "default",
"deleted" varchar(50) COLLATE "default",
"create_time" timestamp(6),
"update_time" timestamp(6),
"update_by" varchar(10) COLLATE "default",
"create_by" varchar(10) COLLATE "default",
"company_name" varchar(10) COLLATE "default",
"chi_name" varchar(100) COLLATE "default",
"chi_name_abbr" varchar(50) COLLATE "default",
"eng_name" varchar(100) COLLATE "default",
"eng_name_abbr" varchar(50) COLLATE "default",
"secu_abbr" varchar(20) COLLATE "default",
"fund_scale" numeric,
"fund_type" varchar(50) COLLATE "default",
"invest_period" varchar(50) COLLATE "default",
"charge" numeric,
"to_account_type" varchar(50) COLLATE "default",
"supplier_id" int8,
"risk_level" varchar(50) COLLATE "default",
"fund_code" varchar(10) COLLATE "default",
"init_buyed_count" int8,
"one_month_buyed_count" int8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for p_fund_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."p_fund_history";
CREATE TABLE "public"."p_fund_history" (
"id" int8 NOT NULL,
"min_apply_amount" numeric(18,4),
"lowest_redemption" int8,
"one_year_profit" numeric(18,4),
"million_of_profit" numeric(18,4),
"one_week_profit" numeric(18,4),
"nav_date" timestamp(6),
"is_apply" varchar(50) COLLATE "default",
"is_redemption" varchar(50) COLLATE "default",
"product_status" int4,
"deleted" bool,
"create_time" timestamp(6),
"update_time" timestamp(6),
"update_by" varchar(10) COLLATE "default",
"create_by" varchar(10) COLLATE "default",
"company_name" varchar(10) COLLATE "default",
"chi_name" varchar(100) COLLATE "default",
"chi_name_abbr" varchar(50) COLLATE "default",
"eng_name" varchar(100) COLLATE "default",
"eng_name_abbr" varchar(50) COLLATE "default",
"secu_abbr" varchar(20) COLLATE "default",
"fund_scale" numeric,
"fund_type" varchar(50) COLLATE "default",
"invest_period" varchar(50) COLLATE "default",
"charge" numeric,
"to_account_type" varchar(50) COLLATE "default",
"supplier_id" int8,
"risk_level" varchar(50) COLLATE "default",
"fund_code" varchar(10) COLLATE "default",
"init_buyed_count" int8,
"one_month_buyed_count" int8,
"created_by" varchar(30) COLLATE "default",
"onr_month_buyed_count" int8,
"suppiler_id" int8,
"updated_by" varchar(30) COLLATE "default",
"updated_time" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for p_prd_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."p_prd_type";
CREATE TABLE "public"."p_prd_type" (
"id" int8 NOT NULL,
"code" varchar(8) COLLATE "default",
"name" varchar(60) COLLATE "default",
"create_time" timestamp(6),
"update_time" timestamp(6),
"delete_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."p_prd_type" IS '产品类型表';
COMMENT ON COLUMN "public"."p_prd_type"."id" IS '主键';
COMMENT ON COLUMN "public"."p_prd_type"."code" IS '产品类型编码';
COMMENT ON COLUMN "public"."p_prd_type"."name" IS '产品类型名称';
COMMENT ON COLUMN "public"."p_prd_type"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."p_prd_type"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."p_prd_type"."delete_time" IS '删除时间';

-- ----------------------------
-- Table structure for p_product_manage
-- ----------------------------
DROP TABLE IF EXISTS "public"."p_product_manage";
CREATE TABLE "public"."p_product_manage" (
"id" int8 NOT NULL,
"product_name" varchar(10) COLLATE "default",
"begin_time" timestamp(6),
"end_date" timestamp(6),
"create_time" timestamp(6),
"update_time" timestamp(6),
"product_desc" varchar(100) COLLATE "default",
"product_status" char(50) COLLATE "default",
"url" varchar(300) COLLATE "default",
"product_code" varchar(10) COLLATE "default",
"product_type" varchar(50) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for p_product_recommend
-- ----------------------------
DROP TABLE IF EXISTS "public"."p_product_recommend";
CREATE TABLE "public"."p_product_recommend" (
"id" int8 NOT NULL,
"product_id" int8,
"product_name" varchar(100) COLLATE "default",
"recommend_type" varchar(8) COLLATE "default",
"product_code" varchar(8) COLLATE "default",
"begin_date" timestamp(6),
"end_date" timestamp(6),
"temp_stop_date" timestamp(6),
"priority_level" varchar(50) COLLATE "default",
"recommend_flag" varchar(50) COLLATE "default",
"recommend_desc" varchar(50) COLLATE "default",
"url" varchar(500) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS "public"."parameter";
CREATE TABLE "public"."parameter" (
"id" int8 NOT NULL,
"description" varchar(255) COLLATE "default",
"name" varchar(50) COLLATE "default",
"value" varchar(50) COLLATE "default",
"status" varchar(1) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."parameter"."description" IS '描述';
COMMENT ON COLUMN "public"."parameter"."name" IS '参数名';
COMMENT ON COLUMN "public"."parameter"."value" IS '参数值';
COMMENT ON COLUMN "public"."parameter"."status" IS 'Y有效 N失效';

-- ----------------------------
-- Table structure for prd_account_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."prd_account_config";
CREATE TABLE "public"."prd_account_config" (
"id" int8 NOT NULL,
"prd_type_code" varchar(8) COLLATE "default",
"sub_account" varchar(10) COLLATE "default",
"create_time" timestamp(6),
"update_time" timestamp(6),
"delete_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."prd_account_config" IS '产品-账户关系配置表';
COMMENT ON COLUMN "public"."prd_account_config"."id" IS '主键Id';
COMMENT ON COLUMN "public"."prd_account_config"."prd_type_code" IS '产品类型编码';
COMMENT ON COLUMN "public"."prd_account_config"."sub_account" IS '子账户号';
COMMENT ON COLUMN "public"."prd_account_config"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."prd_account_config"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."prd_account_config"."delete_time" IS '删除时间';

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_blob_triggers";
CREATE TABLE "public"."qrtz_blob_triggers" (
"sched_name" varchar(120) COLLATE "default" NOT NULL,
"trigger_name" varchar(200) COLLATE "default" NOT NULL,
"trigger_group" varchar(200) COLLATE "default" NOT NULL,
"blob_data" bytea
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_calendars";
CREATE TABLE "public"."qrtz_calendars" (
"sched_name" varchar(120) COLLATE "default" NOT NULL,
"calendar_name" varchar(200) COLLATE "default" NOT NULL,
"calendar" bytea NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_cron_triggers";
CREATE TABLE "public"."qrtz_cron_triggers" (
"sched_name" varchar(120) COLLATE "default" NOT NULL,
"trigger_name" varchar(200) COLLATE "default" NOT NULL,
"trigger_group" varchar(200) COLLATE "default" NOT NULL,
"cron_expression" varchar(120) COLLATE "default" NOT NULL,
"time_zone_id" varchar(80) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_fired_triggers";
CREATE TABLE "public"."qrtz_fired_triggers" (
"sched_name" varchar(120) COLLATE "default" NOT NULL,
"entry_id" varchar(95) COLLATE "default" NOT NULL,
"trigger_name" varchar(200) COLLATE "default" NOT NULL,
"trigger_group" varchar(200) COLLATE "default" NOT NULL,
"instance_name" varchar(200) COLLATE "default" NOT NULL,
"fired_time" int8 NOT NULL,
"priority" int4 NOT NULL,
"state" varchar(16) COLLATE "default" NOT NULL,
"job_name" varchar(200) COLLATE "default",
"job_group" varchar(200) COLLATE "default",
"is_nonconcurrent" bool,
"requests_recovery" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_job_details";
CREATE TABLE "public"."qrtz_job_details" (
"sched_name" varchar(120) COLLATE "default" NOT NULL,
"job_name" varchar(200) COLLATE "default" NOT NULL,
"job_group" varchar(200) COLLATE "default" NOT NULL,
"description" varchar(250) COLLATE "default",
"job_class_name" varchar(250) COLLATE "default" NOT NULL,
"is_durable" bool NOT NULL,
"is_nonconcurrent" bool NOT NULL,
"is_update_data" bool NOT NULL,
"requests_recovery" bool NOT NULL,
"job_data" bytea
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_locks";
CREATE TABLE "public"."qrtz_locks" (
"sched_name" varchar(120) COLLATE "default" NOT NULL,
"lock_name" varchar(40) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_paused_trigger_grps";
CREATE TABLE "public"."qrtz_paused_trigger_grps" (
"sched_name" varchar(120) COLLATE "default" NOT NULL,
"trigger_group" varchar(200) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_scheduler_state";
CREATE TABLE "public"."qrtz_scheduler_state" (
"sched_name" varchar(120) COLLATE "default" NOT NULL,
"instance_name" varchar(200) COLLATE "default" NOT NULL,
"last_checkin_time" int8 NOT NULL,
"checkin_interval" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_simple_triggers";
CREATE TABLE "public"."qrtz_simple_triggers" (
"sched_name" varchar(120) COLLATE "default" NOT NULL,
"trigger_name" varchar(200) COLLATE "default" NOT NULL,
"trigger_group" varchar(200) COLLATE "default" NOT NULL,
"repeat_count" int8 NOT NULL,
"repeat_interval" int8 NOT NULL,
"times_triggered" int8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_simprop_triggers";
CREATE TABLE "public"."qrtz_simprop_triggers" (
"sched_name" varchar(120) COLLATE "default" NOT NULL,
"trigger_name" varchar(200) COLLATE "default" NOT NULL,
"trigger_group" varchar(200) COLLATE "default" NOT NULL,
"str_prop_1" varchar(512) COLLATE "default",
"str_prop_2" varchar(512) COLLATE "default",
"str_prop_3" varchar(512) COLLATE "default",
"int_prop_1" int4,
"int_prop_2" int4,
"long_prop_1" int8,
"long_prop_2" int8,
"dec_prop_1" numeric(13,4),
"dec_prop_2" numeric(13,4),
"bool_prop_1" bool,
"bool_prop_2" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."qrtz_triggers";
CREATE TABLE "public"."qrtz_triggers" (
"sched_name" varchar(120) COLLATE "default" NOT NULL,
"trigger_name" varchar(200) COLLATE "default" NOT NULL,
"trigger_group" varchar(200) COLLATE "default" NOT NULL,
"job_name" varchar(200) COLLATE "default" NOT NULL,
"job_group" varchar(200) COLLATE "default" NOT NULL,
"description" varchar(250) COLLATE "default",
"next_fire_time" int8,
"prev_fire_time" int8,
"priority" int4,
"trigger_state" varchar(16) COLLATE "default" NOT NULL,
"trigger_type" varchar(8) COLLATE "default" NOT NULL,
"start_time" int8 NOT NULL,
"end_time" int8,
"calendar_name" varchar(200) COLLATE "default",
"misfire_instr" int2,
"job_data" bytea
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for sms_message
-- ----------------------------
DROP TABLE IF EXISTS "public"."sms_message";
CREATE TABLE "public"."sms_message" (
"id" int8 NOT NULL,
"content" varchar(200) COLLATE "default",
"mobile" varchar(11) COLLATE "default",
"rec_status" varchar(40) COLLATE "default",
"return_msg" varchar(200) COLLATE "default",
"smsid" varchar(40) COLLATE "default",
"create_time" timestamp(6),
"update_time" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for t_trade
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_trade";
CREATE TABLE "public"."t_trade" (
"id" int8 NOT NULL,
"trade_no" varchar(20) COLLATE "default",
"fee" numeric(18,4),
"type" char(1) COLLATE "default",
"trade_status" char(1) COLLATE "default",
"confirm_status" char(1) COLLATE "default",
"trade_time" timestamp(6),
"create_time" timestamp(6),
"update_time" timestamp(6),
"delete_time" timestamp(6),
"cust_id" varchar(30) COLLATE "default",
"bank_card_no" varchar(40) COLLATE "default",
"bank_name" varchar(50) COLLATE "default",
"pay_status" varchar(1) COLLATE "default",
"trade_amount" numeric(18,4),
"product_code" varchar(8) COLLATE "default",
"product_name" varchar(100) COLLATE "default",
"product_price" numeric(18,4),
"quantity" int4,
"holdcapital_id" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."t_trade" IS '交易表';
COMMENT ON COLUMN "public"."t_trade"."id" IS '交易主键';
COMMENT ON COLUMN "public"."t_trade"."trade_no" IS '交易流水号';
COMMENT ON COLUMN "public"."t_trade"."fee" IS '手续费';
COMMENT ON COLUMN "public"."t_trade"."type" IS '1:申购 2:赎回 3:分红';
COMMENT ON COLUMN "public"."t_trade"."trade_status" IS '1：存/取钱中、2：存/取钱成功、3：存/取失败【失败原因】';
COMMENT ON COLUMN "public"."t_trade"."confirm_status" IS '0-不需发送；1-待确认；2-待确认；3-部分确认；4-确认完成；5-确认失败';
COMMENT ON COLUMN "public"."t_trade"."trade_time" IS '下单时间';
COMMENT ON COLUMN "public"."t_trade"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."t_trade"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."t_trade"."delete_time" IS '删除时间';
COMMENT ON COLUMN "public"."t_trade"."cust_id" IS '客户号';
COMMENT ON COLUMN "public"."t_trade"."bank_card_no" IS '银行卡号';
COMMENT ON COLUMN "public"."t_trade"."bank_name" IS '银行名称';
COMMENT ON COLUMN "public"."t_trade"."trade_amount" IS '申赎金额';
COMMENT ON COLUMN "public"."t_trade"."product_code" IS '产品编码';
COMMENT ON COLUMN "public"."t_trade"."product_name" IS '产品名称';
COMMENT ON COLUMN "public"."t_trade"."product_price" IS '产品单价';
COMMENT ON COLUMN "public"."t_trade"."quantity" IS '数量';

/*==============================================================*/
/* Table: P_fund_company                                        */
/*==============================================================*/

CREATE TABLE P_FUND_COMPANY
(
   ID                   BIGINT                         NOT NULL,
   COMPANY_NAME         VARCHAR(50)                    NULL,
   COMPANY_CODE         VARCHAR(20)                    NULL,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* TABLE: C_SUPPLIER                                            */
/*==============================================================*/
DROP TABLE IF EXISTS C_SUPPLIER;
CREATE TABLE C_SUPPLIER
(
   ID                   BIGINT                         NOT NULL,
   SUPPLIER_CODE       VARCHAR(50)                    NULL,
   SUPPLIER_TYPE        VARCHAR(50)                    NULL,
   MERCHANT_NAME        VARCHAR(100)                   NULL,
   DISPLAY_NAME         VARCHAR(50)                    NULL,
   BELONG_ADDRESS       VARCHAR(200)                   NULL,
   CONTACT_CALLNO       VARCHAR(15)                    NULL,
   CORPORATE_PROPERTY   VARCHAR(20)                    NULL,
   WEBSITE_ADDRESS      VARCHAR(50)                    NULL,
   MERCHANT_INTRODUCTION VARCHAR(200)                   NULL,
   REG_CAPITAL          DECIMAL(18,4)                  NULL,
   PAID_UP_CAPITAL      DECIMAL(18,4)                  NULL,
   REG_PROV             VARCHAR(10)                    NULL,
   REG_CITY             VARCHAR(10)                    NULL,
   REG_ADDRESS          VARCHAR(100)                   NULL,
   CREATE_TIME          TIMESTAMP                      NULL,
   UPDATE_TIME          TIMESTAMP                      NULL,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: F_ACTIVITY                                            */
/*==============================================================*/
DROP TABLE IF EXISTS F_ACTIVITY;
create table F_ACTIVITY (
   ID                   INT8                 not null,
   STATUS               VARCHAR(6)           null,
   TITLE                VARCHAR(700)         null,
   BEGIN_TIME           DATE                 null,
   END_TIME             DATE                 null,
   IMAGE                VARCHAR(300)         null,
   URL                  VARCHAR(300)         null,
   APP_ID               VARCHAR(16)          null,
   CLICK_TIME           INT8                 null,
   TYPE                 VARCHAR(10)          null,
   STYLE                VARCHAR(5)           null,
   CREATE_TIME          TIMESTAMP            null,
   UPDATE_TIME          TIMESTAMP            null,
   CREATE_BY            VARCHAR(30)          null,
   UPDATE_BY            VARCHAR(30)          null,
   constraint PK_F_ACTIVITY primary key (ID)
);

comment on column F_ACTIVITY.ID is
'主键';

comment on column F_ACTIVITY.STATUS is
'N表示正常   F表示禁用';

comment on column F_ACTIVITY.TITLE is
'活动标题';

comment on column F_ACTIVITY.BEGIN_TIME is
'活动开始时间';

comment on column F_ACTIVITY.END_TIME is
'活动结束时间';

comment on column F_ACTIVITY.IMAGE is
'活动图片';

comment on column F_ACTIVITY.URL is
'HTML5路径';

comment on column F_ACTIVITY.APP_ID is
'投放产品ID';

comment on column F_ACTIVITY.CLICK_TIME is
'点击次数';

comment on column F_ACTIVITY.TYPE is
'活动类型';

comment on column F_ACTIVITY.STYLE is
'活动形式';

comment on column F_ACTIVITY.CREATE_TIME is
'创建时间';

comment on column F_ACTIVITY.UPDATE_TIME is
'修改时间';

comment on column F_ACTIVITY.CREATE_BY is
'创建人';

comment on column F_ACTIVITY.UPDATE_BY is
'修改人';


-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table c_bank
-- ----------------------------
ALTER TABLE "public"."c_bank" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table c_bank_card
-- ----------------------------
ALTER TABLE "public"."c_bank_card" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table c_customer
-- ----------------------------
ALTER TABLE "public"."c_customer" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table c_customer_gesture
-- ----------------------------
ALTER TABLE "public"."c_customer_gesture" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table c_customer_session
-- ----------------------------
ALTER TABLE "public"."c_customer_session" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table c_customer_verify_code
-- ----------------------------
ALTER TABLE "public"."c_customer_verify_code" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table c_feedback
-- ----------------------------
ALTER TABLE "public"."c_feedback" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table c_login_history
-- ----------------------------
ALTER TABLE "public"."c_login_history" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table c_open_account_pact
-- ----------------------------
ALTER TABLE "public"."c_open_account_pact" ADD PRIMARY KEY ("agreement_no");

-- ----------------------------
-- Primary Key structure for table dict
-- ----------------------------
ALTER TABLE "public"."dict" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table f_acct_chang_flow
-- ----------------------------
ALTER TABLE "public"."f_acct_chang_flow" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table f_basic_account
-- ----------------------------
ALTER TABLE "public"."f_basic_account" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table f_fund_agreement
-- ----------------------------
ALTER TABLE "public"."f_fund_agreement" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table f_holdcapital
-- ----------------------------
ALTER TABLE "public"."f_holdcapital" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table f_sub_account
-- ----------------------------
ALTER TABLE "public"."f_sub_account" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table f_subject
-- ----------------------------
ALTER TABLE "public"."f_subject" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table m_logging_event
-- ----------------------------
ALTER TABLE "public"."m_logging_event" ADD PRIMARY KEY ("log_event_id");

-- ----------------------------
-- Primary Key structure for table m_logging_event_exception
-- ----------------------------
ALTER TABLE "public"."m_logging_event_exception" ADD PRIMARY KEY ("log_event_id");

-- ----------------------------
-- Primary Key structure for table m_logging_event_property
-- ----------------------------
ALTER TABLE "public"."m_logging_event_property" ADD PRIMARY KEY ("log_event_id");

-- ----------------------------
-- Primary Key structure for table p_fund
-- ----------------------------
ALTER TABLE "public"."p_fund" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table p_fund_history
-- ----------------------------
ALTER TABLE "public"."p_fund_history" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table p_prd_type
-- ----------------------------
ALTER TABLE "public"."p_prd_type" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table p_product_manage
-- ----------------------------
ALTER TABLE "public"."p_product_manage" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table p_product_recommend
-- ----------------------------
ALTER TABLE "public"."p_product_recommend" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table parameter
-- ----------------------------
ALTER TABLE "public"."parameter" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table prd_account_config
-- ----------------------------
ALTER TABLE "public"."prd_account_config" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table qrtz_blob_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_blob_triggers" ADD PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_calendars
-- ----------------------------
ALTER TABLE "public"."qrtz_calendars" ADD PRIMARY KEY ("sched_name", "calendar_name");

-- ----------------------------
-- Primary Key structure for table qrtz_cron_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_cron_triggers" ADD PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Indexes structure for table qrtz_fired_triggers
-- ----------------------------
CREATE INDEX "idx_qrtz_ft_inst_job_req_rcvry" ON "public"."qrtz_fired_triggers" USING btree (sched_name, instance_name, requests_recovery);
CREATE INDEX "idx_qrtz_ft_j_g" ON "public"."qrtz_fired_triggers" USING btree (sched_name, job_name, job_group);
CREATE INDEX "idx_qrtz_ft_jg" ON "public"."qrtz_fired_triggers" USING btree (sched_name, job_group);
CREATE INDEX "idx_qrtz_ft_t_g" ON "public"."qrtz_fired_triggers" USING btree (sched_name, trigger_name, trigger_group);
CREATE INDEX "idx_qrtz_ft_tg" ON "public"."qrtz_fired_triggers" USING btree (sched_name, trigger_group);
CREATE INDEX "idx_qrtz_ft_trig_inst_name" ON "public"."qrtz_fired_triggers" USING btree (sched_name, instance_name);

-- ----------------------------
-- Primary Key structure for table qrtz_fired_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_fired_triggers" ADD PRIMARY KEY ("sched_name", "entry_id");

-- ----------------------------
-- Indexes structure for table qrtz_job_details
-- ----------------------------
CREATE INDEX "idx_qrtz_j_grp" ON "public"."qrtz_job_details" USING btree (sched_name, job_group);
CREATE INDEX "idx_qrtz_j_req_recovery" ON "public"."qrtz_job_details" USING btree (sched_name, requests_recovery);

-- ----------------------------
-- Primary Key structure for table qrtz_job_details
-- ----------------------------
ALTER TABLE "public"."qrtz_job_details" ADD PRIMARY KEY ("sched_name", "job_name", "job_group");

-- ----------------------------
-- Primary Key structure for table qrtz_locks
-- ----------------------------
ALTER TABLE "public"."qrtz_locks" ADD PRIMARY KEY ("sched_name", "lock_name");

-- ----------------------------
-- Primary Key structure for table qrtz_paused_trigger_grps
-- ----------------------------
ALTER TABLE "public"."qrtz_paused_trigger_grps" ADD PRIMARY KEY ("sched_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_scheduler_state
-- ----------------------------
ALTER TABLE "public"."qrtz_scheduler_state" ADD PRIMARY KEY ("sched_name", "instance_name");

-- ----------------------------
-- Primary Key structure for table qrtz_simple_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_simple_triggers" ADD PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table qrtz_simprop_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_simprop_triggers" ADD PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Indexes structure for table qrtz_triggers
-- ----------------------------
CREATE INDEX "idx_qrtz_t_c" ON "public"."qrtz_triggers" USING btree (sched_name, calendar_name);
CREATE INDEX "idx_qrtz_t_g" ON "public"."qrtz_triggers" USING btree (sched_name, trigger_group);
CREATE INDEX "idx_qrtz_t_j" ON "public"."qrtz_triggers" USING btree (sched_name, job_name, job_group);
CREATE INDEX "idx_qrtz_t_jg" ON "public"."qrtz_triggers" USING btree (sched_name, job_group);
CREATE INDEX "idx_qrtz_t_n_g_state" ON "public"."qrtz_triggers" USING btree (sched_name, trigger_group, trigger_state);
CREATE INDEX "idx_qrtz_t_n_state" ON "public"."qrtz_triggers" USING btree (sched_name, trigger_name, trigger_group, trigger_state);
CREATE INDEX "idx_qrtz_t_next_fire_time" ON "public"."qrtz_triggers" USING btree (sched_name, next_fire_time);
CREATE INDEX "idx_qrtz_t_nft_misfire" ON "public"."qrtz_triggers" USING btree (sched_name, misfire_instr, next_fire_time);
CREATE INDEX "idx_qrtz_t_nft_st" ON "public"."qrtz_triggers" USING btree (sched_name, trigger_state, next_fire_time);
CREATE INDEX "idx_qrtz_t_nft_st_misfire" ON "public"."qrtz_triggers" USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);
CREATE INDEX "idx_qrtz_t_nft_st_misfire_grp" ON "public"."qrtz_triggers" USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);
CREATE INDEX "idx_qrtz_t_state" ON "public"."qrtz_triggers" USING btree (sched_name, trigger_state);

-- ----------------------------
-- Primary Key structure for table qrtz_triggers
-- ----------------------------
ALTER TABLE "public"."qrtz_triggers" ADD PRIMARY KEY ("sched_name", "trigger_name", "trigger_group");

-- ----------------------------
-- Primary Key structure for table sms_message
-- ----------------------------
ALTER TABLE "public"."sms_message" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_trade
-- ----------------------------
ALTER TABLE "public"."t_trade" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."qrtz_blob_triggers"
-- ----------------------------
ALTER TABLE "public"."qrtz_blob_triggers" ADD FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "public"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."qrtz_cron_triggers"
-- ----------------------------
ALTER TABLE "public"."qrtz_cron_triggers" ADD FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "public"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."qrtz_simple_triggers"
-- ----------------------------
ALTER TABLE "public"."qrtz_simple_triggers" ADD FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "public"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."qrtz_simprop_triggers"
-- ----------------------------
ALTER TABLE "public"."qrtz_simprop_triggers" ADD FOREIGN KEY ("sched_name", "trigger_name", "trigger_group") REFERENCES "public"."qrtz_triggers" ("sched_name", "trigger_name", "trigger_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."qrtz_triggers"
-- ----------------------------
ALTER TABLE "public"."qrtz_triggers" ADD FOREIGN KEY ("sched_name", "job_name", "job_group") REFERENCES "public"."qrtz_job_details" ("sched_name", "job_name", "job_group") ON DELETE NO ACTION ON UPDATE NO ACTION;