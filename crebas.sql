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
   account_id           int not null comment '�˻�ID',
   user_id              int comment '�û�ID',
   account_level_id     tinyint comment '�˻��ȼ�ID',
   username             varchar(30) comment '��¼��',
   password             varchar(40) comment '����',
   consume_usable       int comment '��������',
   consume_upgrade      int comment '����������',
   levels               int comment '���ѵȼ�',
   credit_level_id      tinyint comment '���õȼ�',
   is_employee          tinyint comment '�Ƿ��ڲ�Ա��',
   ip                   varchar(30) comment 'IP��ַ',
   add_time             datetime comment '���ʱ��',
   last_time            datetime comment '����¼ʱ��',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   source_from          varchar(10) comment '�ʺ���Դ',
   balance              double comment '�ֽ��˻����',
   primary key (account_id)
);

alter table account comment '�ʺ���Դ��ʶ�� ���ĸ�ƽ̨�������û�������QQ������΢���ȡ�
';

/*==============================================================*/
/* Table: account_level                                         */
/*==============================================================*/
create table account_level
(
   account_level_id     tinyint not null comment '�˻��ȼ�ID',
   name                 varchar(50) comment '����',
   need_beans           int,
   beans_every_level    int,
   reduct_percent       double,
   consume_scale        varchar(10),
   free_frequency       tinyint,
   obtain_scale         varchar(10),
   picture_resource_id  int,
   add_time             datetime comment '���ʱ��',
   modify_time          datetime comment '����޸�ʱ��',
   add_admin_id         int,
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   modify_admin_id      int comment '�޸���',
   primary key (account_level_id)
);

alter table account_level comment '�˻��ȼ���';

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

alter table action_join_role comment '��ɫȨ�޹�����';

/*==============================================================*/
/* Table: ad                                                    */
/*==============================================================*/
create table ad
(
   ad_id                int not null comment '���ID',
   name                 varchar(50) comment '����',
   picture_url          varchar(100),
   link_url             varchar(100) comment '���ӵ�ַ',
   width                int,
   height               int,
   countdown_time       datetime comment '����ʱ',
   description          varchar(50) comment '����',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   priority             int comment '���ȼ�',
   primary key (ad_id)
);

alter table ad comment '�����Դ��
�����������Ҫ�ǣ����ͼƬalt�¼�ʱ�����ʾ����';

/*==============================================================*/
/* Table: ad_join_position                                      */
/*==============================================================*/
create table ad_join_position
(
   ad_join_position_id  int not null,
   ad_id                int comment '���ID',
   ad_page_position_id  int,
   primary key (ad_join_position_id)
);

alter table ad_join_position comment '�����λ�ù�����
���������λ�÷���ʲô����Ĺ�棬����Ϊ��������
���ĳ��λ�ÿ��ܳ��ֶ�����';

/*==============================================================*/
/* Table: ad_page_position                                      */
/*==============================================================*/
create table ad_page_position
(
   ad_page_position_id  int not null,
   name                 varchar(50) comment '����',
   page_id              int comment 'ҳ��ID',
   ad_position_id       int comment '���λ��ID',
   ad_key               varchar(20) comment '������',
   ad_key_code          varchar(20) comment '����������',
   ad_value             varchar(20) comment '����ֵ',
   ad_value_code        varchar(20) comment '����ֵ����',
   primary key (ad_page_position_id)
);

alter table ad_page_position comment '������λ�ñ�
�Թ��ľ���λ����Ϣ���н綨��
���ĸ�ҳ�棨�����ܴ򿪣� ��Ʒ�ƴ�..�����ĸ�';

/*==============================================================*/
/* Table: ad_position                                           */
/*==============================================================*/
create table ad_position
(
   ad_position_id       int not null comment '���λ��ID',
   name                 varchar(50) comment '����',
   primary key (ad_position_id)
);

alter table ad_position comment '���λ�ñ�';

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   admin_id             smallint not null comment '�ظ���',
   username             varchar(30) comment '��¼��',
   password             varchar(40) comment '����',
   name                 varchar(50) comment '����',
   is_sys               tinyint comment '�Ƿ񳬼��û�',
   telephone            varchar(20) comment '�̶��绰',
   mobile               varchar(20) comment '�ֻ�',
   description          varchar(50) comment '����',
   email                varchar(30) comment '����',
   department_id        tinyint,
   position             varchar(30) comment '׫д��ְλ',
   login_time           datetime comment '����¼ʱ��',
   add_time             datetime comment '���ʱ��',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (admin_id)
);

alter table admin comment '��̨�˻���';

/*==============================================================*/
/* Table: admin_action                                          */
/*==============================================================*/
create table admin_action
(
   admin_action_id      int not null,
   name                 varchar(50) comment '����',
   description          varchar(50) comment '����',
   admin_action_group_id tinyint comment 'Ȩ����ID',
   action_type          tinyint,
   resource_url         varchar(100),
   priority             int comment '���ȼ�',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   add_time             datetime comment '���ʱ��',
   modify_time          datetime comment '����޸�ʱ��',
   modify_admin_id      int comment '�޸���',
   primary key (admin_action_id)
);

alter table admin_action comment 'Ȩ�ޱ�';

/*==============================================================*/
/* Table: admin_action_group                                    */
/*==============================================================*/
create table admin_action_group
(
   admin_action_group_id tinyint not null comment 'Ȩ����ID',
   name                 varchar(50) comment '����',
   primary key (admin_action_group_id)
);

alter table admin_action_group comment 'Ȩ�����
��ʶ��ЩȨ��ͬ����һ��������ġ���������Է�ģ�������֣�����ǰ̨��ʾ��
��ɻ���Ϊ����';

/*==============================================================*/
/* Table: admin_join_role                                       */
/*==============================================================*/
create table admin_join_role
(
   admin_join_role_id   int not null,
   admin_id             smallint comment '�ظ���',
   admin_role_id        int,
   primary key (admin_join_role_id)
);

alter table admin_join_role comment '�û���ɫ������';

/*==============================================================*/
/* Table: admin_role                                            */
/*==============================================================*/
create table admin_role
(
   admin_role_id        int not null,
   name                 varchar(50) comment '����',
   role_code            varchar(50) comment '��ɫ����',
   primary key (admin_role_id)
);

alter table admin_role comment '��ɫ��';

/*==============================================================*/
/* Table: behavior_type                                         */
/*==============================================================*/
create table behavior_type
(
   behavior_type_id     tinyint not null comment '��������ID',
   name                 varchar(50) comment '����',
   primary key (behavior_type_id)
);

alter table behavior_type comment '�������ͱ�
�ñ���ҪΪ���ֽ��˻���¼��ȯ��¼�е������֧������
���磺ԭ��¼�룺�¶���    ';

/*==============================================================*/
/* Table: box                                                   */
/*==============================================================*/
create table box
(
   box_id               int not null,
   name                 varchar(50) comment '����',
   show_text            varchar(100) comment '��ʾ����',
   box_type_id          int comment '�������ID',
   file_name            varchar(30) comment '�ļ���',
   add_time             datetime comment '���ʱ��',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   order_by             int comment '����',
   is_hidden_no_data    tinyint comment '�������Ƿ��Զ�����',
   primary key (box_id)
);

