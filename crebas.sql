/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/2/23 10:49:28                           */
/*==============================================================*/


drop table if exists account;

drop table if exists account_level;

drop table if exists action_join_role;

drop table if exists ad;

drop table if exists ad_join_position;

drop table if exists ad_page_position;

drop table if exists ad_position;

drop table if exists admin;

drop table if exists admin_action;

drop table if exists admin_action_group;

drop table if exists admin_join_role;

drop table if exists admin_role;

drop table if exists behavior_type;

drop table if exists box;

drop table if exists box_type;

drop table if exists brand;

drop table if exists cart_info;

drop table if exists cash_record;

drop table if exists category;

drop table if exists children;

drop table if exists comment;

drop table if exists comment_detail;

drop table if exists comment_item;

drop table if exists comment_level;

drop table if exists comment_product;

drop table if exists comment_statistics;

drop table if exists consume_record;

drop table if exists content;

drop table if exists content_type;

drop table if exists coupon;

drop table if exists coupon_code;

drop table if exists coupon_history;

drop table if exists coupon_record;

drop table if exists coupon_type;

drop table if exists credit_level;

drop table if exists delivery_address;

drop table if exists delivery_time;

drop table if exists delivery_type;

drop table if exists department;

drop table if exists email_template;

drop table if exists float_icon;

drop table if exists freight_template;

drop table if exists group_condition;

drop table if exists group_sub;

drop table if exists interaction;

drop table if exists interaction_type;

drop table if exists invoice_type;

drop table if exists keyword_prompt;

drop table if exists layout;

drop table if exists layout_join_box;

drop table if exists log_account;

drop table if exists log_admin;

drop table if exists log_cart_order;

drop table if exists log_payment;

drop table if exists log_product;

drop table if exists menu_item;

drop table if exists meta_template;

drop table if exists notice;

drop table if exists notice_type;

drop table if exists notice_type_join_template;

drop table if exists order_delivery;

drop table if exists order_detail;

drop table if exists order_info;

drop table if exists order_preferences;

drop table if exists order_return;

drop table if exists order_return_detail;

drop table if exists order_source;

drop table if exists order_status_customer;

drop table if exists order_status_system;

drop table if exists page;

drop table if exists pay;

drop table if exists pay_type;

drop table if exists picture;

drop table if exists picture_resource;

drop table if exists picture_resource_type;

drop table if exists placeholder;

drop table if exists product;

drop table if exists product_filter;

drop table if exists product_focus;

drop table if exists product_group;

drop table if exists product_order_by;

drop table if exists product_post;

drop table if exists product_post_picture;

drop table if exists product_story;

drop table if exists product_style;

drop table if exists product_type;

drop table if exists questionnaire;

drop table if exists questionnaire_item;

drop table if exists questionnaire_result;

drop table if exists questionnaire_statistics;

drop table if exists refund_type;

drop table if exists region;

drop table if exists return_reason;

drop table if exists return_status;

drop table if exists sale;

drop table if exists sale_join_rule;

drop table if exists sale_rule;

drop table if exists sale_type;

drop table if exists sale_type_join_rule;

drop table if exists sell_type;

drop table if exists shop;

drop table if exists shopping_cart;

drop table if exists sms_template;

drop table if exists supplier;

drop table if exists system_param;

drop table if exists user;

drop table if exists warehouse;

/*==============================================================*/
/* Table: account                                               */
/*==============================================================*/
create table account
(
   account_id           int not null comment '账户ID',
   user_id              int comment '用户ID',
   account_level_id     tinyint comment '账户等级ID',
   username             varchar(30) comment '登录名',
   password             varchar(40) comment '密码',
   consume_usable       int comment '可用消费',
   consume_upgrade      int comment '升级消费数',
   levels               int comment '消费等级',
   credit_level_id      tinyint comment '信用等级',
   is_employee          tinyint comment '是否内部员工',
   ip                   varchar(30) comment 'IP地址',
   add_time             datetime comment '添加时间',
   last_time            datetime comment '最后登录时间',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   source_from          varchar(10) comment '帐号来源',
   balance              double comment '现金账户余额',
   primary key (account_id)
);

alter table account comment '帐号来源标识出 是哪个平台过来的用户，比如QQ，新浪微博等。
';

/*==============================================================*/
/* Table: account_level                                         */
/*==============================================================*/
create table account_level
(
   account_level_id     tinyint not null comment '账户等级ID',
   name                 varchar(50) comment '名称',
   need_beans           int,
   beans_every_level    int,
   reduct_percent       double,
   consume_scale        varchar(10),
   free_frequency       tinyint,
   obtain_scale         varchar(10),
   picture_resource_id  int,
   add_time             datetime comment '添加时间',
   modify_time          datetime comment '最后修改时间',
   add_admin_id         int,
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   modify_admin_id      int comment '修改人',
   primary key (account_level_id)
);

alter table account_level comment '账户等级表';

/*==============================================================*/
/* Table: action_join_role                                      */
/*==============================================================*/
create table action_join_role
(
   action_join_role_id  int not null,
   admin_role_id        int,
   admin_action_id      int,
   primary key (action_join_role_id)
);

alter table action_join_role comment '角色权限关联表';

/*==============================================================*/
/* Table: ad                                                    */
/*==============================================================*/
create table ad
(
   ad_id                int not null comment '广告ID',
   name                 varchar(50) comment '名称',
   picture_url          varchar(100),
   link_url             varchar(100) comment '链接地址',
   width                int,
   height               int,
   countdown_time       datetime comment '倒计时',
   description          varchar(50) comment '描述',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   priority             int comment '优先级',
   primary key (ad_id)
);

alter table ad comment '广告资源表
这里的描述主要是，如果图片alt事件时候的提示内容';

/*==============================================================*/
/* Table: ad_join_position                                      */
/*==============================================================*/
create table ad_join_position
(
   ad_join_position_id  int not null,
   ad_id                int comment '广告ID',
   ad_page_position_id  int,
   primary key (ad_join_position_id)
);

alter table ad_join_position comment '广告与位置关联表
关联具体的位置放置什么具体的广告，两列为联合主键
如果某个位置可能出现多个广告';

/*==============================================================*/
/* Table: ad_page_position                                      */
/*==============================================================*/
create table ad_page_position
(
   ad_page_position_id  int not null,
   name                 varchar(50) comment '名称',
   page_id              int comment '页面ID',
   ad_position_id       int comment '广告位置ID',
   ad_key               varchar(20) comment '条件名',
   ad_key_code          varchar(20) comment '条件名代码',
   ad_value             varchar(20) comment '条件值',
   ad_value_code        varchar(20) comment '条件值代码',
   primary key (ad_page_position_id)
);

alter table ad_page_position comment '广告具体位置表
对广告的具体位置信息进行界定。
在哪个页面（按货架打开？ 按品牌打开..）的哪个';

/*==============================================================*/
/* Table: ad_position                                           */
/*==============================================================*/
create table ad_position
(
   ad_position_id       int not null comment '广告位置ID',
   name                 varchar(50) comment '名称',
   primary key (ad_position_id)
);