alter table box comment '���ӱ�
�ļ�������ʾ�ú��Ӷ�Ӧ���ĸ���ftlģ���ļ���';

/*==============================================================*/
/* Table: box_type                                              */
/*==============================================================*/
create table box_type
(
   box_type_id          int not null comment '�������ID',
   name                 varchar(50) comment '����',
   width                int,
   height               int,
   number_of_row        tinyint comment 'ÿ����ʾ����',
   max_row              tinyint comment '�����ʾ����',
   add_time             datetime comment '���ʱ��',
   primary key (box_type_id)
);

alter table box_type comment '��������';

/*==============================================================*/
/* Table: brand                                                 */
/*==============================================================*/
create table brand
(
   brand_id             tinyint not null comment 'Ʒ��,Ʒ�Ʊ�����',
   name                 varchar(50) comment '����',
   primary key (brand_id)
);

alter table brand comment 'Ʒ�Ʊ�';

/*==============================================================*/
/* Table: cart_info                                             */
/*==============================================================*/
create table cart_info
(
   cart_info_id         bigint not null,
   shopping_cart_id     bigint,
   product_id           int comment '��ƷID',
   color_id             int,
   size_id              int,
   quantity             smallint,
   primary key (cart_info_id)
);

alter table cart_info comment '���ﳵ�ӱ�';

/*==============================================================*/
/* Table: cash_record                                           */
/*==============================================================*/
create table cash_record
(
   cash_record_id       int not null comment '�ֽ��˻���¼ID',
   account_id           int comment '�˻�ID',
   before_money         double comment '֮ǰ���',
   after_money          double comment '֮����',
   tx_money             double comment '���ν��',
   frozen_money         double comment '������,�ѷ�����������',
   tx_type              tinyint comment '����/֧��,0:���� 1:֧��',
   behavior_type_id     tinyint comment '��������ID',
   tx_result            varchar(30) comment '������Ϣ,�����֧���������µĽ��',
   add_time             datetime comment '���ʱ��',
   aux_info             varchar(30) comment '����˵��',
   primary key (cash_record_id)
);

alter table cash_record comment '�ֽ��˻���¼��';

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
   category_id          smallint not null comment 'Ʒ��,Ʒ�������',
   name                 varchar(50) comment '����',
   primary key (category_id)
);

alter table category comment 'Ʒ���';

/*==============================================================*/
/* Table: children                                              */
/*==============================================================*/
create table children
(
   children_id          int not null,
   user_id              int comment '�û�ID',
   name                 varchar(50) comment '����',
   height               varchar(10) comment '���',
   hobby                varchar(30) comment 'ϲ��',
   birthday             datetime comment '����',
   sex                  varchar(4) comment '�Ա�,�С�Ů������',
   personality          varchar(20) comment '����',
   weight               varchar(20) comment '����',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   add_time             datetime comment '���ʱ��',
   modify_time          datetime comment '����޸�ʱ��',
   primary key (children_id)
);

alter table children comment '������Ϣ���û����һ������һ���û�����ӵ�ж���������Ϣ
�������֮����������϶���һ�������Ը������ʱ����';

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   comment_id           bigint not null,
   order_detail_id      int,
   stock_id             int comment '����ID',
   account_id           int comment '�˻�ID',
   title                varchar(30),
   content              varchar(50),
   parent_id            int comment '�ظ�',
   useful               int,
   useless              int,
   score_avg            double comment 'ƽ������',
   add_time             datetime comment '���ʱ��',
   admin_id             smallint comment '�ظ���',
   review_result        varchar(30) comment '��˽��˵��',
   review_status        tinyint comment '���״̬,0δ��� 1��ͨ�� 2δͨ��',
   review_time          datetime comment '���ʱ��',
   primary key (comment_id)
);

alter table comment comment '���۱�
ƽ��������С���ĸ��ƽ�����ּ���ʱ����0.1-0.5֮�䰴0.5��  0.5-1֮�� ��1��
                            ';

/*==============================================================*/
/* Table: comment_detail                                        */
/*==============================================================*/
create table comment_detail
(
   comment_detail_id    bigint not null,
   comment_id           bigint,
   item_name_id         int comment '�����,comment_item��ID',
   item_value_id        int comment '��,comment_item��ID',
   score                double comment '����ֵ',
   add_time             datetime comment '���ʱ��',
   primary key (comment_detail_id)
);

alter table comment_detail comment '���۴�ֽ����ϸ��';

/*==============================================================*/
/* Table: comment_item                                          */
/*==============================================================*/
create table comment_item
(
   comment_item_id      int not null,
   product_type_id      tinyint comment '��Ʒ����,��Ʒ���ͱ�����',
   item_name            varchar(30),
   parent_id            int comment '�ظ�',
   score                double comment '����ֵ',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (comment_item_id)
);

alter table comment_item comment '���۴�����
��¼ÿ����Ʒ���ͯЬ��ͯװ����ߡ����Ĳ�ͬ�Ĵ������ʹ������
��Ʒ����ID����';

/*==============================================================*/
/* Table: comment_level                                         */
/*==============================================================*/
create table comment_level
(
   comment_level_id     tinyint not null,
   name                 varchar(50) comment '����',
   star_from            double comment '�Ӷ��ٷ�',
   star_to              double comment '�����ٷ�',
   primary key (comment_level_id)
);

alter table comment_level comment '���ۼ����';

/*==============================================================*/
/* Table: comment_product                                       */
/*==============================================================*/
create table comment_product
(
   comment_product_id   int not null,
   product_id           int comment '��ƷID',
   comment_level_id     tinyint,
   times                int comment '��ִ���',
   rate                 double comment '�ٷֱ�,����ռ�ò�İٷֱ�',
   primary key (comment_product_id)
);

alter table comment_product comment '���ۻ��ܱ�-������Ʒ';

/*==============================================================*/
/* Table: comment_statistics                                    */
/*==============================================================*/
create table comment_statistics
(
   comment_statistics_id int not null,
   product_id           int comment '��ƷID',
   item_name_id         int comment '�����,comment_item��ID',
   item_value_id        int comment '��,comment_item��ID',
   times                int comment '��ִ���',
   score_avg            double comment 'ƽ������',
   total_score          double comment '������',
   rate                 double comment '�ٷֱ�,����ռ�ò�İٷֱ�',
   primary key (comment_statistics_id)
);

alter table comment_statistics comment '���۽��ͳ�Ʊ�
��������IDΪNullʱ����Ϊ�����ͳ���ͳ�Ƹô�����������������ƽ������
                                       -&#&';

/*==============================================================*/
/* Table: consume_record                                        */
/*==============================================================*/
create table consume_record
(
   consume_record_id    int not null,
   account_id           int comment '�˻�ID',
   consume_before       int comment '����֮ǰ',
   tx                   int comment '��������',
   frozen               int comment '����',
   after                int comment '����֮��',
   tx_type              tinyint comment '����/֧��,0:���� 1:֧��',
   behavior_type_id     tinyint comment '��������ID',
   tx_result            varchar(30) comment '������Ϣ,�����֧���������µĽ��',
   add_time             datetime comment '���ʱ��',
   aux_info             varchar(30) comment '����˵��',
   primary key (consume_record_id)
);

alter table consume_record comment '���Ѽ�¼��';

/*==============================================================*/
/* Table: content                                               */
/*==============================================================*/
create table content
(
   content_id           int not null,
   content_type_id      tinyint,
   first_title          varchar(30) comment '������',
   second_title         varchar(30) comment '������',
   content              varchar(50),
   order_by             int comment '����',
   added_by             varchar(20) comment '׫д��',
   position             varchar(30) comment '׫д��ְλ',
   employer             varchar(30) comment '׫д�˵�λ',
   add_time             datetime comment '���ʱ��',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (content_id)
);

alter table content comment '���ݱ�';

/*==============================================================*/
/* Table: content_type                                          */
/*==============================================================*/
create table content_type
(
   content_type_id      tinyint not null,
   name                 varchar(50) comment '����',
   primary key (content_type_id)
);

alter table content_type comment '�������ͱ�';

/*==============================================================*/
/* Table: coupon                                                */
/*==============================================================*/
create table coupon
(
   coupon_id            int not null,
   name                 varchar(50) comment '����',
   coupon_type_id       smallint,
   face_value           double,
   description          varchar(50) comment '����',
   delay_day            tinyint comment '�ӳ�����',
   is_free              tinyint comment '�Ƿ����˷�',
   is_reuse             tinyint comment '�ܷ��ظ�ʹ��',
   enough_money         double comment '������Ǯ',
   discount             double comment '�Żݽ��',
   include_group        varchar(30) comment '������ƷȺ��',
   exclude_group        varchar(30) comment '�ų���ƷȺ��',
   begin_time           datetime comment '��ʼʱ��',
   end_time             datetime comment '����ʱ��',
   add_time             datetime comment '���ʱ��',
   modify_time          datetime comment '����޸�ʱ��',
   admin_id             smallint comment '�ظ���',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (coupon_id)
);

alter table coupon comment 'ȯ����
����ۿ��ֶ��ֶ�ֵ������1����Ḳ����ֵ��Ȼ���ۿ�������
�ܷ��ظ�ʹ�ã���ʶ��ȯ�Ƿ����';

/*==============================================================*/
/* Table: coupon_code                                           */
/*==============================================================*/
create table coupon_code
(
   coupon_code_id       int not null comment 'ȯID',
   account_id           int comment '�˻�ID',
   add_time             datetime comment '���ʱ��',
   code                 varchar(20) comment '���',
   coupon_id            int,
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   password             varchar(40) comment '����',
   is_used              tinyint comment '�Ƿ�ʹ�ù�,0: ��ʹ��1:δʹ��',
   primary key (coupon_code_id)
);

alter table coupon_code comment 'ȯ��ϸ��
ȯ���壺16λ�����ֺʹ�д��ĸ��ɡ��ų�0 O�����ַ�';

/*==============================================================*/
/* Table: coupon_history                                        */
/*==============================================================*/
create table coupon_history
(
   coupon_history_id    int not null,
   code                 varchar(20) comment '���',
   tx_behavior          varchar(30) comment '��Ϊ����',
   account_id           int comment '�˻�ID',
   is_send_used         tinyint comment '��ȯ/��ȯ',
   add_time             datetime comment '���ʱ��',
   primary key (coupon_history_id)
);

alter table coupon_history comment 'ȯ��¼��
����ȯ����ȯ���ּ�¼
��Ϊ�������洢��ȯʱ�����������ȯʱ��ĵ���';

/*==============================================================*/
/* Table: coupon_record                                         */
/*==============================================================*/
create table coupon_record
(
   coupon_record_id     int not null,
   account_id           int comment '�˻�ID',
   coupon_code_id       int comment 'ȯID',
   tx_type              tinyint comment '����/֧��,0:���� 1:֧��',
   behavior_type_id     tinyint comment '��������ID',
   tx_result            varchar(30) comment '������Ϣ,�����֧���������µĽ��',
   add_time             datetime comment '���ʱ��',
   aux_info             varchar(30) comment '����˵��',
   primary key (coupon_record_id)
);

alter table coupon_record comment 'ȯ��¼��';

/*==============================================================*/
/* Table: coupon_type                                           */
/*==============================================================*/
create table coupon_type
(
   coupon_type_id       smallint not null,
   name                 varchar(50) comment '����',
   primary key (coupon_type_id)
);

alter table coupon_type comment 'ȯ���ͱ�
������ֽ�ȯ�����˷�ȯ���ۿ�ȯ�����˷Ѿ�';

/*==============================================================*/
/* Table: credit_level                                          */
/*==============================================================*/
create table credit_level
(
   name                 varchar(50) comment '����',
   credit_level_id      tinyint not null comment '���õȼ�',
   primary key (credit_level_id)
);

alter table credit_level comment '���õȼ���
�����
�Ȼ���Ϊ����ȼ������á��Ϻá�һ�㡢�ϲ��
���õȼ�����û���';

/*==============================================================*/
/* Table: delivery_address                                      */
/*==============================================================*/
create table delivery_address
(
   delivery_address_id  int not null comment 'ID',
   account_id           int comment '�˻�ID',
   region_province_id   int comment 'ʡ��',
   region_city_id       int comment '����',
   region_country_id    int comment '����',
   consignee            varchar(10) comment '�ջ���',
   address              varchar(50) comment 'סַ',
   mobile               varchar(20) comment '�ֻ�',
   telephone            varchar(20) comment '�̶��绰',
   email                varchar(30) comment '����',
   post_code            varchar(10) comment '�ʱ�',
   add_time             datetime comment '���ʱ��',
   is_default           tinyint comment 'Ĭ��ʹ��',
   primary key (delivery_address_id)
);

alter table delivery_address comment '���͵�ַ��';

/*==============================================================*/
/* Table: delivery_time                                         */
/*==============================================================*/
create table delivery_time
(
   delivery_time_id     tinyint comment '����ʱ��ID',
   name                 varchar(50) comment '����'
);

alter table delivery_time comment '����ʱ���';

/*==============================================================*/
/* Table: delivery_type                                         */
/*==============================================================*/
create table delivery_type
(
   delivery_type_id     tinyint comment '���ͷ�ʽID',
   name                 varchar(50) comment '����'
);

alter table delivery_type comment '���ͷ�ʽ��';

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department
(
   department_id        tinyint not null,
   name                 varchar(50) comment '����',
   primary key (department_id)
);

alter table department comment '���ű�';

/*==============================================================*/
/* Table: email_template                                        */
/*==============================================================*/
create table email_template
(
   email_template_id    smallint not null comment '�ʼ�ģ��',
   add_time             datetime comment '���ʱ��',
   content              varchar(50),
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   name                 varchar(50) comment '����',
   title                varchar(30),
   primary key (email_template_id)
);

alter table email_template comment '�ʼ�ģ���
ģ������֧��ռλ��${oid},${name}��';

/*==============================================================*/
/* Table: float_icon                                            */
/*==============================================================*/
create table float_icon
(
   float_icon_id        int not null,
   product_group_id     int comment 'Ⱥ��ID',
   picture_angle        tinyint comment 'ͼƬ�Ľ�',
   picture_resource_id  int,
   icon_text            varchar(10),
   priority             int comment '���ȼ�',
   description          varchar(50) comment '����',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (float_icon_id)
);