alter table ad_position comment '广告位置表';

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   admin_id             smallint not null comment '回复人',
   username             varchar(30) comment '登录名',
   password             varchar(40) comment '密码',
   name                 varchar(50) comment '名称',
   is_sys               tinyint comment '是否超级用户',
   telephone            varchar(20) comment '固定电话',
   mobile               varchar(20) comment '手机',
   description          varchar(50) comment '描述',
   email                varchar(30) comment '邮箱',
   department_id        tinyint,
   position             varchar(30) comment '撰写人职位',
   login_time           datetime comment '最后登录时间',
   add_time             datetime comment '添加时间',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (admin_id)
);

alter table admin comment '后台账户表';

/*==============================================================*/
/* Table: admin_action                                          */
/*==============================================================*/
create table admin_action
(
   admin_action_id      int not null,
   name                 varchar(50) comment '名称',
   description          varchar(50) comment '描述',
   admin_action_group_id tinyint comment '权限组ID',
   action_type          tinyint,
   resource_url         varchar(100),
   priority             int comment '优先级',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   add_time             datetime comment '添加时间',
   modify_time          datetime comment '最后修改时间',
   modify_admin_id      int comment '修改人',
   primary key (admin_action_id)
);

alter table admin_action comment '权限表';

/*==============================================================*/
/* Table: admin_action_group                                    */
/*==============================================================*/
create table admin_action_group
(
   admin_action_group_id tinyint not null comment '权限组ID',
   name                 varchar(50) comment '名称',
   primary key (admin_action_group_id)
);

alter table admin_action_group comment '权限组表
标识哪些权限同属于一个组下面的。比如组可以分模块来划分，便于前台显示。
如可划分为，商';

/*==============================================================*/
/* Table: admin_join_role                                       */
/*==============================================================*/
create table admin_join_role
(
   admin_join_role_id   int not null,
   admin_id             smallint comment '回复人',
   admin_role_id        int,
   primary key (admin_join_role_id)
);

alter table admin_join_role comment '用户角色关联表';

/*==============================================================*/
/* Table: admin_role                                            */
/*==============================================================*/
create table admin_role
(
   admin_role_id        int not null,
   name                 varchar(50) comment '名称',
   role_code            varchar(50) comment '角色代码',
   primary key (admin_role_id)
);

alter table admin_role comment '角色表';

/*==============================================================*/
/* Table: behavior_type                                         */
/*==============================================================*/
create table behavior_type
(
   behavior_type_id     tinyint not null comment '动作类型ID',
   name                 varchar(50) comment '名称',
   primary key (behavior_type_id)
);

alter table behavior_type comment '动作类型表
该表主要为：现金账户记录、券记录中的收入和支出服务。
比如：原因录入：下订单    ';

/*==============================================================*/
/* Table: box                                                   */
/*==============================================================*/
create table box
(
   box_id               int not null,
   name                 varchar(50) comment '名称',
   show_text            varchar(100) comment '显示文字',
   box_type_id          int comment '盒子类别ID',
   file_name            varchar(30) comment '文件名',
   add_time             datetime comment '添加时间',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   order_by             int comment '排序',
   is_hidden_no_data    tinyint comment '无数据是否自动隐藏',
   primary key (box_id)
);

alter table box comment '盒子表
文件名：表示该盒子对应了哪个的ftl模板文件。';

/*==============================================================*/
/* Table: box_type                                              */
/*==============================================================*/
create table box_type
(
   box_type_id          int not null comment '盒子类别ID',
   name                 varchar(50) comment '名称',
   width                int,
   height               int,
   number_of_row        tinyint comment '每行显示个数',
   max_row              tinyint comment '最大显示行数',
   add_time             datetime comment '添加时间',
   primary key (box_type_id)
);

alter table box_type comment '盒子类别表';

/*==============================================================*/
/* Table: brand                                                 */
/*==============================================================*/
create table brand
(
   brand_id             tinyint not null comment '品牌,品牌表主键',
   name                 varchar(50) comment '名称',
   primary key (brand_id)
);

alter table brand comment '品牌表';

/*==============================================================*/
/* Table: cart_info                                             */
/*==============================================================*/
create table cart_info
(
   cart_info_id         bigint not null,
   shopping_cart_id     bigint,
   product_id           int comment '商品ID',
   color_id             int,
   size_id              int,
   quantity             smallint,
   primary key (cart_info_id)
);

alter table cart_info comment '购物车子表';

/*==============================================================*/
/* Table: cash_record                                           */
/*==============================================================*/
create table cash_record
(
   cash_record_id       int not null comment '现金账户记录ID',
   account_id           int comment '账户ID',
   before_money         double comment '之前金额',
   after_money          double comment '之后金额',
   tx_money             double comment '本次金额',
   frozen_money         double comment '冻结金额,已发货后解除冻结',
   tx_type              tinyint comment '收入/支出,0:收入 1:支出',
   behavior_type_id     tinyint comment '动作类型ID',
   tx_result            varchar(30) comment '附加信息,收入或支出动作导致的结果',
   add_time             datetime comment '添加时间',
   aux_info             varchar(30) comment '辅助说明',
   primary key (cash_record_id)
);

alter table cash_record comment '现金账户记录表';

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
   category_id          smallint not null comment '品类,品类表主键',
   name                 varchar(50) comment '名称',
   primary key (category_id)
);

alter table category comment '品类表';

/*==============================================================*/
/* Table: children                                              */
/*==============================================================*/
create table children
(
   children_id          int not null,
   user_id              int comment '用户ID',
   name                 varchar(50) comment '名称',
   height               varchar(10) comment '身高',
   hobby                varchar(30) comment '喜好',
   birthday             datetime comment '生日',
   sex                  varchar(4) comment '性别,男、女、中性',
   personality          varchar(20) comment '个性',
   weight               varchar(20) comment '体重',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   add_time             datetime comment '添加时间',
   modify_time          datetime comment '最后修改时间',
   primary key (children_id)
);

alter table children comment '宝贝信息与用户多对一关联，一个用户可以拥有多条宝贝信息
身高体重之类随年龄变大肯定不一样，所以根据添加时间来';

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   comment_id           bigint not null,
   order_detail_id      int,
   stock_id             int comment '库存表ID',
   account_id           int comment '账户ID',
   title                varchar(30),
   content              varchar(50),
   parent_id            int comment '回复',
   useful               int,
   useless              int,
   score_avg            double comment '平均评分',
   add_time             datetime comment '添加时间',
   admin_id             smallint comment '回复人',
   review_result        varchar(30) comment '审核结果说明',
   review_status        tinyint comment '审核状态,0未审核 1已通过 2未通过',
   review_time          datetime comment '审核时间',
   primary key (comment_id)
);

alter table comment comment '评论表
平均评分有小数的概念，平均评分计算时候，以0.1-0.5之间按0.5算  0.5-1之间 按1算
                            ';

/*==============================================================*/
/* Table: comment_detail                                        */
/*==============================================================*/
create table comment_detail
(
   comment_detail_id    bigint not null,
   comment_id           bigint,
   item_name_id         int comment '打分项,comment_item表ID',
   item_value_id        int comment '答案,comment_item表ID',
   score                double comment '分数值',
   add_time             datetime comment '添加时间',
   primary key (comment_detail_id)
);

alter table comment_detail comment '评论打分结果详细表';

/*==============================================================*/
/* Table: comment_item                                          */
/*==============================================================*/
create table comment_item
(
   comment_item_id      int not null,
   product_type_id      tinyint comment '商品类型,商品类型表主键',
   item_name            varchar(30),
   parent_id            int comment '回复',
   score                double comment '分数值',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (comment_item_id)
);

alter table comment_item comment '评论打分项表
记录每个商品类别（童鞋、童装、玩具…）的不同的打分类项和打分子项
商品属性ID：查';

/*==============================================================*/
/* Table: comment_level                                         */
/*==============================================================*/
create table comment_level
(
   comment_level_id     tinyint not null,
   name                 varchar(50) comment '名称',
   star_from            double comment '从多少分',
   star_to              double comment '到多少分',
   primary key (comment_level_id)
);

alter table comment_level comment '评论级别表';

/*==============================================================*/
/* Table: comment_product                                       */
/*==============================================================*/
create table comment_product
(
   comment_product_id   int not null,
   product_id           int comment '商品ID',
   comment_level_id     tinyint,
   times                int comment '打分次数',
   rate                 double comment '百分比,各项占该层的百分比',
   primary key (comment_product_id)
);

alter table comment_product comment '评论汇总表-单款商品';

/*==============================================================*/
/* Table: comment_statistics                                    */
/*==============================================================*/
create table comment_statistics
(
   comment_statistics_id int not null,
   product_id           int comment '商品ID',
   item_name_id         int comment '打分项,comment_item表ID',
   item_value_id        int comment '答案,comment_item表ID',
   times                int comment '打分次数',
   score_avg            double comment '平均评分',
   total_score          double comment '总评分',
   rate                 double comment '百分比,各项占该层的百分比',
   primary key (comment_statistics_id)
);

alter table comment_statistics comment '评论结果统计表
如果打分项ID为Null时，则为大类别统计项，统计该大类别的总评论数和总平均评分
                                       -&#&';

/*==============================================================*/
/* Table: consume_record                                        */
/*==============================================================*/
create table consume_record
(
   consume_record_id    int not null,
   account_id           int comment '账户ID',
   consume_before       int comment '消费之前',
   tx                   int comment '本次消费',
   frozen               int comment '冻结',
   after                int comment '消费之后',
   tx_type              tinyint comment '收入/支出,0:收入 1:支出',
   behavior_type_id     tinyint comment '动作类型ID',
   tx_result            varchar(30) comment '附加信息,收入或支出动作导致的结果',
   add_time             datetime comment '添加时间',
   aux_info             varchar(30) comment '辅助说明',
   primary key (consume_record_id)
);

alter table consume_record comment '消费记录表';

/*==============================================================*/
/* Table: content                                               */
/*==============================================================*/
create table content
(
   content_id           int not null,
   content_type_id      tinyint,
   first_title          varchar(30) comment '主标题',
   second_title         varchar(30) comment '副标题',
   content              varchar(50),
   order_by             int comment '排序',
   added_by             varchar(20) comment '撰写人',
   position             varchar(30) comment '撰写人职位',
   employer             varchar(30) comment '撰写人单位',
   add_time             datetime comment '添加时间',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (content_id)
);

alter table content comment '内容表';

/*==============================================================*/
/* Table: content_type                                          */
/*==============================================================*/
create table content_type
(
   content_type_id      tinyint not null,
   name                 varchar(50) comment '名称',
   primary key (content_type_id)
);

alter table content_type comment '内容类型表';

/*==============================================================*/
/* Table: coupon                                                */
/*==============================================================*/
create table coupon
(
   coupon_id            int not null,
   name                 varchar(50) comment '名称',
   coupon_type_id       smallint,
   face_value           double,
   description          varchar(50) comment '描述',
   delay_day            tinyint comment '延迟天数',
   is_free              tinyint comment '是否免运费',
   is_reuse             tinyint comment '能否重复使用',
   enough_money         double comment '满多少钱',
   discount             double comment '优惠金额',
   include_group        varchar(30) comment '包含商品群组',
   exclude_group        varchar(30) comment '排除商品群组',
   begin_time           datetime comment '开始时间',
   end_time             datetime comment '结束时间',
   add_time             datetime comment '添加时间',
   modify_time          datetime comment '最后修改时间',
   admin_id             smallint comment '回复人',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (coupon_id)
);

alter table coupon comment '券主表
如果折扣字段字段值不等于1，则会覆盖面值，然后折扣起作用
能否重复使用：标识该券是否可以';

/*==============================================================*/
/* Table: coupon_code                                           */
/*==============================================================*/
create table coupon_code
(
   coupon_code_id       int not null comment '券ID',
   account_id           int comment '账户ID',
   add_time             datetime comment '添加时间',
   code                 varchar(20) comment '编号',
   coupon_id            int,
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   password             varchar(40) comment '密码',
   is_used              tinyint comment '是否使用过,0: 已使用1:未使用',
   primary key (coupon_code_id)
);

alter table coupon_code comment '券明细表
券定义：16位的数字和大写字母组成。排除0 O两个字符';

/*==============================================================*/
/* Table: coupon_history                                        */
/*==============================================================*/
create table coupon_history
(
   coupon_history_id    int not null,
   code                 varchar(20) comment '编号',
   tx_behavior          varchar(30) comment '行为或结果',
   account_id           int comment '账户ID',
   is_send_used         tinyint comment '发券/用券',
   add_time             datetime comment '添加时间',
   primary key (coupon_history_id)
);

alter table coupon_history comment '券记录表
含发券和用券两种记录
行为或结果：存储发券时候的渠道和用券时候的单号';

/*==============================================================*/
/* Table: coupon_record                                         */
/*==============================================================*/
create table coupon_record
(
   coupon_record_id     int not null,
   account_id           int comment '账户ID',
   coupon_code_id       int comment '券ID',
   tx_type              tinyint comment '收入/支出,0:收入 1:支出',
   behavior_type_id     tinyint comment '动作类型ID',
   tx_result            varchar(30) comment '附加信息,收入或支出动作导致的结果',
   add_time             datetime comment '添加时间',
   aux_info             varchar(30) comment '辅助说明',
   primary key (coupon_record_id)
);

alter table coupon_record comment '券记录表';

/*==============================================================*/
/* Table: coupon_type                                           */
/*==============================================================*/
create table coupon_type
(
   coupon_type_id       smallint not null,
   name                 varchar(50) comment '名称',
   primary key (coupon_type_id)
);

alter table coupon_type comment '券类型表
红包、现金券、免运费券、折扣券、减运费卷';

/*==============================================================*/
/* Table: credit_level                                          */
/*==============================================================*/
create table credit_level
(
   name                 varchar(50) comment '名称',
   credit_level_id      tinyint not null comment '信用等级',
   primary key (credit_level_id)
);

alter table credit_level comment '信用等级表
代码表
先划分为五个等级：良好、较好、一般、较差、差
信用等级差的用户，';

/*==============================================================*/
/* Table: delivery_address                                      */
/*==============================================================*/
create table delivery_address
(
   delivery_address_id  int not null comment 'ID',
   account_id           int comment '账户ID',
   region_province_id   int comment '省份',
   region_city_id       int comment '城市',
   region_country_id    int comment '区县',
   consignee            varchar(10) comment '收货人',
   address              varchar(50) comment '住址',
   mobile               varchar(20) comment '手机',
   telephone            varchar(20) comment '固定电话',
   email                varchar(30) comment '邮箱',
   post_code            varchar(10) comment '邮编',
   add_time             datetime comment '添加时间',
   is_default           tinyint comment '默认使用',
   primary key (delivery_address_id)
);