alter table float_icon comment '����ͼ���
�б�ҳ���������ҳ�������ͼ�ꡢ��Ʒҳ��������ʶ
���Ͻǣ������
                               -&#&';

/*==============================================================*/
/* Table: freight_template                                      */
/*==============================================================*/
create table freight_template
(
   freight_template_id  int not null,
   name                 varchar(50) comment '����',
   region_id            int comment 'ʡ����ID',
   delivery_type_id     tinyint comment '���ͷ�ʽID',
   pay_id               tinyint comment '֧����ʽID',
   remark               varchar(200) comment '��ע',
   initial_weight_freight double comment '�����˷�',
   additional_weight_freight double comment '�����˷�',
   is_cod               tinyint comment '�Ƿ�֧�ֵ���,0:֧�� 1:��֧��',
   min_eta              tinyint comment '��̵���ʱ��',
   max_eta              tinyint comment '�����ʱ��',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (freight_template_id)
);

alter table freight_template comment '�˷�ģ���
ע�⣺�������ֻ���ø��ڵ��ID�Ļ���Ĭ�ϸø��ڵ��µ����е�ֵ��һ����
������и���';

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

alter table group_condition comment 'Ⱥ��-��Ʒ������
��λȺ���е���Ʒ���������ݣ���Ҫ������Щ�����е�keyֵ����������Щ�����Щ�ֶΣ�Ȼ�����';

/*==============================================================*/
/* Table: group_sub                                             */
/*==============================================================*/
create table group_sub
(
   group_sub_id         int not null,
   product_group_id     int comment 'Ⱥ��ID',
   product_id           int comment '��ƷID',
   color_id             int,
   custom_price         double comment '�Զ�����',
   primary key (group_sub_id)
);

alter table group_sub comment 'Ⱥ���ӱ�';

/*==============================================================*/
/* Table: interaction                                           */
/*==============================================================*/
create table interaction
(
   interaction_id       int not null,
   account_id           int comment '�˻�ID',
   content              varchar(50),
   interaction_type_id  tinyint,
   parent_id            int comment '�ظ�',
   useful               int,
   useless              int,
   add_time             datetime comment '���ʱ��',
   admin_id             smallint comment '�ظ���',
   review_time          datetime comment '���ʱ��',
   review_status        tinyint comment '���״̬,0δ��� 1��ͨ�� 2δͨ��',
   review_result        varchar(30) comment '��˽��˵��',
   primary key (interaction_id)
);

alter table interaction comment '������ϸ��';

/*==============================================================*/
/* Table: interaction_type                                      */
/*==============================================================*/
create table interaction_type
(
   interaction_type_id  tinyint not null,
   name                 varchar(50) comment '����',
   primary key (interaction_type_id)
);

alter table interaction_type comment '���������
���������У���ѯ���ʴ��';

/*==============================================================*/
/* Table: invoice_type                                          */
/*==============================================================*/
create table invoice_type
(
   invoice_type_id      tinyint not null comment '��Ʊ����ID',
   name                 varchar(50) comment '����',
   primary key (invoice_type_id)
);

alter table invoice_type comment '��Ʊ���ͱ�';

/*==============================================================*/
/* Table: keyword_prompt                                        */
/*==============================================================*/
create table keyword_prompt
(
   keyword_prompt_id    int not null,
   name                 varchar(50) comment '����',
   order_by             int comment '����',
   times                int comment '��ִ���',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (keyword_prompt_id)
);

alter table keyword_prompt comment '�����ؼ��ʱ�';

/*==============================================================*/
/* Table: layout                                                */
/*==============================================================*/
create table layout
(
   layout_id            int not null,
   name                 varchar(50) comment '����',
   layout_type          tinyint comment '��������',
   order_type           tinyint comment '1:����  2:��  3:�˻�',
   page_id              int comment 'ҳ��ID',
   add_time             datetime comment '���ʱ��',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (layout_id)
);

alter table layout comment 'ģ�岼�ֱ�
�������ͣ����ң����У����ң����ң������ң���
�������ͣ�����/����';

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

alter table layout_join_box comment 'ģ�岼��-���ӹ�����';

/*==============================================================*/
/* Table: log_account                                           */
/*==============================================================*/
create table log_account
(
   log_account_id       int not null,
   account_id           int comment '�˻�ID',
   from_ip              varchar(30) comment '��·IP��ַ',
   from_url             varchar(100) comment '��·URL',
   add_time             datetime comment '���ʱ��',
   to_page_content      varchar(100) comment '����ҳ������',
   to_page_name         varchar(50) comment '����ҳ������',
   primary key (log_account_id)
);

alter table log_account comment '�˻���־��
��־��Χ���û��ĸ����˻���������־';

/*==============================================================*/
/* Table: log_admin                                             */
/*==============================================================*/
create table log_admin
(
   log_admin_id         int not null,
   admin_id             smallint comment '�ظ���',
   content              varchar(50),
   add_time             datetime comment '���ʱ��',
   primary key (log_admin_id)
);

alter table log_admin comment '��̨ϵͳ������־��';

/*==============================================================*/
/* Table: log_cart_order                                        */
/*==============================================================*/
create table log_cart_order
(
   log_cart_order_id    int not null,
   account_id           int comment '�˻�ID',
   from_ip              varchar(30) comment '��·IP��ַ',
   from_url             varchar(100) comment '��·URL',
   to_page_content      varchar(100) comment '����ҳ������',
   to_page_name         varchar(50) comment '����ҳ������',
   add_time             datetime comment '���ʱ��',
   primary key (log_cart_order_id)
);

alter table log_cart_order comment '������־��
��־��Χ�����ﳵ���µ�������־';

/*==============================================================*/
/* Table: log_payment                                           */
/*==============================================================*/
create table log_payment
(
   log_payment_id       int not null,
   account_id           int comment '�˻�ID',
   from_ip              varchar(30) comment '��·IP��ַ',
   from_url             varchar(100) comment '��·URL',
   to_page_content      varchar(100) comment '����ҳ������',
   to_page_name         varchar(50) comment '����ҳ������',
   add_time             datetime comment '���ʱ��',
   primary key (log_payment_id)
);

alter table log_payment comment '֧��������־��';

/*==============================================================*/
/* Table: log_product                                           */
/*==============================================================*/
create table log_product
(
   log_product_id       int not null,
   account_id           int comment '�˻�ID',
   from_ip              varchar(30) comment '��·IP��ַ',
   from_url             varchar(100) comment '��·URL',
   to_page_name         varchar(50) comment '����ҳ������',
   to_page_content      varchar(100) comment '����ҳ������',
   add_time             datetime comment '���ʱ��',
   primary key (log_product_id)
);

alter table log_product comment '��Ʒ��־��
��־��Χ���漰��Ʒ��Χ�ķ��ʹؼ���־����������磺�б���������Ʒ����ҳ������ҳ��
                                -&#&';

/*==============================================================*/
/* Table: menu_item                                             */
/*==============================================================*/
create table menu_item
(
   menu_item_id         int not null,
   name                 varchar(50) comment '����',
   parent_id            int comment '�ظ�',
   order_by             int comment '����',
   link_url             varchar(100) comment '���ӵ�ַ',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (menu_item_id)
);

alter table menu_item comment '�˵�������';