alter table delivery_address comment '配送地址表';

/*==============================================================*/
/* Table: delivery_time                                         */
/*==============================================================*/
create table delivery_time
(
   delivery_time_id     tinyint comment '配送时间ID',
   name                 varchar(50) comment '名称'
);

alter table delivery_time comment '配送时间表';

/*==============================================================*/
/* Table: delivery_type                                         */
/*==============================================================*/
create table delivery_type
(
   delivery_type_id     tinyint comment '配送方式ID',
   name                 varchar(50) comment '名称'
);

alter table delivery_type comment '配送方式表';

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department
(
   department_id        tinyint not null,
   name                 varchar(50) comment '名称',
   primary key (department_id)
);

alter table department comment '部门表';

/*==============================================================*/
/* Table: email_template                                        */
/*==============================================================*/
create table email_template
(
   email_template_id    smallint not null comment '邮件模板',
   add_time             datetime comment '添加时间',
   content              varchar(50),
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   name                 varchar(50) comment '名称',
   title                varchar(30),
   primary key (email_template_id)
);

alter table email_template comment '邮件模板表
模板内容支持占位符${oid},${name}等';

/*==============================================================*/
/* Table: float_icon                                            */
/*==============================================================*/
create table float_icon
(
   float_icon_id        int not null,
   product_group_id     int comment '群组ID',
   picture_angle        tinyint comment '图片四角',
   picture_resource_id  int,
   icon_text            varchar(10),
   priority             int comment '优先级',
   description          varchar(50) comment '描述',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (float_icon_id)
);

alter table float_icon comment '浮动图标表
列表页面或者搜索页面的悬浮图标、或单品页面促销活动标识
左上角：促销活动
                               -&#&';

/*==============================================================*/
/* Table: freight_template                                      */
/*==============================================================*/
create table freight_template
(
   freight_template_id  int not null,
   name                 varchar(50) comment '名称',
   region_id            int comment '省市县ID',
   delivery_type_id     tinyint comment '配送方式ID',
   pay_id               tinyint comment '支付方式ID',
   remark               varchar(200) comment '备注',
   initial_weight_freight double comment '首重运费',
   additional_weight_freight double comment '续重运费',
   is_cod               tinyint comment '是否支持到付,0:支持 1:不支持',
   min_eta              tinyint comment '最短到货时间',
   max_eta              tinyint comment '最长到货时间',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (freight_template_id)
);

alter table freight_template comment '运费模板表
注意：这里如果只设置父节点的ID的话，默认该父节点下的所有的值都一样。
如果既有父节';

/*==============================================================*/
/* Table: group_condition                                       */
/*==============================================================*/
create table group_condition
(
   group_condition_id   int not null,
   table_name           varchar(30),
   show_name            varchar(30),
   column_name          varchar(30),
   primary key (group_condition_id)
);

alter table group_condition comment '群组-商品条件表
定位群组中的商品条件的内容，主要体现这些条件中的key值是隶属于哪些表的哪些字段，然后可以';

/*==============================================================*/
/* Table: group_sub                                             */
/*==============================================================*/
create table group_sub
(
   group_sub_id         int not null,
   product_group_id     int comment '群组ID',
   product_id           int comment '商品ID',
   color_id             int,
   custom_price         double comment '自定义金额',
   primary key (group_sub_id)
);

alter table group_sub comment '群组子表';

/*==============================================================*/
/* Table: interaction                                           */
/*==============================================================*/
create table interaction
(
   interaction_id       int not null,
   account_id           int comment '账户ID',
   content              varchar(50),
   interaction_type_id  tinyint,
   parent_id            int comment '回复',
   useful               int,
   useless              int,
   add_time             datetime comment '添加时间',
   admin_id             smallint comment '回复人',
   review_time          datetime comment '审核时间',
   review_status        tinyint comment '审核状态,0未审核 1已通过 2未通过',
   review_result        varchar(30) comment '审核结果说明',
   primary key (interaction_id)
);

alter table interaction comment '互动详细表';

/*==============================================================*/
/* Table: interaction_type                                      */
/*==============================================================*/
create table interaction_type
(
   interaction_type_id  tinyint not null,
   name                 varchar(50) comment '名称',
   primary key (interaction_type_id)
);

alter table interaction_type comment '互动分类表
互动分类有：咨询、问答等';

/*==============================================================*/
/* Table: invoice_type                                          */
/*==============================================================*/
create table invoice_type
(
   invoice_type_id      tinyint not null comment '发票类型ID',
   name                 varchar(50) comment '名称',
   primary key (invoice_type_id)
);

alter table invoice_type comment '发票类型表';

/*==============================================================*/
/* Table: keyword_prompt                                        */
/*==============================================================*/
create table keyword_prompt
(
   keyword_prompt_id    int not null,
   name                 varchar(50) comment '名称',
   order_by             int comment '排序',
   times                int comment '打分次数',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (keyword_prompt_id)
);

alter table keyword_prompt comment '搜索关键词表';

/*==============================================================*/
/* Table: layout                                                */
/*==============================================================*/
create table layout
(
   layout_id            int not null,
   name                 varchar(50) comment '名称',
   layout_type          tinyint comment '布局类型',
   order_type           tinyint comment '1:正常  2:退  3:退换',
   page_id              int comment '页面ID',
   add_time             datetime comment '添加时间',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (layout_id)
);

alter table layout comment '模板布局表
布局类型：左，右，左中，中右，左右，左中右，中
排序类型：横排/竖排';

/*==============================================================*/
/* Table: layout_join_box                                       */
/*==============================================================*/
create table layout_join_box
(
   layout_join_box_id   int not null,
   box_id               int,
   layout_id            int,
   primary key (layout_join_box_id)
);

alter table layout_join_box comment '模板布局-盒子关联表';

/*==============================================================*/
/* Table: log_account                                           */
/*==============================================================*/
create table log_account
(
   log_account_id       int not null,
   account_id           int comment '账户ID',
   from_ip              varchar(30) comment '来路IP地址',
   from_url             varchar(100) comment '来路URL',
   add_time             datetime comment '添加时间',
   to_page_content      varchar(100) comment '到达页面内容',
   to_page_name         varchar(50) comment '到达页面名称',
   primary key (log_account_id)
);

alter table log_account comment '账户日志表
日志范围：用户的个人账户中所有日志';

/*==============================================================*/
/* Table: log_admin                                             */
/*==============================================================*/
create table log_admin
(
   log_admin_id         int not null,
   admin_id             smallint comment '回复人',
   content              varchar(50),
   add_time             datetime comment '添加时间',
   primary key (log_admin_id)
);

alter table log_admin comment '后台系统操作日志表';

/*==============================================================*/
/* Table: log_cart_order                                        */
/*==============================================================*/
create table log_cart_order
(
   log_cart_order_id    int not null,
   account_id           int comment '账户ID',
   from_ip              varchar(30) comment '来路IP地址',
   from_url             varchar(100) comment '来路URL',
   to_page_content      varchar(100) comment '到达页面内容',
   to_page_name         varchar(50) comment '到达页面名称',
   add_time             datetime comment '添加时间',
   primary key (log_cart_order_id)
);