/*==============================================================*/
/* Table: meta_template                                         */
/*==============================================================*/
create table meta_template
(
   meta_template_id     int not null,
   name                 varchar(50) comment '����',
   title                varchar(30),
   keywords             varchar(50) comment '�ؼ���,������',
   description          varchar(50) comment '����',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   add_time             datetime comment '���ʱ��',
   primary key (meta_template_id)
);

alter table meta_template comment 'META���ͱ�
�����λ��URL��������Զ�ƥ��ķ�ʽ��������ҳ���λ�á�
���絥Ʒҳ������� ';

/*==============================================================*/
/* Table: notice                                                */
/*==============================================================*/
create table notice
(
   notice_id            int not null,
   notice_type_id       tinyint comment '֪ͨ����ID',
   account_id           int comment '�˻�ID',
   product_id           int comment '��ƷID',
   color_id             int,
   content              varchar(50),
   add_time             datetime comment '���ʱ��',
   parent_id            int comment '�ظ�',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   admin_id             smallint comment '�ظ���',
   primary key (notice_id)
);

alter table notice comment '֪ͨ��';

/*==============================================================*/
/* Table: notice_type                                           */
/*==============================================================*/
create table notice_type
(
   notice_type_id       tinyint not null comment '֪ͨ����ID',
   name                 varchar(50) comment '����',
   primary key (notice_type_id)
);

alter table notice_type comment '֪ͨ���ͱ�';

/*==============================================================*/
/* Table: notice_type_join_template                             */
/*==============================================================*/
create table notice_type_join_template
(
   notice_type_join_template_id int not null,
   notice_type_id       tinyint comment '֪ͨ����ID',
   sms_template_id      smallint comment '����ģ��',
   email_template_id    smallint comment '�ʼ�ģ��',
   primary key (notice_type_join_template_id)
);

alter table notice_type_join_template comment '֪ͨ����-ģ�������';

/*==============================================================*/
/* Table: order_delivery                                        */
/*==============================================================*/
create table order_delivery
(
   order_delivery_id    int not null,
   order_info_id        int,
   oid                  varchar(30) comment '������',
   express_company      varchar(30) comment '��ݹ�˾',
   tracking_number      varchar(30) comment '��ݵ���',
   send_time            datetime comment '����ʱ��',
   initial_weight       double comment '����',
   additional_weight    double comment '����',
   remark               varchar(200) comment '��ע',
   primary key (order_delivery_id)
);

alter table order_delivery comment '����������Ϣ��';

/*==============================================================*/
/* Table: order_detail                                          */
/*==============================================================*/
create table order_detail
(
   order_detail_id      int not null,
   order_info_id        int,
   stock_id             int comment '����ID',
   oid                  varchar(30) comment '������',
   no                   varchar(20) comment '���',
   suite_no             varchar(20),
   suite_name           varchar(20),
   name                 varchar(50) comment '����',
   color                varchar(20),
   size                 varchar(20),
   quantity             smallint,
   subtotal             double comment 'С��',
   market_price         double comment '�г��۸�',
   sale_price           double comment '���ۼ�',
   deal_price           double comment '�ɽ���',
   suite_price          double comment '��װ��',
   suite_random         varchar(30) comment '������װ',
   is_suite             tinyint comment '�Ƿ���װ,0:�� 1:��',
   discount_rate        double comment '�ۿ۱���',
   warehouse_id         tinyint comment '�ֿ�,�ֿ������',
   shop_id              tinyint comment '�̵�,�̵������',
   is_posted            tinyint comment '�Ƿ���ɹ��,0:δɹ��  1:��ɹ��',
   is_comment           tinyint comment '�Ƿ�������,0:δ���� 1:������',
   is_gift              tinyint comment '�Ƿ�Ϊ��Ʒ,0:�� 1:��',
   primary key (order_detail_id)
);

alter table order_detail comment '���������-�ͷ�';

/*==============================================================*/
/* Table: order_info                                            */
/*==============================================================*/
create table order_info
(
   order_info_id        int not null,
   oid                  varchar(30) comment '������',
   relate_oid           varchar(30) comment '��������',
   amount_payable       double comment 'Ӧ�����',
   amount_paid          double comment '�Ѹ����',
   sale_price_total     double comment '���ۼ��ܶ�',
   account_id           int comment '�˻�ID',
   consignee            varchar(10) comment '�ջ���',
   mobile               varchar(20) comment '�ֻ�',
   address              varchar(50) comment 'סַ',
   delivery_time_id     tinyint comment '����ʱ��ID',
   pay_id               tinyint comment '֧����ʽID',
   delivery_type_id     tinyint comment '���ͷ�ʽID',
   province             varchar(20) comment 'ʡ��',
   city                 varchar(20) comment '����',
   country              varchar(20) comment '����',
   order_source_id      tinyint comment '������ԴID',
   pay_status           tinyint comment '֧��״̬,0:���� 1:δ���� 2:�Ѹ���',
   order_status_customer_id tinyint comment '����״̬-�ͻ�',
   order_status_system_id tinyint comment '����״̬-�ͷ�',
   order_type           tinyint comment '1:����  2:��  3:�˻�',
   invoice_type_id      tinyint comment '��Ʊ����ID',
   invoice_head         varchar(200) comment '��Ʊ̧ͷ',
   freight_reduce       double comment '�˷��Ż�',
   freight_payable      double comment 'Ӧ���˷�',
   product_total_price  double comment '��Ʒ�ܽ��',
   discount             double comment '�Żݽ��',
   remark_customer      varchar(50) comment '��ע-�ͻ�',
   remark_system        varchar(50) comment '��ע-�ͷ�',
   ip                   varchar(30) comment 'IP��ַ',
   post_code            varchar(10) comment '�ʱ�',
   telephone            varchar(20) comment '�̶��绰',
   add_time             datetime comment '���ʱ��',
   email                varchar(30) comment '����',
   pay_time             datetime comment '����ʱ��',
   exchange_oid         varchar(250) comment '��������',
   return_oid           varchar(250) comment '�˵�����',
   custom_price         double comment '�Զ�����',
   coupon_code          varchar(30) comment 'ȯ��',
   coupon_reduce_price  double comment 'ȯ�Ż�',
   cash_reduce_price    double comment '�ֽ��Ż�',
   bean_reduce_price    double,
   is_free_account_level tinyint,
   primary key (order_info_id)
);

alter table order_info comment '���ݽ���
����ʱ�䣺ָ����ݹ�˾��ָ����ʱ����ڣ��Կͻ�����Ը���ͻ���
֧����ʽ�����ú���֧����';

/*==============================================================*/
/* Table: order_preferences                                     */
/*==============================================================*/
create table order_preferences
(
   order_preferences_id int not null,
   account_id           int comment '�˻�ID',
   delivery_type_id     tinyint comment '���ͷ�ʽID',
   delivery_time_id     tinyint comment '����ʱ��ID',
   add_time             datetime comment '���ʱ��',
   freight_template_id  int,
   pay_id               tinyint comment '֧����ʽID',
   priority             int comment '���ȼ�',
   primary key (order_preferences_id)
);

alter table order_preferences comment '�û��µ�ƫ�ñ�,�����û������͵�ַID+�˻�ID��̬��ȡ�û����µ�ƫ��,ÿ���û������ж����������ȼ�������������';