alter table log_cart_order comment '订单日志表
日志范围：购物车及下单操作日志';

/*==============================================================*/
/* Table: log_payment                                           */
/*==============================================================*/
create table log_payment
(
   log_payment_id       int not null,
   account_id           int comment '账户ID',
   from_ip              varchar(30) comment '来路IP地址',
   from_url             varchar(100) comment '来路URL',
   to_page_content      varchar(100) comment '到达页面内容',
   to_page_name         varchar(50) comment '到达页面名称',
   add_time             datetime comment '添加时间',
   primary key (log_payment_id)
);

alter table log_payment comment '支付结算日志表';

/*==============================================================*/
/* Table: log_product                                           */
/*==============================================================*/
create table log_product
(
   log_product_id       int not null,
   account_id           int comment '账户ID',
   from_ip              varchar(30) comment '来路IP地址',
   from_url             varchar(100) comment '来路URL',
   to_page_name         varchar(50) comment '到达页面名称',
   to_page_content      varchar(100) comment '到达页面内容',
   add_time             datetime comment '添加时间',
   primary key (log_product_id)
);

alter table log_product comment '商品日志表
日志范围：涉及商品范围的访问关键日志保存在这里。如：列表，搜索，单品，首页，促销页等
                                -&#&';

/*==============================================================*/
/* Table: menu_item                                             */
/*==============================================================*/
create table menu_item
(
   menu_item_id         int not null,
   name                 varchar(50) comment '名称',
   parent_id            int comment '回复',
   order_by             int comment '排序',
   link_url             varchar(100) comment '链接地址',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (menu_item_id)
);

alter table menu_item comment '菜单导航表';

/*==============================================================*/
/* Table: meta_template                                         */
/*==============================================================*/
create table meta_template
(
   meta_template_id     int not null,
   name                 varchar(50) comment '名称',
   title                varchar(30),
   keywords             varchar(50) comment '关键词,搜索用',
   description          varchar(50) comment '描述',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   add_time             datetime comment '添加时间',
   primary key (meta_template_id)
);

alter table meta_template comment 'META类型表
这里的位置URL，会采用自动匹配的方式，来描述页面的位置。
比如单品页面可能是 ';

/*==============================================================*/
/* Table: notice                                                */
/*==============================================================*/
create table notice
(
   notice_id            int not null,
   notice_type_id       tinyint comment '通知类型ID',
   account_id           int comment '账户ID',
   product_id           int comment '商品ID',
   color_id             int,
   content              varchar(50),
   add_time             datetime comment '添加时间',
   parent_id            int comment '回复',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   admin_id             smallint comment '回复人',
   primary key (notice_id)
);

alter table notice comment '通知表';

/*==============================================================*/
/* Table: notice_type                                           */
/*==============================================================*/
create table notice_type
(
   notice_type_id       tinyint not null comment '通知类型ID',
   name                 varchar(50) comment '名称',
   primary key (notice_type_id)
);

alter table notice_type comment '通知类型表';

/*==============================================================*/
/* Table: notice_type_join_template                             */
/*==============================================================*/
create table notice_type_join_template
(
   notice_type_join_template_id int not null,
   notice_type_id       tinyint comment '通知类型ID',
   sms_template_id      smallint comment '短信模板',
   email_template_id    smallint comment '邮件模板',
   primary key (notice_type_join_template_id)
);

alter table notice_type_join_template comment '通知类型-模板关联表';

/*==============================================================*/
/* Table: order_delivery                                        */
/*==============================================================*/
create table order_delivery
(
   order_delivery_id    int not null,
   order_info_id        int,
   oid                  varchar(30) comment '订单号',
   express_company      varchar(30) comment '快递公司',
   tracking_number      varchar(30) comment '快递单号',
   send_time            datetime comment '发货时间',
   initial_weight       double comment '首重',
   additional_weight    double comment '续重',
   remark               varchar(200) comment '备注',
   primary key (order_delivery_id)
);

alter table order_delivery comment '订单配送信息表';

/*==============================================================*/
/* Table: order_detail                                          */
/*==============================================================*/
create table order_detail
(
   order_detail_id      int not null,
   order_info_id        int,
   stock_id             int comment '库存表ID',
   oid                  varchar(30) comment '订单号',
   no                   varchar(20) comment '款号',
   suite_no             varchar(20),
   suite_name           varchar(20),
   name                 varchar(50) comment '名称',
   color                varchar(20),
   size                 varchar(20),
   quantity             smallint,
   subtotal             double comment '小计',
   market_price         double comment '市场价格',
   sale_price           double comment '销售价',
   deal_price           double comment '成交价',
   suite_price          double comment '套装价',
   suite_random         varchar(30) comment '区分套装',
   is_suite             tinyint comment '是否套装,0:非 1:是',
   discount_rate        double comment '折扣比例',
   warehouse_id         tinyint comment '仓库,仓库表主键',
   shop_id              tinyint comment '商店,商店表主键',
   is_posted            tinyint comment '是否已晒单,0:未晒单  1:已晒单',
   is_comment           tinyint comment '是否已评论,0:未评论 1:已评论',
   is_gift              tinyint comment '是否为赠品,0:非 1:是',
   primary key (order_detail_id)
);

alter table order_detail comment '订单子项表-客服';

/*==============================================================*/
/* Table: order_info                                            */
/*==============================================================*/
create table order_info
(
   order_info_id        int not null,
   oid                  varchar(30) comment '订单号',
   relate_oid           varchar(30) comment '关联单号',
   amount_payable       double comment '应付金额',
   amount_paid          double comment '已付金额',
   sale_price_total     double comment '销售价总额',
   account_id           int comment '账户ID',
   consignee            varchar(10) comment '收货人',
   mobile               varchar(20) comment '手机',
   address              varchar(50) comment '住址',
   delivery_time_id     tinyint comment '配送时间ID',
   pay_id               tinyint comment '支付方式ID',
   delivery_type_id     tinyint comment '配送方式ID',
   province             varchar(20) comment '省份',
   city                 varchar(20) comment '城市',
   country              varchar(20) comment '县区',
   order_source_id      tinyint comment '订单来源ID',
   pay_status           tinyint comment '支付状态,0:到付 1:未付款 2:已付款',
   order_status_customer_id tinyint comment '订单状态-客户',
   order_status_system_id tinyint comment '订单状态-客服',
   order_type           tinyint comment '1:正常  2:退  3:退换',
   invoice_type_id      tinyint comment '发票类型ID',
   invoice_head         varchar(200) comment '发票抬头',
   freight_reduce       double comment '运费优惠',
   freight_payable      double comment '应付运费',
   product_total_price  double comment '商品总金额',
   discount             double comment '优惠金额',
   remark_customer      varchar(50) comment '备注-客户',
   remark_system        varchar(50) comment '备注-客服',
   ip                   varchar(30) comment 'IP地址',
   post_code            varchar(10) comment '邮编',
   telephone            varchar(20) comment '固定电话',
   add_time             datetime comment '添加时间',
   email                varchar(30) comment '邮箱',
   pay_time             datetime comment '付款时间',
   exchange_oid         varchar(250) comment '换单单号',
   return_oid           varchar(250) comment '退单单号',
   custom_price         double comment '自定义金额',
   coupon_code          varchar(30) comment '券号',
   coupon_reduce_price  double comment '券优惠',
   cash_reduce_price    double comment '现金优惠',
   bean_reduce_price    double,
   is_free_account_level tinyint,
   primary key (order_info_id)
);