/*==============================================================*/
/* Table: order_return                                          */
/*==============================================================*/
create table order_return
(
   order_return_id      int not null,
   order_info_oid       varchar(30),
   refund_payable       double,
   refund_paid          double,
   sale_price_total     double comment '���ۼ��ܶ�',
   account_id           int comment '�˻�ID',
   consignee            varchar(10) comment '�ջ���',
   mobile               varchar(20) comment '�ֻ�',
   address              varchar(50) comment 'סַ',
   province             varchar(20) comment 'ʡ��',
   city                 varchar(20) comment '����',
   country              varchar(20) comment '����',
   freight              double,
   product_total_price  double comment '��Ʒ�ܽ��',
   remark_customer      varchar(50) comment '��ע-�ͻ�',
   remark_system        varchar(50) comment '��ע-�ͷ�',
   add_time             datetime comment '���ʱ��',
   email                varchar(30) comment '����',
   ip                   varchar(30) comment 'IP��ַ',
   post_code            varchar(10) comment '�ʱ�',
   telephone            varchar(20) comment '�̶��绰',
   return_reason_id     tinyint,
   custom_return_reason varchar(200),
   refund_type_id       tinyint,
   custom_price         double comment '�Զ�����',
   return_oid           varchar(250) comment '�˵�����',
   order_info_id        int,
   return_status_id     tinyint,
   primary key (order_return_id)
);

alter table order_return comment '�˵�����,�˵�״̬��δ�ջ���ȷ��/���ջ����ʼ�ͨ�����ʼ첻ͨ��/�˻���ɣ������/�˻���ɣ�������ɣ���';

/*==============================================================*/
/* Table: order_return_detail                                   */
/*==============================================================*/
create table order_return_detail
(
   order_return_detail_id int not null,
   order_return_id      int,
   stock_id             int comment '����ID',
   return_oid           varchar(250) comment '�˵�����',
   no                   varchar(20) comment '���',
   suite_no             varchar(20),
   name                 varchar(50) comment '����',
   color                varchar(20),
   size                 varchar(20),
   quantity             smallint,
   subtotal             double comment 'С��',
   market_price         double comment '�г��۸�',
   sale_price           double comment '���ۼ�',
   deal_price           double comment '�ɽ���',
   discount_rate        double comment '�ۿ۱���',
   is_gift              tinyint comment '�Ƿ�Ϊ��Ʒ,0:�� 1:��',
   is_suite             tinyint comment '�Ƿ���װ,0:�� 1:��',
   shop_id              tinyint comment '�̵�,�̵������',
   suite_price          double comment '��װ��',
   suite_random         varchar(30) comment '������װ',
   warehouse_id         tinyint comment '�ֿ�,�ֿ������',
   primary key (order_return_detail_id)
);

alter table order_return_detail comment '�˵��ӱ�';

/*==============================================================*/
/* Table: order_source                                          */
/*==============================================================*/
create table order_source
(
   order_source_id      tinyint not null comment '������ԴID',
   name                 varchar(50) comment '����',
   primary key (order_source_id)
);

alter table order_source comment '������Դ��
ƽ̨�����Ա���������
���漶��ʵ���..';

/*==============================================================*/
/* Table: order_status_customer                                 */
/*==============================================================*/
create table order_status_customer
(
   order_status_customer_id tinyint not null comment '����״̬-�ͻ�',
   name                 varchar(50) comment '����',
   primary key (order_status_customer_id)
);

alter table order_status_customer comment '����״̬��-�ͻ�';

/*==============================================================*/
/* Table: order_status_system                                   */
/*==============================================================*/
create table order_status_system
(
   order_status_system_id tinyint not null comment '����״̬-�ͷ�',
   name                 varchar(50) comment '����',
   primary key (order_status_system_id)
);

alter table order_status_system comment '����״̬��-�ͷ�';

/*==============================================================*/
/* Table: page                                                  */
/*==============================================================*/
create table page
(
   name                 varchar(50) comment '����',
   page_id              int not null comment 'ҳ��ID',
   primary key (page_id)
);

alter table page comment 'ҳ���';

/*==============================================================*/
/* Table: pay                                                   */
/*==============================================================*/
create table pay
(
   pay_id               tinyint not null comment '֧����ʽID',
   pay_type_id          tinyint comment '֧������ID',
   name                 varchar(50) comment '����',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   order_by             int comment '����',
   primary key (pay_id)
);

alter table pay comment '֧����ʽ��';

/*==============================================================*/
/* Table: pay_type                                              */
/*==============================================================*/
create table pay_type
(
   pay_type_id          tinyint not null comment '֧������ID',
   name                 varchar(50) comment '����',
   primary key (pay_type_id)
);

alter table pay_type comment '֧�����ͱ�';

/*==============================================================*/
/* Table: picture                                               */
/*==============================================================*/
create table picture
(
   picture_id           int not null comment 'ͼƬID,����',
   product_id           int comment '��ƷID',
   color_id             int,
   picture_angle_id     tinyint,
   picture_size_id      tinyint,
   picture_url          varchar(100),
   is_default           tinyint comment 'Ĭ��ʹ��',
   primary key (picture_id)
);

alter table picture comment '�洢���е�ͼƬ��·���ַ�����URL��������洢����������Ҫ��������ֵ�������
ͼƬ�������򣺿��_��ɫ_��';

/*==============================================================*/
/* Table: picture_resource                                      */
/*==============================================================*/
create table picture_resource
(
   picture_resource_id  int not null,
   picture_resource_type_id tinyint,
   name                 varchar(50) comment '����',
   picture_url          varchar(100),
   add_admin_id         int,
   add_time             datetime comment '���ʱ��',
   description          varchar(50) comment '����',
   primary key (picture_resource_id)
);

alter table picture_resource comment 'ͼƬ��Դ��';

/*==============================================================*/
/* Table: picture_resource_type                                 */
/*==============================================================*/
create table picture_resource_type
(
   picture_resource_type_id tinyint not null,
   name                 varchar(50) comment '����',
   primary key (picture_resource_type_id)
);

alter table picture_resource_type comment 'ͼƬ��Դ���ͱ�';

/*==============================================================*/
/* Table: placeholder                                           */
/*==============================================================*/
create table placeholder
(
   placeholder_id       int not null,
   placeholder_name     varchar(20),
   param_name           varchar(20),
   is_fixed             tinyint comment '�Ƿ�̶�',
   primary key (placeholder_id)
);

alter table placeholder comment 'ռλ����
���磺����:${season}
ֵ�ɳ���Աһ��ȫ�����롣���������Ҫ�޸������ԱЭ����';

/*==============================================================*/
/* Table: product                                               */
/*==============================================================*/
create table product
(
   product_id           int not null comment '��ƷID',
   name                 varchar(50) comment '����',
   no                   varchar(20) comment '���',
   year                 varchar(10) comment '���',
   season               varchar(4) comment '����,����λ����������б�ʶ',
   sex                  varchar(4) comment '�Ա�,�С�Ů������',
   keywords             varchar(50) comment '�ؼ���,������',
   product_type_id      tinyint comment '��Ʒ����,��Ʒ���ͱ�����',
   sell_type_id         tinyint comment '��������,�������ͱ�����',
   is_alive             tinyint comment '���¼�״̬',
   brand_id             tinyint comment 'Ʒ��,Ʒ�Ʊ�����',
   category_id          smallint comment 'Ʒ��,Ʒ�������',
   shop_id              tinyint comment '�̵�,�̵������',
   warehouse_id         tinyint comment '�ֿ�,�ֿ������',
   supplier_id          tinyint comment '������,�����̱�����',
   product_style_id     tinyint comment '��Ʒ���,��Ʒ��������',
   product_story_id     tinyint comment '�������,������±�����',
   add_time             datetime comment '���ʱ��',
   modify_admin_id      int comment '�޸���',
   modify_time          datetime comment '����޸�ʱ��',
   primary key (product_id)
);

/*==============================================================*/
/* Table: product_filter                                        */
/*==============================================================*/
create table product_filter
(
   product_filter_id    smallint not null,
   name                 varchar(50) comment '����',
   parent_id            int comment '�ظ�',
   en_name              varchar(50),
   description          varchar(50) comment '����',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (product_filter_id)
);

alter table product_filter comment '��Ʒɸѡ��
��Ʒ�б���ҳ�������ɸѡ�����������¡��۸�����..';

/*==============================================================*/
/* Table: product_focus                                         */
/*==============================================================*/
create table product_focus
(
   product_focus_id     int not null,
   account_id           int comment '�˻�ID',
   product_id           int comment '��ƷID',
   color_id             int,
   add_time             datetime comment '���ʱ��',
   primary key (product_focus_id)
);

alter table product_focus comment '��ע��Ʒ��';

/*==============================================================*/
/* Table: product_group                                         */
/*==============================================================*/
create table product_group
(
   product_group_id     int not null comment 'Ⱥ��ID',
   code                 varchar(20) comment '���',
   name                 varchar(50) comment '����',
   condition_find       varchar(100) comment '��������',
   is_type              tinyint comment '������/�����/���߲���,0:����Ⱥ�� 1:���Ⱥ�� 2:����Ⱥ��+���Ⱥ��',
   is_shelf             tinyint comment '�Ƿ������,0:�� 1����',
   remark               varchar(200) comment '��ע',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (product_group_id)
);

alter table product_group comment 'Ⱥ���
���Ⱥ���к��۸񣬾�ֱ�Ӷ�ȡ�۸��ӱ�
��ѯ������������ݲ�ѯ������������Ʒ�ķ�Χ��
                                  -';

/*==============================================================*/
/* Table: product_order_by                                      */
/*==============================================================*/
create table product_order_by
(
   product_order_by_id  int not null,
   name                 varchar(50) comment '����',
   en_name              varchar(50),
   description          varchar(50) comment '����',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (product_order_by_id)
);

alter table product_order_by comment '��Ʒ�����';

/*==============================================================*/
/* Table: product_post                                          */
/*==============================================================*/
create table product_post
(
   product_post_id      int not null,
   account_id           int comment '�˻�ID',
   order_detail_id      int,
   stock_id             int comment '����ID',
   title                varchar(30),
   add_time             datetime comment '���ʱ��',
   content              varchar(50),
   parent_id            int comment '�ظ�',
   read_count           int comment '�������',
   reply_count          int comment '�ظ�����',
   account_level_id     tinyint comment '�˻��ȼ�ID',
   admin_id             smallint comment '�ظ���',
   review_result        varchar(30) comment '��˽��˵��',
   review_status        tinyint comment '���״̬,0δ��� 1��ͨ�� 2δͨ��',
   review_time          datetime comment '���ʱ��',
   primary key (product_post_id)
);

alter table product_post comment 'ɹ����
���ID��Ψһ��ʶ��һ��SKU����ɫ�룩��';

/*==============================================================*/
/* Table: product_post_picture                                  */
/*==============================================================*/
create table product_post_picture
(
   product_post_picture_id int not null,
   product_post_id      int,
   picture_url          varchar(100),
   remark               varchar(200) comment '��ע',
   is_default           tinyint comment 'Ĭ��ʹ��',
   primary key (product_post_picture_id)
);

alter table product_post_picture comment 'ɹ��ͼƬ˵����
ÿ��ɹ������Ӧ����ͼƬ��ÿ��ͼƬ���������в�ͬ��ͼƬ˵����';

/*==============================================================*/
/* Table: product_story                                         */
/*==============================================================*/
create table product_story
(
   product_story_id     tinyint not null comment '�������,������±�����',
   name                 varchar(50) comment '����',
   primary key (product_story_id)
);

alter table product_story comment '������±�';

/*==============================================================*/
/* Table: product_style                                         */
/*==============================================================*/
create table product_style
(
   product_style_id     tinyint not null comment '��Ʒ���,��Ʒ��������',
   name                 varchar(50) comment '����',
   primary key (product_style_id)
);

alter table product_style comment '��Ʒ���';

/*==============================================================*/
/* Table: product_type                                          */
/*==============================================================*/
create table product_type
(
   product_type_id      tinyint not null comment '��Ʒ����,��Ʒ���ͱ�����',
   name                 varchar(50) comment '����',
   primary key (product_type_id)
);

/*==============================================================*/
/* Table: questionnaire                                         */
/*==============================================================*/
create table questionnaire
(
   questionnaire_id     int not null,
   name                 varchar(50) comment '����',
   title                varchar(30),
   description          varchar(50) comment '����',
   page_id              int comment 'ҳ��ID',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (questionnaire_id)
);

alter table questionnaire comment '�ʾ�����';

/*==============================================================*/
/* Table: questionnaire_item                                    */
/*==============================================================*/
create table questionnaire_item
(
   questionnaire_item_id int not null,
   questionnaire_id     int,
   qa                   varchar(50) comment '��Ŀorѡ��',
   parent_id            int comment '�ظ�',
   answer_type          tinyint comment '��ѡ/��ѡ/����,0:��ѡ 1:��ѡ 2:����',
   is_text_field        tinyint comment '�Ƿ��������,0: û�� 1:��',
   primary key (questionnaire_item_id)
);

alter table questionnaire_item comment '�ʾ����ݱ�
�����IDΪnull ��Ϊ���⣬ÿ����Ŀ�ĸ�IDΪ�ñ�����е�ID';

/*==============================================================*/
/* Table: questionnaire_result                                  */
/*==============================================================*/
create table questionnaire_result
(
   questionnaire_result_id int not null,
   account_id           int comment '�˻�ID',
   questionnaire_id     int,
   item_name_id         int comment '�����,comment_item��ID',
   item_value_id        int comment '��,comment_item��ID',
   text_field           varchar(100) comment '�ı���������',
   add_time             datetime comment '���ʱ��',
   primary key (questionnaire_result_id)
);

alter table questionnaire_result comment '�ʾ�����¼��';

/*==============================================================*/
/* Table: questionnaire_statistics                              */
/*==============================================================*/
create table questionnaire_statistics
(
   questionnaire_statistics_id int not null,
   questionnaire_id     int,
   item_name_id         int comment '�����,comment_item��ID',
   item_value_id        int comment '��,comment_item��ID',
   frequency            int,
   percent              double comment 'ռ��',
   primary key (questionnaire_statistics_id)
);

alter table questionnaire_statistics comment '�ʾ�����¼��';