alter table order_info comment '内容解释
配送时间：指定快递公司在指定的时间段内，以客户的意愿来送货。
支付方式：采用何种支付的';

/*==============================================================*/
/* Table: order_preferences                                     */
/*==============================================================*/
create table order_preferences
(
   order_preferences_id int not null,
   account_id           int comment '账户ID',
   delivery_type_id     tinyint comment '配送方式ID',
   delivery_time_id     tinyint comment '配送时间ID',
   add_time             datetime comment '添加时间',
   freight_template_id  int,
   pay_id               tinyint comment '支付方式ID',
   priority             int comment '优先级',
   primary key (order_preferences_id)
);

alter table order_preferences comment '用户下单偏好表,根据用户的配送地址ID+账户ID动态读取用户的下单偏好,每个用户可以有多条，以优先级来区隔出来。';

/*==============================================================*/
/* Table: order_return                                          */
/*==============================================================*/
create table order_return
(
   order_return_id      int not null,
   order_info_oid       varchar(30),
   refund_payable       double,
   refund_paid          double,
   sale_price_total     double comment '销售价总额',
   account_id           int comment '账户ID',
   consignee            varchar(10) comment '收货人',
   mobile               varchar(20) comment '手机',
   address              varchar(50) comment '住址',
   province             varchar(20) comment '省份',
   city                 varchar(20) comment '城市',
   country              varchar(20) comment '县区',
   freight              double,
   product_total_price  double comment '商品总金额',
   remark_customer      varchar(50) comment '备注-客户',
   remark_system        varchar(50) comment '备注-客服',
   add_time             datetime comment '添加时间',
   email                varchar(30) comment '邮箱',
   ip                   varchar(30) comment 'IP地址',
   post_code            varchar(10) comment '邮编',
   telephone            varchar(20) comment '固定电话',
   return_reason_id     tinyint,
   custom_return_reason varchar(200),
   refund_type_id       tinyint,
   custom_price         double comment '自定义金额',
   return_oid           varchar(250) comment '退单单号',
   order_info_id        int,
   return_status_id     tinyint,
   primary key (order_return_id)
);

alter table order_return comment '退单主表,退单状态：未收货、确认/已收货、质检通过（质检不通过/退回完成）、入库/退货完成（拒收完成）。';

/*==============================================================*/
/* Table: order_return_detail                                   */
/*==============================================================*/
create table order_return_detail
(
   order_return_detail_id int not null,
   order_return_id      int,
   stock_id             int comment '库存表ID',
   return_oid           varchar(250) comment '退单单号',
   no                   varchar(20) comment '款号',
   suite_no             varchar(20),
   name                 varchar(50) comment '名称',
   color                varchar(20),
   size                 varchar(20),
   quantity             smallint,
   subtotal             double comment '小计',
   market_price         double comment '市场价格',
   sale_price           double comment '销售价',
   deal_price           double comment '成交价',
   discount_rate        double comment '折扣比例',
   is_gift              tinyint comment '是否为赠品,0:非 1:是',
   is_suite             tinyint comment '是否套装,0:非 1:是',
   shop_id              tinyint comment '商店,商店表主键',
   suite_price          double comment '套装价',
   suite_random         varchar(30) comment '区分套装',
   warehouse_id         tinyint comment '仓库,仓库表主键',
   primary key (order_return_detail_id)
);

alter table order_return_detail comment '退单子表';

/*==============================================================*/
/* Table: order_source                                          */
/*==============================================================*/
create table order_source
(
   order_source_id      tinyint not null comment '订单来源ID',
   name                 varchar(50) comment '名称',
   primary key (order_source_id)
);

alter table order_source comment '订单来源表
平台级别：淘宝、京东…
店面级别：实体店..';

/*==============================================================*/
/* Table: order_status_customer                                 */
/*==============================================================*/
create table order_status_customer
(
   order_status_customer_id tinyint not null comment '订单状态-客户',
   name                 varchar(50) comment '名称',
   primary key (order_status_customer_id)
);

alter table order_status_customer comment '订单状态表-客户';

/*==============================================================*/
/* Table: order_status_system                                   */
/*==============================================================*/
create table order_status_system
(
   order_status_system_id tinyint not null comment '订单状态-客服',
   name                 varchar(50) comment '名称',
   primary key (order_status_system_id)
);

alter table order_status_system comment '订单状态表-客服';

/*==============================================================*/
/* Table: page                                                  */
/*==============================================================*/
create table page
(
   name                 varchar(50) comment '名称',
   page_id              int not null comment '页面ID',
   primary key (page_id)
);

alter table page comment '页面表';

/*==============================================================*/
/* Table: pay                                                   */
/*==============================================================*/
create table pay
(
   pay_id               tinyint not null comment '支付方式ID',
   pay_type_id          tinyint comment '支付类型ID',
   name                 varchar(50) comment '名称',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   order_by             int comment '排序',
   primary key (pay_id)
);

alter table pay comment '支付方式表';

/*==============================================================*/
/* Table: pay_type                                              */
/*==============================================================*/
create table pay_type
(
   pay_type_id          tinyint not null comment '支付类型ID',
   name                 varchar(50) comment '名称',
   primary key (pay_type_id)
);

alter table pay_type comment '支付类型表';

/*==============================================================*/
/* Table: picture                                               */
/*==============================================================*/
create table picture
(
   picture_id           int not null comment '图片ID,自增',
   product_id           int comment '商品ID',
   color_id             int,
   picture_angle_id     tinyint,
   picture_size_id      tinyint,
   picture_url          varchar(100),
   is_default           tinyint comment '默认使用',
   primary key (picture_id)
);

alter table picture comment '存储所有的图片的路径字符串（URL），如果存储量过大，则需要根据主键值做表分区
图片命名规则：款号_颜色_角';

/*==============================================================*/
/* Table: picture_resource                                      */
/*==============================================================*/
create table picture_resource
(
   picture_resource_id  int not null,
   picture_resource_type_id tinyint,
   name                 varchar(50) comment '名称',
   picture_url          varchar(100),
   add_admin_id         int,
   add_time             datetime comment '添加时间',
   description          varchar(50) comment '描述',
   primary key (picture_resource_id)
);

alter table picture_resource comment '图片资源表';

/*==============================================================*/
/* Table: picture_resource_type                                 */
/*==============================================================*/
create table picture_resource_type
(
   picture_resource_type_id tinyint not null,
   name                 varchar(50) comment '名称',
   primary key (picture_resource_type_id)
);

alter table picture_resource_type comment '图片资源类型表';

/*==============================================================*/
/* Table: placeholder                                           */
/*==============================================================*/
create table placeholder
(
   placeholder_id       int not null,
   placeholder_name     varchar(20),
   param_name           varchar(20),
   is_fixed             tinyint comment '是否固定',
   primary key (placeholder_id)
);

alter table placeholder comment '占位符表
比如：季节:${season}
值由程序员一期全部填入。后期如果需要修改请程序员协助修';

/*==============================================================*/
/* Table: product                                               */
/*==============================================================*/
create table product
(
   product_id           int not null comment '商品ID',
   name                 varchar(50) comment '名称',
   no                   varchar(20) comment '款号',
   year                 varchar(10) comment '年份',
   season               varchar(4) comment '季节,以四位二进制码进行标识',
   sex                  varchar(4) comment '性别,男、女、中性',
   keywords             varchar(50) comment '关键词,搜索用',
   product_type_id      tinyint comment '商品类型,商品类型表主键',
   sell_type_id         tinyint comment '销售类型,销售类型表主键',
   is_alive             tinyint comment '上下架状态',
   brand_id             tinyint comment '品牌,品牌表主键',
   category_id          smallint comment '品类,品类表主键',
   shop_id              tinyint comment '商店,商店表主键',
   warehouse_id         tinyint comment '仓库,仓库表主键',
   supplier_id          tinyint comment '供货商,供货商表主键',
   product_style_id     tinyint comment '商品风格,商品风格表主键',
   product_story_id     tinyint comment '主题故事,主题故事表主键',
   add_time             datetime comment '添加时间',
   modify_admin_id      int comment '修改人',
   modify_time          datetime comment '最后修改时间',
   primary key (product_id)
);

/*==============================================================*/
/* Table: product_filter                                        */
/*==============================================================*/
create table product_filter
(
   product_filter_id    smallint not null,
   name                 varchar(50) comment '名称',
   parent_id            int comment '回复',
   en_name              varchar(50),
   description          varchar(50) comment '描述',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (product_filter_id)
);

alter table product_filter comment '商品筛选表
商品列表性页面的条件筛选：好评、最新、价格、销量..';

/*==============================================================*/
/* Table: product_focus                                         */
/*==============================================================*/
create table product_focus
(
   product_focus_id     int not null,
   account_id           int comment '账户ID',
   product_id           int comment '商品ID',
   color_id             int,
   add_time             datetime comment '添加时间',
   primary key (product_focus_id)
);

alter table product_focus comment '关注商品表';

/*==============================================================*/
/* Table: product_group                                         */
/*==============================================================*/
create table product_group
(
   product_group_id     int not null comment '群组ID',
   code                 varchar(20) comment '编号',
   name                 varchar(50) comment '名称',
   condition_find       varchar(100) comment '条件内容',
   is_type              tinyint comment '条件组/款号组/两者并存,0:条件群组 1:款号群组 2:条件群组+款号群组',
   is_shelf             tinyint comment '是否货架组,0:非 1：是',
   remark               varchar(200) comment '备注',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (product_group_id)
);

alter table product_group comment '群组表
如果群组中含价格，就直接读取价格子表
查询条件，这里根据查询条件来定义商品的范围。
                                  -';

/*==============================================================*/
/* Table: product_order_by                                      */
/*==============================================================*/
create table product_order_by
(
   product_order_by_id  int not null,
   name                 varchar(50) comment '名称',
   en_name              varchar(50),
   description          varchar(50) comment '描述',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (product_order_by_id)
);

alter table product_order_by comment '商品排序表';

/*==============================================================*/
/* Table: product_post                                          */
/*==============================================================*/
create table product_post
(
   product_post_id      int not null,
   account_id           int comment '账户ID',
   order_detail_id      int,
   stock_id             int comment '库存表ID',
   title                varchar(30),
   add_time             datetime comment '添加时间',
   content              varchar(50),
   parent_id            int comment '回复',
   read_count           int comment '浏览次数',
   reply_count          int comment '回复次数',
   account_level_id     tinyint comment '账户等级ID',
   admin_id             smallint comment '回复人',
   review_result        varchar(30) comment '审核结果说明',
   review_status        tinyint comment '审核状态,0未审核 1已通过 2未通过',
   review_time          datetime comment '审核时间',
   primary key (product_post_id)
);

alter table product_post comment '晒单表
库存ID能唯一标识出一个SKU（款色码）。';

/*==============================================================*/
/* Table: product_post_picture                                  */
/*==============================================================*/
create table product_post_picture
(
   product_post_picture_id int not null,
   product_post_id      int,
   picture_url          varchar(100),
   remark               varchar(200) comment '备注',
   is_default           tinyint comment '默认使用',
   primary key (product_post_picture_id)
);

alter table product_post_picture comment '晒单图片说明表
每个晒单贴对应多张图片，每张图片可以允许有不同的图片说明。';

/*==============================================================*/
/* Table: product_story                                         */
/*==============================================================*/
create table product_story
(
   product_story_id     tinyint not null comment '主题故事,主题故事表主键',
   name                 varchar(50) comment '名称',
   primary key (product_story_id)
);

alter table product_story comment '主题故事表';

/*==============================================================*/
/* Table: product_style                                         */
/*==============================================================*/
create table product_style
(
   product_style_id     tinyint not null comment '商品风格,商品风格表主键',
   name                 varchar(50) comment '名称',
   primary key (product_style_id)
);

alter table product_style comment '商品风格';

/*==============================================================*/
/* Table: product_type                                          */
/*==============================================================*/
create table product_type
(
   product_type_id      tinyint not null comment '商品类型,商品类型表主键',
   name                 varchar(50) comment '名称',
   primary key (product_type_id)
);

/*==============================================================*/
/* Table: questionnaire                                         */
/*==============================================================*/
create table questionnaire
(
   questionnaire_id     int not null,
   name                 varchar(50) comment '名称',
   title                varchar(30),
   description          varchar(50) comment '描述',
   page_id              int comment '页面ID',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (questionnaire_id)
);

alter table questionnaire comment '问卷主表';

/*==============================================================*/
/* Table: questionnaire_item                                    */
/*==============================================================*/
create table questionnaire_item
(
   questionnaire_item_id int not null,
   questionnaire_id     int,
   qa                   varchar(50) comment '题目or选项',
   parent_id            int comment '回复',
   answer_type          tinyint comment '多选/单选/其他,0:多选 1:单选 2:其他',
   is_text_field        tinyint comment '是否有输入框,0: 没有 1:有',
   primary key (questionnaire_item_id)
);

alter table questionnaire_item comment '问卷内容表
如果父ID为null 则为标题，每道题目的父ID为该标题的行的ID';

/*==============================================================*/
/* Table: questionnaire_result                                  */
/*==============================================================*/
create table questionnaire_result
(
   questionnaire_result_id int not null,
   account_id           int comment '账户ID',
   questionnaire_id     int,
   item_name_id         int comment '打分项,comment_item表ID',
   item_value_id        int comment '答案,comment_item表ID',
   text_field           varchar(100) comment '文本输入内容',
   add_time             datetime comment '添加时间',
   primary key (questionnaire_result_id)
);

alter table questionnaire_result comment '问卷结果记录表';

/*==============================================================*/
/* Table: questionnaire_statistics                              */
/*==============================================================*/
create table questionnaire_statistics
(
   questionnaire_statistics_id int not null,
   questionnaire_id     int,
   item_name_id         int comment '打分项,comment_item表ID',
   item_value_id        int comment '答案,comment_item表ID',
   frequency            int,
   percent              double comment '占比',
   primary key (questionnaire_statistics_id)
);

alter table questionnaire_statistics comment '问卷结果记录表';

/*==============================================================*/
/* Table: refund_type                                           */
/*==============================================================*/
create table refund_type
(
   name                 varchar(50) comment '名称',
   refund_type_id       tinyint not null,
   primary key (refund_type_id)
);