/*==============================================================*/
/* Table: refund_type                                           */
/*==============================================================*/
create table refund_type
(
   name                 varchar(50) comment '����',
   refund_type_id       tinyint not null,
   primary key (refund_type_id)
);

alter table refund_type comment '�˿ʽ��';

/*==============================================================*/
/* Table: region                                                */
/*==============================================================*/
create table region
(
   region_id            int not null comment 'ʡ����ID',
   name                 varchar(50) comment '����',
   parent_id            int comment '�ظ�',
   post_code            varchar(10) comment '�ʱ�',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (region_id)
);

alter table region comment '������';

/*==============================================================*/
/* Table: return_reason                                         */
/*==============================================================*/
create table return_reason
(
   return_reason_id     tinyint not null,
   name                 varchar(50) comment '����',
   primary key (return_reason_id)
);

alter table return_reason comment '�˻�ԭ���';

/*==============================================================*/
/* Table: return_status                                         */
/*==============================================================*/
create table return_status
(
   return_status_id     tinyint not null,
   name                 varchar(50) comment '����',
   primary key (return_status_id)
);

alter table return_status comment '�˵�״̬��';

/*==============================================================*/
/* Table: sale                                                  */
/*==============================================================*/
create table sale
(
   sale_id              int not null,
   name                 varchar(50) comment '����',
   sale_type_id         smallint comment '��������',
   priority             int comment '���ȼ�',
   sample_name          varchar(200) comment '�����',
   is_item              tinyint comment '�Ƿ�Ʒҳ��ʾ,0:Ĭ�ϲ���ʾ',
   description          varchar(50) comment '����',
   picture_resource_id  int,
   is_exclude           tinyint comment '�ų��ϵ,0:���ų�  1:�ų�',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   add_time             datetime comment '���ʱ��',
   primary key (sale_id)
);

alter table sale comment '������Ϣ��
���ȼ�������ж���ͬʱ����ʱ���������ȼ����ж���ִ���ĸ����
�������Ƿ��ڵ�Ʒ';

/*==============================================================*/
/* Table: sale_join_rule                                        */
/*==============================================================*/
create table sale_join_rule
(
   sale_join_rule_id    tinyint not null,
   sale_id              int,
   sale_rule_id         int,
   rule_value           varchar(30),
   order_by             int comment '����',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (sale_join_rule_id)
);

alter table sale_join_rule comment '������Ϣ-���������
�˱���ϳ��˸����Ļ�����Ҹ���˳��ɵ���ÿ�������ִ���Ⱥ�';

/*==============================================================*/
/* Table: sale_rule                                             */
/*==============================================================*/
create table sale_rule
(
   sale_rule_id         int not null,
   name                 varchar(50) comment '����',
   primary key (sale_rule_id)
);

alter table sale_rule comment '���������
�˱������д������֫�⣬�ֽ��һ�����Ĺ���Ȼ�󰴹����˳������ϳɻ������ֻ�Ƕ���������';

/*==============================================================*/
/* Table: sale_type                                             */
/*==============================================================*/
create table sale_type
(
   sale_type_id         smallint not null comment '��������',
   name                 varchar(50) comment '����',
   primary key (sale_type_id)
);

alter table sale_type comment '�������ͱ�
�Դ�������з��ű��࣬ÿ�����������ͬ�Ĺ���Ԥ��һ���Զ���Ĺ��򣬰����еĹ���ȫ�����С�';

/*==============================================================*/
/* Table: sale_type_join_rule                                   */
/*==============================================================*/
create table sale_type_join_rule
(
   sale_type_join_rule_id int not null,
   sale_type_id         smallint comment '��������',
   sale_rule_id         int,
   primary key (sale_type_join_rule_id)
);

alter table sale_type_join_rule comment '��������-�������������
�����ô��������¶�������Щ��������
�磺���������� ֮��';

/*==============================================================*/
/* Table: sell_type                                             */
/*==============================================================*/
create table sell_type
(
   sell_type_id         tinyint not null comment '��������,�������ͱ�����',
   name                 varchar(50) comment '����',
   primary key (sell_type_id)
);

alter table sell_type comment '�������ͱ�';

/*==============================================================*/
/* Table: shop                                                  */
/*==============================================================*/
create table shop
(
   shop_id              tinyint not null comment '�̵�,�̵������',
   name                 varchar(50) comment '����',
   primary key (shop_id)
);

alter table shop comment '�̵��';

/*==============================================================*/
/* Table: shopping_cart                                         */
/*==============================================================*/
create table shopping_cart
(
   shopping_cart_id     bigint not null,
   account_id           int comment '�˻�ID',
   total_quantity       int,
   add_time             datetime comment '���ʱ��',
   primary key (shopping_cart_id)
);

alter table shopping_cart comment '���ﳵ����';

/*==============================================================*/
/* Table: sms_template                                          */
/*==============================================================*/
create table sms_template
(
   sms_template_id      smallint not null,
   add_time             datetime comment '���ʱ��',
   content              varchar(50),
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   name                 varchar(50) comment '����',
   primary key (sms_template_id)
);

alter table sms_template comment '����ģ���
�洢ƽ̨����Ҫ�����ŵĸ���ģ�壬ģ������֧��ͨ���${oid},${name}��';

/*==============================================================*/
/* Table: supplier                                              */
/*==============================================================*/
create table supplier
(
   supplier_id          tinyint not null comment '������,�����̱�����',
   name                 varchar(50) comment '����',
   primary key (supplier_id)
);

alter table supplier comment '�����̱�';

/*==============================================================*/
/* Table: system_param                                          */
/*==============================================================*/
create table system_param
(
   system_param_id      smallint not null,
   name                 varchar(50) comment '����',
   param_key            varchar(20) comment '������',
   param_value          varchar(20) comment '����ֵ',
   add_time             datetime comment '���ʱ��',
   is_enable            tinyint comment '�Ƿ�����,0:������ 1:����',
   primary key (system_param_id)
);

alter table system_param comment 'ϵͳ������';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int not null comment '�û�ID',
   name                 varchar(50) comment '����',
   employer             varchar(30) comment '������λ����',
   mobile               varchar(20) comment '�ֻ�',
   address              varchar(50) comment 'סַ',
   email                varchar(30) comment '����',
   idcard               varchar(20) comment '���֤',
   sex                  varchar(4) comment '�Ա�,�С�Ů������',
   birthday             datetime comment '����',
   region_province_id   int comment 'ʡ��',
   region_city_id       int comment '����',
   region_country_id    int comment '����',
   telephone            varchar(20) comment '�̶��绰',
   post_code            varchar(10) comment '�ʱ�',
   income_month         varchar(10) comment '������',
   job                  varchar(20) comment 'ְҵ',
   hobby                varchar(30) comment 'ϲ��',
   primary key (user_id)
);

alter table user comment '�û�������Ϣ��,һ���û����԰�������˻��������˻�֮���ǿ����л���';

/*==============================================================*/
/* Table: warehouse                                             */
/*==============================================================*/
create table warehouse
(
   warehouse_id         tinyint not null comment '�ֿ�,�ֿ������',
   name                 varchar(50) comment '����',
   primary key (warehouse_id)
);

alter table warehouse comment '�ֿ��';

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