alter table refund_type comment '退款方式表';

/*==============================================================*/
/* Table: region                                                */
/*==============================================================*/
create table region
(
   region_id            int not null comment '省市县ID',
   name                 varchar(50) comment '名称',
   parent_id            int comment '回复',
   post_code            varchar(10) comment '邮编',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (region_id)
);

alter table region comment '地区表';

/*==============================================================*/
/* Table: return_reason                                         */
/*==============================================================*/
create table return_reason
(
   return_reason_id     tinyint not null,
   name                 varchar(50) comment '名称',
   primary key (return_reason_id)
);

alter table return_reason comment '退货原因表';

/*==============================================================*/
/* Table: return_status                                         */
/*==============================================================*/
create table return_status
(
   return_status_id     tinyint not null,
   name                 varchar(50) comment '名称',
   primary key (return_status_id)
);

alter table return_status comment '退单状态表';

/*==============================================================*/
/* Table: sale                                                  */
/*==============================================================*/
create table sale
(
   sale_id              int not null,
   name                 varchar(50) comment '名称',
   sale_type_id         smallint comment '促销类型',
   priority             int comment '优先级',
   sample_name          varchar(200) comment '活动简名',
   is_item              tinyint comment '是否单品页显示,0:默认不显示',
   description          varchar(50) comment '描述',
   picture_resource_id  int,
   is_exclude           tinyint comment '排斥关系,0:非排斥  1:排斥',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   add_time             datetime comment '添加时间',
   primary key (sale_id)
);

alter table sale comment '促销信息表
优先级：如果有多个活动同时进行时，根据优先级来判断先执行哪个活动。
简名、是否在单品';

/*==============================================================*/
/* Table: sale_join_rule                                        */
/*==============================================================*/
create table sale_join_rule
(
   sale_join_rule_id    tinyint not null,
   sale_id              int,
   sale_rule_id         int,
   rule_value           varchar(30),
   order_by             int comment '排序',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (sale_join_rule_id)
);

alter table sale_join_rule comment '促销信息-规则关联表
此表组合成了各个的活动，并且根据顺序可调整每条规则的执行先后。';

/*==============================================================*/
/* Table: sale_rule                                             */
/*==============================================================*/
create table sale_rule
(
   sale_rule_id         int not null,
   name                 varchar(50) comment '名称',
   primary key (sale_rule_id)
);

alter table sale_rule comment '促销规则表
此表是所有促销活动的肢解，分解成一条条的规则，然后按规则的顺序来组合成活动，这里只是定义规则的名';

/*==============================================================*/
/* Table: sale_type                                             */
/*==============================================================*/
create table sale_type
(
   sale_type_id         smallint not null comment '促销类型',
   name                 varchar(50) comment '名称',
   primary key (sale_type_id)
);

alter table sale_type comment '促销类型表
对促销活动进行分门别类，每个类别下属不同的规则。预留一个自定义的规则，把所有的规则全部罗列。';

/*==============================================================*/
/* Table: sale_type_join_rule                                   */
/*==============================================================*/
create table sale_type_join_rule
(
   sale_type_join_rule_id int not null,
   sale_type_id         smallint comment '促销类型',
   sale_rule_id         int,
   primary key (sale_type_join_rule_id)
);

alter table sale_type_join_rule comment '促销类型-促销规则关联表
关联该促销类型下都包含哪些促销规则
如：满减，立减 之类';

/*==============================================================*/
/* Table: sell_type                                             */
/*==============================================================*/
create table sell_type
(
   sell_type_id         tinyint not null comment '销售类型,销售类型表主键',
   name                 varchar(50) comment '名称',
   primary key (sell_type_id)
);

alter table sell_type comment '销售类型表';

/*==============================================================*/
/* Table: shop                                                  */
/*==============================================================*/
create table shop
(
   shop_id              tinyint not null comment '商店,商店表主键',
   name                 varchar(50) comment '名称',
   primary key (shop_id)
);

alter table shop comment '商店表';

/*==============================================================*/
/* Table: shopping_cart                                         */
/*==============================================================*/
create table shopping_cart
(
   shopping_cart_id     bigint not null,
   account_id           int comment '账户ID',
   total_quantity       int,
   add_time             datetime comment '添加时间',
   primary key (shopping_cart_id)
);

alter table shopping_cart comment '购物车主表';

/*==============================================================*/
/* Table: sms_template                                          */
/*==============================================================*/
create table sms_template
(
   sms_template_id      smallint not null,
   add_time             datetime comment '添加时间',
   content              varchar(50),
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   name                 varchar(50) comment '名称',
   primary key (sms_template_id)
);

alter table sms_template comment '短信模板表
存储平台所需要发短信的各种模板，模板内容支持通配符${oid},${name}等';

/*==============================================================*/
/* Table: supplier                                              */
/*==============================================================*/
create table supplier
(
   supplier_id          tinyint not null comment '供货商,供货商表主键',
   name                 varchar(50) comment '名称',
   primary key (supplier_id)
);

alter table supplier comment '供货商表';

/*==============================================================*/
/* Table: system_param                                          */
/*==============================================================*/
create table system_param
(
   system_param_id      smallint not null,
   name                 varchar(50) comment '名称',
   param_key            varchar(20) comment '参数键',
   param_value          varchar(20) comment '参数值',
   add_time             datetime comment '添加时间',
   is_enable            tinyint comment '是否启用,0:不启用 1:启用',
   primary key (system_param_id)
);

alter table system_param comment '系统参数表';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int not null comment '用户ID',
   name                 varchar(50) comment '名称',
   employer             varchar(30) comment '工作单位雇主',
   mobile               varchar(20) comment '手机',
   address              varchar(50) comment '住址',
   email                varchar(30) comment '邮箱',
   idcard               varchar(20) comment '身份证',
   sex                  varchar(4) comment '性别,男、女、中性',
   birthday             datetime comment '生日',
   region_province_id   int comment '省份',
   region_city_id       int comment '城市',
   region_country_id    int comment '区县',
   telephone            varchar(20) comment '固定电话',
   post_code            varchar(10) comment '邮编',
   income_month         varchar(10) comment '月收入',
   job                  varchar(20) comment '职业',
   hobby                varchar(30) comment '喜好',
   primary key (user_id)
);

alter table user comment '用户基础信息表,一个用户可以包含多个账户，各个账户之间是可以切换的';

/*==============================================================*/
/* Table: warehouse                                             */
/*==============================================================*/
create table warehouse
(
   warehouse_id         tinyint not null comment '仓库,仓库表主键',
   name                 varchar(50) comment '名称',
   primary key (warehouse_id)
);

alter table warehouse comment '仓库表';

alter table product add constraint FK_Reference_1 foreign key (product_type_id)
      references product_type (product_type_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_10 foreign key (product_story_id)
      references product_story (product_story_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_2 foreign key (sell_type_id)
      references sell_type (sell_type_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_3 foreign key (brand_id)
      references brand (brand_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_4 foreign key (category_id)
      references category (category_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_5 foreign key (supplier_id)
      references supplier (supplier_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_6 foreign key (warehouse_id)
      references warehouse (warehouse_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_7 foreign key (shop_id)
      references shop (shop_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_9 foreign key (product_style_id)
      references product_style (product_style_id) on delete restrict on update restrict;

