/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-01-25 00:48:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sh_acategory`
-- ----------------------------
DROP TABLE IF EXISTS `sh_acategory`;
CREATE TABLE `sh_acategory` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_acategory
-- ----------------------------
INSERT INTO `sh_acategory` VALUES ('1', '商城帮助', '0', '0', 'help');
INSERT INTO `sh_acategory` VALUES ('2', '商城公告', '0', '0', 'notice');
INSERT INTO `sh_acategory` VALUES ('3', '内置文章', '0', '0', 'system');

-- ----------------------------
-- Table structure for `sh_ad`
-- ----------------------------
DROP TABLE IF EXISTS `sh_ad`;
CREATE TABLE `sh_ad` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(30) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL COMMENT 'home  首页',
  `ad_img` varchar(60) DEFAULT NULL,
  `link` varchar(60) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `sh_address`
-- ----------------------------
DROP TABLE IF EXISTS `sh_address`;
CREATE TABLE `sh_address` (
  `addr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `region_id` int(10) unsigned DEFAULT NULL,
  `region_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `phone_tel` varchar(60) DEFAULT NULL,
  `phone_mob` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`addr_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_address
-- ----------------------------
INSERT INTO `sh_address` VALUES ('2', '1', '张君', '3', '中国	浙江	杭州市', '中国杭州', '333123', '13456265351', '13456265351');

-- ----------------------------
-- Table structure for `sh_article`
-- ----------------------------
DROP TABLE IF EXISTS `sh_article`;
CREATE TABLE `sh_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `cate_id` int(10) NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) DEFAULT NULL,
  `content` text,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `if_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `code` (`code`),
  KEY `cate_id` (`cate_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_article
-- ----------------------------
INSERT INTO `sh_article` VALUES ('1', 'eula', '用户服务协议', '3', '0', '', '<p>特别提醒用户认真阅读本《用户服务协议》(下称《协议》) 中各条款。除非您接受本《协议》条款，否则您无权使用本网站提供的相关服务。您的使用行为将视为对本《协议》的接受，并同意接受本《协议》各项条款的约束。 <br /> <br /> <strong>一、定义</strong><br /></p>\r\n<ol>\r\n<li>\"用户\"指符合本协议所规定的条件，同意遵守本网站各种规则、条款（包括但不限于本协议），并使用本网站的个人或机构。</li>\r\n<li>\"卖家\"是指在本网站上出售物品的用户。\"买家\"是指在本网站购买物品的用户。</li>\r\n<li>\"成交\"指买家根据卖家所刊登的交易要求，在特定时间内提出最优的交易条件，因而取得依其提出的条件购买该交易物品的权利。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>二、用户资格</strong><br /> <br /> 只有符合下列条件之一的人员或实体才能申请成为本网站用户，可以使用本网站的服务。</p>\r\n<ol>\r\n<li>年满十八岁，并具有民事权利能力和民事行为能力的自然人；</li>\r\n<li>未满十八岁，但监护人（包括但不仅限于父母）予以书面同意的自然人；</li>\r\n<li>根据中国法律或设立地法律、法规和/或规章成立并合法存在的公司、企事业单位、社团组织和其他组织。</li>\r\n</ol>\r\n<p><br /> 无民事行为能力人、限制民事行为能力人以及无经营或特定经营资格的组织不当注册为本网站用户或超过其民事权利或行为能力范围从事交易的，其与本网站之间的协议自始无效，本网站一经发现，有权立即注销该用户，并追究其使用本网站\"服务\"的一切法律责任。<br /> <br /> <strong>三.用户的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>用户有权根据本协议的规定及本网站发布的相关规则，利用本网站网上交易平台登录物品、发布交易信息、查询物品信息、购买物品、与其他用户订立物品买卖合同、在本网站社区发帖、参加本网站的有关活动及有权享受本网站提供的其他的有关资讯及信息服务。</li>\r\n<li>用户有权根据需要更改密码和交易密码。用户应对以该用户名进行的所有活动和事件负全部责任。</li>\r\n<li>用户有义务确保向本网站提供的任何资料、注册信息真实准确，包括但不限于真实姓名、身份证号、联系电话、地址、邮政编码等。保证本网站及其他用户可以通过上述联系方式与自己进行联系。同时，用户也有义务在相关资料实际变更时及时更新有关注册资料。</li>\r\n<li>用户不得以任何形式擅自转让或授权他人使用自己在本网站的用户帐号。</li>\r\n<li>用户有义务确保在本网站网上交易平台上登录物品、发布的交易信息真实、准确，无误导性。</li>\r\n<li>用户不得在本网站网上交易平台买卖国家禁止销售的或限制销售的物品、不得买卖侵犯他人知识产权或其他合法权益的物品，也不得买卖违背社会公共利益或公共道德的物品。</li>\r\n<li>用户不得在本网站发布各类违法或违规信息。包括但不限于物品信息、交易信息、社区帖子、物品留言，店铺留言，评价内容等。</li>\r\n<li>用户在本网站交易中应当遵守诚实信用原则，不得以干预或操纵物品价格等不正当竞争方式扰乱网上交易秩序，不得从事与网上交易无关的不当行为，不得在交易平台上发布任何违法信息。</li>\r\n<li>用户不应采取不正当手段（包括但不限于虚假交易、互换好评等方式）提高自身或他人信用度，或采用不正当手段恶意评价其他用户，降低其他用户信用度。</li>\r\n<li>用户承诺自己在使用本网站网上交易平台实施的所有行为遵守国家法律、法规和本网站的相关规定以及各种社会公共利益或公共道德。对于任何法律后果的发生，用户将以自己的名义独立承担所有相应的法律责任。</li>\r\n<li>用户在本网站网上交易过程中如与其他用户因交易产生纠纷，可以请求本网站从中予以协调。用户如发现其他用户有违法或违反本协议的行为，可以向本网站举报。如用户因网上交易与其他用户产生诉讼的，用户有权通过司法部门要求本网站提供相关资料。</li>\r\n<li>用户应自行承担因交易产生的相关费用，并依法纳税。</li>\r\n<li>未经本网站书面允许，用户不得将本网站资料以及在交易平台上所展示的任何信息以复制、修改、翻译等形式制作衍生作品、分发或公开展示。</li>\r\n<li>用户同意接收来自本网站的信息，包括但不限于活动信息、交易信息、促销信息等。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>四、 本网站的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>本网站不是传统意义上的\"拍卖商\"，仅为用户提供一个信息交流、进行物品买卖的平台，充当买卖双方之间的交流媒介，而非买主或卖主的代理商、合伙  人、雇员或雇主等经营关系人。公布在本网站上的交易物品是用户自行上传进行交易的物品，并非本网站所有。对于用户刊登物品、提供的信息或参与竞标的过程，  本网站均不加以监视或控制，亦不介入物品的交易过程，包括运送、付款、退款、瑕疵担保及其它交易事项，且不承担因交易物品存在品质、权利上的瑕疵以及交易  方履行交易协议的能力而产生的任何责任，对于出现在拍卖上的物品品质、安全性或合法性，本网站均不予保证。</li>\r\n<li>本网站有义务在现有技术水平的基础上努力确保整个网上交易平台的正常运行，尽力避免服务中断或将中断时间限制在最短时间内，保证用户网上交易活动的顺利进行。</li>\r\n<li>本网站有义务对用户在注册使用本网站网上交易平台中所遇到的问题及反映的情况及时作出回复。 </li>\r\n<li>本网站有权对用户的注册资料进行查阅，对存在任何问题或怀疑的注册资料，本网站有权发出通知询问用户并要求用户做出解释、改正，或直接做出处罚、删除等处理。</li>\r\n<li>用  户因在本网站网上交易与其他用户产生纠纷的，用户通过司法部门或行政部门依照法定程序要求本网站提供相关资料，本网站将积极配合并提供有关资料；用户将纠  纷告知本网站，或本网站知悉纠纷情况的，经审核后，本网站有权通过电子邮件及电话联系向纠纷双方了解纠纷情况，并将所了解的情况通过电子邮件互相通知对  方。 </li>\r\n<li>因网上交易平台的特殊性，本网站没有义务对所有用户的注册资料、所有的交易行为以及与交易有关的其他事项进行事先审查，但如发生以下情形，本网站有权限制用户的活动、向用户核实有关资料、发出警告通知、暂时中止、无限期地中止及拒绝向该用户提供服务：         \r\n<ul>\r\n<li>用户违反本协议或因被提及而纳入本协议的文件；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据，而本网站无法联系到该用户核证或验证该用户向本网站提供的任何资料；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据。本网站以普通非专业交易者的知识水平标准对相关内容进行判别，可以明显认为这些内容或行为可能对本网站用户或本网站造成财务损失或法律责任。 </li>\r\n</ul>\r\n</li>\r\n<li>在反网络欺诈行动中，本着保护广大用户利益的原则，当用户举报自己交易可能存在欺诈而产生交易争议时，本网站有权通过表面判断暂时冻结相关用户账号，并有权核对当事人身份资料及要求提供交易相关证明材料。</li>\r\n<li>根据国家法律法规、本协议的内容和本网站所掌握的事实依据，可以认定用户存在违法或违反本协议行为以及在本网站交易平台上的其他不当行为，本网站有权在本网站交易平台及所在网站上以网络发布形式公布用户的违法行为，并有权随时作出删除相关信息，而无须征得用户的同意。</li>\r\n<li>本  网站有权在不通知用户的前提下删除或采取其他限制性措施处理下列信息：包括但不限于以规避费用为目的；以炒作信用为目的；存在欺诈等恶意或虚假内容；与网  上交易无关或不是以交易为目的；存在恶意竞价或其他试图扰乱正常交易秩序因素；该信息违反公共利益或可能严重损害本网站和其他用户合法利益的。</li>\r\n<li>用  户授予本网站独家的、全球通用的、永久的、免费的信息许可使用权利，本网站有权对该权利进行再授权，依此授权本网站有权(全部或部份地)  使用、复制、修订、改写、发布、翻译、分发、执行和展示用户公示于网站的各类信息或制作其派生作品，以现在已知或日后开发的任何形式、媒体或技术，将上述  信息纳入其他作品内。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>五、服务的中断和终止</strong><br /></p>\r\n<ol>\r\n<li>在  本网站未向用户收取相关服务费用的情况下，本网站可自行全权决定以任何理由  (包括但不限于本网站认为用户已违反本协议的字面意义和精神，或用户在超过180天内未登录本网站等)  终止对用户的服务，并不再保存用户在本网站的全部资料（包括但不限于用户信息、商品信息、交易信息等）。同时本网站可自行全权决定，在发出通知或不发出通  知的情况下，随时停止提供全部或部分服务。服务终止后，本网站没有义务为用户保留原用户资料或与之相关的任何信息，或转发任何未曾阅读或发送的信息给用户  或第三方。此外，本网站不就终止对用户的服务而对用户或任何第三方承担任何责任。 </li>\r\n<li>如用户向本网站提出注销本网站注册用户身份，需经本网站审核同意，由本网站注销该注册用户，用户即解除与本网站的协议关系，但本网站仍保留下列权利：         \r\n<ul>\r\n<li>用户注销后，本网站有权保留该用户的资料,包括但不限于以前的用户资料、店铺资料、商品资料和交易记录等。 </li>\r\n<li>用户注销后，如用户在注销前在本网站交易平台上存在违法行为或违反本协议的行为，本网站仍可行使本协议所规定的权利。 </li>\r\n</ul>\r\n</li>\r\n<li>如存在下列情况，本网站可以通过注销用户的方式终止服务：         \r\n<ul>\r\n<li>在用户违反本协议相关规定时，本网站有权终止向该用户提供服务。本网站将在中断服务时通知用户。但如该用户在被本网站终止提供服务后，再一次直接或间接或以他人名义注册为本网站用户的，本网站有权再次单方面终止为该用户提供服务；</li>\r\n<li>一旦本网站发现用户注册资料中主要内容是虚假的，本网站有权随时终止为该用户提供服务； </li>\r\n<li>本协议终止或更新时，用户未确认新的协议的。 </li>\r\n<li>其它本网站认为需终止服务的情况。 </li>\r\n</ul>\r\n</li>\r\n<li>因用户违反相关法律法规或者违反本协议规定等原因而致使本网站中断、终止对用户服务的，对于服务中断、终止之前用户交易行为依下列原则处理：         \r\n<ul>\r\n<li>本网站有权决定是否在中断、终止对用户服务前将用户被中断或终止服务的情况和原因通知用户交易关系方，包括但不限于对该交易有意向但尚未达成交易的用户,参与该交易竞价的用户，已达成交易要约用户。</li>\r\n<li>服务中断、终止之前，用户已经上传至本网站的物品尚未交易或交易尚未完成的，本网站有权在中断、终止服务的同时删除此项物品的相关信息。 </li>\r\n<li>服务中断、终止之前，用户已经就其他用户出售的具体物品作出要约，但交易尚未结束，本网站有权在中断或终止服务的同时删除该用户的相关要约和信息。</li>\r\n</ul>\r\n</li>\r\n<li>本网站若因用户的行为（包括但不限于刊登的商品、在本网站社区发帖等）侵害了第三方的权利或违反了相关规定，而受到第三方的追偿或受到主管机关的处分时，用户应赔偿本网站因此所产生的一切损失及费用。</li>\r\n<li>对违反相关法律法规或者违反本协议规定，且情节严重的用户，本网站有权终止该用户的其它服务。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>六、协议的修订</strong><br /> <br /> 本协议可由本网站随时修订，并将修订后的协议公告于本网站之上，修订后的条款内容自公告时起生效，并成为本协议的一部分。用户若在本协议修改之后，仍继续使用本网站，则视为用户接受和自愿遵守修订后的协议。本网站行使修改或中断服务时，不需对任何第三方负责。<br /> <br /> <strong>七、 本网站的责任范围 </strong><br /> <br /> 当用户接受该协议时，用户应明确了解并同意∶</p>\r\n<ol>\r\n<li>是否经由本网站下载或取得任何资料，由用户自行考虑、衡量并且自负风险，因下载任何资料而导致用户电脑系统的任何损坏或资料流失，用户应负完全责任。</li>\r\n<li>用户经由本网站取得的建议和资讯，无论其形式或表现，绝不构成本协议未明示规定的任何保证。</li>\r\n<li>基于以下原因而造成的利润、商誉、使用、资料损失或其它无形损失，本网站不承担任何直接、间接、附带、特别、衍生性或惩罚性赔偿（即使本网站已被告知前款赔偿的可能性）：         \r\n<ul>\r\n<li>本网站的使用或无法使用。</li>\r\n<li>经由或通过本网站购买或取得的任何物品，或接收之信息，或进行交易所随之产生的替代物品及服务的购买成本。</li>\r\n<li>用户的传输或资料遭到未获授权的存取或变更。</li>\r\n<li>本网站中任何第三方之声明或行为。</li>\r\n<li>本网站其它相关事宜。</li>\r\n</ul>\r\n</li>\r\n<li>本网站只是为用户提供一个交易的平台，对于用户所刊登的交易物品的合法性、真实性及其品质，以及用户履行交易的能力等，本网站一律不负任何担保责任。用户如果因使用本网站，或因购买刊登于本网站的任何物品，而受有损害时，本网站不负任何补偿或赔偿责任。</li>\r\n<li>本  网站提供与其它互联网上的网站或资源的链接，用户可能会因此连结至其它运营商经营的网站，但不表示本网站与这些运营商有任何关系。其它运营商经营的网站均  由各经营者自行负责，不属于本网站控制及负责范围之内。对于存在或来源于此类网站或资源的任何内容、广告、产品或其它资料，本网站亦不予保证或负责。因使  用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、物品或服务所产生的任何损害或损失，本网站不负任何直接或间接的责任。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>八.、不可抗力</strong><br /> <br /> 因不可抗力或者其他意外事件，使得本协议的履行不可能、不必要或者无意义的，双方均不承担责任。本合同所称之不可抗力意指不能预见、不能避免并不能克服的  客观情况，包括但不限于战争、台风、水灾、火灾、雷击或地震、罢工、暴动、法定疾病、黑客攻击、网络病毒、电信部门技术管制、政府行为或任何其它自然或人  为造成的灾难等客观情况。<br /> <br /> <strong>九、争议解决方式</strong><br /></p>\r\n<ol>\r\n<li>本协议及其修订本的有效性、履行和与本协议及其修订本效力有关的所有事宜，将受中华人民共和国法律管辖，任何争议仅适用中华人民共和国法律。</li>\r\n<li>因  使用本网站服务所引起与本网站的任何争议，均应提交深圳仲裁委员会按照该会届时有效的仲裁规则进行仲裁。相关争议应单独仲裁，不得与任何其它方的争议在任  何仲裁中合并处理，该仲裁裁决是终局，对各方均有约束力。如果所涉及的争议不适于仲裁解决，用户同意一切争议由人民法院管辖。</li>\r\n</ol>', '255', '1', '1240122848');
INSERT INTO `sh_article` VALUES ('2', 'cert_autonym', '什么是实名认证', '3', '0', '', '<p><strong>什么是实名认证？</strong></p>\r\n<p>&ldquo;认证店铺&rdquo;服务是一项对店主身份真实性识别服务。店主可以通过站内PM、电话或管理员EMail的方式 联系并申请该项认证。经过管理员审核确认了店主的真实身份，就可以开通该项认证。</p>\r\n<p>通过该认证，可以说明店主身份的真实有效性，为买家在网络交易的过程中提供一定的信心和保证。</p>\r\n<p><strong>认证申请的方式：</strong></p>\r\n<p>Email：XXXX@XX.com</p>\r\n<p>管理员：XXXXXX</p>', '255', '1', '1240122848');
INSERT INTO `sh_article` VALUES ('3', 'cert_material', '什么是实体店铺认证', '3', '0', '', '<p><strong>什么是实体店铺认证？</strong></p>\r\n<p>&ldquo;认证店铺&rdquo;服务是一项对店主身份真实性识别服务。店主可以通过站内PM、电话或管理员EMail的方式 联系并申请该项认证。经过管理员审核确认了店主的真实身份，就可以开通该项认证。</p>\r\n<p>通过该认证，可以说明店主身份的真实有效性，为买家在网络交易的过程中提供一定的信心和保证。</p>\r\n<p><strong>认证申请的方式：</strong></p>\r\n<p>Email：XXXX@XX.com</p>\r\n<p>管理员：XXXXXX</p>', '255', '1', '1240122848');
INSERT INTO `sh_article` VALUES ('4', 'setup_store', '开店协议', '3', '0', '', '<p>使用本公司服务所须遵守的条款和条件。<br /><br />1.用户资格<br />本公司的服务仅向适用法律下能够签订具有法律约束力的合同的个人提供并仅由其使用。在不限制前述规定的前提下，本公司的服务不向18周岁以下或被临时或无限期中止的用户提供。如您不合资格，请勿使用本公司的服务。此外，您的帐户（包括信用评价）和用户名不得向其他方转让或出售。另外，本公司保留根据其意愿中止或终止您的帐户的权利。<br /><br />2.您的资料（包括但不限于所添加的任何商品）不得：<br />*具有欺诈性、虚假、不准确或具误导性；<br />*侵犯任何第三方著作权、专利权、商标权、商业秘密或其他专有权利或发表权或隐私权；<br />*违反任何适用的法律或法规（包括但不限于有关出口管制、消费者保护、不正当竞争、刑法、反歧视或贸易惯例/公平贸易法律的法律或法规）；<br />*有侮辱或者诽谤他人，侵害他人合法权益的内容；<br />*有淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的内容；<br />*包含可能破坏、改变、删除、不利影响、秘密截取、未经授权而接触或征用任何系统、数据或个人资料的任何病毒、特洛依木马、蠕虫、定时炸弹、删除蝇、复活节彩蛋、间谍软件或其他电脑程序；<br /><br />3.违约<br />如发生以下情形，本公司可能限制您的活动、立即删除您的商品、向本公司社区发出有关您的行为的警告、发出警告通知、暂时中止、无限期地中止或终止您的用户资格及拒绝向您提供服务：<br />(a)您违反本协议或纳入本协议的文件；<br />(b)本公司无法核证或验证您向本公司提供的任何资料；<br />(c)本公司相信您的行为可能对您、本公司用户或本公司造成损失或法律责任。<br /><br />4.责任限制<br />本公司、本公司的关联公司和相关实体或本公司的供应商在任何情况下均不就因本公司的网站、本公司的服务或本协议而产生或与之有关的利润损失或任何特别、间接或后果性的损害（无论以何种方式产生，包括疏忽）承担任何责任。您同意您就您自身行为之合法性单独承担责任。您同意，本公司和本公司的所有关联公司和相关实体对本公司用户的行为的合法性及产生的任何结果不承担责任。<br /><br />5.无代理关系<br />用户和本公司是独立的合同方，本协议无意建立也没有创立任何代理、合伙、合营、雇员与雇主或特许经营关系。本公司也不对任何用户及其网上交易行为做出明示或默许的推荐、承诺或担保。<br /><br />6.一般规定<br />本协议在所有方面均受中华人民共和国法律管辖。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。</p>', '255', '1', '1240122848');
INSERT INTO `sh_article` VALUES ('5', 'msn_privacy', 'MSN在线通隐私策略', '3', '0', '', '<p>Msn在线通隐私策略旨在说明您在本网站使用Msn在线通功能时我们如何保护您的Msn帐号信息。<br /> 我们认为隐私权非常重要。我们希望此隐私保护中心有助于您在本网站更好使用Msn在线通<br /> <strong>我们收集的信息</strong></p><blockquote>* 您在本网站激活Msn在线通时,程序将会记录您的Msn在线通帐号</blockquote><p><br /> <strong>您的选择</strong></p><blockquote>* 您可以在本网站随时注销您的Msn在线通帐号</blockquote><p><br /> <strong>其他隐私声明</strong></p><blockquote>* 如果我们需要改变本网站Msn在线通的隐私策略, 我们会把相关的改动在此页面发布.</blockquote>', '255', '1', '1240122848');
INSERT INTO `sh_article` VALUES ('6', '', '帮助1', '1', '0', '', '<p>3123eqweqwe</p>', '255', '1', '1429698505');

-- ----------------------------
-- Table structure for `sh_brand`
-- ----------------------------
DROP TABLE IF EXISTS `sh_brand`;
CREATE TABLE `sh_brand` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) NOT NULL DEFAULT '',
  `brand_logo` varchar(255) DEFAULT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `if_show` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `tag` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`brand_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `sh_gcategory`
-- ----------------------------
DROP TABLE IF EXISTS `sh_gcategory`;
CREATE TABLE `sh_gcategory` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `if_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`cate_id`),
  KEY `store_id` (`store_id`,`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_gcategory
-- ----------------------------
INSERT INTO `sh_gcategory` VALUES ('1', '2', '纸尿裤', '0', '1', '1');
INSERT INTO `sh_gcategory` VALUES ('2', '2', '湿巾', '0', '2', '1');
INSERT INTO `sh_gcategory` VALUES ('3', '2', '奶粉', '0', '3', '1');
INSERT INTO `sh_gcategory` VALUES ('4', '0', '母婴', '0', '1', '1');
INSERT INTO `sh_gcategory` VALUES ('5', '0', '出行', '0', '255', '1');
INSERT INTO `sh_gcategory` VALUES ('6', '0', '服饰', '0', '255', '1');
INSERT INTO `sh_gcategory` VALUES ('7', '0', '奶粉', '4', '255', '1');
INSERT INTO `sh_gcategory` VALUES ('8', '0', '米糊', '4', '255', '1');
INSERT INTO `sh_gcategory` VALUES ('9', '0', '牛奶奶粉', '7', '255', '1');

-- ----------------------------
-- Table structure for `sh_goods`
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods`;
CREATE TABLE `sh_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT 'material',
  `goods_name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_name` varchar(255) NOT NULL DEFAULT '',
  `brand` varchar(100) NOT NULL,
  `spec_qty` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `spec_name_1` varchar(60) NOT NULL DEFAULT '',
  `spec_name_2` varchar(60) NOT NULL DEFAULT '',
  `if_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `closed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `close_reason` varchar(255) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `default_spec` int(11) unsigned NOT NULL DEFAULT '0',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `recommended` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `cate_id_1` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_id_2` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_id_3` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_id_4` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tags` varchar(102) NOT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `store_id` (`store_id`),
  KEY `cate_id` (`cate_id`),
  KEY `cate_id_1` (`cate_id_1`),
  KEY `cate_id_2` (`cate_id_2`),
  KEY `cate_id_3` (`cate_id_3`),
  KEY `cate_id_4` (`cate_id_4`),
  KEY `brand` (`brand`(10)),
  KEY `tags` (`tags`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_goods
-- ----------------------------
INSERT INTO `sh_goods` VALUES ('1', '2', 'material', '日本花王 婴儿纸尿裤 大号L54片', '<p>本店所采购的花王纸尿裤都是一手操作，不受水货、假货、毛货的渗透，保证货源是日本本土正货，保真境外购！中华保险为您保驾护航，假一赔50万; 14天无理由退货；零利润回馈，全网最低价！</p>', '9', '母婴	奶粉	牛奶奶粉', '花王', '0', '', '', '1', '0', null, '1425851545', '1425851768', '1', 'data/files/store_2/goods_133/small_201503091348536895.jpg', '1', '4', '7', '9', '0', '154.00', ',纸尿裤,婴儿,花王,');
INSERT INTO `sh_goods` VALUES ('2', '2', 'material', '澳大利亚 A2 婴儿配方奶粉3段900g 100%原装原罐进口 大于1岁', '<p>【澳大利亚原装进口】甄选自然源生的A2 &beta;－酪蛋白，有助于宝宝消化【限时疯抢】适1岁以上的宝宝，全网底价【极速送达】保税区直邮，顺丰发货，快速到手</p>', '9', '母婴	奶粉	牛奶奶粉', '美林', '1', '颜色', '', '1', '0', null, '1427998752', '1436228281', '3', 'data/files/store_2/goods_167/small_201504031016075387.jpg', '1', '4', '7', '9', '0', '11.00', '');

-- ----------------------------
-- Table structure for `sh_goods_attr`
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods_attr`;
CREATE TABLE `sh_goods_attr` (
  `gattr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `attr_value` varchar(255) NOT NULL DEFAULT '',
  `attr_id` int(10) unsigned DEFAULT NULL,
  `sort_order` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`gattr_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_goods_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `sh_goods_image`
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods_image`;
CREATE TABLE `sh_goods_image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `image_url` varchar(255) NOT NULL DEFAULT '',
  `thumbnail` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `file_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_goods_image
-- ----------------------------
INSERT INTO `sh_goods_image` VALUES ('1', '1', 'data/files/store_2/goods_133/201503091348536895.jpg', 'data/files/store_2/goods_133/small_201503091348536895.jpg', '1', '1');
INSERT INTO `sh_goods_image` VALUES ('2', '2', 'data/files/store_2/goods_167/201504031016075387.jpg', 'data/files/store_2/goods_167/small_201504031016075387.jpg', '1', '2');

-- ----------------------------
-- Table structure for `sh_goods_spec`
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods_spec`;
CREATE TABLE `sh_goods_spec` (
  `spec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `spec_1` varchar(60) NOT NULL DEFAULT '',
  `spec_2` varchar(60) NOT NULL DEFAULT '',
  `color_rgb` varchar(7) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`spec_id`),
  KEY `goods_id` (`goods_id`),
  KEY `price` (`price`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_goods_spec
-- ----------------------------
INSERT INTO `sh_goods_spec` VALUES ('1', '1', '', '', '', '154.00', '998', '');
INSERT INTO `sh_goods_spec` VALUES ('3', '2', '红色', '', '', '11.00', '11', '1');
INSERT INTO `sh_goods_spec` VALUES ('6', '2', '黄色', '', '', '11.00', '20', '2');

-- ----------------------------
-- Table structure for `sh_goods_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods_statistics`;
CREATE TABLE `sh_goods_statistics` (
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `collects` int(10) unsigned NOT NULL DEFAULT '0',
  `carts` int(10) unsigned NOT NULL DEFAULT '0',
  `orders` int(10) unsigned NOT NULL DEFAULT '0',
  `sales` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_goods_statistics
-- ----------------------------
INSERT INTO `sh_goods_statistics` VALUES ('1', '62', '1', '7', '2', '0', '0');
INSERT INTO `sh_goods_statistics` VALUES ('2', '23', '0', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for `sh_member`
-- ----------------------------
DROP TABLE IF EXISTS `sh_member`;
CREATE TABLE `sh_member` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `real_name` varchar(60) DEFAULT NULL,
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `phone_tel` varchar(60) DEFAULT NULL,
  `phone_mob` varchar(60) DEFAULT NULL,
  `im_qq` varchar(60) DEFAULT NULL,
  `im_msn` varchar(60) DEFAULT NULL,
  `im_skype` varchar(60) DEFAULT NULL,
  `im_yahoo` varchar(60) DEFAULT NULL,
  `im_aliww` varchar(60) DEFAULT NULL,
  `reg_time` int(10) unsigned DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `ugrade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `portrait` varchar(255) DEFAULT NULL,
  `outer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `activation` varchar(60) DEFAULT NULL,
  `feed_config` text NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `outer_id` (`outer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_member
-- ----------------------------
INSERT INTO `sh_member` VALUES ('1', 'admin', '1149502217@qq.com', 'e10adc3949ba59abbe56e057f20f883e', null, '0', null, null, null, null, null, null, null, null, '1425869615', '1453551200', '127.0.0.1', '41', '0', null, '0', null, '');
INSERT INTO `sh_member` VALUES ('2', 'junnyboy', '1149502217@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '', '0', '0000-00-00', null, null, '', '', null, null, null, '1425842425', '1448505287', '127.0.0.1', '32', '0', 'data/files/mall/portrait/1/2.jpg', '0', null, '');

-- ----------------------------
-- Table structure for `sh_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `sh_navigation`;
CREATE TABLE `sh_navigation` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(60) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `open_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_navigation
-- ----------------------------
INSERT INTO `sh_navigation` VALUES ('1', 'middle', '母婴', 'index.php?app=search&cate_id=4', '1', '0');
INSERT INTO `sh_navigation` VALUES ('2', 'header', '商城帮助', '', '2', '0');

-- ----------------------------
-- Table structure for `sh_partner`
-- ----------------------------
DROP TABLE IF EXISTS `sh_partner`;
CREATE TABLE `sh_partner` (
  `partner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) DEFAULT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`partner_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_partner
-- ----------------------------

-- ----------------------------
-- Table structure for `sh_payment`
-- ----------------------------
DROP TABLE IF EXISTS `sh_payment`;
CREATE TABLE `sh_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_code` varchar(20) NOT NULL DEFAULT '',
  `payment_name` varchar(100) NOT NULL DEFAULT '',
  `payment_desc` varchar(255) DEFAULT NULL,
  `config` text,
  `is_online` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`payment_id`),
  KEY `store_id` (`store_id`),
  KEY `payment_code` (`payment_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_payment
-- ----------------------------
INSERT INTO `sh_payment` VALUES ('1', '2', 'alipay', '支付宝', '11', 'a:5:{s:14:\"alipay_account\";s:19:\"15881105687@163.com\";s:10:\"alipay_key\";s:32:\"kdth4dr7l76dv7peeyd55qk99qeqafot\";s:14:\"alipay_partner\";s:16:\"2088611730330404\";s:14:\"alipay_service\";s:21:\"trade_create_by_buyer\";s:5:\"pcode\";s:0:\"\";}', '1', '1', '1');

-- ----------------------------
-- Table structure for `sh_region`
-- ----------------------------
DROP TABLE IF EXISTS `sh_region`;
CREATE TABLE `sh_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_region
-- ----------------------------
INSERT INTO `sh_region` VALUES ('1', '中国', '0', '255');
INSERT INTO `sh_region` VALUES ('2', '北京', '1', '255');
INSERT INTO `sh_region` VALUES ('3', '安徽', '1', '255');
INSERT INTO `sh_region` VALUES ('4', '福建', '1', '255');
INSERT INTO `sh_region` VALUES ('5', '甘肃', '1', '255');
INSERT INTO `sh_region` VALUES ('6', '广东', '1', '255');
INSERT INTO `sh_region` VALUES ('7', '广西', '1', '255');
INSERT INTO `sh_region` VALUES ('8', '贵州', '1', '255');
INSERT INTO `sh_region` VALUES ('9', '海南', '1', '255');
INSERT INTO `sh_region` VALUES ('10', '河北', '1', '255');
INSERT INTO `sh_region` VALUES ('11', '河南', '1', '255');
INSERT INTO `sh_region` VALUES ('12', '黑龙江', '1', '255');
INSERT INTO `sh_region` VALUES ('13', '湖北', '1', '255');
INSERT INTO `sh_region` VALUES ('14', '湖南', '1', '255');
INSERT INTO `sh_region` VALUES ('15', '吉林', '1', '255');
INSERT INTO `sh_region` VALUES ('16', '江苏', '1', '255');
INSERT INTO `sh_region` VALUES ('17', '江西', '1', '255');
INSERT INTO `sh_region` VALUES ('18', '辽宁', '1', '255');
INSERT INTO `sh_region` VALUES ('19', '内蒙古', '1', '255');
INSERT INTO `sh_region` VALUES ('20', '宁夏', '1', '255');
INSERT INTO `sh_region` VALUES ('21', '青海', '1', '255');
INSERT INTO `sh_region` VALUES ('22', '山东', '1', '255');
INSERT INTO `sh_region` VALUES ('23', '山西', '1', '255');
INSERT INTO `sh_region` VALUES ('24', '陕西', '1', '255');
INSERT INTO `sh_region` VALUES ('25', '上海', '1', '255');
INSERT INTO `sh_region` VALUES ('26', '四川', '1', '255');
INSERT INTO `sh_region` VALUES ('27', '天津', '1', '255');
INSERT INTO `sh_region` VALUES ('28', '西藏', '1', '255');
INSERT INTO `sh_region` VALUES ('29', '新疆', '1', '255');
INSERT INTO `sh_region` VALUES ('30', '云南', '1', '255');
INSERT INTO `sh_region` VALUES ('31', '浙江', '1', '255');
INSERT INTO `sh_region` VALUES ('32', '重庆', '1', '255');
INSERT INTO `sh_region` VALUES ('33', '香港', '1', '255');
INSERT INTO `sh_region` VALUES ('34', '澳门', '1', '255');
INSERT INTO `sh_region` VALUES ('35', '台湾', '1', '255');
INSERT INTO `sh_region` VALUES ('36', '安庆', '3', '255');
INSERT INTO `sh_region` VALUES ('37', '蚌埠', '3', '255');
INSERT INTO `sh_region` VALUES ('38', '巢湖', '3', '255');
INSERT INTO `sh_region` VALUES ('39', '池州', '3', '255');
INSERT INTO `sh_region` VALUES ('40', '滁州', '3', '255');
INSERT INTO `sh_region` VALUES ('41', '阜阳', '3', '255');
INSERT INTO `sh_region` VALUES ('42', '淮北', '3', '255');
INSERT INTO `sh_region` VALUES ('43', '淮南', '3', '255');
INSERT INTO `sh_region` VALUES ('44', '黄山', '3', '255');
INSERT INTO `sh_region` VALUES ('45', '六安', '3', '255');
INSERT INTO `sh_region` VALUES ('46', '马鞍山', '3', '255');
INSERT INTO `sh_region` VALUES ('47', '宿州', '3', '255');
INSERT INTO `sh_region` VALUES ('48', '铜陵', '3', '255');
INSERT INTO `sh_region` VALUES ('49', '芜湖', '3', '255');
INSERT INTO `sh_region` VALUES ('50', '宣城', '3', '255');
INSERT INTO `sh_region` VALUES ('51', '亳州', '3', '255');
INSERT INTO `sh_region` VALUES ('52', '北京', '2', '255');
INSERT INTO `sh_region` VALUES ('53', '福州', '4', '255');
INSERT INTO `sh_region` VALUES ('54', '龙岩', '4', '255');
INSERT INTO `sh_region` VALUES ('55', '南平', '4', '255');
INSERT INTO `sh_region` VALUES ('56', '宁德', '4', '255');
INSERT INTO `sh_region` VALUES ('57', '莆田', '4', '255');
INSERT INTO `sh_region` VALUES ('58', '泉州', '4', '255');
INSERT INTO `sh_region` VALUES ('59', '三明', '4', '255');
INSERT INTO `sh_region` VALUES ('60', '厦门', '4', '255');
INSERT INTO `sh_region` VALUES ('61', '漳州', '4', '255');
INSERT INTO `sh_region` VALUES ('62', '兰州', '5', '255');
INSERT INTO `sh_region` VALUES ('63', '白银', '5', '255');
INSERT INTO `sh_region` VALUES ('64', '定西', '5', '255');
INSERT INTO `sh_region` VALUES ('65', '甘南', '5', '255');
INSERT INTO `sh_region` VALUES ('66', '嘉峪关', '5', '255');
INSERT INTO `sh_region` VALUES ('67', '金昌', '5', '255');
INSERT INTO `sh_region` VALUES ('68', '酒泉', '5', '255');
INSERT INTO `sh_region` VALUES ('69', '临夏', '5', '255');
INSERT INTO `sh_region` VALUES ('70', '陇南', '5', '255');
INSERT INTO `sh_region` VALUES ('71', '平凉', '5', '255');
INSERT INTO `sh_region` VALUES ('72', '庆阳', '5', '255');
INSERT INTO `sh_region` VALUES ('73', '天水', '5', '255');
INSERT INTO `sh_region` VALUES ('74', '武威', '5', '255');
INSERT INTO `sh_region` VALUES ('75', '张掖', '5', '255');
INSERT INTO `sh_region` VALUES ('76', '广州', '6', '255');
INSERT INTO `sh_region` VALUES ('77', '深圳', '6', '255');
INSERT INTO `sh_region` VALUES ('78', '潮州', '6', '255');
INSERT INTO `sh_region` VALUES ('79', '东莞', '6', '255');
INSERT INTO `sh_region` VALUES ('80', '佛山', '6', '255');
INSERT INTO `sh_region` VALUES ('81', '河源', '6', '255');
INSERT INTO `sh_region` VALUES ('82', '惠州', '6', '255');
INSERT INTO `sh_region` VALUES ('83', '江门', '6', '255');
INSERT INTO `sh_region` VALUES ('84', '揭阳', '6', '255');
INSERT INTO `sh_region` VALUES ('85', '茂名', '6', '255');
INSERT INTO `sh_region` VALUES ('86', '梅州', '6', '255');
INSERT INTO `sh_region` VALUES ('87', '清远', '6', '255');
INSERT INTO `sh_region` VALUES ('88', '汕头', '6', '255');
INSERT INTO `sh_region` VALUES ('89', '汕尾', '6', '255');
INSERT INTO `sh_region` VALUES ('90', '韶关', '6', '255');
INSERT INTO `sh_region` VALUES ('91', '阳江', '6', '255');
INSERT INTO `sh_region` VALUES ('92', '云浮', '6', '255');
INSERT INTO `sh_region` VALUES ('93', '湛江', '6', '255');
INSERT INTO `sh_region` VALUES ('94', '肇庆', '6', '255');
INSERT INTO `sh_region` VALUES ('95', '中山', '6', '255');
INSERT INTO `sh_region` VALUES ('96', '珠海', '6', '255');
INSERT INTO `sh_region` VALUES ('97', '南宁', '7', '255');
INSERT INTO `sh_region` VALUES ('98', '桂林', '7', '255');
INSERT INTO `sh_region` VALUES ('99', '百色', '7', '255');
INSERT INTO `sh_region` VALUES ('100', '北海', '7', '255');
INSERT INTO `sh_region` VALUES ('101', '崇左', '7', '255');
INSERT INTO `sh_region` VALUES ('102', '防城港', '7', '255');
INSERT INTO `sh_region` VALUES ('103', '贵港', '7', '255');
INSERT INTO `sh_region` VALUES ('104', '河池', '7', '255');
INSERT INTO `sh_region` VALUES ('105', '贺州', '7', '255');
INSERT INTO `sh_region` VALUES ('106', '来宾', '7', '255');
INSERT INTO `sh_region` VALUES ('107', '柳州', '7', '255');
INSERT INTO `sh_region` VALUES ('108', '钦州', '7', '255');
INSERT INTO `sh_region` VALUES ('109', '梧州', '7', '255');
INSERT INTO `sh_region` VALUES ('110', '玉林', '7', '255');
INSERT INTO `sh_region` VALUES ('111', '贵阳', '8', '255');
INSERT INTO `sh_region` VALUES ('112', '安顺', '8', '255');
INSERT INTO `sh_region` VALUES ('113', '毕节', '8', '255');
INSERT INTO `sh_region` VALUES ('114', '六盘水', '8', '255');
INSERT INTO `sh_region` VALUES ('115', '黔东南', '8', '255');
INSERT INTO `sh_region` VALUES ('116', '黔南', '8', '255');
INSERT INTO `sh_region` VALUES ('117', '黔西南', '8', '255');
INSERT INTO `sh_region` VALUES ('118', '铜仁', '8', '255');
INSERT INTO `sh_region` VALUES ('119', '遵义', '8', '255');
INSERT INTO `sh_region` VALUES ('120', '海口', '9', '255');
INSERT INTO `sh_region` VALUES ('121', '三亚', '9', '255');
INSERT INTO `sh_region` VALUES ('122', '白沙', '9', '255');
INSERT INTO `sh_region` VALUES ('123', '保亭', '9', '255');
INSERT INTO `sh_region` VALUES ('124', '昌江', '9', '255');
INSERT INTO `sh_region` VALUES ('125', '澄迈县', '9', '255');
INSERT INTO `sh_region` VALUES ('126', '定安县', '9', '255');
INSERT INTO `sh_region` VALUES ('127', '东方', '9', '255');
INSERT INTO `sh_region` VALUES ('128', '乐东', '9', '255');
INSERT INTO `sh_region` VALUES ('129', '临高县', '9', '255');
INSERT INTO `sh_region` VALUES ('130', '陵水', '9', '255');
INSERT INTO `sh_region` VALUES ('131', '琼海', '9', '255');
INSERT INTO `sh_region` VALUES ('132', '琼中', '9', '255');
INSERT INTO `sh_region` VALUES ('133', '屯昌县', '9', '255');
INSERT INTO `sh_region` VALUES ('134', '万宁', '9', '255');
INSERT INTO `sh_region` VALUES ('135', '文昌', '9', '255');
INSERT INTO `sh_region` VALUES ('136', '五指山', '9', '255');
INSERT INTO `sh_region` VALUES ('137', '儋州', '9', '255');
INSERT INTO `sh_region` VALUES ('138', '石家庄', '10', '255');
INSERT INTO `sh_region` VALUES ('139', '保定', '10', '255');
INSERT INTO `sh_region` VALUES ('140', '沧州', '10', '255');
INSERT INTO `sh_region` VALUES ('141', '承德', '10', '255');
INSERT INTO `sh_region` VALUES ('142', '邯郸', '10', '255');
INSERT INTO `sh_region` VALUES ('143', '衡水', '10', '255');
INSERT INTO `sh_region` VALUES ('144', '廊坊', '10', '255');
INSERT INTO `sh_region` VALUES ('145', '秦皇岛', '10', '255');
INSERT INTO `sh_region` VALUES ('146', '唐山', '10', '255');
INSERT INTO `sh_region` VALUES ('147', '邢台', '10', '255');
INSERT INTO `sh_region` VALUES ('148', '张家口', '10', '255');
INSERT INTO `sh_region` VALUES ('149', '郑州', '11', '255');
INSERT INTO `sh_region` VALUES ('150', '洛阳', '11', '255');
INSERT INTO `sh_region` VALUES ('151', '开封', '11', '255');
INSERT INTO `sh_region` VALUES ('152', '安阳', '11', '255');
INSERT INTO `sh_region` VALUES ('153', '鹤壁', '11', '255');
INSERT INTO `sh_region` VALUES ('154', '济源', '11', '255');
INSERT INTO `sh_region` VALUES ('155', '焦作', '11', '255');
INSERT INTO `sh_region` VALUES ('156', '南阳', '11', '255');
INSERT INTO `sh_region` VALUES ('157', '平顶山', '11', '255');
INSERT INTO `sh_region` VALUES ('158', '三门峡', '11', '255');
INSERT INTO `sh_region` VALUES ('159', '商丘', '11', '255');
INSERT INTO `sh_region` VALUES ('160', '新乡', '11', '255');
INSERT INTO `sh_region` VALUES ('161', '信阳', '11', '255');
INSERT INTO `sh_region` VALUES ('162', '许昌', '11', '255');
INSERT INTO `sh_region` VALUES ('163', '周口', '11', '255');
INSERT INTO `sh_region` VALUES ('164', '驻马店', '11', '255');
INSERT INTO `sh_region` VALUES ('165', '漯河', '11', '255');
INSERT INTO `sh_region` VALUES ('166', '濮阳', '11', '255');
INSERT INTO `sh_region` VALUES ('167', '哈尔滨', '12', '255');
INSERT INTO `sh_region` VALUES ('168', '大庆', '12', '255');
INSERT INTO `sh_region` VALUES ('169', '大兴安岭', '12', '255');
INSERT INTO `sh_region` VALUES ('170', '鹤岗', '12', '255');
INSERT INTO `sh_region` VALUES ('171', '黑河', '12', '255');
INSERT INTO `sh_region` VALUES ('172', '鸡西', '12', '255');
INSERT INTO `sh_region` VALUES ('173', '佳木斯', '12', '255');
INSERT INTO `sh_region` VALUES ('174', '牡丹江', '12', '255');
INSERT INTO `sh_region` VALUES ('175', '七台河', '12', '255');
INSERT INTO `sh_region` VALUES ('176', '齐齐哈尔', '12', '255');
INSERT INTO `sh_region` VALUES ('177', '双鸭山', '12', '255');
INSERT INTO `sh_region` VALUES ('178', '绥化', '12', '255');
INSERT INTO `sh_region` VALUES ('179', '伊春', '12', '255');
INSERT INTO `sh_region` VALUES ('180', '武汉', '13', '255');
INSERT INTO `sh_region` VALUES ('181', '仙桃', '13', '255');
INSERT INTO `sh_region` VALUES ('182', '鄂州', '13', '255');
INSERT INTO `sh_region` VALUES ('183', '黄冈', '13', '255');
INSERT INTO `sh_region` VALUES ('184', '黄石', '13', '255');
INSERT INTO `sh_region` VALUES ('185', '荆门', '13', '255');
INSERT INTO `sh_region` VALUES ('186', '荆州', '13', '255');
INSERT INTO `sh_region` VALUES ('187', '潜江', '13', '255');
INSERT INTO `sh_region` VALUES ('188', '神农架林区', '13', '255');
INSERT INTO `sh_region` VALUES ('189', '十堰', '13', '255');
INSERT INTO `sh_region` VALUES ('190', '随州', '13', '255');
INSERT INTO `sh_region` VALUES ('191', '天门', '13', '255');
INSERT INTO `sh_region` VALUES ('192', '咸宁', '13', '255');
INSERT INTO `sh_region` VALUES ('193', '襄樊', '13', '255');
INSERT INTO `sh_region` VALUES ('194', '孝感', '13', '255');
INSERT INTO `sh_region` VALUES ('195', '宜昌', '13', '255');
INSERT INTO `sh_region` VALUES ('196', '恩施', '13', '255');
INSERT INTO `sh_region` VALUES ('197', '长沙', '14', '255');
INSERT INTO `sh_region` VALUES ('198', '张家界', '14', '255');
INSERT INTO `sh_region` VALUES ('199', '常德', '14', '255');
INSERT INTO `sh_region` VALUES ('200', '郴州', '14', '255');
INSERT INTO `sh_region` VALUES ('201', '衡阳', '14', '255');
INSERT INTO `sh_region` VALUES ('202', '怀化', '14', '255');
INSERT INTO `sh_region` VALUES ('203', '娄底', '14', '255');
INSERT INTO `sh_region` VALUES ('204', '邵阳', '14', '255');
INSERT INTO `sh_region` VALUES ('205', '湘潭', '14', '255');
INSERT INTO `sh_region` VALUES ('206', '湘西', '14', '255');
INSERT INTO `sh_region` VALUES ('207', '益阳', '14', '255');
INSERT INTO `sh_region` VALUES ('208', '永州', '14', '255');
INSERT INTO `sh_region` VALUES ('209', '岳阳', '14', '255');
INSERT INTO `sh_region` VALUES ('210', '株洲', '14', '255');
INSERT INTO `sh_region` VALUES ('211', '长春', '15', '255');
INSERT INTO `sh_region` VALUES ('212', '吉林', '15', '255');
INSERT INTO `sh_region` VALUES ('213', '白城', '15', '255');
INSERT INTO `sh_region` VALUES ('214', '白山', '15', '255');
INSERT INTO `sh_region` VALUES ('215', '辽源', '15', '255');
INSERT INTO `sh_region` VALUES ('216', '四平', '15', '255');
INSERT INTO `sh_region` VALUES ('217', '松原', '15', '255');
INSERT INTO `sh_region` VALUES ('218', '通化', '15', '255');
INSERT INTO `sh_region` VALUES ('219', '延边', '15', '255');
INSERT INTO `sh_region` VALUES ('220', '南京', '16', '255');
INSERT INTO `sh_region` VALUES ('221', '苏州', '16', '255');
INSERT INTO `sh_region` VALUES ('222', '无锡', '16', '255');
INSERT INTO `sh_region` VALUES ('223', '常州', '16', '255');
INSERT INTO `sh_region` VALUES ('224', '淮安', '16', '255');
INSERT INTO `sh_region` VALUES ('225', '连云港', '16', '255');
INSERT INTO `sh_region` VALUES ('226', '南通', '16', '255');
INSERT INTO `sh_region` VALUES ('227', '宿迁', '16', '255');
INSERT INTO `sh_region` VALUES ('228', '泰州', '16', '255');
INSERT INTO `sh_region` VALUES ('229', '徐州', '16', '255');
INSERT INTO `sh_region` VALUES ('230', '盐城', '16', '255');
INSERT INTO `sh_region` VALUES ('231', '扬州', '16', '255');
INSERT INTO `sh_region` VALUES ('232', '镇江', '16', '255');
INSERT INTO `sh_region` VALUES ('233', '南昌', '17', '255');
INSERT INTO `sh_region` VALUES ('234', '抚州', '17', '255');
INSERT INTO `sh_region` VALUES ('235', '赣州', '17', '255');
INSERT INTO `sh_region` VALUES ('236', '吉安', '17', '255');
INSERT INTO `sh_region` VALUES ('237', '景德镇', '17', '255');
INSERT INTO `sh_region` VALUES ('238', '九江', '17', '255');
INSERT INTO `sh_region` VALUES ('239', '萍乡', '17', '255');
INSERT INTO `sh_region` VALUES ('240', '上饶', '17', '255');
INSERT INTO `sh_region` VALUES ('241', '新余', '17', '255');
INSERT INTO `sh_region` VALUES ('242', '宜春', '17', '255');
INSERT INTO `sh_region` VALUES ('243', '鹰潭', '17', '255');
INSERT INTO `sh_region` VALUES ('244', '沈阳', '18', '255');
INSERT INTO `sh_region` VALUES ('245', '大连', '18', '255');
INSERT INTO `sh_region` VALUES ('246', '鞍山', '18', '255');
INSERT INTO `sh_region` VALUES ('247', '本溪', '18', '255');
INSERT INTO `sh_region` VALUES ('248', '朝阳', '18', '255');
INSERT INTO `sh_region` VALUES ('249', '丹东', '18', '255');
INSERT INTO `sh_region` VALUES ('250', '抚顺', '18', '255');
INSERT INTO `sh_region` VALUES ('251', '阜新', '18', '255');
INSERT INTO `sh_region` VALUES ('252', '葫芦岛', '18', '255');
INSERT INTO `sh_region` VALUES ('253', '锦州', '18', '255');
INSERT INTO `sh_region` VALUES ('254', '辽阳', '18', '255');
INSERT INTO `sh_region` VALUES ('255', '盘锦', '18', '255');
INSERT INTO `sh_region` VALUES ('256', '铁岭', '18', '255');
INSERT INTO `sh_region` VALUES ('257', '营口', '18', '255');
INSERT INTO `sh_region` VALUES ('258', '呼和浩特', '19', '255');
INSERT INTO `sh_region` VALUES ('259', '阿拉善盟', '19', '255');
INSERT INTO `sh_region` VALUES ('260', '巴彦淖尔盟', '19', '255');
INSERT INTO `sh_region` VALUES ('261', '包头', '19', '255');
INSERT INTO `sh_region` VALUES ('262', '赤峰', '19', '255');
INSERT INTO `sh_region` VALUES ('263', '鄂尔多斯', '19', '255');
INSERT INTO `sh_region` VALUES ('264', '呼伦贝尔', '19', '255');
INSERT INTO `sh_region` VALUES ('265', '通辽', '19', '255');
INSERT INTO `sh_region` VALUES ('266', '乌海', '19', '255');
INSERT INTO `sh_region` VALUES ('267', '乌兰察布市', '19', '255');
INSERT INTO `sh_region` VALUES ('268', '锡林郭勒盟', '19', '255');
INSERT INTO `sh_region` VALUES ('269', '兴安盟', '19', '255');
INSERT INTO `sh_region` VALUES ('270', '银川', '20', '255');
INSERT INTO `sh_region` VALUES ('271', '固原', '20', '255');
INSERT INTO `sh_region` VALUES ('272', '石嘴山', '20', '255');
INSERT INTO `sh_region` VALUES ('273', '吴忠', '20', '255');
INSERT INTO `sh_region` VALUES ('274', '中卫', '20', '255');
INSERT INTO `sh_region` VALUES ('275', '西宁', '21', '255');
INSERT INTO `sh_region` VALUES ('276', '果洛', '21', '255');
INSERT INTO `sh_region` VALUES ('277', '海北', '21', '255');
INSERT INTO `sh_region` VALUES ('278', '海东', '21', '255');
INSERT INTO `sh_region` VALUES ('279', '海南', '21', '255');
INSERT INTO `sh_region` VALUES ('280', '海西', '21', '255');
INSERT INTO `sh_region` VALUES ('281', '黄南', '21', '255');
INSERT INTO `sh_region` VALUES ('282', '玉树', '21', '255');
INSERT INTO `sh_region` VALUES ('283', '济南', '22', '255');
INSERT INTO `sh_region` VALUES ('284', '青岛', '22', '255');
INSERT INTO `sh_region` VALUES ('285', '滨州', '22', '255');
INSERT INTO `sh_region` VALUES ('286', '德州', '22', '255');
INSERT INTO `sh_region` VALUES ('287', '东营', '22', '255');
INSERT INTO `sh_region` VALUES ('288', '菏泽', '22', '255');
INSERT INTO `sh_region` VALUES ('289', '济宁', '22', '255');
INSERT INTO `sh_region` VALUES ('290', '莱芜', '22', '255');
INSERT INTO `sh_region` VALUES ('291', '聊城', '22', '255');
INSERT INTO `sh_region` VALUES ('292', '临沂', '22', '255');
INSERT INTO `sh_region` VALUES ('293', '日照', '22', '255');
INSERT INTO `sh_region` VALUES ('294', '泰安', '22', '255');
INSERT INTO `sh_region` VALUES ('295', '威海', '22', '255');
INSERT INTO `sh_region` VALUES ('296', '潍坊', '22', '255');
INSERT INTO `sh_region` VALUES ('297', '烟台', '22', '255');
INSERT INTO `sh_region` VALUES ('298', '枣庄', '22', '255');
INSERT INTO `sh_region` VALUES ('299', '淄博', '22', '255');
INSERT INTO `sh_region` VALUES ('300', '太原', '23', '255');
INSERT INTO `sh_region` VALUES ('301', '长治', '23', '255');
INSERT INTO `sh_region` VALUES ('302', '大同', '23', '255');
INSERT INTO `sh_region` VALUES ('303', '晋城', '23', '255');
INSERT INTO `sh_region` VALUES ('304', '晋中', '23', '255');
INSERT INTO `sh_region` VALUES ('305', '临汾', '23', '255');
INSERT INTO `sh_region` VALUES ('306', '吕梁', '23', '255');
INSERT INTO `sh_region` VALUES ('307', '朔州', '23', '255');
INSERT INTO `sh_region` VALUES ('308', '忻州', '23', '255');
INSERT INTO `sh_region` VALUES ('309', '阳泉', '23', '255');
INSERT INTO `sh_region` VALUES ('310', '运城', '23', '255');
INSERT INTO `sh_region` VALUES ('311', '西安', '24', '255');
INSERT INTO `sh_region` VALUES ('312', '安康', '24', '255');
INSERT INTO `sh_region` VALUES ('313', '宝鸡', '24', '255');
INSERT INTO `sh_region` VALUES ('314', '汉中', '24', '255');
INSERT INTO `sh_region` VALUES ('315', '商洛', '24', '255');
INSERT INTO `sh_region` VALUES ('316', '铜川', '24', '255');
INSERT INTO `sh_region` VALUES ('317', '渭南', '24', '255');
INSERT INTO `sh_region` VALUES ('318', '咸阳', '24', '255');
INSERT INTO `sh_region` VALUES ('319', '延安', '24', '255');
INSERT INTO `sh_region` VALUES ('320', '榆林', '24', '255');
INSERT INTO `sh_region` VALUES ('321', '上海', '25', '255');
INSERT INTO `sh_region` VALUES ('322', '成都', '26', '255');
INSERT INTO `sh_region` VALUES ('323', '绵阳', '26', '255');
INSERT INTO `sh_region` VALUES ('324', '阿坝', '26', '255');
INSERT INTO `sh_region` VALUES ('325', '巴中', '26', '255');
INSERT INTO `sh_region` VALUES ('326', '达州', '26', '255');
INSERT INTO `sh_region` VALUES ('327', '德阳', '26', '255');
INSERT INTO `sh_region` VALUES ('328', '甘孜', '26', '255');
INSERT INTO `sh_region` VALUES ('329', '广安', '26', '255');
INSERT INTO `sh_region` VALUES ('330', '广元', '26', '255');
INSERT INTO `sh_region` VALUES ('331', '乐山', '26', '255');
INSERT INTO `sh_region` VALUES ('332', '凉山', '26', '255');
INSERT INTO `sh_region` VALUES ('333', '眉山', '26', '255');
INSERT INTO `sh_region` VALUES ('334', '南充', '26', '255');
INSERT INTO `sh_region` VALUES ('335', '内江', '26', '255');
INSERT INTO `sh_region` VALUES ('336', '攀枝花', '26', '255');
INSERT INTO `sh_region` VALUES ('337', '遂宁', '26', '255');
INSERT INTO `sh_region` VALUES ('338', '雅安', '26', '255');
INSERT INTO `sh_region` VALUES ('339', '宜宾', '26', '255');
INSERT INTO `sh_region` VALUES ('340', '资阳', '26', '255');
INSERT INTO `sh_region` VALUES ('341', '自贡', '26', '255');
INSERT INTO `sh_region` VALUES ('342', '泸州', '26', '255');
INSERT INTO `sh_region` VALUES ('343', '天津', '27', '255');
INSERT INTO `sh_region` VALUES ('344', '拉萨', '28', '255');
INSERT INTO `sh_region` VALUES ('345', '阿里', '28', '255');
INSERT INTO `sh_region` VALUES ('346', '昌都', '28', '255');
INSERT INTO `sh_region` VALUES ('347', '林芝', '28', '255');
INSERT INTO `sh_region` VALUES ('348', '那曲', '28', '255');
INSERT INTO `sh_region` VALUES ('349', '日喀则', '28', '255');
INSERT INTO `sh_region` VALUES ('350', '山南', '28', '255');
INSERT INTO `sh_region` VALUES ('351', '乌鲁木齐', '29', '255');
INSERT INTO `sh_region` VALUES ('352', '阿克苏', '29', '255');
INSERT INTO `sh_region` VALUES ('353', '阿拉尔', '29', '255');
INSERT INTO `sh_region` VALUES ('354', '巴音郭楞', '29', '255');
INSERT INTO `sh_region` VALUES ('355', '博尔塔拉', '29', '255');
INSERT INTO `sh_region` VALUES ('356', '昌吉', '29', '255');
INSERT INTO `sh_region` VALUES ('357', '哈密', '29', '255');
INSERT INTO `sh_region` VALUES ('358', '和田', '29', '255');
INSERT INTO `sh_region` VALUES ('359', '喀什', '29', '255');
INSERT INTO `sh_region` VALUES ('360', '克拉玛依', '29', '255');
INSERT INTO `sh_region` VALUES ('361', '克孜勒苏', '29', '255');
INSERT INTO `sh_region` VALUES ('362', '石河子', '29', '255');
INSERT INTO `sh_region` VALUES ('363', '图木舒克', '29', '255');
INSERT INTO `sh_region` VALUES ('364', '吐鲁番', '29', '255');
INSERT INTO `sh_region` VALUES ('365', '五家渠', '29', '255');
INSERT INTO `sh_region` VALUES ('366', '伊犁', '29', '255');
INSERT INTO `sh_region` VALUES ('367', '昆明', '30', '255');
INSERT INTO `sh_region` VALUES ('368', '怒江', '30', '255');
INSERT INTO `sh_region` VALUES ('369', '普洱', '30', '255');
INSERT INTO `sh_region` VALUES ('370', '丽江', '30', '255');
INSERT INTO `sh_region` VALUES ('371', '保山', '30', '255');
INSERT INTO `sh_region` VALUES ('372', '楚雄', '30', '255');
INSERT INTO `sh_region` VALUES ('373', '大理', '30', '255');
INSERT INTO `sh_region` VALUES ('374', '德宏', '30', '255');
INSERT INTO `sh_region` VALUES ('375', '迪庆', '30', '255');
INSERT INTO `sh_region` VALUES ('376', '红河', '30', '255');
INSERT INTO `sh_region` VALUES ('377', '临沧', '30', '255');
INSERT INTO `sh_region` VALUES ('378', '曲靖', '30', '255');
INSERT INTO `sh_region` VALUES ('379', '文山', '30', '255');
INSERT INTO `sh_region` VALUES ('380', '西双版纳', '30', '255');
INSERT INTO `sh_region` VALUES ('381', '玉溪', '30', '255');
INSERT INTO `sh_region` VALUES ('382', '昭通', '30', '255');
INSERT INTO `sh_region` VALUES ('383', '杭州', '31', '255');
INSERT INTO `sh_region` VALUES ('384', '湖州', '31', '255');
INSERT INTO `sh_region` VALUES ('385', '嘉兴', '31', '255');
INSERT INTO `sh_region` VALUES ('386', '金华', '31', '255');
INSERT INTO `sh_region` VALUES ('387', '丽水', '31', '255');
INSERT INTO `sh_region` VALUES ('388', '宁波', '31', '255');
INSERT INTO `sh_region` VALUES ('389', '绍兴', '31', '255');
INSERT INTO `sh_region` VALUES ('390', '台州', '31', '255');
INSERT INTO `sh_region` VALUES ('391', '温州', '31', '255');
INSERT INTO `sh_region` VALUES ('392', '舟山', '31', '255');
INSERT INTO `sh_region` VALUES ('393', '衢州', '31', '255');
INSERT INTO `sh_region` VALUES ('394', '重庆', '32', '255');
INSERT INTO `sh_region` VALUES ('395', '香港', '33', '255');
INSERT INTO `sh_region` VALUES ('396', '澳门', '34', '255');
INSERT INTO `sh_region` VALUES ('397', '台湾', '35', '255');
INSERT INTO `sh_region` VALUES ('398', '迎江区', '36', '255');
INSERT INTO `sh_region` VALUES ('399', '大观区', '36', '255');
INSERT INTO `sh_region` VALUES ('400', '宜秀区', '36', '255');
INSERT INTO `sh_region` VALUES ('401', '桐城市', '36', '255');
INSERT INTO `sh_region` VALUES ('402', '怀宁县', '36', '255');
INSERT INTO `sh_region` VALUES ('403', '枞阳县', '36', '255');
INSERT INTO `sh_region` VALUES ('404', '潜山县', '36', '255');
INSERT INTO `sh_region` VALUES ('405', '太湖县', '36', '255');
INSERT INTO `sh_region` VALUES ('406', '宿松县', '36', '255');
INSERT INTO `sh_region` VALUES ('407', '望江县', '36', '255');
INSERT INTO `sh_region` VALUES ('408', '岳西县', '36', '255');
INSERT INTO `sh_region` VALUES ('409', '中市区', '37', '255');
INSERT INTO `sh_region` VALUES ('410', '东市区', '37', '255');
INSERT INTO `sh_region` VALUES ('411', '西市区', '37', '255');
INSERT INTO `sh_region` VALUES ('412', '郊区', '37', '255');
INSERT INTO `sh_region` VALUES ('413', '怀远县', '37', '255');
INSERT INTO `sh_region` VALUES ('414', '五河县', '37', '255');
INSERT INTO `sh_region` VALUES ('415', '固镇县', '37', '255');
INSERT INTO `sh_region` VALUES ('416', '居巢区', '38', '255');
INSERT INTO `sh_region` VALUES ('417', '庐江县', '38', '255');
INSERT INTO `sh_region` VALUES ('418', '无为县', '38', '255');
INSERT INTO `sh_region` VALUES ('419', '含山县', '38', '255');
INSERT INTO `sh_region` VALUES ('420', '和县', '38', '255');
INSERT INTO `sh_region` VALUES ('421', '贵池区', '39', '255');
INSERT INTO `sh_region` VALUES ('422', '东至县', '39', '255');
INSERT INTO `sh_region` VALUES ('423', '石台县', '39', '255');
INSERT INTO `sh_region` VALUES ('424', '青阳县', '39', '255');
INSERT INTO `sh_region` VALUES ('425', '琅琊区', '40', '255');
INSERT INTO `sh_region` VALUES ('426', '南谯区', '40', '255');
INSERT INTO `sh_region` VALUES ('427', '天长市', '40', '255');
INSERT INTO `sh_region` VALUES ('428', '明光市', '40', '255');
INSERT INTO `sh_region` VALUES ('429', '来安县', '40', '255');
INSERT INTO `sh_region` VALUES ('430', '全椒县', '40', '255');
INSERT INTO `sh_region` VALUES ('431', '定远县', '40', '255');
INSERT INTO `sh_region` VALUES ('432', '凤阳县', '40', '255');
INSERT INTO `sh_region` VALUES ('433', '蚌山区', '41', '255');
INSERT INTO `sh_region` VALUES ('434', '龙子湖区', '41', '255');
INSERT INTO `sh_region` VALUES ('435', '禹会区', '41', '255');
INSERT INTO `sh_region` VALUES ('436', '淮上区', '41', '255');
INSERT INTO `sh_region` VALUES ('437', '颍州区', '41', '255');
INSERT INTO `sh_region` VALUES ('438', '颍东区', '41', '255');
INSERT INTO `sh_region` VALUES ('439', '颍泉区', '41', '255');
INSERT INTO `sh_region` VALUES ('440', '界首市', '41', '255');
INSERT INTO `sh_region` VALUES ('441', '临泉县', '41', '255');
INSERT INTO `sh_region` VALUES ('442', '太和县', '41', '255');
INSERT INTO `sh_region` VALUES ('443', '阜南县', '41', '255');
INSERT INTO `sh_region` VALUES ('444', '颖上县', '41', '255');
INSERT INTO `sh_region` VALUES ('445', '相山区', '42', '255');
INSERT INTO `sh_region` VALUES ('446', '杜集区', '42', '255');
INSERT INTO `sh_region` VALUES ('447', '烈山区', '42', '255');
INSERT INTO `sh_region` VALUES ('448', '濉溪县', '42', '255');
INSERT INTO `sh_region` VALUES ('449', '田家庵区', '43', '255');
INSERT INTO `sh_region` VALUES ('450', '大通区', '43', '255');
INSERT INTO `sh_region` VALUES ('451', '谢家集区', '43', '255');
INSERT INTO `sh_region` VALUES ('452', '八公山区', '43', '255');
INSERT INTO `sh_region` VALUES ('453', '潘集区', '43', '255');
INSERT INTO `sh_region` VALUES ('454', '凤台县', '43', '255');
INSERT INTO `sh_region` VALUES ('455', '屯溪区', '44', '255');
INSERT INTO `sh_region` VALUES ('456', '黄山区', '44', '255');
INSERT INTO `sh_region` VALUES ('457', '徽州区', '44', '255');
INSERT INTO `sh_region` VALUES ('458', '歙县', '44', '255');
INSERT INTO `sh_region` VALUES ('459', '休宁县', '44', '255');
INSERT INTO `sh_region` VALUES ('460', '黟县', '44', '255');
INSERT INTO `sh_region` VALUES ('461', '祁门县', '44', '255');
INSERT INTO `sh_region` VALUES ('462', '金安区', '45', '255');
INSERT INTO `sh_region` VALUES ('463', '裕安区', '45', '255');
INSERT INTO `sh_region` VALUES ('464', '寿县', '45', '255');
INSERT INTO `sh_region` VALUES ('465', '霍邱县', '45', '255');
INSERT INTO `sh_region` VALUES ('466', '舒城县', '45', '255');
INSERT INTO `sh_region` VALUES ('467', '金寨县', '45', '255');
INSERT INTO `sh_region` VALUES ('468', '霍山县', '45', '255');
INSERT INTO `sh_region` VALUES ('469', '雨山区', '46', '255');
INSERT INTO `sh_region` VALUES ('470', '花山区', '46', '255');
INSERT INTO `sh_region` VALUES ('471', '金家庄区', '46', '255');
INSERT INTO `sh_region` VALUES ('472', '当涂县', '46', '255');
INSERT INTO `sh_region` VALUES ('473', '埇桥区', '47', '255');
INSERT INTO `sh_region` VALUES ('474', '砀山县', '47', '255');
INSERT INTO `sh_region` VALUES ('475', '萧县', '47', '255');
INSERT INTO `sh_region` VALUES ('476', '灵璧县', '47', '255');
INSERT INTO `sh_region` VALUES ('477', '泗县', '47', '255');
INSERT INTO `sh_region` VALUES ('478', '铜官山区', '48', '255');
INSERT INTO `sh_region` VALUES ('479', '狮子山区', '48', '255');
INSERT INTO `sh_region` VALUES ('480', '郊区', '48', '255');
INSERT INTO `sh_region` VALUES ('481', '铜陵县', '48', '255');
INSERT INTO `sh_region` VALUES ('482', '镜湖区', '49', '255');
INSERT INTO `sh_region` VALUES ('483', '弋江区', '49', '255');
INSERT INTO `sh_region` VALUES ('484', '鸠江区', '49', '255');
INSERT INTO `sh_region` VALUES ('485', '三山区', '49', '255');
INSERT INTO `sh_region` VALUES ('486', '芜湖县', '49', '255');
INSERT INTO `sh_region` VALUES ('487', '繁昌县', '49', '255');
INSERT INTO `sh_region` VALUES ('488', '南陵县', '49', '255');
INSERT INTO `sh_region` VALUES ('489', '宣州区', '50', '255');
INSERT INTO `sh_region` VALUES ('490', '宁国市', '50', '255');
INSERT INTO `sh_region` VALUES ('491', '郎溪县', '50', '255');
INSERT INTO `sh_region` VALUES ('492', '广德县', '50', '255');
INSERT INTO `sh_region` VALUES ('493', '泾县', '50', '255');
INSERT INTO `sh_region` VALUES ('494', '绩溪县', '50', '255');
INSERT INTO `sh_region` VALUES ('495', '旌德县', '50', '255');
INSERT INTO `sh_region` VALUES ('496', '涡阳县', '51', '255');
INSERT INTO `sh_region` VALUES ('497', '蒙城县', '51', '255');
INSERT INTO `sh_region` VALUES ('498', '利辛县', '51', '255');
INSERT INTO `sh_region` VALUES ('499', '谯城区', '51', '255');
INSERT INTO `sh_region` VALUES ('500', '东城区', '52', '255');
INSERT INTO `sh_region` VALUES ('501', '西城区', '52', '255');
INSERT INTO `sh_region` VALUES ('502', '海淀区', '52', '255');
INSERT INTO `sh_region` VALUES ('503', '朝阳区', '52', '255');
INSERT INTO `sh_region` VALUES ('504', '崇文区', '52', '255');
INSERT INTO `sh_region` VALUES ('505', '宣武区', '52', '255');
INSERT INTO `sh_region` VALUES ('506', '丰台区', '52', '255');
INSERT INTO `sh_region` VALUES ('507', '石景山区', '52', '255');
INSERT INTO `sh_region` VALUES ('508', '房山区', '52', '255');
INSERT INTO `sh_region` VALUES ('509', '门头沟区', '52', '255');
INSERT INTO `sh_region` VALUES ('510', '通州区', '52', '255');
INSERT INTO `sh_region` VALUES ('511', '顺义区', '52', '255');
INSERT INTO `sh_region` VALUES ('512', '昌平区', '52', '255');
INSERT INTO `sh_region` VALUES ('513', '怀柔区', '52', '255');
INSERT INTO `sh_region` VALUES ('514', '平谷区', '52', '255');
INSERT INTO `sh_region` VALUES ('515', '大兴区', '52', '255');
INSERT INTO `sh_region` VALUES ('516', '密云县', '52', '255');
INSERT INTO `sh_region` VALUES ('517', '延庆县', '52', '255');
INSERT INTO `sh_region` VALUES ('518', '鼓楼区', '53', '255');
INSERT INTO `sh_region` VALUES ('519', '台江区', '53', '255');
INSERT INTO `sh_region` VALUES ('520', '仓山区', '53', '255');
INSERT INTO `sh_region` VALUES ('521', '马尾区', '53', '255');
INSERT INTO `sh_region` VALUES ('522', '晋安区', '53', '255');
INSERT INTO `sh_region` VALUES ('523', '福清市', '53', '255');
INSERT INTO `sh_region` VALUES ('524', '长乐市', '53', '255');
INSERT INTO `sh_region` VALUES ('525', '闽侯县', '53', '255');
INSERT INTO `sh_region` VALUES ('526', '连江县', '53', '255');
INSERT INTO `sh_region` VALUES ('527', '罗源县', '53', '255');
INSERT INTO `sh_region` VALUES ('528', '闽清县', '53', '255');
INSERT INTO `sh_region` VALUES ('529', '永泰县', '53', '255');
INSERT INTO `sh_region` VALUES ('530', '平潭县', '53', '255');
INSERT INTO `sh_region` VALUES ('531', '新罗区', '54', '255');
INSERT INTO `sh_region` VALUES ('532', '漳平市', '54', '255');
INSERT INTO `sh_region` VALUES ('533', '长汀县', '54', '255');
INSERT INTO `sh_region` VALUES ('534', '永定县', '54', '255');
INSERT INTO `sh_region` VALUES ('535', '上杭县', '54', '255');
INSERT INTO `sh_region` VALUES ('536', '武平县', '54', '255');
INSERT INTO `sh_region` VALUES ('537', '连城县', '54', '255');
INSERT INTO `sh_region` VALUES ('538', '延平区', '55', '255');
INSERT INTO `sh_region` VALUES ('539', '邵武市', '55', '255');
INSERT INTO `sh_region` VALUES ('540', '武夷山市', '55', '255');
INSERT INTO `sh_region` VALUES ('541', '建瓯市', '55', '255');
INSERT INTO `sh_region` VALUES ('542', '建阳市', '55', '255');
INSERT INTO `sh_region` VALUES ('543', '顺昌县', '55', '255');
INSERT INTO `sh_region` VALUES ('544', '浦城县', '55', '255');
INSERT INTO `sh_region` VALUES ('545', '光泽县', '55', '255');
INSERT INTO `sh_region` VALUES ('546', '松溪县', '55', '255');
INSERT INTO `sh_region` VALUES ('547', '政和县', '55', '255');
INSERT INTO `sh_region` VALUES ('548', '蕉城区', '56', '255');
INSERT INTO `sh_region` VALUES ('549', '福安市', '56', '255');
INSERT INTO `sh_region` VALUES ('550', '福鼎市', '56', '255');
INSERT INTO `sh_region` VALUES ('551', '霞浦县', '56', '255');
INSERT INTO `sh_region` VALUES ('552', '古田县', '56', '255');
INSERT INTO `sh_region` VALUES ('553', '屏南县', '56', '255');
INSERT INTO `sh_region` VALUES ('554', '寿宁县', '56', '255');
INSERT INTO `sh_region` VALUES ('555', '周宁县', '56', '255');
INSERT INTO `sh_region` VALUES ('556', '柘荣县', '56', '255');
INSERT INTO `sh_region` VALUES ('557', '城厢区', '57', '255');
INSERT INTO `sh_region` VALUES ('558', '涵江区', '57', '255');
INSERT INTO `sh_region` VALUES ('559', '荔城区', '57', '255');
INSERT INTO `sh_region` VALUES ('560', '秀屿区', '57', '255');
INSERT INTO `sh_region` VALUES ('561', '仙游县', '57', '255');
INSERT INTO `sh_region` VALUES ('562', '鲤城区', '58', '255');
INSERT INTO `sh_region` VALUES ('563', '丰泽区', '58', '255');
INSERT INTO `sh_region` VALUES ('564', '洛江区', '58', '255');
INSERT INTO `sh_region` VALUES ('565', '清濛开发区', '58', '255');
INSERT INTO `sh_region` VALUES ('566', '泉港区', '58', '255');
INSERT INTO `sh_region` VALUES ('567', '石狮市', '58', '255');
INSERT INTO `sh_region` VALUES ('568', '晋江市', '58', '255');
INSERT INTO `sh_region` VALUES ('569', '南安市', '58', '255');
INSERT INTO `sh_region` VALUES ('570', '惠安县', '58', '255');
INSERT INTO `sh_region` VALUES ('571', '安溪县', '58', '255');
INSERT INTO `sh_region` VALUES ('572', '永春县', '58', '255');
INSERT INTO `sh_region` VALUES ('573', '德化县', '58', '255');
INSERT INTO `sh_region` VALUES ('574', '金门县', '58', '255');
INSERT INTO `sh_region` VALUES ('575', '梅列区', '59', '255');
INSERT INTO `sh_region` VALUES ('576', '三元区', '59', '255');
INSERT INTO `sh_region` VALUES ('577', '永安市', '59', '255');
INSERT INTO `sh_region` VALUES ('578', '明溪县', '59', '255');
INSERT INTO `sh_region` VALUES ('579', '清流县', '59', '255');
INSERT INTO `sh_region` VALUES ('580', '宁化县', '59', '255');
INSERT INTO `sh_region` VALUES ('581', '大田县', '59', '255');
INSERT INTO `sh_region` VALUES ('582', '尤溪县', '59', '255');
INSERT INTO `sh_region` VALUES ('583', '沙县', '59', '255');
INSERT INTO `sh_region` VALUES ('584', '将乐县', '59', '255');
INSERT INTO `sh_region` VALUES ('585', '泰宁县', '59', '255');
INSERT INTO `sh_region` VALUES ('586', '建宁县', '59', '255');
INSERT INTO `sh_region` VALUES ('587', '思明区', '60', '255');
INSERT INTO `sh_region` VALUES ('588', '海沧区', '60', '255');
INSERT INTO `sh_region` VALUES ('589', '湖里区', '60', '255');
INSERT INTO `sh_region` VALUES ('590', '集美区', '60', '255');
INSERT INTO `sh_region` VALUES ('591', '同安区', '60', '255');
INSERT INTO `sh_region` VALUES ('592', '翔安区', '60', '255');
INSERT INTO `sh_region` VALUES ('593', '芗城区', '61', '255');
INSERT INTO `sh_region` VALUES ('594', '龙文区', '61', '255');
INSERT INTO `sh_region` VALUES ('595', '龙海市', '61', '255');
INSERT INTO `sh_region` VALUES ('596', '云霄县', '61', '255');
INSERT INTO `sh_region` VALUES ('597', '漳浦县', '61', '255');
INSERT INTO `sh_region` VALUES ('598', '诏安县', '61', '255');
INSERT INTO `sh_region` VALUES ('599', '长泰县', '61', '255');
INSERT INTO `sh_region` VALUES ('600', '东山县', '61', '255');
INSERT INTO `sh_region` VALUES ('601', '南靖县', '61', '255');
INSERT INTO `sh_region` VALUES ('602', '平和县', '61', '255');
INSERT INTO `sh_region` VALUES ('603', '华安县', '61', '255');
INSERT INTO `sh_region` VALUES ('604', '皋兰县', '62', '255');
INSERT INTO `sh_region` VALUES ('605', '城关区', '62', '255');
INSERT INTO `sh_region` VALUES ('606', '七里河区', '62', '255');
INSERT INTO `sh_region` VALUES ('607', '西固区', '62', '255');
INSERT INTO `sh_region` VALUES ('608', '安宁区', '62', '255');
INSERT INTO `sh_region` VALUES ('609', '红古区', '62', '255');
INSERT INTO `sh_region` VALUES ('610', '永登县', '62', '255');
INSERT INTO `sh_region` VALUES ('611', '榆中县', '62', '255');
INSERT INTO `sh_region` VALUES ('612', '白银区', '63', '255');
INSERT INTO `sh_region` VALUES ('613', '平川区', '63', '255');
INSERT INTO `sh_region` VALUES ('614', '会宁县', '63', '255');
INSERT INTO `sh_region` VALUES ('615', '景泰县', '63', '255');
INSERT INTO `sh_region` VALUES ('616', '靖远县', '63', '255');
INSERT INTO `sh_region` VALUES ('617', '临洮县', '64', '255');
INSERT INTO `sh_region` VALUES ('618', '陇西县', '64', '255');
INSERT INTO `sh_region` VALUES ('619', '通渭县', '64', '255');
INSERT INTO `sh_region` VALUES ('620', '渭源县', '64', '255');
INSERT INTO `sh_region` VALUES ('621', '漳县', '64', '255');
INSERT INTO `sh_region` VALUES ('622', '岷县', '64', '255');
INSERT INTO `sh_region` VALUES ('623', '安定区', '64', '255');
INSERT INTO `sh_region` VALUES ('624', '安定区', '64', '255');
INSERT INTO `sh_region` VALUES ('625', '合作市', '65', '255');
INSERT INTO `sh_region` VALUES ('626', '临潭县', '65', '255');
INSERT INTO `sh_region` VALUES ('627', '卓尼县', '65', '255');
INSERT INTO `sh_region` VALUES ('628', '舟曲县', '65', '255');
INSERT INTO `sh_region` VALUES ('629', '迭部县', '65', '255');
INSERT INTO `sh_region` VALUES ('630', '玛曲县', '65', '255');
INSERT INTO `sh_region` VALUES ('631', '碌曲县', '65', '255');
INSERT INTO `sh_region` VALUES ('632', '夏河县', '65', '255');
INSERT INTO `sh_region` VALUES ('633', '嘉峪关市', '66', '255');
INSERT INTO `sh_region` VALUES ('634', '金川区', '67', '255');
INSERT INTO `sh_region` VALUES ('635', '永昌县', '67', '255');
INSERT INTO `sh_region` VALUES ('636', '肃州区', '68', '255');
INSERT INTO `sh_region` VALUES ('637', '玉门市', '68', '255');
INSERT INTO `sh_region` VALUES ('638', '敦煌市', '68', '255');
INSERT INTO `sh_region` VALUES ('639', '金塔县', '68', '255');
INSERT INTO `sh_region` VALUES ('640', '瓜州县', '68', '255');
INSERT INTO `sh_region` VALUES ('641', '肃北', '68', '255');
INSERT INTO `sh_region` VALUES ('642', '阿克塞', '68', '255');
INSERT INTO `sh_region` VALUES ('643', '临夏市', '69', '255');
INSERT INTO `sh_region` VALUES ('644', '临夏县', '69', '255');
INSERT INTO `sh_region` VALUES ('645', '康乐县', '69', '255');
INSERT INTO `sh_region` VALUES ('646', '永靖县', '69', '255');
INSERT INTO `sh_region` VALUES ('647', '广河县', '69', '255');
INSERT INTO `sh_region` VALUES ('648', '和政县', '69', '255');
INSERT INTO `sh_region` VALUES ('649', '东乡族自治县', '69', '255');
INSERT INTO `sh_region` VALUES ('650', '积石山', '69', '255');
INSERT INTO `sh_region` VALUES ('651', '成县', '70', '255');
INSERT INTO `sh_region` VALUES ('652', '徽县', '70', '255');
INSERT INTO `sh_region` VALUES ('653', '康县', '70', '255');
INSERT INTO `sh_region` VALUES ('654', '礼县', '70', '255');
INSERT INTO `sh_region` VALUES ('655', '两当县', '70', '255');
INSERT INTO `sh_region` VALUES ('656', '文县', '70', '255');
INSERT INTO `sh_region` VALUES ('657', '西和县', '70', '255');
INSERT INTO `sh_region` VALUES ('658', '宕昌县', '70', '255');
INSERT INTO `sh_region` VALUES ('659', '武都区', '70', '255');
INSERT INTO `sh_region` VALUES ('660', '崇信县', '71', '255');
INSERT INTO `sh_region` VALUES ('661', '华亭县', '71', '255');
INSERT INTO `sh_region` VALUES ('662', '静宁县', '71', '255');
INSERT INTO `sh_region` VALUES ('663', '灵台县', '71', '255');
INSERT INTO `sh_region` VALUES ('664', '崆峒区', '71', '255');
INSERT INTO `sh_region` VALUES ('665', '庄浪县', '71', '255');
INSERT INTO `sh_region` VALUES ('666', '泾川县', '71', '255');
INSERT INTO `sh_region` VALUES ('667', '合水县', '72', '255');
INSERT INTO `sh_region` VALUES ('668', '华池县', '72', '255');
INSERT INTO `sh_region` VALUES ('669', '环县', '72', '255');
INSERT INTO `sh_region` VALUES ('670', '宁县', '72', '255');
INSERT INTO `sh_region` VALUES ('671', '庆城县', '72', '255');
INSERT INTO `sh_region` VALUES ('672', '西峰区', '72', '255');
INSERT INTO `sh_region` VALUES ('673', '镇原县', '72', '255');
INSERT INTO `sh_region` VALUES ('674', '正宁县', '72', '255');
INSERT INTO `sh_region` VALUES ('675', '甘谷县', '73', '255');
INSERT INTO `sh_region` VALUES ('676', '秦安县', '73', '255');
INSERT INTO `sh_region` VALUES ('677', '清水县', '73', '255');
INSERT INTO `sh_region` VALUES ('678', '秦州区', '73', '255');
INSERT INTO `sh_region` VALUES ('679', '麦积区', '73', '255');
INSERT INTO `sh_region` VALUES ('680', '武山县', '73', '255');
INSERT INTO `sh_region` VALUES ('681', '张家川', '73', '255');
INSERT INTO `sh_region` VALUES ('682', '古浪县', '74', '255');
INSERT INTO `sh_region` VALUES ('683', '民勤县', '74', '255');
INSERT INTO `sh_region` VALUES ('684', '天祝', '74', '255');
INSERT INTO `sh_region` VALUES ('685', '凉州区', '74', '255');
INSERT INTO `sh_region` VALUES ('686', '高台县', '75', '255');
INSERT INTO `sh_region` VALUES ('687', '临泽县', '75', '255');
INSERT INTO `sh_region` VALUES ('688', '民乐县', '75', '255');
INSERT INTO `sh_region` VALUES ('689', '山丹县', '75', '255');
INSERT INTO `sh_region` VALUES ('690', '肃南', '75', '255');
INSERT INTO `sh_region` VALUES ('691', '甘州区', '75', '255');
INSERT INTO `sh_region` VALUES ('692', '从化市', '76', '255');
INSERT INTO `sh_region` VALUES ('693', '天河区', '76', '255');
INSERT INTO `sh_region` VALUES ('694', '东山区', '76', '255');
INSERT INTO `sh_region` VALUES ('695', '白云区', '76', '255');
INSERT INTO `sh_region` VALUES ('696', '海珠区', '76', '255');
INSERT INTO `sh_region` VALUES ('697', '荔湾区', '76', '255');
INSERT INTO `sh_region` VALUES ('698', '越秀区', '76', '255');
INSERT INTO `sh_region` VALUES ('699', '黄埔区', '76', '255');
INSERT INTO `sh_region` VALUES ('700', '番禺区', '76', '255');
INSERT INTO `sh_region` VALUES ('701', '花都区', '76', '255');
INSERT INTO `sh_region` VALUES ('702', '增城区', '76', '255');
INSERT INTO `sh_region` VALUES ('703', '从化区', '76', '255');
INSERT INTO `sh_region` VALUES ('704', '市郊', '76', '255');
INSERT INTO `sh_region` VALUES ('705', '福田区', '77', '255');
INSERT INTO `sh_region` VALUES ('706', '罗湖区', '77', '255');
INSERT INTO `sh_region` VALUES ('707', '南山区', '77', '255');
INSERT INTO `sh_region` VALUES ('708', '宝安区', '77', '255');
INSERT INTO `sh_region` VALUES ('709', '龙岗区', '77', '255');
INSERT INTO `sh_region` VALUES ('710', '盐田区', '77', '255');
INSERT INTO `sh_region` VALUES ('711', '湘桥区', '78', '255');
INSERT INTO `sh_region` VALUES ('712', '潮安县', '78', '255');
INSERT INTO `sh_region` VALUES ('713', '饶平县', '78', '255');
INSERT INTO `sh_region` VALUES ('714', '南城区', '79', '255');
INSERT INTO `sh_region` VALUES ('715', '东城区', '79', '255');
INSERT INTO `sh_region` VALUES ('716', '万江区', '79', '255');
INSERT INTO `sh_region` VALUES ('717', '莞城区', '79', '255');
INSERT INTO `sh_region` VALUES ('718', '石龙镇', '79', '255');
INSERT INTO `sh_region` VALUES ('719', '虎门镇', '79', '255');
INSERT INTO `sh_region` VALUES ('720', '麻涌镇', '79', '255');
INSERT INTO `sh_region` VALUES ('721', '道滘镇', '79', '255');
INSERT INTO `sh_region` VALUES ('722', '石碣镇', '79', '255');
INSERT INTO `sh_region` VALUES ('723', '沙田镇', '79', '255');
INSERT INTO `sh_region` VALUES ('724', '望牛墩镇', '79', '255');
INSERT INTO `sh_region` VALUES ('725', '洪梅镇', '79', '255');
INSERT INTO `sh_region` VALUES ('726', '茶山镇', '79', '255');
INSERT INTO `sh_region` VALUES ('727', '寮步镇', '79', '255');
INSERT INTO `sh_region` VALUES ('728', '大岭山镇', '79', '255');
INSERT INTO `sh_region` VALUES ('729', '大朗镇', '79', '255');
INSERT INTO `sh_region` VALUES ('730', '黄江镇', '79', '255');
INSERT INTO `sh_region` VALUES ('731', '樟木头', '79', '255');
INSERT INTO `sh_region` VALUES ('732', '凤岗镇', '79', '255');
INSERT INTO `sh_region` VALUES ('733', '塘厦镇', '79', '255');
INSERT INTO `sh_region` VALUES ('734', '谢岗镇', '79', '255');
INSERT INTO `sh_region` VALUES ('735', '厚街镇', '79', '255');
INSERT INTO `sh_region` VALUES ('736', '清溪镇', '79', '255');
INSERT INTO `sh_region` VALUES ('737', '常平镇', '79', '255');
INSERT INTO `sh_region` VALUES ('738', '桥头镇', '79', '255');
INSERT INTO `sh_region` VALUES ('739', '横沥镇', '79', '255');
INSERT INTO `sh_region` VALUES ('740', '东坑镇', '79', '255');
INSERT INTO `sh_region` VALUES ('741', '企石镇', '79', '255');
INSERT INTO `sh_region` VALUES ('742', '石排镇', '79', '255');
INSERT INTO `sh_region` VALUES ('743', '长安镇', '79', '255');
INSERT INTO `sh_region` VALUES ('744', '中堂镇', '79', '255');
INSERT INTO `sh_region` VALUES ('745', '高埗镇', '79', '255');
INSERT INTO `sh_region` VALUES ('746', '禅城区', '80', '255');
INSERT INTO `sh_region` VALUES ('747', '南海区', '80', '255');
INSERT INTO `sh_region` VALUES ('748', '顺德区', '80', '255');
INSERT INTO `sh_region` VALUES ('749', '三水区', '80', '255');
INSERT INTO `sh_region` VALUES ('750', '高明区', '80', '255');
INSERT INTO `sh_region` VALUES ('751', '东源县', '81', '255');
INSERT INTO `sh_region` VALUES ('752', '和平县', '81', '255');
INSERT INTO `sh_region` VALUES ('753', '源城区', '81', '255');
INSERT INTO `sh_region` VALUES ('754', '连平县', '81', '255');
INSERT INTO `sh_region` VALUES ('755', '龙川县', '81', '255');
INSERT INTO `sh_region` VALUES ('756', '紫金县', '81', '255');
INSERT INTO `sh_region` VALUES ('757', '惠阳区', '82', '255');
INSERT INTO `sh_region` VALUES ('758', '惠城区', '82', '255');
INSERT INTO `sh_region` VALUES ('759', '大亚湾', '82', '255');
INSERT INTO `sh_region` VALUES ('760', '博罗县', '82', '255');
INSERT INTO `sh_region` VALUES ('761', '惠东县', '82', '255');
INSERT INTO `sh_region` VALUES ('762', '龙门县', '82', '255');
INSERT INTO `sh_region` VALUES ('763', '江海区', '83', '255');
INSERT INTO `sh_region` VALUES ('764', '蓬江区', '83', '255');
INSERT INTO `sh_region` VALUES ('765', '新会区', '83', '255');
INSERT INTO `sh_region` VALUES ('766', '台山市', '83', '255');
INSERT INTO `sh_region` VALUES ('767', '开平市', '83', '255');
INSERT INTO `sh_region` VALUES ('768', '鹤山市', '83', '255');
INSERT INTO `sh_region` VALUES ('769', '恩平市', '83', '255');
INSERT INTO `sh_region` VALUES ('770', '榕城区', '84', '255');
INSERT INTO `sh_region` VALUES ('771', '普宁市', '84', '255');
INSERT INTO `sh_region` VALUES ('772', '揭东县', '84', '255');
INSERT INTO `sh_region` VALUES ('773', '揭西县', '84', '255');
INSERT INTO `sh_region` VALUES ('774', '惠来县', '84', '255');
INSERT INTO `sh_region` VALUES ('775', '茂南区', '85', '255');
INSERT INTO `sh_region` VALUES ('776', '茂港区', '85', '255');
INSERT INTO `sh_region` VALUES ('777', '高州市', '85', '255');
INSERT INTO `sh_region` VALUES ('778', '化州市', '85', '255');
INSERT INTO `sh_region` VALUES ('779', '信宜市', '85', '255');
INSERT INTO `sh_region` VALUES ('780', '电白县', '85', '255');
INSERT INTO `sh_region` VALUES ('781', '梅县', '86', '255');
INSERT INTO `sh_region` VALUES ('782', '梅江区', '86', '255');
INSERT INTO `sh_region` VALUES ('783', '兴宁市', '86', '255');
INSERT INTO `sh_region` VALUES ('784', '大埔县', '86', '255');
INSERT INTO `sh_region` VALUES ('785', '丰顺县', '86', '255');
INSERT INTO `sh_region` VALUES ('786', '五华县', '86', '255');
INSERT INTO `sh_region` VALUES ('787', '平远县', '86', '255');
INSERT INTO `sh_region` VALUES ('788', '蕉岭县', '86', '255');
INSERT INTO `sh_region` VALUES ('789', '清城区', '87', '255');
INSERT INTO `sh_region` VALUES ('790', '英德市', '87', '255');
INSERT INTO `sh_region` VALUES ('791', '连州市', '87', '255');
INSERT INTO `sh_region` VALUES ('792', '佛冈县', '87', '255');
INSERT INTO `sh_region` VALUES ('793', '阳山县', '87', '255');
INSERT INTO `sh_region` VALUES ('794', '清新县', '87', '255');
INSERT INTO `sh_region` VALUES ('795', '连山', '87', '255');
INSERT INTO `sh_region` VALUES ('796', '连南', '87', '255');
INSERT INTO `sh_region` VALUES ('797', '南澳县', '88', '255');
INSERT INTO `sh_region` VALUES ('798', '潮阳区', '88', '255');
INSERT INTO `sh_region` VALUES ('799', '澄海区', '88', '255');
INSERT INTO `sh_region` VALUES ('800', '龙湖区', '88', '255');
INSERT INTO `sh_region` VALUES ('801', '金平区', '88', '255');
INSERT INTO `sh_region` VALUES ('802', '濠江区', '88', '255');
INSERT INTO `sh_region` VALUES ('803', '潮南区', '88', '255');
INSERT INTO `sh_region` VALUES ('804', '城区', '89', '255');
INSERT INTO `sh_region` VALUES ('805', '陆丰市', '89', '255');
INSERT INTO `sh_region` VALUES ('806', '海丰县', '89', '255');
INSERT INTO `sh_region` VALUES ('807', '陆河县', '89', '255');
INSERT INTO `sh_region` VALUES ('808', '曲江县', '90', '255');
INSERT INTO `sh_region` VALUES ('809', '浈江区', '90', '255');
INSERT INTO `sh_region` VALUES ('810', '武江区', '90', '255');
INSERT INTO `sh_region` VALUES ('811', '曲江区', '90', '255');
INSERT INTO `sh_region` VALUES ('812', '乐昌市', '90', '255');
INSERT INTO `sh_region` VALUES ('813', '南雄市', '90', '255');
INSERT INTO `sh_region` VALUES ('814', '始兴县', '90', '255');
INSERT INTO `sh_region` VALUES ('815', '仁化县', '90', '255');
INSERT INTO `sh_region` VALUES ('816', '翁源县', '90', '255');
INSERT INTO `sh_region` VALUES ('817', '新丰县', '90', '255');
INSERT INTO `sh_region` VALUES ('818', '乳源', '90', '255');
INSERT INTO `sh_region` VALUES ('819', '江城区', '91', '255');
INSERT INTO `sh_region` VALUES ('820', '阳春市', '91', '255');
INSERT INTO `sh_region` VALUES ('821', '阳西县', '91', '255');
INSERT INTO `sh_region` VALUES ('822', '阳东县', '91', '255');
INSERT INTO `sh_region` VALUES ('823', '云城区', '92', '255');
INSERT INTO `sh_region` VALUES ('824', '罗定市', '92', '255');
INSERT INTO `sh_region` VALUES ('825', '新兴县', '92', '255');
INSERT INTO `sh_region` VALUES ('826', '郁南县', '92', '255');
INSERT INTO `sh_region` VALUES ('827', '云安县', '92', '255');
INSERT INTO `sh_region` VALUES ('828', '赤坎区', '93', '255');
INSERT INTO `sh_region` VALUES ('829', '霞山区', '93', '255');
INSERT INTO `sh_region` VALUES ('830', '坡头区', '93', '255');
INSERT INTO `sh_region` VALUES ('831', '麻章区', '93', '255');
INSERT INTO `sh_region` VALUES ('832', '廉江市', '93', '255');
INSERT INTO `sh_region` VALUES ('833', '雷州市', '93', '255');
INSERT INTO `sh_region` VALUES ('834', '吴川市', '93', '255');
INSERT INTO `sh_region` VALUES ('835', '遂溪县', '93', '255');
INSERT INTO `sh_region` VALUES ('836', '徐闻县', '93', '255');
INSERT INTO `sh_region` VALUES ('837', '肇庆市', '94', '255');
INSERT INTO `sh_region` VALUES ('838', '高要市', '94', '255');
INSERT INTO `sh_region` VALUES ('839', '四会市', '94', '255');
INSERT INTO `sh_region` VALUES ('840', '广宁县', '94', '255');
INSERT INTO `sh_region` VALUES ('841', '怀集县', '94', '255');
INSERT INTO `sh_region` VALUES ('842', '封开县', '94', '255');
INSERT INTO `sh_region` VALUES ('843', '德庆县', '94', '255');
INSERT INTO `sh_region` VALUES ('844', '石岐街道', '95', '255');
INSERT INTO `sh_region` VALUES ('845', '东区街道', '95', '255');
INSERT INTO `sh_region` VALUES ('846', '西区街道', '95', '255');
INSERT INTO `sh_region` VALUES ('847', '环城街道', '95', '255');
INSERT INTO `sh_region` VALUES ('848', '中山港街道', '95', '255');
INSERT INTO `sh_region` VALUES ('849', '五桂山街道', '95', '255');
INSERT INTO `sh_region` VALUES ('850', '香洲区', '96', '255');
INSERT INTO `sh_region` VALUES ('851', '斗门区', '96', '255');
INSERT INTO `sh_region` VALUES ('852', '金湾区', '96', '255');
INSERT INTO `sh_region` VALUES ('853', '邕宁区', '97', '255');
INSERT INTO `sh_region` VALUES ('854', '青秀区', '97', '255');
INSERT INTO `sh_region` VALUES ('855', '兴宁区', '97', '255');
INSERT INTO `sh_region` VALUES ('856', '良庆区', '97', '255');
INSERT INTO `sh_region` VALUES ('857', '西乡塘区', '97', '255');
INSERT INTO `sh_region` VALUES ('858', '江南区', '97', '255');
INSERT INTO `sh_region` VALUES ('859', '武鸣县', '97', '255');
INSERT INTO `sh_region` VALUES ('860', '隆安县', '97', '255');
INSERT INTO `sh_region` VALUES ('861', '马山县', '97', '255');
INSERT INTO `sh_region` VALUES ('862', '上林县', '97', '255');
INSERT INTO `sh_region` VALUES ('863', '宾阳县', '97', '255');
INSERT INTO `sh_region` VALUES ('864', '横县', '97', '255');
INSERT INTO `sh_region` VALUES ('865', '秀峰区', '98', '255');
INSERT INTO `sh_region` VALUES ('866', '叠彩区', '98', '255');
INSERT INTO `sh_region` VALUES ('867', '象山区', '98', '255');
INSERT INTO `sh_region` VALUES ('868', '七星区', '98', '255');
INSERT INTO `sh_region` VALUES ('869', '雁山区', '98', '255');
INSERT INTO `sh_region` VALUES ('870', '阳朔县', '98', '255');
INSERT INTO `sh_region` VALUES ('871', '临桂县', '98', '255');
INSERT INTO `sh_region` VALUES ('872', '灵川县', '98', '255');
INSERT INTO `sh_region` VALUES ('873', '全州县', '98', '255');
INSERT INTO `sh_region` VALUES ('874', '平乐县', '98', '255');
INSERT INTO `sh_region` VALUES ('875', '兴安县', '98', '255');
INSERT INTO `sh_region` VALUES ('876', '灌阳县', '98', '255');
INSERT INTO `sh_region` VALUES ('877', '荔浦县', '98', '255');
INSERT INTO `sh_region` VALUES ('878', '资源县', '98', '255');
INSERT INTO `sh_region` VALUES ('879', '永福县', '98', '255');
INSERT INTO `sh_region` VALUES ('880', '龙胜', '98', '255');
INSERT INTO `sh_region` VALUES ('881', '恭城', '98', '255');
INSERT INTO `sh_region` VALUES ('882', '右江区', '99', '255');
INSERT INTO `sh_region` VALUES ('883', '凌云县', '99', '255');
INSERT INTO `sh_region` VALUES ('884', '平果县', '99', '255');
INSERT INTO `sh_region` VALUES ('885', '西林县', '99', '255');
INSERT INTO `sh_region` VALUES ('886', '乐业县', '99', '255');
INSERT INTO `sh_region` VALUES ('887', '德保县', '99', '255');
INSERT INTO `sh_region` VALUES ('888', '田林县', '99', '255');
INSERT INTO `sh_region` VALUES ('889', '田阳县', '99', '255');
INSERT INTO `sh_region` VALUES ('890', '靖西县', '99', '255');
INSERT INTO `sh_region` VALUES ('891', '田东县', '99', '255');
INSERT INTO `sh_region` VALUES ('892', '那坡县', '99', '255');
INSERT INTO `sh_region` VALUES ('893', '隆林', '99', '255');
INSERT INTO `sh_region` VALUES ('894', '海城区', '100', '255');
INSERT INTO `sh_region` VALUES ('895', '银海区', '100', '255');
INSERT INTO `sh_region` VALUES ('896', '铁山港区', '100', '255');
INSERT INTO `sh_region` VALUES ('897', '合浦县', '100', '255');
INSERT INTO `sh_region` VALUES ('898', '江州区', '101', '255');
INSERT INTO `sh_region` VALUES ('899', '凭祥市', '101', '255');
INSERT INTO `sh_region` VALUES ('900', '宁明县', '101', '255');
INSERT INTO `sh_region` VALUES ('901', '扶绥县', '101', '255');
INSERT INTO `sh_region` VALUES ('902', '龙州县', '101', '255');
INSERT INTO `sh_region` VALUES ('903', '大新县', '101', '255');
INSERT INTO `sh_region` VALUES ('904', '天等县', '101', '255');
INSERT INTO `sh_region` VALUES ('905', '港口区', '102', '255');
INSERT INTO `sh_region` VALUES ('906', '防城区', '102', '255');
INSERT INTO `sh_region` VALUES ('907', '东兴市', '102', '255');
INSERT INTO `sh_region` VALUES ('908', '上思县', '102', '255');
INSERT INTO `sh_region` VALUES ('909', '港北区', '103', '255');
INSERT INTO `sh_region` VALUES ('910', '港南区', '103', '255');
INSERT INTO `sh_region` VALUES ('911', '覃塘区', '103', '255');
INSERT INTO `sh_region` VALUES ('912', '桂平市', '103', '255');
INSERT INTO `sh_region` VALUES ('913', '平南县', '103', '255');
INSERT INTO `sh_region` VALUES ('914', '金城江区', '104', '255');
INSERT INTO `sh_region` VALUES ('915', '宜州市', '104', '255');
INSERT INTO `sh_region` VALUES ('916', '天峨县', '104', '255');
INSERT INTO `sh_region` VALUES ('917', '凤山县', '104', '255');
INSERT INTO `sh_region` VALUES ('918', '南丹县', '104', '255');
INSERT INTO `sh_region` VALUES ('919', '东兰县', '104', '255');
INSERT INTO `sh_region` VALUES ('920', '都安', '104', '255');
INSERT INTO `sh_region` VALUES ('921', '罗城', '104', '255');
INSERT INTO `sh_region` VALUES ('922', '巴马', '104', '255');
INSERT INTO `sh_region` VALUES ('923', '环江', '104', '255');
INSERT INTO `sh_region` VALUES ('924', '大化', '104', '255');
INSERT INTO `sh_region` VALUES ('925', '八步区', '105', '255');
INSERT INTO `sh_region` VALUES ('926', '钟山县', '105', '255');
INSERT INTO `sh_region` VALUES ('927', '昭平县', '105', '255');
INSERT INTO `sh_region` VALUES ('928', '富川', '105', '255');
INSERT INTO `sh_region` VALUES ('929', '兴宾区', '106', '255');
INSERT INTO `sh_region` VALUES ('930', '合山市', '106', '255');
INSERT INTO `sh_region` VALUES ('931', '象州县', '106', '255');
INSERT INTO `sh_region` VALUES ('932', '武宣县', '106', '255');
INSERT INTO `sh_region` VALUES ('933', '忻城县', '106', '255');
INSERT INTO `sh_region` VALUES ('934', '金秀', '106', '255');
INSERT INTO `sh_region` VALUES ('935', '城中区', '107', '255');
INSERT INTO `sh_region` VALUES ('936', '鱼峰区', '107', '255');
INSERT INTO `sh_region` VALUES ('937', '柳北区', '107', '255');
INSERT INTO `sh_region` VALUES ('938', '柳南区', '107', '255');
INSERT INTO `sh_region` VALUES ('939', '柳江县', '107', '255');
INSERT INTO `sh_region` VALUES ('940', '柳城县', '107', '255');
INSERT INTO `sh_region` VALUES ('941', '鹿寨县', '107', '255');
INSERT INTO `sh_region` VALUES ('942', '融安县', '107', '255');
INSERT INTO `sh_region` VALUES ('943', '融水', '107', '255');
INSERT INTO `sh_region` VALUES ('944', '三江', '107', '255');
INSERT INTO `sh_region` VALUES ('945', '钦南区', '108', '255');
INSERT INTO `sh_region` VALUES ('946', '钦北区', '108', '255');
INSERT INTO `sh_region` VALUES ('947', '灵山县', '108', '255');
INSERT INTO `sh_region` VALUES ('948', '浦北县', '108', '255');
INSERT INTO `sh_region` VALUES ('949', '万秀区', '109', '255');
INSERT INTO `sh_region` VALUES ('950', '蝶山区', '109', '255');
INSERT INTO `sh_region` VALUES ('951', '长洲区', '109', '255');
INSERT INTO `sh_region` VALUES ('952', '岑溪市', '109', '255');
INSERT INTO `sh_region` VALUES ('953', '苍梧县', '109', '255');
INSERT INTO `sh_region` VALUES ('954', '藤县', '109', '255');
INSERT INTO `sh_region` VALUES ('955', '蒙山县', '109', '255');
INSERT INTO `sh_region` VALUES ('956', '玉州区', '110', '255');
INSERT INTO `sh_region` VALUES ('957', '北流市', '110', '255');
INSERT INTO `sh_region` VALUES ('958', '容县', '110', '255');
INSERT INTO `sh_region` VALUES ('959', '陆川县', '110', '255');
INSERT INTO `sh_region` VALUES ('960', '博白县', '110', '255');
INSERT INTO `sh_region` VALUES ('961', '兴业县', '110', '255');
INSERT INTO `sh_region` VALUES ('962', '南明区', '111', '255');
INSERT INTO `sh_region` VALUES ('963', '云岩区', '111', '255');
INSERT INTO `sh_region` VALUES ('964', '花溪区', '111', '255');
INSERT INTO `sh_region` VALUES ('965', '乌当区', '111', '255');
INSERT INTO `sh_region` VALUES ('966', '白云区', '111', '255');
INSERT INTO `sh_region` VALUES ('967', '小河区', '111', '255');
INSERT INTO `sh_region` VALUES ('968', '金阳新区', '111', '255');
INSERT INTO `sh_region` VALUES ('969', '新天园区', '111', '255');
INSERT INTO `sh_region` VALUES ('970', '清镇市', '111', '255');
INSERT INTO `sh_region` VALUES ('971', '开阳县', '111', '255');
INSERT INTO `sh_region` VALUES ('972', '修文县', '111', '255');
INSERT INTO `sh_region` VALUES ('973', '息烽县', '111', '255');
INSERT INTO `sh_region` VALUES ('974', '西秀区', '112', '255');
INSERT INTO `sh_region` VALUES ('975', '关岭', '112', '255');
INSERT INTO `sh_region` VALUES ('976', '镇宁', '112', '255');
INSERT INTO `sh_region` VALUES ('977', '紫云', '112', '255');
INSERT INTO `sh_region` VALUES ('978', '平坝县', '112', '255');
INSERT INTO `sh_region` VALUES ('979', '普定县', '112', '255');
INSERT INTO `sh_region` VALUES ('980', '毕节市', '113', '255');
INSERT INTO `sh_region` VALUES ('981', '大方县', '113', '255');
INSERT INTO `sh_region` VALUES ('982', '黔西县', '113', '255');
INSERT INTO `sh_region` VALUES ('983', '金沙县', '113', '255');
INSERT INTO `sh_region` VALUES ('984', '织金县', '113', '255');
INSERT INTO `sh_region` VALUES ('985', '纳雍县', '113', '255');
INSERT INTO `sh_region` VALUES ('986', '赫章县', '113', '255');
INSERT INTO `sh_region` VALUES ('987', '威宁', '113', '255');
INSERT INTO `sh_region` VALUES ('988', '钟山区', '114', '255');
INSERT INTO `sh_region` VALUES ('989', '六枝特区', '114', '255');
INSERT INTO `sh_region` VALUES ('990', '水城县', '114', '255');
INSERT INTO `sh_region` VALUES ('991', '盘县', '114', '255');
INSERT INTO `sh_region` VALUES ('992', '凯里市', '115', '255');
INSERT INTO `sh_region` VALUES ('993', '黄平县', '115', '255');
INSERT INTO `sh_region` VALUES ('994', '施秉县', '115', '255');
INSERT INTO `sh_region` VALUES ('995', '三穗县', '115', '255');
INSERT INTO `sh_region` VALUES ('996', '镇远县', '115', '255');
INSERT INTO `sh_region` VALUES ('997', '岑巩县', '115', '255');
INSERT INTO `sh_region` VALUES ('998', '天柱县', '115', '255');
INSERT INTO `sh_region` VALUES ('999', '锦屏县', '115', '255');
INSERT INTO `sh_region` VALUES ('1000', '剑河县', '115', '255');
INSERT INTO `sh_region` VALUES ('1001', '台江县', '115', '255');
INSERT INTO `sh_region` VALUES ('1002', '黎平县', '115', '255');
INSERT INTO `sh_region` VALUES ('1003', '榕江县', '115', '255');
INSERT INTO `sh_region` VALUES ('1004', '从江县', '115', '255');
INSERT INTO `sh_region` VALUES ('1005', '雷山县', '115', '255');
INSERT INTO `sh_region` VALUES ('1006', '麻江县', '115', '255');
INSERT INTO `sh_region` VALUES ('1007', '丹寨县', '115', '255');
INSERT INTO `sh_region` VALUES ('1008', '都匀市', '116', '255');
INSERT INTO `sh_region` VALUES ('1009', '福泉市', '116', '255');
INSERT INTO `sh_region` VALUES ('1010', '荔波县', '116', '255');
INSERT INTO `sh_region` VALUES ('1011', '贵定县', '116', '255');
INSERT INTO `sh_region` VALUES ('1012', '瓮安县', '116', '255');
INSERT INTO `sh_region` VALUES ('1013', '独山县', '116', '255');
INSERT INTO `sh_region` VALUES ('1014', '平塘县', '116', '255');
INSERT INTO `sh_region` VALUES ('1015', '罗甸县', '116', '255');
INSERT INTO `sh_region` VALUES ('1016', '长顺县', '116', '255');
INSERT INTO `sh_region` VALUES ('1017', '龙里县', '116', '255');
INSERT INTO `sh_region` VALUES ('1018', '惠水县', '116', '255');
INSERT INTO `sh_region` VALUES ('1019', '三都', '116', '255');
INSERT INTO `sh_region` VALUES ('1020', '兴义市', '117', '255');
INSERT INTO `sh_region` VALUES ('1021', '兴仁县', '117', '255');
INSERT INTO `sh_region` VALUES ('1022', '普安县', '117', '255');
INSERT INTO `sh_region` VALUES ('1023', '晴隆县', '117', '255');
INSERT INTO `sh_region` VALUES ('1024', '贞丰县', '117', '255');
INSERT INTO `sh_region` VALUES ('1025', '望谟县', '117', '255');
INSERT INTO `sh_region` VALUES ('1026', '册亨县', '117', '255');
INSERT INTO `sh_region` VALUES ('1027', '安龙县', '117', '255');
INSERT INTO `sh_region` VALUES ('1028', '铜仁市', '118', '255');
INSERT INTO `sh_region` VALUES ('1029', '江口县', '118', '255');
INSERT INTO `sh_region` VALUES ('1030', '石阡县', '118', '255');
INSERT INTO `sh_region` VALUES ('1031', '思南县', '118', '255');
INSERT INTO `sh_region` VALUES ('1032', '德江县', '118', '255');
INSERT INTO `sh_region` VALUES ('1033', '玉屏', '118', '255');
INSERT INTO `sh_region` VALUES ('1034', '印江', '118', '255');
INSERT INTO `sh_region` VALUES ('1035', '沿河', '118', '255');
INSERT INTO `sh_region` VALUES ('1036', '松桃', '118', '255');
INSERT INTO `sh_region` VALUES ('1037', '万山特区', '118', '255');
INSERT INTO `sh_region` VALUES ('1038', '红花岗区', '119', '255');
INSERT INTO `sh_region` VALUES ('1039', '务川县', '119', '255');
INSERT INTO `sh_region` VALUES ('1040', '道真县', '119', '255');
INSERT INTO `sh_region` VALUES ('1041', '汇川区', '119', '255');
INSERT INTO `sh_region` VALUES ('1042', '赤水市', '119', '255');
INSERT INTO `sh_region` VALUES ('1043', '仁怀市', '119', '255');
INSERT INTO `sh_region` VALUES ('1044', '遵义县', '119', '255');
INSERT INTO `sh_region` VALUES ('1045', '桐梓县', '119', '255');
INSERT INTO `sh_region` VALUES ('1046', '绥阳县', '119', '255');
INSERT INTO `sh_region` VALUES ('1047', '正安县', '119', '255');
INSERT INTO `sh_region` VALUES ('1048', '凤冈县', '119', '255');
INSERT INTO `sh_region` VALUES ('1049', '湄潭县', '119', '255');
INSERT INTO `sh_region` VALUES ('1050', '余庆县', '119', '255');
INSERT INTO `sh_region` VALUES ('1051', '习水县', '119', '255');
INSERT INTO `sh_region` VALUES ('1052', '道真', '119', '255');
INSERT INTO `sh_region` VALUES ('1053', '务川', '119', '255');
INSERT INTO `sh_region` VALUES ('1054', '秀英区', '120', '255');
INSERT INTO `sh_region` VALUES ('1055', '龙华区', '120', '255');
INSERT INTO `sh_region` VALUES ('1056', '琼山区', '120', '255');
INSERT INTO `sh_region` VALUES ('1057', '美兰区', '120', '255');
INSERT INTO `sh_region` VALUES ('1058', '市区', '137', '255');
INSERT INTO `sh_region` VALUES ('1059', '洋浦开发区', '137', '255');
INSERT INTO `sh_region` VALUES ('1060', '那大镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1061', '王五镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1062', '雅星镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1063', '大成镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1064', '中和镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1065', '峨蔓镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1066', '南丰镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1067', '白马井镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1068', '兰洋镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1069', '和庆镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1070', '海头镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1071', '排浦镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1072', '东成镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1073', '光村镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1074', '木棠镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1075', '新州镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1076', '三都镇', '137', '255');
INSERT INTO `sh_region` VALUES ('1077', '其他', '137', '255');
INSERT INTO `sh_region` VALUES ('1078', '长安区', '138', '255');
INSERT INTO `sh_region` VALUES ('1079', '桥东区', '138', '255');
INSERT INTO `sh_region` VALUES ('1080', '桥西区', '138', '255');
INSERT INTO `sh_region` VALUES ('1081', '新华区', '138', '255');
INSERT INTO `sh_region` VALUES ('1082', '裕华区', '138', '255');
INSERT INTO `sh_region` VALUES ('1083', '井陉矿区', '138', '255');
INSERT INTO `sh_region` VALUES ('1084', '高新区', '138', '255');
INSERT INTO `sh_region` VALUES ('1085', '辛集市', '138', '255');
INSERT INTO `sh_region` VALUES ('1086', '藁城市', '138', '255');
INSERT INTO `sh_region` VALUES ('1087', '晋州市', '138', '255');
INSERT INTO `sh_region` VALUES ('1088', '新乐市', '138', '255');
INSERT INTO `sh_region` VALUES ('1089', '鹿泉市', '138', '255');
INSERT INTO `sh_region` VALUES ('1090', '井陉县', '138', '255');
INSERT INTO `sh_region` VALUES ('1091', '正定县', '138', '255');
INSERT INTO `sh_region` VALUES ('1092', '栾城县', '138', '255');
INSERT INTO `sh_region` VALUES ('1093', '行唐县', '138', '255');
INSERT INTO `sh_region` VALUES ('1094', '灵寿县', '138', '255');
INSERT INTO `sh_region` VALUES ('1095', '高邑县', '138', '255');
INSERT INTO `sh_region` VALUES ('1096', '深泽县', '138', '255');
INSERT INTO `sh_region` VALUES ('1097', '赞皇县', '138', '255');
INSERT INTO `sh_region` VALUES ('1098', '无极县', '138', '255');
INSERT INTO `sh_region` VALUES ('1099', '平山县', '138', '255');
INSERT INTO `sh_region` VALUES ('1100', '元氏县', '138', '255');
INSERT INTO `sh_region` VALUES ('1101', '赵县', '138', '255');
INSERT INTO `sh_region` VALUES ('1102', '新市区', '139', '255');
INSERT INTO `sh_region` VALUES ('1103', '南市区', '139', '255');
INSERT INTO `sh_region` VALUES ('1104', '北市区', '139', '255');
INSERT INTO `sh_region` VALUES ('1105', '涿州市', '139', '255');
INSERT INTO `sh_region` VALUES ('1106', '定州市', '139', '255');
INSERT INTO `sh_region` VALUES ('1107', '安国市', '139', '255');
INSERT INTO `sh_region` VALUES ('1108', '高碑店市', '139', '255');
INSERT INTO `sh_region` VALUES ('1109', '满城县', '139', '255');
INSERT INTO `sh_region` VALUES ('1110', '清苑县', '139', '255');
INSERT INTO `sh_region` VALUES ('1111', '涞水县', '139', '255');
INSERT INTO `sh_region` VALUES ('1112', '阜平县', '139', '255');
INSERT INTO `sh_region` VALUES ('1113', '徐水县', '139', '255');
INSERT INTO `sh_region` VALUES ('1114', '定兴县', '139', '255');
INSERT INTO `sh_region` VALUES ('1115', '唐县', '139', '255');
INSERT INTO `sh_region` VALUES ('1116', '高阳县', '139', '255');
INSERT INTO `sh_region` VALUES ('1117', '容城县', '139', '255');
INSERT INTO `sh_region` VALUES ('1118', '涞源县', '139', '255');
INSERT INTO `sh_region` VALUES ('1119', '望都县', '139', '255');
INSERT INTO `sh_region` VALUES ('1120', '安新县', '139', '255');
INSERT INTO `sh_region` VALUES ('1121', '易县', '139', '255');
INSERT INTO `sh_region` VALUES ('1122', '曲阳县', '139', '255');
INSERT INTO `sh_region` VALUES ('1123', '蠡县', '139', '255');
INSERT INTO `sh_region` VALUES ('1124', '顺平县', '139', '255');
INSERT INTO `sh_region` VALUES ('1125', '博野县', '139', '255');
INSERT INTO `sh_region` VALUES ('1126', '雄县', '139', '255');
INSERT INTO `sh_region` VALUES ('1127', '运河区', '140', '255');
INSERT INTO `sh_region` VALUES ('1128', '新华区', '140', '255');
INSERT INTO `sh_region` VALUES ('1129', '泊头市', '140', '255');
INSERT INTO `sh_region` VALUES ('1130', '任丘市', '140', '255');
INSERT INTO `sh_region` VALUES ('1131', '黄骅市', '140', '255');
INSERT INTO `sh_region` VALUES ('1132', '河间市', '140', '255');
INSERT INTO `sh_region` VALUES ('1133', '沧县', '140', '255');
INSERT INTO `sh_region` VALUES ('1134', '青县', '140', '255');
INSERT INTO `sh_region` VALUES ('1135', '东光县', '140', '255');
INSERT INTO `sh_region` VALUES ('1136', '海兴县', '140', '255');
INSERT INTO `sh_region` VALUES ('1137', '盐山县', '140', '255');
INSERT INTO `sh_region` VALUES ('1138', '肃宁县', '140', '255');
INSERT INTO `sh_region` VALUES ('1139', '南皮县', '140', '255');
INSERT INTO `sh_region` VALUES ('1140', '吴桥县', '140', '255');
INSERT INTO `sh_region` VALUES ('1141', '献县', '140', '255');
INSERT INTO `sh_region` VALUES ('1142', '孟村', '140', '255');
INSERT INTO `sh_region` VALUES ('1143', '双桥区', '141', '255');
INSERT INTO `sh_region` VALUES ('1144', '双滦区', '141', '255');
INSERT INTO `sh_region` VALUES ('1145', '鹰手营子矿区', '141', '255');
INSERT INTO `sh_region` VALUES ('1146', '承德县', '141', '255');
INSERT INTO `sh_region` VALUES ('1147', '兴隆县', '141', '255');
INSERT INTO `sh_region` VALUES ('1148', '平泉县', '141', '255');
INSERT INTO `sh_region` VALUES ('1149', '滦平县', '141', '255');
INSERT INTO `sh_region` VALUES ('1150', '隆化县', '141', '255');
INSERT INTO `sh_region` VALUES ('1151', '丰宁', '141', '255');
INSERT INTO `sh_region` VALUES ('1152', '宽城', '141', '255');
INSERT INTO `sh_region` VALUES ('1153', '围场', '141', '255');
INSERT INTO `sh_region` VALUES ('1154', '从台区', '142', '255');
INSERT INTO `sh_region` VALUES ('1155', '复兴区', '142', '255');
INSERT INTO `sh_region` VALUES ('1156', '邯山区', '142', '255');
INSERT INTO `sh_region` VALUES ('1157', '峰峰矿区', '142', '255');
INSERT INTO `sh_region` VALUES ('1158', '武安市', '142', '255');
INSERT INTO `sh_region` VALUES ('1159', '邯郸县', '142', '255');
INSERT INTO `sh_region` VALUES ('1160', '临漳县', '142', '255');
INSERT INTO `sh_region` VALUES ('1161', '成安县', '142', '255');
INSERT INTO `sh_region` VALUES ('1162', '大名县', '142', '255');
INSERT INTO `sh_region` VALUES ('1163', '涉县', '142', '255');
INSERT INTO `sh_region` VALUES ('1164', '磁县', '142', '255');
INSERT INTO `sh_region` VALUES ('1165', '肥乡县', '142', '255');
INSERT INTO `sh_region` VALUES ('1166', '永年县', '142', '255');
INSERT INTO `sh_region` VALUES ('1167', '邱县', '142', '255');
INSERT INTO `sh_region` VALUES ('1168', '鸡泽县', '142', '255');
INSERT INTO `sh_region` VALUES ('1169', '广平县', '142', '255');
INSERT INTO `sh_region` VALUES ('1170', '馆陶县', '142', '255');
INSERT INTO `sh_region` VALUES ('1171', '魏县', '142', '255');
INSERT INTO `sh_region` VALUES ('1172', '曲周县', '142', '255');
INSERT INTO `sh_region` VALUES ('1173', '桃城区', '143', '255');
INSERT INTO `sh_region` VALUES ('1174', '冀州市', '143', '255');
INSERT INTO `sh_region` VALUES ('1175', '深州市', '143', '255');
INSERT INTO `sh_region` VALUES ('1176', '枣强县', '143', '255');
INSERT INTO `sh_region` VALUES ('1177', '武邑县', '143', '255');
INSERT INTO `sh_region` VALUES ('1178', '武强县', '143', '255');
INSERT INTO `sh_region` VALUES ('1179', '饶阳县', '143', '255');
INSERT INTO `sh_region` VALUES ('1180', '安平县', '143', '255');
INSERT INTO `sh_region` VALUES ('1181', '故城县', '143', '255');
INSERT INTO `sh_region` VALUES ('1182', '景县', '143', '255');
INSERT INTO `sh_region` VALUES ('1183', '阜城县', '143', '255');
INSERT INTO `sh_region` VALUES ('1184', '安次区', '144', '255');
INSERT INTO `sh_region` VALUES ('1185', '广阳区', '144', '255');
INSERT INTO `sh_region` VALUES ('1186', '霸州市', '144', '255');
INSERT INTO `sh_region` VALUES ('1187', '三河市', '144', '255');
INSERT INTO `sh_region` VALUES ('1188', '固安县', '144', '255');
INSERT INTO `sh_region` VALUES ('1189', '永清县', '144', '255');
INSERT INTO `sh_region` VALUES ('1190', '香河县', '144', '255');
INSERT INTO `sh_region` VALUES ('1191', '大城县', '144', '255');
INSERT INTO `sh_region` VALUES ('1192', '文安县', '144', '255');
INSERT INTO `sh_region` VALUES ('1193', '大厂', '144', '255');
INSERT INTO `sh_region` VALUES ('1194', '海港区', '145', '255');
INSERT INTO `sh_region` VALUES ('1195', '山海关区', '145', '255');
INSERT INTO `sh_region` VALUES ('1196', '北戴河区', '145', '255');
INSERT INTO `sh_region` VALUES ('1197', '昌黎县', '145', '255');
INSERT INTO `sh_region` VALUES ('1198', '抚宁县', '145', '255');
INSERT INTO `sh_region` VALUES ('1199', '卢龙县', '145', '255');
INSERT INTO `sh_region` VALUES ('1200', '青龙', '145', '255');
INSERT INTO `sh_region` VALUES ('1201', '路北区', '146', '255');
INSERT INTO `sh_region` VALUES ('1202', '路南区', '146', '255');
INSERT INTO `sh_region` VALUES ('1203', '古冶区', '146', '255');
INSERT INTO `sh_region` VALUES ('1204', '开平区', '146', '255');
INSERT INTO `sh_region` VALUES ('1205', '丰南区', '146', '255');
INSERT INTO `sh_region` VALUES ('1206', '丰润区', '146', '255');
INSERT INTO `sh_region` VALUES ('1207', '遵化市', '146', '255');
INSERT INTO `sh_region` VALUES ('1208', '迁安市', '146', '255');
INSERT INTO `sh_region` VALUES ('1209', '滦县', '146', '255');
INSERT INTO `sh_region` VALUES ('1210', '滦南县', '146', '255');
INSERT INTO `sh_region` VALUES ('1211', '乐亭县', '146', '255');
INSERT INTO `sh_region` VALUES ('1212', '迁西县', '146', '255');
INSERT INTO `sh_region` VALUES ('1213', '玉田县', '146', '255');
INSERT INTO `sh_region` VALUES ('1214', '唐海县', '146', '255');
INSERT INTO `sh_region` VALUES ('1215', '桥东区', '147', '255');
INSERT INTO `sh_region` VALUES ('1216', '桥西区', '147', '255');
INSERT INTO `sh_region` VALUES ('1217', '南宫市', '147', '255');
INSERT INTO `sh_region` VALUES ('1218', '沙河市', '147', '255');
INSERT INTO `sh_region` VALUES ('1219', '邢台县', '147', '255');
INSERT INTO `sh_region` VALUES ('1220', '临城县', '147', '255');
INSERT INTO `sh_region` VALUES ('1221', '内丘县', '147', '255');
INSERT INTO `sh_region` VALUES ('1222', '柏乡县', '147', '255');
INSERT INTO `sh_region` VALUES ('1223', '隆尧县', '147', '255');
INSERT INTO `sh_region` VALUES ('1224', '任县', '147', '255');
INSERT INTO `sh_region` VALUES ('1225', '南和县', '147', '255');
INSERT INTO `sh_region` VALUES ('1226', '宁晋县', '147', '255');
INSERT INTO `sh_region` VALUES ('1227', '巨鹿县', '147', '255');
INSERT INTO `sh_region` VALUES ('1228', '新河县', '147', '255');
INSERT INTO `sh_region` VALUES ('1229', '广宗县', '147', '255');
INSERT INTO `sh_region` VALUES ('1230', '平乡县', '147', '255');
INSERT INTO `sh_region` VALUES ('1231', '威县', '147', '255');
INSERT INTO `sh_region` VALUES ('1232', '清河县', '147', '255');
INSERT INTO `sh_region` VALUES ('1233', '临西县', '147', '255');
INSERT INTO `sh_region` VALUES ('1234', '桥西区', '148', '255');
INSERT INTO `sh_region` VALUES ('1235', '桥东区', '148', '255');
INSERT INTO `sh_region` VALUES ('1236', '宣化区', '148', '255');
INSERT INTO `sh_region` VALUES ('1237', '下花园区', '148', '255');
INSERT INTO `sh_region` VALUES ('1238', '宣化县', '148', '255');
INSERT INTO `sh_region` VALUES ('1239', '张北县', '148', '255');
INSERT INTO `sh_region` VALUES ('1240', '康保县', '148', '255');
INSERT INTO `sh_region` VALUES ('1241', '沽源县', '148', '255');
INSERT INTO `sh_region` VALUES ('1242', '尚义县', '148', '255');
INSERT INTO `sh_region` VALUES ('1243', '蔚县', '148', '255');
INSERT INTO `sh_region` VALUES ('1244', '阳原县', '148', '255');
INSERT INTO `sh_region` VALUES ('1245', '怀安县', '148', '255');
INSERT INTO `sh_region` VALUES ('1246', '万全县', '148', '255');
INSERT INTO `sh_region` VALUES ('1247', '怀来县', '148', '255');
INSERT INTO `sh_region` VALUES ('1248', '涿鹿县', '148', '255');
INSERT INTO `sh_region` VALUES ('1249', '赤城县', '148', '255');
INSERT INTO `sh_region` VALUES ('1250', '崇礼县', '148', '255');
INSERT INTO `sh_region` VALUES ('1251', '金水区', '149', '255');
INSERT INTO `sh_region` VALUES ('1252', '邙山区', '149', '255');
INSERT INTO `sh_region` VALUES ('1253', '二七区', '149', '255');
INSERT INTO `sh_region` VALUES ('1254', '管城区', '149', '255');
INSERT INTO `sh_region` VALUES ('1255', '中原区', '149', '255');
INSERT INTO `sh_region` VALUES ('1256', '上街区', '149', '255');
INSERT INTO `sh_region` VALUES ('1257', '惠济区', '149', '255');
INSERT INTO `sh_region` VALUES ('1258', '郑东新区', '149', '255');
INSERT INTO `sh_region` VALUES ('1259', '经济技术开发区', '149', '255');
INSERT INTO `sh_region` VALUES ('1260', '高新开发区', '149', '255');
INSERT INTO `sh_region` VALUES ('1261', '出口加工区', '149', '255');
INSERT INTO `sh_region` VALUES ('1262', '巩义市', '149', '255');
INSERT INTO `sh_region` VALUES ('1263', '荥阳市', '149', '255');
INSERT INTO `sh_region` VALUES ('1264', '新密市', '149', '255');
INSERT INTO `sh_region` VALUES ('1265', '新郑市', '149', '255');
INSERT INTO `sh_region` VALUES ('1266', '登封市', '149', '255');
INSERT INTO `sh_region` VALUES ('1267', '中牟县', '149', '255');
INSERT INTO `sh_region` VALUES ('1268', '西工区', '150', '255');
INSERT INTO `sh_region` VALUES ('1269', '老城区', '150', '255');
INSERT INTO `sh_region` VALUES ('1270', '涧西区', '150', '255');
INSERT INTO `sh_region` VALUES ('1271', '瀍河回族区', '150', '255');
INSERT INTO `sh_region` VALUES ('1272', '洛龙区', '150', '255');
INSERT INTO `sh_region` VALUES ('1273', '吉利区', '150', '255');
INSERT INTO `sh_region` VALUES ('1274', '偃师市', '150', '255');
INSERT INTO `sh_region` VALUES ('1275', '孟津县', '150', '255');
INSERT INTO `sh_region` VALUES ('1276', '新安县', '150', '255');
INSERT INTO `sh_region` VALUES ('1277', '栾川县', '150', '255');
INSERT INTO `sh_region` VALUES ('1278', '嵩县', '150', '255');
INSERT INTO `sh_region` VALUES ('1279', '汝阳县', '150', '255');
INSERT INTO `sh_region` VALUES ('1280', '宜阳县', '150', '255');
INSERT INTO `sh_region` VALUES ('1281', '洛宁县', '150', '255');
INSERT INTO `sh_region` VALUES ('1282', '伊川县', '150', '255');
INSERT INTO `sh_region` VALUES ('1283', '鼓楼区', '151', '255');
INSERT INTO `sh_region` VALUES ('1284', '龙亭区', '151', '255');
INSERT INTO `sh_region` VALUES ('1285', '顺河回族区', '151', '255');
INSERT INTO `sh_region` VALUES ('1286', '金明区', '151', '255');
INSERT INTO `sh_region` VALUES ('1287', '禹王台区', '151', '255');
INSERT INTO `sh_region` VALUES ('1288', '杞县', '151', '255');
INSERT INTO `sh_region` VALUES ('1289', '通许县', '151', '255');
INSERT INTO `sh_region` VALUES ('1290', '尉氏县', '151', '255');
INSERT INTO `sh_region` VALUES ('1291', '开封县', '151', '255');
INSERT INTO `sh_region` VALUES ('1292', '兰考县', '151', '255');
INSERT INTO `sh_region` VALUES ('1293', '北关区', '152', '255');
INSERT INTO `sh_region` VALUES ('1294', '文峰区', '152', '255');
INSERT INTO `sh_region` VALUES ('1295', '殷都区', '152', '255');
INSERT INTO `sh_region` VALUES ('1296', '龙安区', '152', '255');
INSERT INTO `sh_region` VALUES ('1297', '林州市', '152', '255');
INSERT INTO `sh_region` VALUES ('1298', '安阳县', '152', '255');
INSERT INTO `sh_region` VALUES ('1299', '汤阴县', '152', '255');
INSERT INTO `sh_region` VALUES ('1300', '滑县', '152', '255');
INSERT INTO `sh_region` VALUES ('1301', '内黄县', '152', '255');
INSERT INTO `sh_region` VALUES ('1302', '淇滨区', '153', '255');
INSERT INTO `sh_region` VALUES ('1303', '山城区', '153', '255');
INSERT INTO `sh_region` VALUES ('1304', '鹤山区', '153', '255');
INSERT INTO `sh_region` VALUES ('1305', '浚县', '153', '255');
INSERT INTO `sh_region` VALUES ('1306', '淇县', '153', '255');
INSERT INTO `sh_region` VALUES ('1307', '济源市', '154', '255');
INSERT INTO `sh_region` VALUES ('1308', '解放区', '155', '255');
INSERT INTO `sh_region` VALUES ('1309', '中站区', '155', '255');
INSERT INTO `sh_region` VALUES ('1310', '马村区', '155', '255');
INSERT INTO `sh_region` VALUES ('1311', '山阳区', '155', '255');
INSERT INTO `sh_region` VALUES ('1312', '沁阳市', '155', '255');
INSERT INTO `sh_region` VALUES ('1313', '孟州市', '155', '255');
INSERT INTO `sh_region` VALUES ('1314', '修武县', '155', '255');
INSERT INTO `sh_region` VALUES ('1315', '博爱县', '155', '255');
INSERT INTO `sh_region` VALUES ('1316', '武陟县', '155', '255');
INSERT INTO `sh_region` VALUES ('1317', '温县', '155', '255');
INSERT INTO `sh_region` VALUES ('1318', '卧龙区', '156', '255');
INSERT INTO `sh_region` VALUES ('1319', '宛城区', '156', '255');
INSERT INTO `sh_region` VALUES ('1320', '邓州市', '156', '255');
INSERT INTO `sh_region` VALUES ('1321', '南召县', '156', '255');
INSERT INTO `sh_region` VALUES ('1322', '方城县', '156', '255');
INSERT INTO `sh_region` VALUES ('1323', '西峡县', '156', '255');
INSERT INTO `sh_region` VALUES ('1324', '镇平县', '156', '255');
INSERT INTO `sh_region` VALUES ('1325', '内乡县', '156', '255');
INSERT INTO `sh_region` VALUES ('1326', '淅川县', '156', '255');
INSERT INTO `sh_region` VALUES ('1327', '社旗县', '156', '255');
INSERT INTO `sh_region` VALUES ('1328', '唐河县', '156', '255');
INSERT INTO `sh_region` VALUES ('1329', '新野县', '156', '255');
INSERT INTO `sh_region` VALUES ('1330', '桐柏县', '156', '255');
INSERT INTO `sh_region` VALUES ('1331', '新华区', '157', '255');
INSERT INTO `sh_region` VALUES ('1332', '卫东区', '157', '255');
INSERT INTO `sh_region` VALUES ('1333', '湛河区', '157', '255');
INSERT INTO `sh_region` VALUES ('1334', '石龙区', '157', '255');
INSERT INTO `sh_region` VALUES ('1335', '舞钢市', '157', '255');
INSERT INTO `sh_region` VALUES ('1336', '汝州市', '157', '255');
INSERT INTO `sh_region` VALUES ('1337', '宝丰县', '157', '255');
INSERT INTO `sh_region` VALUES ('1338', '叶县', '157', '255');
INSERT INTO `sh_region` VALUES ('1339', '鲁山县', '157', '255');
INSERT INTO `sh_region` VALUES ('1340', '郏县', '157', '255');
INSERT INTO `sh_region` VALUES ('1341', '湖滨区', '158', '255');
INSERT INTO `sh_region` VALUES ('1342', '义马市', '158', '255');
INSERT INTO `sh_region` VALUES ('1343', '灵宝市', '158', '255');
INSERT INTO `sh_region` VALUES ('1344', '渑池县', '158', '255');
INSERT INTO `sh_region` VALUES ('1345', '陕县', '158', '255');
INSERT INTO `sh_region` VALUES ('1346', '卢氏县', '158', '255');
INSERT INTO `sh_region` VALUES ('1347', '梁园区', '159', '255');
INSERT INTO `sh_region` VALUES ('1348', '睢阳区', '159', '255');
INSERT INTO `sh_region` VALUES ('1349', '永城市', '159', '255');
INSERT INTO `sh_region` VALUES ('1350', '民权县', '159', '255');
INSERT INTO `sh_region` VALUES ('1351', '睢县', '159', '255');
INSERT INTO `sh_region` VALUES ('1352', '宁陵县', '159', '255');
INSERT INTO `sh_region` VALUES ('1353', '虞城县', '159', '255');
INSERT INTO `sh_region` VALUES ('1354', '柘城县', '159', '255');
INSERT INTO `sh_region` VALUES ('1355', '夏邑县', '159', '255');
INSERT INTO `sh_region` VALUES ('1356', '卫滨区', '160', '255');
INSERT INTO `sh_region` VALUES ('1357', '红旗区', '160', '255');
INSERT INTO `sh_region` VALUES ('1358', '凤泉区', '160', '255');
INSERT INTO `sh_region` VALUES ('1359', '牧野区', '160', '255');
INSERT INTO `sh_region` VALUES ('1360', '卫辉市', '160', '255');
INSERT INTO `sh_region` VALUES ('1361', '辉县市', '160', '255');
INSERT INTO `sh_region` VALUES ('1362', '新乡县', '160', '255');
INSERT INTO `sh_region` VALUES ('1363', '获嘉县', '160', '255');
INSERT INTO `sh_region` VALUES ('1364', '原阳县', '160', '255');
INSERT INTO `sh_region` VALUES ('1365', '延津县', '160', '255');
INSERT INTO `sh_region` VALUES ('1366', '封丘县', '160', '255');
INSERT INTO `sh_region` VALUES ('1367', '长垣县', '160', '255');
INSERT INTO `sh_region` VALUES ('1368', '浉河区', '161', '255');
INSERT INTO `sh_region` VALUES ('1369', '平桥区', '161', '255');
INSERT INTO `sh_region` VALUES ('1370', '罗山县', '161', '255');
INSERT INTO `sh_region` VALUES ('1371', '光山县', '161', '255');
INSERT INTO `sh_region` VALUES ('1372', '新县', '161', '255');
INSERT INTO `sh_region` VALUES ('1373', '商城县', '161', '255');
INSERT INTO `sh_region` VALUES ('1374', '固始县', '161', '255');
INSERT INTO `sh_region` VALUES ('1375', '潢川县', '161', '255');
INSERT INTO `sh_region` VALUES ('1376', '淮滨县', '161', '255');
INSERT INTO `sh_region` VALUES ('1377', '息县', '161', '255');
INSERT INTO `sh_region` VALUES ('1378', '魏都区', '162', '255');
INSERT INTO `sh_region` VALUES ('1379', '禹州市', '162', '255');
INSERT INTO `sh_region` VALUES ('1380', '长葛市', '162', '255');
INSERT INTO `sh_region` VALUES ('1381', '许昌县', '162', '255');
INSERT INTO `sh_region` VALUES ('1382', '鄢陵县', '162', '255');
INSERT INTO `sh_region` VALUES ('1383', '襄城县', '162', '255');
INSERT INTO `sh_region` VALUES ('1384', '川汇区', '163', '255');
INSERT INTO `sh_region` VALUES ('1385', '项城市', '163', '255');
INSERT INTO `sh_region` VALUES ('1386', '扶沟县', '163', '255');
INSERT INTO `sh_region` VALUES ('1387', '西华县', '163', '255');
INSERT INTO `sh_region` VALUES ('1388', '商水县', '163', '255');
INSERT INTO `sh_region` VALUES ('1389', '沈丘县', '163', '255');
INSERT INTO `sh_region` VALUES ('1390', '郸城县', '163', '255');
INSERT INTO `sh_region` VALUES ('1391', '淮阳县', '163', '255');
INSERT INTO `sh_region` VALUES ('1392', '太康县', '163', '255');
INSERT INTO `sh_region` VALUES ('1393', '鹿邑县', '163', '255');
INSERT INTO `sh_region` VALUES ('1394', '驿城区', '164', '255');
INSERT INTO `sh_region` VALUES ('1395', '西平县', '164', '255');
INSERT INTO `sh_region` VALUES ('1396', '上蔡县', '164', '255');
INSERT INTO `sh_region` VALUES ('1397', '平舆县', '164', '255');
INSERT INTO `sh_region` VALUES ('1398', '正阳县', '164', '255');
INSERT INTO `sh_region` VALUES ('1399', '确山县', '164', '255');
INSERT INTO `sh_region` VALUES ('1400', '泌阳县', '164', '255');
INSERT INTO `sh_region` VALUES ('1401', '汝南县', '164', '255');
INSERT INTO `sh_region` VALUES ('1402', '遂平县', '164', '255');
INSERT INTO `sh_region` VALUES ('1403', '新蔡县', '164', '255');
INSERT INTO `sh_region` VALUES ('1404', '郾城区', '165', '255');
INSERT INTO `sh_region` VALUES ('1405', '源汇区', '165', '255');
INSERT INTO `sh_region` VALUES ('1406', '召陵区', '165', '255');
INSERT INTO `sh_region` VALUES ('1407', '舞阳县', '165', '255');
INSERT INTO `sh_region` VALUES ('1408', '临颍县', '165', '255');
INSERT INTO `sh_region` VALUES ('1409', '华龙区', '166', '255');
INSERT INTO `sh_region` VALUES ('1410', '清丰县', '166', '255');
INSERT INTO `sh_region` VALUES ('1411', '南乐县', '166', '255');
INSERT INTO `sh_region` VALUES ('1412', '范县', '166', '255');
INSERT INTO `sh_region` VALUES ('1413', '台前县', '166', '255');
INSERT INTO `sh_region` VALUES ('1414', '濮阳县', '166', '255');
INSERT INTO `sh_region` VALUES ('1415', '道里区', '167', '255');
INSERT INTO `sh_region` VALUES ('1416', '南岗区', '167', '255');
INSERT INTO `sh_region` VALUES ('1417', '动力区', '167', '255');
INSERT INTO `sh_region` VALUES ('1418', '平房区', '167', '255');
INSERT INTO `sh_region` VALUES ('1419', '香坊区', '167', '255');
INSERT INTO `sh_region` VALUES ('1420', '太平区', '167', '255');
INSERT INTO `sh_region` VALUES ('1421', '道外区', '167', '255');
INSERT INTO `sh_region` VALUES ('1422', '阿城区', '167', '255');
INSERT INTO `sh_region` VALUES ('1423', '呼兰区', '167', '255');
INSERT INTO `sh_region` VALUES ('1424', '松北区', '167', '255');
INSERT INTO `sh_region` VALUES ('1425', '尚志市', '167', '255');
INSERT INTO `sh_region` VALUES ('1426', '双城市', '167', '255');
INSERT INTO `sh_region` VALUES ('1427', '五常市', '167', '255');
INSERT INTO `sh_region` VALUES ('1428', '方正县', '167', '255');
INSERT INTO `sh_region` VALUES ('1429', '宾县', '167', '255');
INSERT INTO `sh_region` VALUES ('1430', '依兰县', '167', '255');
INSERT INTO `sh_region` VALUES ('1431', '巴彦县', '167', '255');
INSERT INTO `sh_region` VALUES ('1432', '通河县', '167', '255');
INSERT INTO `sh_region` VALUES ('1433', '木兰县', '167', '255');
INSERT INTO `sh_region` VALUES ('1434', '延寿县', '167', '255');
INSERT INTO `sh_region` VALUES ('1435', '萨尔图区', '168', '255');
INSERT INTO `sh_region` VALUES ('1436', '红岗区', '168', '255');
INSERT INTO `sh_region` VALUES ('1437', '龙凤区', '168', '255');
INSERT INTO `sh_region` VALUES ('1438', '让胡路区', '168', '255');
INSERT INTO `sh_region` VALUES ('1439', '大同区', '168', '255');
INSERT INTO `sh_region` VALUES ('1440', '肇州县', '168', '255');
INSERT INTO `sh_region` VALUES ('1441', '肇源县', '168', '255');
INSERT INTO `sh_region` VALUES ('1442', '林甸县', '168', '255');
INSERT INTO `sh_region` VALUES ('1443', '杜尔伯特', '168', '255');
INSERT INTO `sh_region` VALUES ('1444', '呼玛县', '169', '255');
INSERT INTO `sh_region` VALUES ('1445', '漠河县', '169', '255');
INSERT INTO `sh_region` VALUES ('1446', '塔河县', '169', '255');
INSERT INTO `sh_region` VALUES ('1447', '兴山区', '170', '255');
INSERT INTO `sh_region` VALUES ('1448', '工农区', '170', '255');
INSERT INTO `sh_region` VALUES ('1449', '南山区', '170', '255');
INSERT INTO `sh_region` VALUES ('1450', '兴安区', '170', '255');
INSERT INTO `sh_region` VALUES ('1451', '向阳区', '170', '255');
INSERT INTO `sh_region` VALUES ('1452', '东山区', '170', '255');
INSERT INTO `sh_region` VALUES ('1453', '萝北县', '170', '255');
INSERT INTO `sh_region` VALUES ('1454', '绥滨县', '170', '255');
INSERT INTO `sh_region` VALUES ('1455', '爱辉区', '171', '255');
INSERT INTO `sh_region` VALUES ('1456', '五大连池市', '171', '255');
INSERT INTO `sh_region` VALUES ('1457', '北安市', '171', '255');
INSERT INTO `sh_region` VALUES ('1458', '嫩江县', '171', '255');
INSERT INTO `sh_region` VALUES ('1459', '逊克县', '171', '255');
INSERT INTO `sh_region` VALUES ('1460', '孙吴县', '171', '255');
INSERT INTO `sh_region` VALUES ('1461', '鸡冠区', '172', '255');
INSERT INTO `sh_region` VALUES ('1462', '恒山区', '172', '255');
INSERT INTO `sh_region` VALUES ('1463', '城子河区', '172', '255');
INSERT INTO `sh_region` VALUES ('1464', '滴道区', '172', '255');
INSERT INTO `sh_region` VALUES ('1465', '梨树区', '172', '255');
INSERT INTO `sh_region` VALUES ('1466', '虎林市', '172', '255');
INSERT INTO `sh_region` VALUES ('1467', '密山市', '172', '255');
INSERT INTO `sh_region` VALUES ('1468', '鸡东县', '172', '255');
INSERT INTO `sh_region` VALUES ('1469', '前进区', '173', '255');
INSERT INTO `sh_region` VALUES ('1470', '郊区', '173', '255');
INSERT INTO `sh_region` VALUES ('1471', '向阳区', '173', '255');
INSERT INTO `sh_region` VALUES ('1472', '东风区', '173', '255');
INSERT INTO `sh_region` VALUES ('1473', '同江市', '173', '255');
INSERT INTO `sh_region` VALUES ('1474', '富锦市', '173', '255');
INSERT INTO `sh_region` VALUES ('1475', '桦南县', '173', '255');
INSERT INTO `sh_region` VALUES ('1476', '桦川县', '173', '255');
INSERT INTO `sh_region` VALUES ('1477', '汤原县', '173', '255');
INSERT INTO `sh_region` VALUES ('1478', '抚远县', '173', '255');
INSERT INTO `sh_region` VALUES ('1479', '爱民区', '174', '255');
INSERT INTO `sh_region` VALUES ('1480', '东安区', '174', '255');
INSERT INTO `sh_region` VALUES ('1481', '阳明区', '174', '255');
INSERT INTO `sh_region` VALUES ('1482', '西安区', '174', '255');
INSERT INTO `sh_region` VALUES ('1483', '绥芬河市', '174', '255');
INSERT INTO `sh_region` VALUES ('1484', '海林市', '174', '255');
INSERT INTO `sh_region` VALUES ('1485', '宁安市', '174', '255');
INSERT INTO `sh_region` VALUES ('1486', '穆棱市', '174', '255');
INSERT INTO `sh_region` VALUES ('1487', '东宁县', '174', '255');
INSERT INTO `sh_region` VALUES ('1488', '林口县', '174', '255');
INSERT INTO `sh_region` VALUES ('1489', '桃山区', '175', '255');
INSERT INTO `sh_region` VALUES ('1490', '新兴区', '175', '255');
INSERT INTO `sh_region` VALUES ('1491', '茄子河区', '175', '255');
INSERT INTO `sh_region` VALUES ('1492', '勃利县', '175', '255');
INSERT INTO `sh_region` VALUES ('1493', '龙沙区', '176', '255');
INSERT INTO `sh_region` VALUES ('1494', '昂昂溪区', '176', '255');
INSERT INTO `sh_region` VALUES ('1495', '铁峰区', '176', '255');
INSERT INTO `sh_region` VALUES ('1496', '建华区', '176', '255');
INSERT INTO `sh_region` VALUES ('1497', '富拉尔基区', '176', '255');
INSERT INTO `sh_region` VALUES ('1498', '碾子山区', '176', '255');
INSERT INTO `sh_region` VALUES ('1499', '梅里斯达斡尔区', '176', '255');
INSERT INTO `sh_region` VALUES ('1500', '讷河市', '176', '255');
INSERT INTO `sh_region` VALUES ('1501', '龙江县', '176', '255');
INSERT INTO `sh_region` VALUES ('1502', '依安县', '176', '255');
INSERT INTO `sh_region` VALUES ('1503', '泰来县', '176', '255');
INSERT INTO `sh_region` VALUES ('1504', '甘南县', '176', '255');
INSERT INTO `sh_region` VALUES ('1505', '富裕县', '176', '255');
INSERT INTO `sh_region` VALUES ('1506', '克山县', '176', '255');
INSERT INTO `sh_region` VALUES ('1507', '克东县', '176', '255');
INSERT INTO `sh_region` VALUES ('1508', '拜泉县', '176', '255');
INSERT INTO `sh_region` VALUES ('1509', '尖山区', '177', '255');
INSERT INTO `sh_region` VALUES ('1510', '岭东区', '177', '255');
INSERT INTO `sh_region` VALUES ('1511', '四方台区', '177', '255');
INSERT INTO `sh_region` VALUES ('1512', '宝山区', '177', '255');
INSERT INTO `sh_region` VALUES ('1513', '集贤县', '177', '255');
INSERT INTO `sh_region` VALUES ('1514', '友谊县', '177', '255');
INSERT INTO `sh_region` VALUES ('1515', '宝清县', '177', '255');
INSERT INTO `sh_region` VALUES ('1516', '饶河县', '177', '255');
INSERT INTO `sh_region` VALUES ('1517', '北林区', '178', '255');
INSERT INTO `sh_region` VALUES ('1518', '安达市', '178', '255');
INSERT INTO `sh_region` VALUES ('1519', '肇东市', '178', '255');
INSERT INTO `sh_region` VALUES ('1520', '海伦市', '178', '255');
INSERT INTO `sh_region` VALUES ('1521', '望奎县', '178', '255');
INSERT INTO `sh_region` VALUES ('1522', '兰西县', '178', '255');
INSERT INTO `sh_region` VALUES ('1523', '青冈县', '178', '255');
INSERT INTO `sh_region` VALUES ('1524', '庆安县', '178', '255');
INSERT INTO `sh_region` VALUES ('1525', '明水县', '178', '255');
INSERT INTO `sh_region` VALUES ('1526', '绥棱县', '178', '255');
INSERT INTO `sh_region` VALUES ('1527', '伊春区', '179', '255');
INSERT INTO `sh_region` VALUES ('1528', '带岭区', '179', '255');
INSERT INTO `sh_region` VALUES ('1529', '南岔区', '179', '255');
INSERT INTO `sh_region` VALUES ('1530', '金山屯区', '179', '255');
INSERT INTO `sh_region` VALUES ('1531', '西林区', '179', '255');
INSERT INTO `sh_region` VALUES ('1532', '美溪区', '179', '255');
INSERT INTO `sh_region` VALUES ('1533', '乌马河区', '179', '255');
INSERT INTO `sh_region` VALUES ('1534', '翠峦区', '179', '255');
INSERT INTO `sh_region` VALUES ('1535', '友好区', '179', '255');
INSERT INTO `sh_region` VALUES ('1536', '上甘岭区', '179', '255');
INSERT INTO `sh_region` VALUES ('1537', '五营区', '179', '255');
INSERT INTO `sh_region` VALUES ('1538', '红星区', '179', '255');
INSERT INTO `sh_region` VALUES ('1539', '新青区', '179', '255');
INSERT INTO `sh_region` VALUES ('1540', '汤旺河区', '179', '255');
INSERT INTO `sh_region` VALUES ('1541', '乌伊岭区', '179', '255');
INSERT INTO `sh_region` VALUES ('1542', '铁力市', '179', '255');
INSERT INTO `sh_region` VALUES ('1543', '嘉荫县', '179', '255');
INSERT INTO `sh_region` VALUES ('1544', '江岸区', '180', '255');
INSERT INTO `sh_region` VALUES ('1545', '武昌区', '180', '255');
INSERT INTO `sh_region` VALUES ('1546', '江汉区', '180', '255');
INSERT INTO `sh_region` VALUES ('1547', '硚口区', '180', '255');
INSERT INTO `sh_region` VALUES ('1548', '汉阳区', '180', '255');
INSERT INTO `sh_region` VALUES ('1549', '青山区', '180', '255');
INSERT INTO `sh_region` VALUES ('1550', '洪山区', '180', '255');
INSERT INTO `sh_region` VALUES ('1551', '东西湖区', '180', '255');
INSERT INTO `sh_region` VALUES ('1552', '汉南区', '180', '255');
INSERT INTO `sh_region` VALUES ('1553', '蔡甸区', '180', '255');
INSERT INTO `sh_region` VALUES ('1554', '江夏区', '180', '255');
INSERT INTO `sh_region` VALUES ('1555', '黄陂区', '180', '255');
INSERT INTO `sh_region` VALUES ('1556', '新洲区', '180', '255');
INSERT INTO `sh_region` VALUES ('1557', '经济开发区', '180', '255');
INSERT INTO `sh_region` VALUES ('1558', '仙桃市', '181', '255');
INSERT INTO `sh_region` VALUES ('1559', '鄂城区', '182', '255');
INSERT INTO `sh_region` VALUES ('1560', '华容区', '182', '255');
INSERT INTO `sh_region` VALUES ('1561', '梁子湖区', '182', '255');
INSERT INTO `sh_region` VALUES ('1562', '黄州区', '183', '255');
INSERT INTO `sh_region` VALUES ('1563', '麻城市', '183', '255');
INSERT INTO `sh_region` VALUES ('1564', '武穴市', '183', '255');
INSERT INTO `sh_region` VALUES ('1565', '团风县', '183', '255');
INSERT INTO `sh_region` VALUES ('1566', '红安县', '183', '255');
INSERT INTO `sh_region` VALUES ('1567', '罗田县', '183', '255');
INSERT INTO `sh_region` VALUES ('1568', '英山县', '183', '255');
INSERT INTO `sh_region` VALUES ('1569', '浠水县', '183', '255');
INSERT INTO `sh_region` VALUES ('1570', '蕲春县', '183', '255');
INSERT INTO `sh_region` VALUES ('1571', '黄梅县', '183', '255');
INSERT INTO `sh_region` VALUES ('1572', '黄石港区', '184', '255');
INSERT INTO `sh_region` VALUES ('1573', '西塞山区', '184', '255');
INSERT INTO `sh_region` VALUES ('1574', '下陆区', '184', '255');
INSERT INTO `sh_region` VALUES ('1575', '铁山区', '184', '255');
INSERT INTO `sh_region` VALUES ('1576', '大冶市', '184', '255');
INSERT INTO `sh_region` VALUES ('1577', '阳新县', '184', '255');
INSERT INTO `sh_region` VALUES ('1578', '东宝区', '185', '255');
INSERT INTO `sh_region` VALUES ('1579', '掇刀区', '185', '255');
INSERT INTO `sh_region` VALUES ('1580', '钟祥市', '185', '255');
INSERT INTO `sh_region` VALUES ('1581', '京山县', '185', '255');
INSERT INTO `sh_region` VALUES ('1582', '沙洋县', '185', '255');
INSERT INTO `sh_region` VALUES ('1583', '沙市区', '186', '255');
INSERT INTO `sh_region` VALUES ('1584', '荆州区', '186', '255');
INSERT INTO `sh_region` VALUES ('1585', '石首市', '186', '255');
INSERT INTO `sh_region` VALUES ('1586', '洪湖市', '186', '255');
INSERT INTO `sh_region` VALUES ('1587', '松滋市', '186', '255');
INSERT INTO `sh_region` VALUES ('1588', '公安县', '186', '255');
INSERT INTO `sh_region` VALUES ('1589', '监利县', '186', '255');
INSERT INTO `sh_region` VALUES ('1590', '江陵县', '186', '255');
INSERT INTO `sh_region` VALUES ('1591', '潜江市', '187', '255');
INSERT INTO `sh_region` VALUES ('1592', '神农架林区', '188', '255');
INSERT INTO `sh_region` VALUES ('1593', '张湾区', '189', '255');
INSERT INTO `sh_region` VALUES ('1594', '茅箭区', '189', '255');
INSERT INTO `sh_region` VALUES ('1595', '丹江口市', '189', '255');
INSERT INTO `sh_region` VALUES ('1596', '郧县', '189', '255');
INSERT INTO `sh_region` VALUES ('1597', '郧西县', '189', '255');
INSERT INTO `sh_region` VALUES ('1598', '竹山县', '189', '255');
INSERT INTO `sh_region` VALUES ('1599', '竹溪县', '189', '255');
INSERT INTO `sh_region` VALUES ('1600', '房县', '189', '255');
INSERT INTO `sh_region` VALUES ('1601', '曾都区', '190', '255');
INSERT INTO `sh_region` VALUES ('1602', '广水市', '190', '255');
INSERT INTO `sh_region` VALUES ('1603', '天门市', '191', '255');
INSERT INTO `sh_region` VALUES ('1604', '咸安区', '192', '255');
INSERT INTO `sh_region` VALUES ('1605', '赤壁市', '192', '255');
INSERT INTO `sh_region` VALUES ('1606', '嘉鱼县', '192', '255');
INSERT INTO `sh_region` VALUES ('1607', '通城县', '192', '255');
INSERT INTO `sh_region` VALUES ('1608', '崇阳县', '192', '255');
INSERT INTO `sh_region` VALUES ('1609', '通山县', '192', '255');
INSERT INTO `sh_region` VALUES ('1610', '襄城区', '193', '255');
INSERT INTO `sh_region` VALUES ('1611', '樊城区', '193', '255');
INSERT INTO `sh_region` VALUES ('1612', '襄阳区', '193', '255');
INSERT INTO `sh_region` VALUES ('1613', '老河口市', '193', '255');
INSERT INTO `sh_region` VALUES ('1614', '枣阳市', '193', '255');
INSERT INTO `sh_region` VALUES ('1615', '宜城市', '193', '255');
INSERT INTO `sh_region` VALUES ('1616', '南漳县', '193', '255');
INSERT INTO `sh_region` VALUES ('1617', '谷城县', '193', '255');
INSERT INTO `sh_region` VALUES ('1618', '保康县', '193', '255');
INSERT INTO `sh_region` VALUES ('1619', '孝南区', '194', '255');
INSERT INTO `sh_region` VALUES ('1620', '应城市', '194', '255');
INSERT INTO `sh_region` VALUES ('1621', '安陆市', '194', '255');
INSERT INTO `sh_region` VALUES ('1622', '汉川市', '194', '255');
INSERT INTO `sh_region` VALUES ('1623', '孝昌县', '194', '255');
INSERT INTO `sh_region` VALUES ('1624', '大悟县', '194', '255');
INSERT INTO `sh_region` VALUES ('1625', '云梦县', '194', '255');
INSERT INTO `sh_region` VALUES ('1626', '长阳', '195', '255');
INSERT INTO `sh_region` VALUES ('1627', '五峰', '195', '255');
INSERT INTO `sh_region` VALUES ('1628', '西陵区', '195', '255');
INSERT INTO `sh_region` VALUES ('1629', '伍家岗区', '195', '255');
INSERT INTO `sh_region` VALUES ('1630', '点军区', '195', '255');
INSERT INTO `sh_region` VALUES ('1631', '猇亭区', '195', '255');
INSERT INTO `sh_region` VALUES ('1632', '夷陵区', '195', '255');
INSERT INTO `sh_region` VALUES ('1633', '宜都市', '195', '255');
INSERT INTO `sh_region` VALUES ('1634', '当阳市', '195', '255');
INSERT INTO `sh_region` VALUES ('1635', '枝江市', '195', '255');
INSERT INTO `sh_region` VALUES ('1636', '远安县', '195', '255');
INSERT INTO `sh_region` VALUES ('1637', '兴山县', '195', '255');
INSERT INTO `sh_region` VALUES ('1638', '秭归县', '195', '255');
INSERT INTO `sh_region` VALUES ('1639', '恩施市', '196', '255');
INSERT INTO `sh_region` VALUES ('1640', '利川市', '196', '255');
INSERT INTO `sh_region` VALUES ('1641', '建始县', '196', '255');
INSERT INTO `sh_region` VALUES ('1642', '巴东县', '196', '255');
INSERT INTO `sh_region` VALUES ('1643', '宣恩县', '196', '255');
INSERT INTO `sh_region` VALUES ('1644', '咸丰县', '196', '255');
INSERT INTO `sh_region` VALUES ('1645', '来凤县', '196', '255');
INSERT INTO `sh_region` VALUES ('1646', '鹤峰县', '196', '255');
INSERT INTO `sh_region` VALUES ('1647', '岳麓区', '197', '255');
INSERT INTO `sh_region` VALUES ('1648', '芙蓉区', '197', '255');
INSERT INTO `sh_region` VALUES ('1649', '天心区', '197', '255');
INSERT INTO `sh_region` VALUES ('1650', '开福区', '197', '255');
INSERT INTO `sh_region` VALUES ('1651', '雨花区', '197', '255');
INSERT INTO `sh_region` VALUES ('1652', '开发区', '197', '255');
INSERT INTO `sh_region` VALUES ('1653', '浏阳市', '197', '255');
INSERT INTO `sh_region` VALUES ('1654', '长沙县', '197', '255');
INSERT INTO `sh_region` VALUES ('1655', '望城县', '197', '255');
INSERT INTO `sh_region` VALUES ('1656', '宁乡县', '197', '255');
INSERT INTO `sh_region` VALUES ('1657', '永定区', '198', '255');
INSERT INTO `sh_region` VALUES ('1658', '武陵源区', '198', '255');
INSERT INTO `sh_region` VALUES ('1659', '慈利县', '198', '255');
INSERT INTO `sh_region` VALUES ('1660', '桑植县', '198', '255');
INSERT INTO `sh_region` VALUES ('1661', '武陵区', '199', '255');
INSERT INTO `sh_region` VALUES ('1662', '鼎城区', '199', '255');
INSERT INTO `sh_region` VALUES ('1663', '津市市', '199', '255');
INSERT INTO `sh_region` VALUES ('1664', '安乡县', '199', '255');
INSERT INTO `sh_region` VALUES ('1665', '汉寿县', '199', '255');
INSERT INTO `sh_region` VALUES ('1666', '澧县', '199', '255');
INSERT INTO `sh_region` VALUES ('1667', '临澧县', '199', '255');
INSERT INTO `sh_region` VALUES ('1668', '桃源县', '199', '255');
INSERT INTO `sh_region` VALUES ('1669', '石门县', '199', '255');
INSERT INTO `sh_region` VALUES ('1670', '北湖区', '200', '255');
INSERT INTO `sh_region` VALUES ('1671', '苏仙区', '200', '255');
INSERT INTO `sh_region` VALUES ('1672', '资兴市', '200', '255');
INSERT INTO `sh_region` VALUES ('1673', '桂阳县', '200', '255');
INSERT INTO `sh_region` VALUES ('1674', '宜章县', '200', '255');
INSERT INTO `sh_region` VALUES ('1675', '永兴县', '200', '255');
INSERT INTO `sh_region` VALUES ('1676', '嘉禾县', '200', '255');
INSERT INTO `sh_region` VALUES ('1677', '临武县', '200', '255');
INSERT INTO `sh_region` VALUES ('1678', '汝城县', '200', '255');
INSERT INTO `sh_region` VALUES ('1679', '桂东县', '200', '255');
INSERT INTO `sh_region` VALUES ('1680', '安仁县', '200', '255');
INSERT INTO `sh_region` VALUES ('1681', '雁峰区', '201', '255');
INSERT INTO `sh_region` VALUES ('1682', '珠晖区', '201', '255');
INSERT INTO `sh_region` VALUES ('1683', '石鼓区', '201', '255');
INSERT INTO `sh_region` VALUES ('1684', '蒸湘区', '201', '255');
INSERT INTO `sh_region` VALUES ('1685', '南岳区', '201', '255');
INSERT INTO `sh_region` VALUES ('1686', '耒阳市', '201', '255');
INSERT INTO `sh_region` VALUES ('1687', '常宁市', '201', '255');
INSERT INTO `sh_region` VALUES ('1688', '衡阳县', '201', '255');
INSERT INTO `sh_region` VALUES ('1689', '衡南县', '201', '255');
INSERT INTO `sh_region` VALUES ('1690', '衡山县', '201', '255');
INSERT INTO `sh_region` VALUES ('1691', '衡东县', '201', '255');
INSERT INTO `sh_region` VALUES ('1692', '祁东县', '201', '255');
INSERT INTO `sh_region` VALUES ('1693', '鹤城区', '202', '255');
INSERT INTO `sh_region` VALUES ('1694', '靖州', '202', '255');
INSERT INTO `sh_region` VALUES ('1695', '麻阳', '202', '255');
INSERT INTO `sh_region` VALUES ('1696', '通道', '202', '255');
INSERT INTO `sh_region` VALUES ('1697', '新晃', '202', '255');
INSERT INTO `sh_region` VALUES ('1698', '芷江', '202', '255');
INSERT INTO `sh_region` VALUES ('1699', '沅陵县', '202', '255');
INSERT INTO `sh_region` VALUES ('1700', '辰溪县', '202', '255');
INSERT INTO `sh_region` VALUES ('1701', '溆浦县', '202', '255');
INSERT INTO `sh_region` VALUES ('1702', '中方县', '202', '255');
INSERT INTO `sh_region` VALUES ('1703', '会同县', '202', '255');
INSERT INTO `sh_region` VALUES ('1704', '洪江市', '202', '255');
INSERT INTO `sh_region` VALUES ('1705', '娄星区', '203', '255');
INSERT INTO `sh_region` VALUES ('1706', '冷水江市', '203', '255');
INSERT INTO `sh_region` VALUES ('1707', '涟源市', '203', '255');
INSERT INTO `sh_region` VALUES ('1708', '双峰县', '203', '255');
INSERT INTO `sh_region` VALUES ('1709', '新化县', '203', '255');
INSERT INTO `sh_region` VALUES ('1710', '城步', '204', '255');
INSERT INTO `sh_region` VALUES ('1711', '双清区', '204', '255');
INSERT INTO `sh_region` VALUES ('1712', '大祥区', '204', '255');
INSERT INTO `sh_region` VALUES ('1713', '北塔区', '204', '255');
INSERT INTO `sh_region` VALUES ('1714', '武冈市', '204', '255');
INSERT INTO `sh_region` VALUES ('1715', '邵东县', '204', '255');
INSERT INTO `sh_region` VALUES ('1716', '新邵县', '204', '255');
INSERT INTO `sh_region` VALUES ('1717', '邵阳县', '204', '255');
INSERT INTO `sh_region` VALUES ('1718', '隆回县', '204', '255');
INSERT INTO `sh_region` VALUES ('1719', '洞口县', '204', '255');
INSERT INTO `sh_region` VALUES ('1720', '绥宁县', '204', '255');
INSERT INTO `sh_region` VALUES ('1721', '新宁县', '204', '255');
INSERT INTO `sh_region` VALUES ('1722', '岳塘区', '205', '255');
INSERT INTO `sh_region` VALUES ('1723', '雨湖区', '205', '255');
INSERT INTO `sh_region` VALUES ('1724', '湘乡市', '205', '255');
INSERT INTO `sh_region` VALUES ('1725', '韶山市', '205', '255');
INSERT INTO `sh_region` VALUES ('1726', '湘潭县', '205', '255');
INSERT INTO `sh_region` VALUES ('1727', '吉首市', '206', '255');
INSERT INTO `sh_region` VALUES ('1728', '泸溪县', '206', '255');
INSERT INTO `sh_region` VALUES ('1729', '凤凰县', '206', '255');
INSERT INTO `sh_region` VALUES ('1730', '花垣县', '206', '255');
INSERT INTO `sh_region` VALUES ('1731', '保靖县', '206', '255');
INSERT INTO `sh_region` VALUES ('1732', '古丈县', '206', '255');
INSERT INTO `sh_region` VALUES ('1733', '永顺县', '206', '255');
INSERT INTO `sh_region` VALUES ('1734', '龙山县', '206', '255');
INSERT INTO `sh_region` VALUES ('1735', '赫山区', '207', '255');
INSERT INTO `sh_region` VALUES ('1736', '资阳区', '207', '255');
INSERT INTO `sh_region` VALUES ('1737', '沅江市', '207', '255');
INSERT INTO `sh_region` VALUES ('1738', '南县', '207', '255');
INSERT INTO `sh_region` VALUES ('1739', '桃江县', '207', '255');
INSERT INTO `sh_region` VALUES ('1740', '安化县', '207', '255');
INSERT INTO `sh_region` VALUES ('1741', '江华', '208', '255');
INSERT INTO `sh_region` VALUES ('1742', '冷水滩区', '208', '255');
INSERT INTO `sh_region` VALUES ('1743', '零陵区', '208', '255');
INSERT INTO `sh_region` VALUES ('1744', '祁阳县', '208', '255');
INSERT INTO `sh_region` VALUES ('1745', '东安县', '208', '255');
INSERT INTO `sh_region` VALUES ('1746', '双牌县', '208', '255');
INSERT INTO `sh_region` VALUES ('1747', '道县', '208', '255');
INSERT INTO `sh_region` VALUES ('1748', '江永县', '208', '255');
INSERT INTO `sh_region` VALUES ('1749', '宁远县', '208', '255');
INSERT INTO `sh_region` VALUES ('1750', '蓝山县', '208', '255');
INSERT INTO `sh_region` VALUES ('1751', '新田县', '208', '255');
INSERT INTO `sh_region` VALUES ('1752', '岳阳楼区', '209', '255');
INSERT INTO `sh_region` VALUES ('1753', '君山区', '209', '255');
INSERT INTO `sh_region` VALUES ('1754', '云溪区', '209', '255');
INSERT INTO `sh_region` VALUES ('1755', '汨罗市', '209', '255');
INSERT INTO `sh_region` VALUES ('1756', '临湘市', '209', '255');
INSERT INTO `sh_region` VALUES ('1757', '岳阳县', '209', '255');
INSERT INTO `sh_region` VALUES ('1758', '华容县', '209', '255');
INSERT INTO `sh_region` VALUES ('1759', '湘阴县', '209', '255');
INSERT INTO `sh_region` VALUES ('1760', '平江县', '209', '255');
INSERT INTO `sh_region` VALUES ('1761', '天元区', '210', '255');
INSERT INTO `sh_region` VALUES ('1762', '荷塘区', '210', '255');
INSERT INTO `sh_region` VALUES ('1763', '芦淞区', '210', '255');
INSERT INTO `sh_region` VALUES ('1764', '石峰区', '210', '255');
INSERT INTO `sh_region` VALUES ('1765', '醴陵市', '210', '255');
INSERT INTO `sh_region` VALUES ('1766', '株洲县', '210', '255');
INSERT INTO `sh_region` VALUES ('1767', '攸县', '210', '255');
INSERT INTO `sh_region` VALUES ('1768', '茶陵县', '210', '255');
INSERT INTO `sh_region` VALUES ('1769', '炎陵县', '210', '255');
INSERT INTO `sh_region` VALUES ('1770', '朝阳区', '211', '255');
INSERT INTO `sh_region` VALUES ('1771', '宽城区', '211', '255');
INSERT INTO `sh_region` VALUES ('1772', '二道区', '211', '255');
INSERT INTO `sh_region` VALUES ('1773', '南关区', '211', '255');
INSERT INTO `sh_region` VALUES ('1774', '绿园区', '211', '255');
INSERT INTO `sh_region` VALUES ('1775', '双阳区', '211', '255');
INSERT INTO `sh_region` VALUES ('1776', '净月潭开发区', '211', '255');
INSERT INTO `sh_region` VALUES ('1777', '高新技术开发区', '211', '255');
INSERT INTO `sh_region` VALUES ('1778', '经济技术开发区', '211', '255');
INSERT INTO `sh_region` VALUES ('1779', '汽车产业开发区', '211', '255');
INSERT INTO `sh_region` VALUES ('1780', '德惠市', '211', '255');
INSERT INTO `sh_region` VALUES ('1781', '九台市', '211', '255');
INSERT INTO `sh_region` VALUES ('1782', '榆树市', '211', '255');
INSERT INTO `sh_region` VALUES ('1783', '农安县', '211', '255');
INSERT INTO `sh_region` VALUES ('1784', '船营区', '212', '255');
INSERT INTO `sh_region` VALUES ('1785', '昌邑区', '212', '255');
INSERT INTO `sh_region` VALUES ('1786', '龙潭区', '212', '255');
INSERT INTO `sh_region` VALUES ('1787', '丰满区', '212', '255');
INSERT INTO `sh_region` VALUES ('1788', '蛟河市', '212', '255');
INSERT INTO `sh_region` VALUES ('1789', '桦甸市', '212', '255');
INSERT INTO `sh_region` VALUES ('1790', '舒兰市', '212', '255');
INSERT INTO `sh_region` VALUES ('1791', '磐石市', '212', '255');
INSERT INTO `sh_region` VALUES ('1792', '永吉县', '212', '255');
INSERT INTO `sh_region` VALUES ('1793', '洮北区', '213', '255');
INSERT INTO `sh_region` VALUES ('1794', '洮南市', '213', '255');
INSERT INTO `sh_region` VALUES ('1795', '大安市', '213', '255');
INSERT INTO `sh_region` VALUES ('1796', '镇赉县', '213', '255');
INSERT INTO `sh_region` VALUES ('1797', '通榆县', '213', '255');
INSERT INTO `sh_region` VALUES ('1798', '江源区', '214', '255');
INSERT INTO `sh_region` VALUES ('1799', '八道江区', '214', '255');
INSERT INTO `sh_region` VALUES ('1800', '长白', '214', '255');
INSERT INTO `sh_region` VALUES ('1801', '临江市', '214', '255');
INSERT INTO `sh_region` VALUES ('1802', '抚松县', '214', '255');
INSERT INTO `sh_region` VALUES ('1803', '靖宇县', '214', '255');
INSERT INTO `sh_region` VALUES ('1804', '龙山区', '215', '255');
INSERT INTO `sh_region` VALUES ('1805', '西安区', '215', '255');
INSERT INTO `sh_region` VALUES ('1806', '东丰县', '215', '255');
INSERT INTO `sh_region` VALUES ('1807', '东辽县', '215', '255');
INSERT INTO `sh_region` VALUES ('1808', '铁西区', '216', '255');
INSERT INTO `sh_region` VALUES ('1809', '铁东区', '216', '255');
INSERT INTO `sh_region` VALUES ('1810', '伊通', '216', '255');
INSERT INTO `sh_region` VALUES ('1811', '公主岭市', '216', '255');
INSERT INTO `sh_region` VALUES ('1812', '双辽市', '216', '255');
INSERT INTO `sh_region` VALUES ('1813', '梨树县', '216', '255');
INSERT INTO `sh_region` VALUES ('1814', '前郭尔罗斯', '217', '255');
INSERT INTO `sh_region` VALUES ('1815', '宁江区', '217', '255');
INSERT INTO `sh_region` VALUES ('1816', '长岭县', '217', '255');
INSERT INTO `sh_region` VALUES ('1817', '乾安县', '217', '255');
INSERT INTO `sh_region` VALUES ('1818', '扶余县', '217', '255');
INSERT INTO `sh_region` VALUES ('1819', '东昌区', '218', '255');
INSERT INTO `sh_region` VALUES ('1820', '二道江区', '218', '255');
INSERT INTO `sh_region` VALUES ('1821', '梅河口市', '218', '255');
INSERT INTO `sh_region` VALUES ('1822', '集安市', '218', '255');
INSERT INTO `sh_region` VALUES ('1823', '通化县', '218', '255');
INSERT INTO `sh_region` VALUES ('1824', '辉南县', '218', '255');
INSERT INTO `sh_region` VALUES ('1825', '柳河县', '218', '255');
INSERT INTO `sh_region` VALUES ('1826', '延吉市', '219', '255');
INSERT INTO `sh_region` VALUES ('1827', '图们市', '219', '255');
INSERT INTO `sh_region` VALUES ('1828', '敦化市', '219', '255');
INSERT INTO `sh_region` VALUES ('1829', '珲春市', '219', '255');
INSERT INTO `sh_region` VALUES ('1830', '龙井市', '219', '255');
INSERT INTO `sh_region` VALUES ('1831', '和龙市', '219', '255');
INSERT INTO `sh_region` VALUES ('1832', '安图县', '219', '255');
INSERT INTO `sh_region` VALUES ('1833', '汪清县', '219', '255');
INSERT INTO `sh_region` VALUES ('1834', '玄武区', '220', '255');
INSERT INTO `sh_region` VALUES ('1835', '鼓楼区', '220', '255');
INSERT INTO `sh_region` VALUES ('1836', '白下区', '220', '255');
INSERT INTO `sh_region` VALUES ('1837', '建邺区', '220', '255');
INSERT INTO `sh_region` VALUES ('1838', '秦淮区', '220', '255');
INSERT INTO `sh_region` VALUES ('1839', '雨花台区', '220', '255');
INSERT INTO `sh_region` VALUES ('1840', '下关区', '220', '255');
INSERT INTO `sh_region` VALUES ('1841', '栖霞区', '220', '255');
INSERT INTO `sh_region` VALUES ('1842', '浦口区', '220', '255');
INSERT INTO `sh_region` VALUES ('1843', '江宁区', '220', '255');
INSERT INTO `sh_region` VALUES ('1844', '六合区', '220', '255');
INSERT INTO `sh_region` VALUES ('1845', '溧水县', '220', '255');
INSERT INTO `sh_region` VALUES ('1846', '高淳县', '220', '255');
INSERT INTO `sh_region` VALUES ('1847', '沧浪区', '221', '255');
INSERT INTO `sh_region` VALUES ('1848', '金阊区', '221', '255');
INSERT INTO `sh_region` VALUES ('1849', '平江区', '221', '255');
INSERT INTO `sh_region` VALUES ('1850', '虎丘区', '221', '255');
INSERT INTO `sh_region` VALUES ('1851', '吴中区', '221', '255');
INSERT INTO `sh_region` VALUES ('1852', '相城区', '221', '255');
INSERT INTO `sh_region` VALUES ('1853', '园区', '221', '255');
INSERT INTO `sh_region` VALUES ('1854', '新区', '221', '255');
INSERT INTO `sh_region` VALUES ('1855', '常熟市', '221', '255');
INSERT INTO `sh_region` VALUES ('1856', '张家港市', '221', '255');
INSERT INTO `sh_region` VALUES ('1857', '玉山镇', '221', '255');
INSERT INTO `sh_region` VALUES ('1858', '巴城镇', '221', '255');
INSERT INTO `sh_region` VALUES ('1859', '周市镇', '221', '255');
INSERT INTO `sh_region` VALUES ('1860', '陆家镇', '221', '255');
INSERT INTO `sh_region` VALUES ('1861', '花桥镇', '221', '255');
INSERT INTO `sh_region` VALUES ('1862', '淀山湖镇', '221', '255');
INSERT INTO `sh_region` VALUES ('1863', '张浦镇', '221', '255');
INSERT INTO `sh_region` VALUES ('1864', '周庄镇', '221', '255');
INSERT INTO `sh_region` VALUES ('1865', '千灯镇', '221', '255');
INSERT INTO `sh_region` VALUES ('1866', '锦溪镇', '221', '255');
INSERT INTO `sh_region` VALUES ('1867', '开发区', '221', '255');
INSERT INTO `sh_region` VALUES ('1868', '吴江市', '221', '255');
INSERT INTO `sh_region` VALUES ('1869', '太仓市', '221', '255');
INSERT INTO `sh_region` VALUES ('1870', '崇安区', '222', '255');
INSERT INTO `sh_region` VALUES ('1871', '北塘区', '222', '255');
INSERT INTO `sh_region` VALUES ('1872', '南长区', '222', '255');
INSERT INTO `sh_region` VALUES ('1873', '锡山区', '222', '255');
INSERT INTO `sh_region` VALUES ('1874', '惠山区', '222', '255');
INSERT INTO `sh_region` VALUES ('1875', '滨湖区', '222', '255');
INSERT INTO `sh_region` VALUES ('1876', '新区', '222', '255');
INSERT INTO `sh_region` VALUES ('1877', '江阴市', '222', '255');
INSERT INTO `sh_region` VALUES ('1878', '宜兴市', '222', '255');
INSERT INTO `sh_region` VALUES ('1879', '天宁区', '223', '255');
INSERT INTO `sh_region` VALUES ('1880', '钟楼区', '223', '255');
INSERT INTO `sh_region` VALUES ('1881', '戚墅堰区', '223', '255');
INSERT INTO `sh_region` VALUES ('1882', '郊区', '223', '255');
INSERT INTO `sh_region` VALUES ('1883', '新北区', '223', '255');
INSERT INTO `sh_region` VALUES ('1884', '武进区', '223', '255');
INSERT INTO `sh_region` VALUES ('1885', '溧阳市', '223', '255');
INSERT INTO `sh_region` VALUES ('1886', '金坛市', '223', '255');
INSERT INTO `sh_region` VALUES ('1887', '清河区', '224', '255');
INSERT INTO `sh_region` VALUES ('1888', '清浦区', '224', '255');
INSERT INTO `sh_region` VALUES ('1889', '楚州区', '224', '255');
INSERT INTO `sh_region` VALUES ('1890', '淮阴区', '224', '255');
INSERT INTO `sh_region` VALUES ('1891', '涟水县', '224', '255');
INSERT INTO `sh_region` VALUES ('1892', '洪泽县', '224', '255');
INSERT INTO `sh_region` VALUES ('1893', '盱眙县', '224', '255');
INSERT INTO `sh_region` VALUES ('1894', '金湖县', '224', '255');
INSERT INTO `sh_region` VALUES ('1895', '新浦区', '225', '255');
INSERT INTO `sh_region` VALUES ('1896', '连云区', '225', '255');
INSERT INTO `sh_region` VALUES ('1897', '海州区', '225', '255');
INSERT INTO `sh_region` VALUES ('1898', '赣榆县', '225', '255');
INSERT INTO `sh_region` VALUES ('1899', '东海县', '225', '255');
INSERT INTO `sh_region` VALUES ('1900', '灌云县', '225', '255');
INSERT INTO `sh_region` VALUES ('1901', '灌南县', '225', '255');
INSERT INTO `sh_region` VALUES ('1902', '崇川区', '226', '255');
INSERT INTO `sh_region` VALUES ('1903', '港闸区', '226', '255');
INSERT INTO `sh_region` VALUES ('1904', '经济开发区', '226', '255');
INSERT INTO `sh_region` VALUES ('1905', '启东市', '226', '255');
INSERT INTO `sh_region` VALUES ('1906', '如皋市', '226', '255');
INSERT INTO `sh_region` VALUES ('1907', '通州市', '226', '255');
INSERT INTO `sh_region` VALUES ('1908', '海门市', '226', '255');
INSERT INTO `sh_region` VALUES ('1909', '海安县', '226', '255');
INSERT INTO `sh_region` VALUES ('1910', '如东县', '226', '255');
INSERT INTO `sh_region` VALUES ('1911', '宿城区', '227', '255');
INSERT INTO `sh_region` VALUES ('1912', '宿豫区', '227', '255');
INSERT INTO `sh_region` VALUES ('1913', '宿豫县', '227', '255');
INSERT INTO `sh_region` VALUES ('1914', '沭阳县', '227', '255');
INSERT INTO `sh_region` VALUES ('1915', '泗阳县', '227', '255');
INSERT INTO `sh_region` VALUES ('1916', '泗洪县', '227', '255');
INSERT INTO `sh_region` VALUES ('1917', '海陵区', '228', '255');
INSERT INTO `sh_region` VALUES ('1918', '高港区', '228', '255');
INSERT INTO `sh_region` VALUES ('1919', '兴化市', '228', '255');
INSERT INTO `sh_region` VALUES ('1920', '靖江市', '228', '255');
INSERT INTO `sh_region` VALUES ('1921', '泰兴市', '228', '255');
INSERT INTO `sh_region` VALUES ('1922', '姜堰市', '228', '255');
INSERT INTO `sh_region` VALUES ('1923', '云龙区', '229', '255');
INSERT INTO `sh_region` VALUES ('1924', '鼓楼区', '229', '255');
INSERT INTO `sh_region` VALUES ('1925', '九里区', '229', '255');
INSERT INTO `sh_region` VALUES ('1926', '贾汪区', '229', '255');
INSERT INTO `sh_region` VALUES ('1927', '泉山区', '229', '255');
INSERT INTO `sh_region` VALUES ('1928', '新沂市', '229', '255');
INSERT INTO `sh_region` VALUES ('1929', '邳州市', '229', '255');
INSERT INTO `sh_region` VALUES ('1930', '丰县', '229', '255');
INSERT INTO `sh_region` VALUES ('1931', '沛县', '229', '255');
INSERT INTO `sh_region` VALUES ('1932', '铜山县', '229', '255');
INSERT INTO `sh_region` VALUES ('1933', '睢宁县', '229', '255');
INSERT INTO `sh_region` VALUES ('1934', '城区', '230', '255');
INSERT INTO `sh_region` VALUES ('1935', '亭湖区', '230', '255');
INSERT INTO `sh_region` VALUES ('1936', '盐都区', '230', '255');
INSERT INTO `sh_region` VALUES ('1937', '盐都县', '230', '255');
INSERT INTO `sh_region` VALUES ('1938', '东台市', '230', '255');
INSERT INTO `sh_region` VALUES ('1939', '大丰市', '230', '255');
INSERT INTO `sh_region` VALUES ('1940', '响水县', '230', '255');
INSERT INTO `sh_region` VALUES ('1941', '滨海县', '230', '255');
INSERT INTO `sh_region` VALUES ('1942', '阜宁县', '230', '255');
INSERT INTO `sh_region` VALUES ('1943', '射阳县', '230', '255');
INSERT INTO `sh_region` VALUES ('1944', '建湖县', '230', '255');
INSERT INTO `sh_region` VALUES ('1945', '广陵区', '231', '255');
INSERT INTO `sh_region` VALUES ('1946', '维扬区', '231', '255');
INSERT INTO `sh_region` VALUES ('1947', '邗江区', '231', '255');
INSERT INTO `sh_region` VALUES ('1948', '仪征市', '231', '255');
INSERT INTO `sh_region` VALUES ('1949', '高邮市', '231', '255');
INSERT INTO `sh_region` VALUES ('1950', '江都市', '231', '255');
INSERT INTO `sh_region` VALUES ('1951', '宝应县', '231', '255');
INSERT INTO `sh_region` VALUES ('1952', '京口区', '232', '255');
INSERT INTO `sh_region` VALUES ('1953', '润州区', '232', '255');
INSERT INTO `sh_region` VALUES ('1954', '丹徒区', '232', '255');
INSERT INTO `sh_region` VALUES ('1955', '丹阳市', '232', '255');
INSERT INTO `sh_region` VALUES ('1956', '扬中市', '232', '255');
INSERT INTO `sh_region` VALUES ('1957', '句容市', '232', '255');
INSERT INTO `sh_region` VALUES ('1958', '东湖区', '233', '255');
INSERT INTO `sh_region` VALUES ('1959', '西湖区', '233', '255');
INSERT INTO `sh_region` VALUES ('1960', '青云谱区', '233', '255');
INSERT INTO `sh_region` VALUES ('1961', '湾里区', '233', '255');
INSERT INTO `sh_region` VALUES ('1962', '青山湖区', '233', '255');
INSERT INTO `sh_region` VALUES ('1963', '红谷滩新区', '233', '255');
INSERT INTO `sh_region` VALUES ('1964', '昌北区', '233', '255');
INSERT INTO `sh_region` VALUES ('1965', '高新区', '233', '255');
INSERT INTO `sh_region` VALUES ('1966', '南昌县', '233', '255');
INSERT INTO `sh_region` VALUES ('1967', '新建县', '233', '255');
INSERT INTO `sh_region` VALUES ('1968', '安义县', '233', '255');
INSERT INTO `sh_region` VALUES ('1969', '进贤县', '233', '255');
INSERT INTO `sh_region` VALUES ('1970', '临川区', '234', '255');
INSERT INTO `sh_region` VALUES ('1971', '南城县', '234', '255');
INSERT INTO `sh_region` VALUES ('1972', '黎川县', '234', '255');
INSERT INTO `sh_region` VALUES ('1973', '南丰县', '234', '255');
INSERT INTO `sh_region` VALUES ('1974', '崇仁县', '234', '255');
INSERT INTO `sh_region` VALUES ('1975', '乐安县', '234', '255');
INSERT INTO `sh_region` VALUES ('1976', '宜黄县', '234', '255');
INSERT INTO `sh_region` VALUES ('1977', '金溪县', '234', '255');
INSERT INTO `sh_region` VALUES ('1978', '资溪县', '234', '255');
INSERT INTO `sh_region` VALUES ('1979', '东乡县', '234', '255');
INSERT INTO `sh_region` VALUES ('1980', '广昌县', '234', '255');
INSERT INTO `sh_region` VALUES ('1981', '章贡区', '235', '255');
INSERT INTO `sh_region` VALUES ('1982', '于都县', '235', '255');
INSERT INTO `sh_region` VALUES ('1983', '瑞金市', '235', '255');
INSERT INTO `sh_region` VALUES ('1984', '南康市', '235', '255');
INSERT INTO `sh_region` VALUES ('1985', '赣县', '235', '255');
INSERT INTO `sh_region` VALUES ('1986', '信丰县', '235', '255');
INSERT INTO `sh_region` VALUES ('1987', '大余县', '235', '255');
INSERT INTO `sh_region` VALUES ('1988', '上犹县', '235', '255');
INSERT INTO `sh_region` VALUES ('1989', '崇义县', '235', '255');
INSERT INTO `sh_region` VALUES ('1990', '安远县', '235', '255');
INSERT INTO `sh_region` VALUES ('1991', '龙南县', '235', '255');
INSERT INTO `sh_region` VALUES ('1992', '定南县', '235', '255');
INSERT INTO `sh_region` VALUES ('1993', '全南县', '235', '255');
INSERT INTO `sh_region` VALUES ('1994', '宁都县', '235', '255');
INSERT INTO `sh_region` VALUES ('1995', '兴国县', '235', '255');
INSERT INTO `sh_region` VALUES ('1996', '会昌县', '235', '255');
INSERT INTO `sh_region` VALUES ('1997', '寻乌县', '235', '255');
INSERT INTO `sh_region` VALUES ('1998', '石城县', '235', '255');
INSERT INTO `sh_region` VALUES ('1999', '安福县', '236', '255');
INSERT INTO `sh_region` VALUES ('2000', '吉州区', '236', '255');
INSERT INTO `sh_region` VALUES ('2001', '青原区', '236', '255');
INSERT INTO `sh_region` VALUES ('2002', '井冈山市', '236', '255');
INSERT INTO `sh_region` VALUES ('2003', '吉安县', '236', '255');
INSERT INTO `sh_region` VALUES ('2004', '吉水县', '236', '255');
INSERT INTO `sh_region` VALUES ('2005', '峡江县', '236', '255');
INSERT INTO `sh_region` VALUES ('2006', '新干县', '236', '255');
INSERT INTO `sh_region` VALUES ('2007', '永丰县', '236', '255');
INSERT INTO `sh_region` VALUES ('2008', '泰和县', '236', '255');
INSERT INTO `sh_region` VALUES ('2009', '遂川县', '236', '255');
INSERT INTO `sh_region` VALUES ('2010', '万安县', '236', '255');
INSERT INTO `sh_region` VALUES ('2011', '永新县', '236', '255');
INSERT INTO `sh_region` VALUES ('2012', '珠山区', '237', '255');
INSERT INTO `sh_region` VALUES ('2013', '昌江区', '237', '255');
INSERT INTO `sh_region` VALUES ('2014', '乐平市', '237', '255');
INSERT INTO `sh_region` VALUES ('2015', '浮梁县', '237', '255');
INSERT INTO `sh_region` VALUES ('2016', '浔阳区', '238', '255');
INSERT INTO `sh_region` VALUES ('2017', '庐山区', '238', '255');
INSERT INTO `sh_region` VALUES ('2018', '瑞昌市', '238', '255');
INSERT INTO `sh_region` VALUES ('2019', '九江县', '238', '255');
INSERT INTO `sh_region` VALUES ('2020', '武宁县', '238', '255');
INSERT INTO `sh_region` VALUES ('2021', '修水县', '238', '255');
INSERT INTO `sh_region` VALUES ('2022', '永修县', '238', '255');
INSERT INTO `sh_region` VALUES ('2023', '德安县', '238', '255');
INSERT INTO `sh_region` VALUES ('2024', '星子县', '238', '255');
INSERT INTO `sh_region` VALUES ('2025', '都昌县', '238', '255');
INSERT INTO `sh_region` VALUES ('2026', '湖口县', '238', '255');
INSERT INTO `sh_region` VALUES ('2027', '彭泽县', '238', '255');
INSERT INTO `sh_region` VALUES ('2028', '安源区', '239', '255');
INSERT INTO `sh_region` VALUES ('2029', '湘东区', '239', '255');
INSERT INTO `sh_region` VALUES ('2030', '莲花县', '239', '255');
INSERT INTO `sh_region` VALUES ('2031', '芦溪县', '239', '255');
INSERT INTO `sh_region` VALUES ('2032', '上栗县', '239', '255');
INSERT INTO `sh_region` VALUES ('2033', '信州区', '240', '255');
INSERT INTO `sh_region` VALUES ('2034', '德兴市', '240', '255');
INSERT INTO `sh_region` VALUES ('2035', '上饶县', '240', '255');
INSERT INTO `sh_region` VALUES ('2036', '广丰县', '240', '255');
INSERT INTO `sh_region` VALUES ('2037', '玉山县', '240', '255');
INSERT INTO `sh_region` VALUES ('2038', '铅山县', '240', '255');
INSERT INTO `sh_region` VALUES ('2039', '横峰县', '240', '255');
INSERT INTO `sh_region` VALUES ('2040', '弋阳县', '240', '255');
INSERT INTO `sh_region` VALUES ('2041', '余干县', '240', '255');
INSERT INTO `sh_region` VALUES ('2042', '波阳县', '240', '255');
INSERT INTO `sh_region` VALUES ('2043', '万年县', '240', '255');
INSERT INTO `sh_region` VALUES ('2044', '婺源县', '240', '255');
INSERT INTO `sh_region` VALUES ('2045', '渝水区', '241', '255');
INSERT INTO `sh_region` VALUES ('2046', '分宜县', '241', '255');
INSERT INTO `sh_region` VALUES ('2047', '袁州区', '242', '255');
INSERT INTO `sh_region` VALUES ('2048', '丰城市', '242', '255');
INSERT INTO `sh_region` VALUES ('2049', '樟树市', '242', '255');
INSERT INTO `sh_region` VALUES ('2050', '高安市', '242', '255');
INSERT INTO `sh_region` VALUES ('2051', '奉新县', '242', '255');
INSERT INTO `sh_region` VALUES ('2052', '万载县', '242', '255');
INSERT INTO `sh_region` VALUES ('2053', '上高县', '242', '255');
INSERT INTO `sh_region` VALUES ('2054', '宜丰县', '242', '255');
INSERT INTO `sh_region` VALUES ('2055', '靖安县', '242', '255');
INSERT INTO `sh_region` VALUES ('2056', '铜鼓县', '242', '255');
INSERT INTO `sh_region` VALUES ('2057', '月湖区', '243', '255');
INSERT INTO `sh_region` VALUES ('2058', '贵溪市', '243', '255');
INSERT INTO `sh_region` VALUES ('2059', '余江县', '243', '255');
INSERT INTO `sh_region` VALUES ('2060', '沈河区', '244', '255');
INSERT INTO `sh_region` VALUES ('2061', '皇姑区', '244', '255');
INSERT INTO `sh_region` VALUES ('2062', '和平区', '244', '255');
INSERT INTO `sh_region` VALUES ('2063', '大东区', '244', '255');
INSERT INTO `sh_region` VALUES ('2064', '铁西区', '244', '255');
INSERT INTO `sh_region` VALUES ('2065', '苏家屯区', '244', '255');
INSERT INTO `sh_region` VALUES ('2066', '东陵区', '244', '255');
INSERT INTO `sh_region` VALUES ('2067', '沈北新区', '244', '255');
INSERT INTO `sh_region` VALUES ('2068', '于洪区', '244', '255');
INSERT INTO `sh_region` VALUES ('2069', '浑南新区', '244', '255');
INSERT INTO `sh_region` VALUES ('2070', '新民市', '244', '255');
INSERT INTO `sh_region` VALUES ('2071', '辽中县', '244', '255');
INSERT INTO `sh_region` VALUES ('2072', '康平县', '244', '255');
INSERT INTO `sh_region` VALUES ('2073', '法库县', '244', '255');
INSERT INTO `sh_region` VALUES ('2074', '西岗区', '245', '255');
INSERT INTO `sh_region` VALUES ('2075', '中山区', '245', '255');
INSERT INTO `sh_region` VALUES ('2076', '沙河口区', '245', '255');
INSERT INTO `sh_region` VALUES ('2077', '甘井子区', '245', '255');
INSERT INTO `sh_region` VALUES ('2078', '旅顺口区', '245', '255');
INSERT INTO `sh_region` VALUES ('2079', '金州区', '245', '255');
INSERT INTO `sh_region` VALUES ('2080', '开发区', '245', '255');
INSERT INTO `sh_region` VALUES ('2081', '瓦房店市', '245', '255');
INSERT INTO `sh_region` VALUES ('2082', '普兰店市', '245', '255');
INSERT INTO `sh_region` VALUES ('2083', '庄河市', '245', '255');
INSERT INTO `sh_region` VALUES ('2084', '长海县', '245', '255');
INSERT INTO `sh_region` VALUES ('2085', '铁东区', '246', '255');
INSERT INTO `sh_region` VALUES ('2086', '铁西区', '246', '255');
INSERT INTO `sh_region` VALUES ('2087', '立山区', '246', '255');
INSERT INTO `sh_region` VALUES ('2088', '千山区', '246', '255');
INSERT INTO `sh_region` VALUES ('2089', '岫岩', '246', '255');
INSERT INTO `sh_region` VALUES ('2090', '海城市', '246', '255');
INSERT INTO `sh_region` VALUES ('2091', '台安县', '246', '255');
INSERT INTO `sh_region` VALUES ('2092', '本溪', '247', '255');
INSERT INTO `sh_region` VALUES ('2093', '平山区', '247', '255');
INSERT INTO `sh_region` VALUES ('2094', '明山区', '247', '255');
INSERT INTO `sh_region` VALUES ('2095', '溪湖区', '247', '255');
INSERT INTO `sh_region` VALUES ('2096', '南芬区', '247', '255');
INSERT INTO `sh_region` VALUES ('2097', '桓仁', '247', '255');
INSERT INTO `sh_region` VALUES ('2098', '双塔区', '248', '255');
INSERT INTO `sh_region` VALUES ('2099', '龙城区', '248', '255');
INSERT INTO `sh_region` VALUES ('2100', '喀喇沁左翼蒙古族自治县', '248', '255');
INSERT INTO `sh_region` VALUES ('2101', '北票市', '248', '255');
INSERT INTO `sh_region` VALUES ('2102', '凌源市', '248', '255');
INSERT INTO `sh_region` VALUES ('2103', '朝阳县', '248', '255');
INSERT INTO `sh_region` VALUES ('2104', '建平县', '248', '255');
INSERT INTO `sh_region` VALUES ('2105', '振兴区', '249', '255');
INSERT INTO `sh_region` VALUES ('2106', '元宝区', '249', '255');
INSERT INTO `sh_region` VALUES ('2107', '振安区', '249', '255');
INSERT INTO `sh_region` VALUES ('2108', '宽甸', '249', '255');
INSERT INTO `sh_region` VALUES ('2109', '东港市', '249', '255');
INSERT INTO `sh_region` VALUES ('2110', '凤城市', '249', '255');
INSERT INTO `sh_region` VALUES ('2111', '顺城区', '250', '255');
INSERT INTO `sh_region` VALUES ('2112', '新抚区', '250', '255');
INSERT INTO `sh_region` VALUES ('2113', '东洲区', '250', '255');
INSERT INTO `sh_region` VALUES ('2114', '望花区', '250', '255');
INSERT INTO `sh_region` VALUES ('2115', '清原', '250', '255');
INSERT INTO `sh_region` VALUES ('2116', '新宾', '250', '255');
INSERT INTO `sh_region` VALUES ('2117', '抚顺县', '250', '255');
INSERT INTO `sh_region` VALUES ('2118', '阜新', '251', '255');
INSERT INTO `sh_region` VALUES ('2119', '海州区', '251', '255');
INSERT INTO `sh_region` VALUES ('2120', '新邱区', '251', '255');
INSERT INTO `sh_region` VALUES ('2121', '太平区', '251', '255');
INSERT INTO `sh_region` VALUES ('2122', '清河门区', '251', '255');
INSERT INTO `sh_region` VALUES ('2123', '细河区', '251', '255');
INSERT INTO `sh_region` VALUES ('2124', '彰武县', '251', '255');
INSERT INTO `sh_region` VALUES ('2125', '龙港区', '252', '255');
INSERT INTO `sh_region` VALUES ('2126', '南票区', '252', '255');
INSERT INTO `sh_region` VALUES ('2127', '连山区', '252', '255');
INSERT INTO `sh_region` VALUES ('2128', '兴城市', '252', '255');
INSERT INTO `sh_region` VALUES ('2129', '绥中县', '252', '255');
INSERT INTO `sh_region` VALUES ('2130', '建昌县', '252', '255');
INSERT INTO `sh_region` VALUES ('2131', '太和区', '253', '255');
INSERT INTO `sh_region` VALUES ('2132', '古塔区', '253', '255');
INSERT INTO `sh_region` VALUES ('2133', '凌河区', '253', '255');
INSERT INTO `sh_region` VALUES ('2134', '凌海市', '253', '255');
INSERT INTO `sh_region` VALUES ('2135', '北镇市', '253', '255');
INSERT INTO `sh_region` VALUES ('2136', '黑山县', '253', '255');
INSERT INTO `sh_region` VALUES ('2137', '义县', '253', '255');
INSERT INTO `sh_region` VALUES ('2138', '白塔区', '254', '255');
INSERT INTO `sh_region` VALUES ('2139', '文圣区', '254', '255');
INSERT INTO `sh_region` VALUES ('2140', '宏伟区', '254', '255');
INSERT INTO `sh_region` VALUES ('2141', '太子河区', '254', '255');
INSERT INTO `sh_region` VALUES ('2142', '弓长岭区', '254', '255');
INSERT INTO `sh_region` VALUES ('2143', '灯塔市', '254', '255');
INSERT INTO `sh_region` VALUES ('2144', '辽阳县', '254', '255');
INSERT INTO `sh_region` VALUES ('2145', '双台子区', '255', '255');
INSERT INTO `sh_region` VALUES ('2146', '兴隆台区', '255', '255');
INSERT INTO `sh_region` VALUES ('2147', '大洼县', '255', '255');
INSERT INTO `sh_region` VALUES ('2148', '盘山县', '255', '255');
INSERT INTO `sh_region` VALUES ('2149', '银州区', '256', '255');
INSERT INTO `sh_region` VALUES ('2150', '清河区', '256', '255');
INSERT INTO `sh_region` VALUES ('2151', '调兵山市', '256', '255');
INSERT INTO `sh_region` VALUES ('2152', '开原市', '256', '255');
INSERT INTO `sh_region` VALUES ('2153', '铁岭县', '256', '255');
INSERT INTO `sh_region` VALUES ('2154', '西丰县', '256', '255');
INSERT INTO `sh_region` VALUES ('2155', '昌图县', '256', '255');
INSERT INTO `sh_region` VALUES ('2156', '站前区', '257', '255');
INSERT INTO `sh_region` VALUES ('2157', '西市区', '257', '255');
INSERT INTO `sh_region` VALUES ('2158', '鲅鱼圈区', '257', '255');
INSERT INTO `sh_region` VALUES ('2159', '老边区', '257', '255');
INSERT INTO `sh_region` VALUES ('2160', '盖州市', '257', '255');
INSERT INTO `sh_region` VALUES ('2161', '大石桥市', '257', '255');
INSERT INTO `sh_region` VALUES ('2162', '回民区', '258', '255');
INSERT INTO `sh_region` VALUES ('2163', '玉泉区', '258', '255');
INSERT INTO `sh_region` VALUES ('2164', '新城区', '258', '255');
INSERT INTO `sh_region` VALUES ('2165', '赛罕区', '258', '255');
INSERT INTO `sh_region` VALUES ('2166', '清水河县', '258', '255');
INSERT INTO `sh_region` VALUES ('2167', '土默特左旗', '258', '255');
INSERT INTO `sh_region` VALUES ('2168', '托克托县', '258', '255');
INSERT INTO `sh_region` VALUES ('2169', '和林格尔县', '258', '255');
INSERT INTO `sh_region` VALUES ('2170', '武川县', '258', '255');
INSERT INTO `sh_region` VALUES ('2171', '阿拉善左旗', '259', '255');
INSERT INTO `sh_region` VALUES ('2172', '阿拉善右旗', '259', '255');
INSERT INTO `sh_region` VALUES ('2173', '额济纳旗', '259', '255');
INSERT INTO `sh_region` VALUES ('2174', '临河区', '260', '255');
INSERT INTO `sh_region` VALUES ('2175', '五原县', '260', '255');
INSERT INTO `sh_region` VALUES ('2176', '磴口县', '260', '255');
INSERT INTO `sh_region` VALUES ('2177', '乌拉特前旗', '260', '255');
INSERT INTO `sh_region` VALUES ('2178', '乌拉特中旗', '260', '255');
INSERT INTO `sh_region` VALUES ('2179', '乌拉特后旗', '260', '255');
INSERT INTO `sh_region` VALUES ('2180', '杭锦后旗', '260', '255');
INSERT INTO `sh_region` VALUES ('2181', '昆都仑区', '261', '255');
INSERT INTO `sh_region` VALUES ('2182', '青山区', '261', '255');
INSERT INTO `sh_region` VALUES ('2183', '东河区', '261', '255');
INSERT INTO `sh_region` VALUES ('2184', '九原区', '261', '255');
INSERT INTO `sh_region` VALUES ('2185', '石拐区', '261', '255');
INSERT INTO `sh_region` VALUES ('2186', '白云矿区', '261', '255');
INSERT INTO `sh_region` VALUES ('2187', '土默特右旗', '261', '255');
INSERT INTO `sh_region` VALUES ('2188', '固阳县', '261', '255');
INSERT INTO `sh_region` VALUES ('2189', '达尔罕茂明安联合旗', '261', '255');
INSERT INTO `sh_region` VALUES ('2190', '红山区', '262', '255');
INSERT INTO `sh_region` VALUES ('2191', '元宝山区', '262', '255');
INSERT INTO `sh_region` VALUES ('2192', '松山区', '262', '255');
INSERT INTO `sh_region` VALUES ('2193', '阿鲁科尔沁旗', '262', '255');
INSERT INTO `sh_region` VALUES ('2194', '巴林左旗', '262', '255');
INSERT INTO `sh_region` VALUES ('2195', '巴林右旗', '262', '255');
INSERT INTO `sh_region` VALUES ('2196', '林西县', '262', '255');
INSERT INTO `sh_region` VALUES ('2197', '克什克腾旗', '262', '255');
INSERT INTO `sh_region` VALUES ('2198', '翁牛特旗', '262', '255');
INSERT INTO `sh_region` VALUES ('2199', '喀喇沁旗', '262', '255');
INSERT INTO `sh_region` VALUES ('2200', '宁城县', '262', '255');
INSERT INTO `sh_region` VALUES ('2201', '敖汉旗', '262', '255');
INSERT INTO `sh_region` VALUES ('2202', '东胜区', '263', '255');
INSERT INTO `sh_region` VALUES ('2203', '达拉特旗', '263', '255');
INSERT INTO `sh_region` VALUES ('2204', '准格尔旗', '263', '255');
INSERT INTO `sh_region` VALUES ('2205', '鄂托克前旗', '263', '255');
INSERT INTO `sh_region` VALUES ('2206', '鄂托克旗', '263', '255');
INSERT INTO `sh_region` VALUES ('2207', '杭锦旗', '263', '255');
INSERT INTO `sh_region` VALUES ('2208', '乌审旗', '263', '255');
INSERT INTO `sh_region` VALUES ('2209', '伊金霍洛旗', '263', '255');
INSERT INTO `sh_region` VALUES ('2210', '海拉尔区', '264', '255');
INSERT INTO `sh_region` VALUES ('2211', '莫力达瓦', '264', '255');
INSERT INTO `sh_region` VALUES ('2212', '满洲里市', '264', '255');
INSERT INTO `sh_region` VALUES ('2213', '牙克石市', '264', '255');
INSERT INTO `sh_region` VALUES ('2214', '扎兰屯市', '264', '255');
INSERT INTO `sh_region` VALUES ('2215', '额尔古纳市', '264', '255');
INSERT INTO `sh_region` VALUES ('2216', '根河市', '264', '255');
INSERT INTO `sh_region` VALUES ('2217', '阿荣旗', '264', '255');
INSERT INTO `sh_region` VALUES ('2218', '鄂伦春自治旗', '264', '255');
INSERT INTO `sh_region` VALUES ('2219', '鄂温克族自治旗', '264', '255');
INSERT INTO `sh_region` VALUES ('2220', '陈巴尔虎旗', '264', '255');
INSERT INTO `sh_region` VALUES ('2221', '新巴尔虎左旗', '264', '255');
INSERT INTO `sh_region` VALUES ('2222', '新巴尔虎右旗', '264', '255');
INSERT INTO `sh_region` VALUES ('2223', '科尔沁区', '265', '255');
INSERT INTO `sh_region` VALUES ('2224', '霍林郭勒市', '265', '255');
INSERT INTO `sh_region` VALUES ('2225', '科尔沁左翼中旗', '265', '255');
INSERT INTO `sh_region` VALUES ('2226', '科尔沁左翼后旗', '265', '255');
INSERT INTO `sh_region` VALUES ('2227', '开鲁县', '265', '255');
INSERT INTO `sh_region` VALUES ('2228', '库伦旗', '265', '255');
INSERT INTO `sh_region` VALUES ('2229', '奈曼旗', '265', '255');
INSERT INTO `sh_region` VALUES ('2230', '扎鲁特旗', '265', '255');
INSERT INTO `sh_region` VALUES ('2231', '海勃湾区', '266', '255');
INSERT INTO `sh_region` VALUES ('2232', '乌达区', '266', '255');
INSERT INTO `sh_region` VALUES ('2233', '海南区', '266', '255');
INSERT INTO `sh_region` VALUES ('2234', '化德县', '267', '255');
INSERT INTO `sh_region` VALUES ('2235', '集宁区', '267', '255');
INSERT INTO `sh_region` VALUES ('2236', '丰镇市', '267', '255');
INSERT INTO `sh_region` VALUES ('2237', '卓资县', '267', '255');
INSERT INTO `sh_region` VALUES ('2238', '商都县', '267', '255');
INSERT INTO `sh_region` VALUES ('2239', '兴和县', '267', '255');
INSERT INTO `sh_region` VALUES ('2240', '凉城县', '267', '255');
INSERT INTO `sh_region` VALUES ('2241', '察哈尔右翼前旗', '267', '255');
INSERT INTO `sh_region` VALUES ('2242', '察哈尔右翼中旗', '267', '255');
INSERT INTO `sh_region` VALUES ('2243', '察哈尔右翼后旗', '267', '255');
INSERT INTO `sh_region` VALUES ('2244', '四子王旗', '267', '255');
INSERT INTO `sh_region` VALUES ('2245', '二连浩特市', '268', '255');
INSERT INTO `sh_region` VALUES ('2246', '锡林浩特市', '268', '255');
INSERT INTO `sh_region` VALUES ('2247', '阿巴嘎旗', '268', '255');
INSERT INTO `sh_region` VALUES ('2248', '苏尼特左旗', '268', '255');
INSERT INTO `sh_region` VALUES ('2249', '苏尼特右旗', '268', '255');
INSERT INTO `sh_region` VALUES ('2250', '东乌珠穆沁旗', '268', '255');
INSERT INTO `sh_region` VALUES ('2251', '西乌珠穆沁旗', '268', '255');
INSERT INTO `sh_region` VALUES ('2252', '太仆寺旗', '268', '255');
INSERT INTO `sh_region` VALUES ('2253', '镶黄旗', '268', '255');
INSERT INTO `sh_region` VALUES ('2254', '正镶白旗', '268', '255');
INSERT INTO `sh_region` VALUES ('2255', '正蓝旗', '268', '255');
INSERT INTO `sh_region` VALUES ('2256', '多伦县', '268', '255');
INSERT INTO `sh_region` VALUES ('2257', '乌兰浩特市', '269', '255');
INSERT INTO `sh_region` VALUES ('2258', '阿尔山市', '269', '255');
INSERT INTO `sh_region` VALUES ('2259', '科尔沁右翼前旗', '269', '255');
INSERT INTO `sh_region` VALUES ('2260', '科尔沁右翼中旗', '269', '255');
INSERT INTO `sh_region` VALUES ('2261', '扎赉特旗', '269', '255');
INSERT INTO `sh_region` VALUES ('2262', '突泉县', '269', '255');
INSERT INTO `sh_region` VALUES ('2263', '西夏区', '270', '255');
INSERT INTO `sh_region` VALUES ('2264', '金凤区', '270', '255');
INSERT INTO `sh_region` VALUES ('2265', '兴庆区', '270', '255');
INSERT INTO `sh_region` VALUES ('2266', '灵武市', '270', '255');
INSERT INTO `sh_region` VALUES ('2267', '永宁县', '270', '255');
INSERT INTO `sh_region` VALUES ('2268', '贺兰县', '270', '255');
INSERT INTO `sh_region` VALUES ('2269', '原州区', '271', '255');
INSERT INTO `sh_region` VALUES ('2270', '海原县', '271', '255');
INSERT INTO `sh_region` VALUES ('2271', '西吉县', '271', '255');
INSERT INTO `sh_region` VALUES ('2272', '隆德县', '271', '255');
INSERT INTO `sh_region` VALUES ('2273', '泾源县', '271', '255');
INSERT INTO `sh_region` VALUES ('2274', '彭阳县', '271', '255');
INSERT INTO `sh_region` VALUES ('2275', '惠农县', '272', '255');
INSERT INTO `sh_region` VALUES ('2276', '大武口区', '272', '255');
INSERT INTO `sh_region` VALUES ('2277', '惠农区', '272', '255');
INSERT INTO `sh_region` VALUES ('2278', '陶乐县', '272', '255');
INSERT INTO `sh_region` VALUES ('2279', '平罗县', '272', '255');
INSERT INTO `sh_region` VALUES ('2280', '利通区', '273', '255');
INSERT INTO `sh_region` VALUES ('2281', '中卫县', '273', '255');
INSERT INTO `sh_region` VALUES ('2282', '青铜峡市', '273', '255');
INSERT INTO `sh_region` VALUES ('2283', '中宁县', '273', '255');
INSERT INTO `sh_region` VALUES ('2284', '盐池县', '273', '255');
INSERT INTO `sh_region` VALUES ('2285', '同心县', '273', '255');
INSERT INTO `sh_region` VALUES ('2286', '沙坡头区', '274', '255');
INSERT INTO `sh_region` VALUES ('2287', '海原县', '274', '255');
INSERT INTO `sh_region` VALUES ('2288', '中宁县', '274', '255');
INSERT INTO `sh_region` VALUES ('2289', '城中区', '275', '255');
INSERT INTO `sh_region` VALUES ('2290', '城东区', '275', '255');
INSERT INTO `sh_region` VALUES ('2291', '城西区', '275', '255');
INSERT INTO `sh_region` VALUES ('2292', '城北区', '275', '255');
INSERT INTO `sh_region` VALUES ('2293', '湟中县', '275', '255');
INSERT INTO `sh_region` VALUES ('2294', '湟源县', '275', '255');
INSERT INTO `sh_region` VALUES ('2295', '大通', '275', '255');
INSERT INTO `sh_region` VALUES ('2296', '玛沁县', '276', '255');
INSERT INTO `sh_region` VALUES ('2297', '班玛县', '276', '255');
INSERT INTO `sh_region` VALUES ('2298', '甘德县', '276', '255');
INSERT INTO `sh_region` VALUES ('2299', '达日县', '276', '255');
INSERT INTO `sh_region` VALUES ('2300', '久治县', '276', '255');
INSERT INTO `sh_region` VALUES ('2301', '玛多县', '276', '255');
INSERT INTO `sh_region` VALUES ('2302', '海晏县', '277', '255');
INSERT INTO `sh_region` VALUES ('2303', '祁连县', '277', '255');
INSERT INTO `sh_region` VALUES ('2304', '刚察县', '277', '255');
INSERT INTO `sh_region` VALUES ('2305', '门源', '277', '255');
INSERT INTO `sh_region` VALUES ('2306', '平安县', '278', '255');
INSERT INTO `sh_region` VALUES ('2307', '乐都县', '278', '255');
INSERT INTO `sh_region` VALUES ('2308', '民和', '278', '255');
INSERT INTO `sh_region` VALUES ('2309', '互助', '278', '255');
INSERT INTO `sh_region` VALUES ('2310', '化隆', '278', '255');
INSERT INTO `sh_region` VALUES ('2311', '循化', '278', '255');
INSERT INTO `sh_region` VALUES ('2312', '共和县', '279', '255');
INSERT INTO `sh_region` VALUES ('2313', '同德县', '279', '255');
INSERT INTO `sh_region` VALUES ('2314', '贵德县', '279', '255');
INSERT INTO `sh_region` VALUES ('2315', '兴海县', '279', '255');
INSERT INTO `sh_region` VALUES ('2316', '贵南县', '279', '255');
INSERT INTO `sh_region` VALUES ('2317', '德令哈市', '280', '255');
INSERT INTO `sh_region` VALUES ('2318', '格尔木市', '280', '255');
INSERT INTO `sh_region` VALUES ('2319', '乌兰县', '280', '255');
INSERT INTO `sh_region` VALUES ('2320', '都兰县', '280', '255');
INSERT INTO `sh_region` VALUES ('2321', '天峻县', '280', '255');
INSERT INTO `sh_region` VALUES ('2322', '同仁县', '281', '255');
INSERT INTO `sh_region` VALUES ('2323', '尖扎县', '281', '255');
INSERT INTO `sh_region` VALUES ('2324', '泽库县', '281', '255');
INSERT INTO `sh_region` VALUES ('2325', '河南蒙古族自治县', '281', '255');
INSERT INTO `sh_region` VALUES ('2326', '玉树县', '282', '255');
INSERT INTO `sh_region` VALUES ('2327', '杂多县', '282', '255');
INSERT INTO `sh_region` VALUES ('2328', '称多县', '282', '255');
INSERT INTO `sh_region` VALUES ('2329', '治多县', '282', '255');
INSERT INTO `sh_region` VALUES ('2330', '囊谦县', '282', '255');
INSERT INTO `sh_region` VALUES ('2331', '曲麻莱县', '282', '255');
INSERT INTO `sh_region` VALUES ('2332', '市中区', '283', '255');
INSERT INTO `sh_region` VALUES ('2333', '历下区', '283', '255');
INSERT INTO `sh_region` VALUES ('2334', '天桥区', '283', '255');
INSERT INTO `sh_region` VALUES ('2335', '槐荫区', '283', '255');
INSERT INTO `sh_region` VALUES ('2336', '历城区', '283', '255');
INSERT INTO `sh_region` VALUES ('2337', '长清区', '283', '255');
INSERT INTO `sh_region` VALUES ('2338', '章丘市', '283', '255');
INSERT INTO `sh_region` VALUES ('2339', '平阴县', '283', '255');
INSERT INTO `sh_region` VALUES ('2340', '济阳县', '283', '255');
INSERT INTO `sh_region` VALUES ('2341', '商河县', '283', '255');
INSERT INTO `sh_region` VALUES ('2342', '市南区', '284', '255');
INSERT INTO `sh_region` VALUES ('2343', '市北区', '284', '255');
INSERT INTO `sh_region` VALUES ('2344', '城阳区', '284', '255');
INSERT INTO `sh_region` VALUES ('2345', '四方区', '284', '255');
INSERT INTO `sh_region` VALUES ('2346', '李沧区', '284', '255');
INSERT INTO `sh_region` VALUES ('2347', '黄岛区', '284', '255');
INSERT INTO `sh_region` VALUES ('2348', '崂山区', '284', '255');
INSERT INTO `sh_region` VALUES ('2349', '胶州市', '284', '255');
INSERT INTO `sh_region` VALUES ('2350', '即墨市', '284', '255');
INSERT INTO `sh_region` VALUES ('2351', '平度市', '284', '255');
INSERT INTO `sh_region` VALUES ('2352', '胶南市', '284', '255');
INSERT INTO `sh_region` VALUES ('2353', '莱西市', '284', '255');
INSERT INTO `sh_region` VALUES ('2354', '滨城区', '285', '255');
INSERT INTO `sh_region` VALUES ('2355', '惠民县', '285', '255');
INSERT INTO `sh_region` VALUES ('2356', '阳信县', '285', '255');
INSERT INTO `sh_region` VALUES ('2357', '无棣县', '285', '255');
INSERT INTO `sh_region` VALUES ('2358', '沾化县', '285', '255');
INSERT INTO `sh_region` VALUES ('2359', '博兴县', '285', '255');
INSERT INTO `sh_region` VALUES ('2360', '邹平县', '285', '255');
INSERT INTO `sh_region` VALUES ('2361', '德城区', '286', '255');
INSERT INTO `sh_region` VALUES ('2362', '陵县', '286', '255');
INSERT INTO `sh_region` VALUES ('2363', '乐陵市', '286', '255');
INSERT INTO `sh_region` VALUES ('2364', '禹城市', '286', '255');
INSERT INTO `sh_region` VALUES ('2365', '宁津县', '286', '255');
INSERT INTO `sh_region` VALUES ('2366', '庆云县', '286', '255');
INSERT INTO `sh_region` VALUES ('2367', '临邑县', '286', '255');
INSERT INTO `sh_region` VALUES ('2368', '齐河县', '286', '255');
INSERT INTO `sh_region` VALUES ('2369', '平原县', '286', '255');
INSERT INTO `sh_region` VALUES ('2370', '夏津县', '286', '255');
INSERT INTO `sh_region` VALUES ('2371', '武城县', '286', '255');
INSERT INTO `sh_region` VALUES ('2372', '东营区', '287', '255');
INSERT INTO `sh_region` VALUES ('2373', '河口区', '287', '255');
INSERT INTO `sh_region` VALUES ('2374', '垦利县', '287', '255');
INSERT INTO `sh_region` VALUES ('2375', '利津县', '287', '255');
INSERT INTO `sh_region` VALUES ('2376', '广饶县', '287', '255');
INSERT INTO `sh_region` VALUES ('2377', '牡丹区', '288', '255');
INSERT INTO `sh_region` VALUES ('2378', '曹县', '288', '255');
INSERT INTO `sh_region` VALUES ('2379', '单县', '288', '255');
INSERT INTO `sh_region` VALUES ('2380', '成武县', '288', '255');
INSERT INTO `sh_region` VALUES ('2381', '巨野县', '288', '255');
INSERT INTO `sh_region` VALUES ('2382', '郓城县', '288', '255');
INSERT INTO `sh_region` VALUES ('2383', '鄄城县', '288', '255');
INSERT INTO `sh_region` VALUES ('2384', '定陶县', '288', '255');
INSERT INTO `sh_region` VALUES ('2385', '东明县', '288', '255');
INSERT INTO `sh_region` VALUES ('2386', '市中区', '289', '255');
INSERT INTO `sh_region` VALUES ('2387', '任城区', '289', '255');
INSERT INTO `sh_region` VALUES ('2388', '曲阜市', '289', '255');
INSERT INTO `sh_region` VALUES ('2389', '兖州市', '289', '255');
INSERT INTO `sh_region` VALUES ('2390', '邹城市', '289', '255');
INSERT INTO `sh_region` VALUES ('2391', '微山县', '289', '255');
INSERT INTO `sh_region` VALUES ('2392', '鱼台县', '289', '255');
INSERT INTO `sh_region` VALUES ('2393', '金乡县', '289', '255');
INSERT INTO `sh_region` VALUES ('2394', '嘉祥县', '289', '255');
INSERT INTO `sh_region` VALUES ('2395', '汶上县', '289', '255');
INSERT INTO `sh_region` VALUES ('2396', '泗水县', '289', '255');
INSERT INTO `sh_region` VALUES ('2397', '梁山县', '289', '255');
INSERT INTO `sh_region` VALUES ('2398', '莱城区', '290', '255');
INSERT INTO `sh_region` VALUES ('2399', '钢城区', '290', '255');
INSERT INTO `sh_region` VALUES ('2400', '东昌府区', '291', '255');
INSERT INTO `sh_region` VALUES ('2401', '临清市', '291', '255');
INSERT INTO `sh_region` VALUES ('2402', '阳谷县', '291', '255');
INSERT INTO `sh_region` VALUES ('2403', '莘县', '291', '255');
INSERT INTO `sh_region` VALUES ('2404', '茌平县', '291', '255');
INSERT INTO `sh_region` VALUES ('2405', '东阿县', '291', '255');
INSERT INTO `sh_region` VALUES ('2406', '冠县', '291', '255');
INSERT INTO `sh_region` VALUES ('2407', '高唐县', '291', '255');
INSERT INTO `sh_region` VALUES ('2408', '兰山区', '292', '255');
INSERT INTO `sh_region` VALUES ('2409', '罗庄区', '292', '255');
INSERT INTO `sh_region` VALUES ('2410', '河东区', '292', '255');
INSERT INTO `sh_region` VALUES ('2411', '沂南县', '292', '255');
INSERT INTO `sh_region` VALUES ('2412', '郯城县', '292', '255');
INSERT INTO `sh_region` VALUES ('2413', '沂水县', '292', '255');
INSERT INTO `sh_region` VALUES ('2414', '苍山县', '292', '255');
INSERT INTO `sh_region` VALUES ('2415', '费县', '292', '255');
INSERT INTO `sh_region` VALUES ('2416', '平邑县', '292', '255');
INSERT INTO `sh_region` VALUES ('2417', '莒南县', '292', '255');
INSERT INTO `sh_region` VALUES ('2418', '蒙阴县', '292', '255');
INSERT INTO `sh_region` VALUES ('2419', '临沭县', '292', '255');
INSERT INTO `sh_region` VALUES ('2420', '东港区', '293', '255');
INSERT INTO `sh_region` VALUES ('2421', '岚山区', '293', '255');
INSERT INTO `sh_region` VALUES ('2422', '五莲县', '293', '255');
INSERT INTO `sh_region` VALUES ('2423', '莒县', '293', '255');
INSERT INTO `sh_region` VALUES ('2424', '泰山区', '294', '255');
INSERT INTO `sh_region` VALUES ('2425', '岱岳区', '294', '255');
INSERT INTO `sh_region` VALUES ('2426', '新泰市', '294', '255');
INSERT INTO `sh_region` VALUES ('2427', '肥城市', '294', '255');
INSERT INTO `sh_region` VALUES ('2428', '宁阳县', '294', '255');
INSERT INTO `sh_region` VALUES ('2429', '东平县', '294', '255');
INSERT INTO `sh_region` VALUES ('2430', '荣成市', '295', '255');
INSERT INTO `sh_region` VALUES ('2431', '乳山市', '295', '255');
INSERT INTO `sh_region` VALUES ('2432', '环翠区', '295', '255');
INSERT INTO `sh_region` VALUES ('2433', '文登市', '295', '255');
INSERT INTO `sh_region` VALUES ('2434', '潍城区', '296', '255');
INSERT INTO `sh_region` VALUES ('2435', '寒亭区', '296', '255');
INSERT INTO `sh_region` VALUES ('2436', '坊子区', '296', '255');
INSERT INTO `sh_region` VALUES ('2437', '奎文区', '296', '255');
INSERT INTO `sh_region` VALUES ('2438', '青州市', '296', '255');
INSERT INTO `sh_region` VALUES ('2439', '诸城市', '296', '255');
INSERT INTO `sh_region` VALUES ('2440', '寿光市', '296', '255');
INSERT INTO `sh_region` VALUES ('2441', '安丘市', '296', '255');
INSERT INTO `sh_region` VALUES ('2442', '高密市', '296', '255');
INSERT INTO `sh_region` VALUES ('2443', '昌邑市', '296', '255');
INSERT INTO `sh_region` VALUES ('2444', '临朐县', '296', '255');
INSERT INTO `sh_region` VALUES ('2445', '昌乐县', '296', '255');
INSERT INTO `sh_region` VALUES ('2446', '芝罘区', '297', '255');
INSERT INTO `sh_region` VALUES ('2447', '福山区', '297', '255');
INSERT INTO `sh_region` VALUES ('2448', '牟平区', '297', '255');
INSERT INTO `sh_region` VALUES ('2449', '莱山区', '297', '255');
INSERT INTO `sh_region` VALUES ('2450', '开发区', '297', '255');
INSERT INTO `sh_region` VALUES ('2451', '龙口市', '297', '255');
INSERT INTO `sh_region` VALUES ('2452', '莱阳市', '297', '255');
INSERT INTO `sh_region` VALUES ('2453', '莱州市', '297', '255');
INSERT INTO `sh_region` VALUES ('2454', '蓬莱市', '297', '255');
INSERT INTO `sh_region` VALUES ('2455', '招远市', '297', '255');
INSERT INTO `sh_region` VALUES ('2456', '栖霞市', '297', '255');
INSERT INTO `sh_region` VALUES ('2457', '海阳市', '297', '255');
INSERT INTO `sh_region` VALUES ('2458', '长岛县', '297', '255');
INSERT INTO `sh_region` VALUES ('2459', '市中区', '298', '255');
INSERT INTO `sh_region` VALUES ('2460', '山亭区', '298', '255');
INSERT INTO `sh_region` VALUES ('2461', '峄城区', '298', '255');
INSERT INTO `sh_region` VALUES ('2462', '台儿庄区', '298', '255');
INSERT INTO `sh_region` VALUES ('2463', '薛城区', '298', '255');
INSERT INTO `sh_region` VALUES ('2464', '滕州市', '298', '255');
INSERT INTO `sh_region` VALUES ('2465', '张店区', '299', '255');
INSERT INTO `sh_region` VALUES ('2466', '临淄区', '299', '255');
INSERT INTO `sh_region` VALUES ('2467', '淄川区', '299', '255');
INSERT INTO `sh_region` VALUES ('2468', '博山区', '299', '255');
INSERT INTO `sh_region` VALUES ('2469', '周村区', '299', '255');
INSERT INTO `sh_region` VALUES ('2470', '桓台县', '299', '255');
INSERT INTO `sh_region` VALUES ('2471', '高青县', '299', '255');
INSERT INTO `sh_region` VALUES ('2472', '沂源县', '299', '255');
INSERT INTO `sh_region` VALUES ('2473', '杏花岭区', '300', '255');
INSERT INTO `sh_region` VALUES ('2474', '小店区', '300', '255');
INSERT INTO `sh_region` VALUES ('2475', '迎泽区', '300', '255');
INSERT INTO `sh_region` VALUES ('2476', '尖草坪区', '300', '255');
INSERT INTO `sh_region` VALUES ('2477', '万柏林区', '300', '255');
INSERT INTO `sh_region` VALUES ('2478', '晋源区', '300', '255');
INSERT INTO `sh_region` VALUES ('2479', '高新开发区', '300', '255');
INSERT INTO `sh_region` VALUES ('2480', '民营经济开发区', '300', '255');
INSERT INTO `sh_region` VALUES ('2481', '经济技术开发区', '300', '255');
INSERT INTO `sh_region` VALUES ('2482', '清徐县', '300', '255');
INSERT INTO `sh_region` VALUES ('2483', '阳曲县', '300', '255');
INSERT INTO `sh_region` VALUES ('2484', '娄烦县', '300', '255');
INSERT INTO `sh_region` VALUES ('2485', '古交市', '300', '255');
INSERT INTO `sh_region` VALUES ('2486', '城区', '301', '255');
INSERT INTO `sh_region` VALUES ('2487', '郊区', '301', '255');
INSERT INTO `sh_region` VALUES ('2488', '沁县', '301', '255');
INSERT INTO `sh_region` VALUES ('2489', '潞城市', '301', '255');
INSERT INTO `sh_region` VALUES ('2490', '长治县', '301', '255');
INSERT INTO `sh_region` VALUES ('2491', '襄垣县', '301', '255');
INSERT INTO `sh_region` VALUES ('2492', '屯留县', '301', '255');
INSERT INTO `sh_region` VALUES ('2493', '平顺县', '301', '255');
INSERT INTO `sh_region` VALUES ('2494', '黎城县', '301', '255');
INSERT INTO `sh_region` VALUES ('2495', '壶关县', '301', '255');
INSERT INTO `sh_region` VALUES ('2496', '长子县', '301', '255');
INSERT INTO `sh_region` VALUES ('2497', '武乡县', '301', '255');
INSERT INTO `sh_region` VALUES ('2498', '沁源县', '301', '255');
INSERT INTO `sh_region` VALUES ('2499', '城区', '302', '255');
INSERT INTO `sh_region` VALUES ('2500', '矿区', '302', '255');
INSERT INTO `sh_region` VALUES ('2501', '南郊区', '302', '255');
INSERT INTO `sh_region` VALUES ('2502', '新荣区', '302', '255');
INSERT INTO `sh_region` VALUES ('2503', '阳高县', '302', '255');
INSERT INTO `sh_region` VALUES ('2504', '天镇县', '302', '255');
INSERT INTO `sh_region` VALUES ('2505', '广灵县', '302', '255');
INSERT INTO `sh_region` VALUES ('2506', '灵丘县', '302', '255');
INSERT INTO `sh_region` VALUES ('2507', '浑源县', '302', '255');
INSERT INTO `sh_region` VALUES ('2508', '左云县', '302', '255');
INSERT INTO `sh_region` VALUES ('2509', '大同县', '302', '255');
INSERT INTO `sh_region` VALUES ('2510', '城区', '303', '255');
INSERT INTO `sh_region` VALUES ('2511', '高平市', '303', '255');
INSERT INTO `sh_region` VALUES ('2512', '沁水县', '303', '255');
INSERT INTO `sh_region` VALUES ('2513', '阳城县', '303', '255');
INSERT INTO `sh_region` VALUES ('2514', '陵川县', '303', '255');
INSERT INTO `sh_region` VALUES ('2515', '泽州县', '303', '255');
INSERT INTO `sh_region` VALUES ('2516', '榆次区', '304', '255');
INSERT INTO `sh_region` VALUES ('2517', '介休市', '304', '255');
INSERT INTO `sh_region` VALUES ('2518', '榆社县', '304', '255');
INSERT INTO `sh_region` VALUES ('2519', '左权县', '304', '255');
INSERT INTO `sh_region` VALUES ('2520', '和顺县', '304', '255');
INSERT INTO `sh_region` VALUES ('2521', '昔阳县', '304', '255');
INSERT INTO `sh_region` VALUES ('2522', '寿阳县', '304', '255');
INSERT INTO `sh_region` VALUES ('2523', '太谷县', '304', '255');
INSERT INTO `sh_region` VALUES ('2524', '祁县', '304', '255');
INSERT INTO `sh_region` VALUES ('2525', '平遥县', '304', '255');
INSERT INTO `sh_region` VALUES ('2526', '灵石县', '304', '255');
INSERT INTO `sh_region` VALUES ('2527', '尧都区', '305', '255');
INSERT INTO `sh_region` VALUES ('2528', '侯马市', '305', '255');
INSERT INTO `sh_region` VALUES ('2529', '霍州市', '305', '255');
INSERT INTO `sh_region` VALUES ('2530', '曲沃县', '305', '255');
INSERT INTO `sh_region` VALUES ('2531', '翼城县', '305', '255');
INSERT INTO `sh_region` VALUES ('2532', '襄汾县', '305', '255');
INSERT INTO `sh_region` VALUES ('2533', '洪洞县', '305', '255');
INSERT INTO `sh_region` VALUES ('2534', '吉县', '305', '255');
INSERT INTO `sh_region` VALUES ('2535', '安泽县', '305', '255');
INSERT INTO `sh_region` VALUES ('2536', '浮山县', '305', '255');
INSERT INTO `sh_region` VALUES ('2537', '古县', '305', '255');
INSERT INTO `sh_region` VALUES ('2538', '乡宁县', '305', '255');
INSERT INTO `sh_region` VALUES ('2539', '大宁县', '305', '255');
INSERT INTO `sh_region` VALUES ('2540', '隰县', '305', '255');
INSERT INTO `sh_region` VALUES ('2541', '永和县', '305', '255');
INSERT INTO `sh_region` VALUES ('2542', '蒲县', '305', '255');
INSERT INTO `sh_region` VALUES ('2543', '汾西县', '305', '255');
INSERT INTO `sh_region` VALUES ('2544', '离石市', '306', '255');
INSERT INTO `sh_region` VALUES ('2545', '离石区', '306', '255');
INSERT INTO `sh_region` VALUES ('2546', '孝义市', '306', '255');
INSERT INTO `sh_region` VALUES ('2547', '汾阳市', '306', '255');
INSERT INTO `sh_region` VALUES ('2548', '文水县', '306', '255');
INSERT INTO `sh_region` VALUES ('2549', '交城县', '306', '255');
INSERT INTO `sh_region` VALUES ('2550', '兴县', '306', '255');
INSERT INTO `sh_region` VALUES ('2551', '临县', '306', '255');
INSERT INTO `sh_region` VALUES ('2552', '柳林县', '306', '255');
INSERT INTO `sh_region` VALUES ('2553', '石楼县', '306', '255');
INSERT INTO `sh_region` VALUES ('2554', '岚县', '306', '255');
INSERT INTO `sh_region` VALUES ('2555', '方山县', '306', '255');
INSERT INTO `sh_region` VALUES ('2556', '中阳县', '306', '255');
INSERT INTO `sh_region` VALUES ('2557', '交口县', '306', '255');
INSERT INTO `sh_region` VALUES ('2558', '朔城区', '307', '255');
INSERT INTO `sh_region` VALUES ('2559', '平鲁区', '307', '255');
INSERT INTO `sh_region` VALUES ('2560', '山阴县', '307', '255');
INSERT INTO `sh_region` VALUES ('2561', '应县', '307', '255');
INSERT INTO `sh_region` VALUES ('2562', '右玉县', '307', '255');
INSERT INTO `sh_region` VALUES ('2563', '怀仁县', '307', '255');
INSERT INTO `sh_region` VALUES ('2564', '忻府区', '308', '255');
INSERT INTO `sh_region` VALUES ('2565', '原平市', '308', '255');
INSERT INTO `sh_region` VALUES ('2566', '定襄县', '308', '255');
INSERT INTO `sh_region` VALUES ('2567', '五台县', '308', '255');
INSERT INTO `sh_region` VALUES ('2568', '代县', '308', '255');
INSERT INTO `sh_region` VALUES ('2569', '繁峙县', '308', '255');
INSERT INTO `sh_region` VALUES ('2570', '宁武县', '308', '255');
INSERT INTO `sh_region` VALUES ('2571', '静乐县', '308', '255');
INSERT INTO `sh_region` VALUES ('2572', '神池县', '308', '255');
INSERT INTO `sh_region` VALUES ('2573', '五寨县', '308', '255');
INSERT INTO `sh_region` VALUES ('2574', '岢岚县', '308', '255');
INSERT INTO `sh_region` VALUES ('2575', '河曲县', '308', '255');
INSERT INTO `sh_region` VALUES ('2576', '保德县', '308', '255');
INSERT INTO `sh_region` VALUES ('2577', '偏关县', '308', '255');
INSERT INTO `sh_region` VALUES ('2578', '城区', '309', '255');
INSERT INTO `sh_region` VALUES ('2579', '矿区', '309', '255');
INSERT INTO `sh_region` VALUES ('2580', '郊区', '309', '255');
INSERT INTO `sh_region` VALUES ('2581', '平定县', '309', '255');
INSERT INTO `sh_region` VALUES ('2582', '盂县', '309', '255');
INSERT INTO `sh_region` VALUES ('2583', '盐湖区', '310', '255');
INSERT INTO `sh_region` VALUES ('2584', '永济市', '310', '255');
INSERT INTO `sh_region` VALUES ('2585', '河津市', '310', '255');
INSERT INTO `sh_region` VALUES ('2586', '临猗县', '310', '255');
INSERT INTO `sh_region` VALUES ('2587', '万荣县', '310', '255');
INSERT INTO `sh_region` VALUES ('2588', '闻喜县', '310', '255');
INSERT INTO `sh_region` VALUES ('2589', '稷山县', '310', '255');
INSERT INTO `sh_region` VALUES ('2590', '新绛县', '310', '255');
INSERT INTO `sh_region` VALUES ('2591', '绛县', '310', '255');
INSERT INTO `sh_region` VALUES ('2592', '垣曲县', '310', '255');
INSERT INTO `sh_region` VALUES ('2593', '夏县', '310', '255');
INSERT INTO `sh_region` VALUES ('2594', '平陆县', '310', '255');
INSERT INTO `sh_region` VALUES ('2595', '芮城县', '310', '255');
INSERT INTO `sh_region` VALUES ('2596', '莲湖区', '311', '255');
INSERT INTO `sh_region` VALUES ('2597', '新城区', '311', '255');
INSERT INTO `sh_region` VALUES ('2598', '碑林区', '311', '255');
INSERT INTO `sh_region` VALUES ('2599', '雁塔区', '311', '255');
INSERT INTO `sh_region` VALUES ('2600', '灞桥区', '311', '255');
INSERT INTO `sh_region` VALUES ('2601', '未央区', '311', '255');
INSERT INTO `sh_region` VALUES ('2602', '阎良区', '311', '255');
INSERT INTO `sh_region` VALUES ('2603', '临潼区', '311', '255');
INSERT INTO `sh_region` VALUES ('2604', '长安区', '311', '255');
INSERT INTO `sh_region` VALUES ('2605', '蓝田县', '311', '255');
INSERT INTO `sh_region` VALUES ('2606', '周至县', '311', '255');
INSERT INTO `sh_region` VALUES ('2607', '户县', '311', '255');
INSERT INTO `sh_region` VALUES ('2608', '高陵县', '311', '255');
INSERT INTO `sh_region` VALUES ('2609', '汉滨区', '312', '255');
INSERT INTO `sh_region` VALUES ('2610', '汉阴县', '312', '255');
INSERT INTO `sh_region` VALUES ('2611', '石泉县', '312', '255');
INSERT INTO `sh_region` VALUES ('2612', '宁陕县', '312', '255');
INSERT INTO `sh_region` VALUES ('2613', '紫阳县', '312', '255');
INSERT INTO `sh_region` VALUES ('2614', '岚皋县', '312', '255');
INSERT INTO `sh_region` VALUES ('2615', '平利县', '312', '255');
INSERT INTO `sh_region` VALUES ('2616', '镇坪县', '312', '255');
INSERT INTO `sh_region` VALUES ('2617', '旬阳县', '312', '255');
INSERT INTO `sh_region` VALUES ('2618', '白河县', '312', '255');
INSERT INTO `sh_region` VALUES ('2619', '陈仓区', '313', '255');
INSERT INTO `sh_region` VALUES ('2620', '渭滨区', '313', '255');
INSERT INTO `sh_region` VALUES ('2621', '金台区', '313', '255');
INSERT INTO `sh_region` VALUES ('2622', '凤翔县', '313', '255');
INSERT INTO `sh_region` VALUES ('2623', '岐山县', '313', '255');
INSERT INTO `sh_region` VALUES ('2624', '扶风县', '313', '255');
INSERT INTO `sh_region` VALUES ('2625', '眉县', '313', '255');
INSERT INTO `sh_region` VALUES ('2626', '陇县', '313', '255');
INSERT INTO `sh_region` VALUES ('2627', '千阳县', '313', '255');
INSERT INTO `sh_region` VALUES ('2628', '麟游县', '313', '255');
INSERT INTO `sh_region` VALUES ('2629', '凤县', '313', '255');
INSERT INTO `sh_region` VALUES ('2630', '太白县', '313', '255');
INSERT INTO `sh_region` VALUES ('2631', '汉台区', '314', '255');
INSERT INTO `sh_region` VALUES ('2632', '南郑县', '314', '255');
INSERT INTO `sh_region` VALUES ('2633', '城固县', '314', '255');
INSERT INTO `sh_region` VALUES ('2634', '洋县', '314', '255');
INSERT INTO `sh_region` VALUES ('2635', '西乡县', '314', '255');
INSERT INTO `sh_region` VALUES ('2636', '勉县', '314', '255');
INSERT INTO `sh_region` VALUES ('2637', '宁强县', '314', '255');
INSERT INTO `sh_region` VALUES ('2638', '略阳县', '314', '255');
INSERT INTO `sh_region` VALUES ('2639', '镇巴县', '314', '255');
INSERT INTO `sh_region` VALUES ('2640', '留坝县', '314', '255');
INSERT INTO `sh_region` VALUES ('2641', '佛坪县', '314', '255');
INSERT INTO `sh_region` VALUES ('2642', '商州区', '315', '255');
INSERT INTO `sh_region` VALUES ('2643', '洛南县', '315', '255');
INSERT INTO `sh_region` VALUES ('2644', '丹凤县', '315', '255');
INSERT INTO `sh_region` VALUES ('2645', '商南县', '315', '255');
INSERT INTO `sh_region` VALUES ('2646', '山阳县', '315', '255');
INSERT INTO `sh_region` VALUES ('2647', '镇安县', '315', '255');
INSERT INTO `sh_region` VALUES ('2648', '柞水县', '315', '255');
INSERT INTO `sh_region` VALUES ('2649', '耀州区', '316', '255');
INSERT INTO `sh_region` VALUES ('2650', '王益区', '316', '255');
INSERT INTO `sh_region` VALUES ('2651', '印台区', '316', '255');
INSERT INTO `sh_region` VALUES ('2652', '宜君县', '316', '255');
INSERT INTO `sh_region` VALUES ('2653', '临渭区', '317', '255');
INSERT INTO `sh_region` VALUES ('2654', '韩城市', '317', '255');
INSERT INTO `sh_region` VALUES ('2655', '华阴市', '317', '255');
INSERT INTO `sh_region` VALUES ('2656', '华县', '317', '255');
INSERT INTO `sh_region` VALUES ('2657', '潼关县', '317', '255');
INSERT INTO `sh_region` VALUES ('2658', '大荔县', '317', '255');
INSERT INTO `sh_region` VALUES ('2659', '合阳县', '317', '255');
INSERT INTO `sh_region` VALUES ('2660', '澄城县', '317', '255');
INSERT INTO `sh_region` VALUES ('2661', '蒲城县', '317', '255');
INSERT INTO `sh_region` VALUES ('2662', '白水县', '317', '255');
INSERT INTO `sh_region` VALUES ('2663', '富平县', '317', '255');
INSERT INTO `sh_region` VALUES ('2664', '秦都区', '318', '255');
INSERT INTO `sh_region` VALUES ('2665', '渭城区', '318', '255');
INSERT INTO `sh_region` VALUES ('2666', '杨陵区', '318', '255');
INSERT INTO `sh_region` VALUES ('2667', '兴平市', '318', '255');
INSERT INTO `sh_region` VALUES ('2668', '三原县', '318', '255');
INSERT INTO `sh_region` VALUES ('2669', '泾阳县', '318', '255');
INSERT INTO `sh_region` VALUES ('2670', '乾县', '318', '255');
INSERT INTO `sh_region` VALUES ('2671', '礼泉县', '318', '255');
INSERT INTO `sh_region` VALUES ('2672', '永寿县', '318', '255');
INSERT INTO `sh_region` VALUES ('2673', '彬县', '318', '255');
INSERT INTO `sh_region` VALUES ('2674', '长武县', '318', '255');
INSERT INTO `sh_region` VALUES ('2675', '旬邑县', '318', '255');
INSERT INTO `sh_region` VALUES ('2676', '淳化县', '318', '255');
INSERT INTO `sh_region` VALUES ('2677', '武功县', '318', '255');
INSERT INTO `sh_region` VALUES ('2678', '吴起县', '319', '255');
INSERT INTO `sh_region` VALUES ('2679', '宝塔区', '319', '255');
INSERT INTO `sh_region` VALUES ('2680', '延长县', '319', '255');
INSERT INTO `sh_region` VALUES ('2681', '延川县', '319', '255');
INSERT INTO `sh_region` VALUES ('2682', '子长县', '319', '255');
INSERT INTO `sh_region` VALUES ('2683', '安塞县', '319', '255');
INSERT INTO `sh_region` VALUES ('2684', '志丹县', '319', '255');
INSERT INTO `sh_region` VALUES ('2685', '甘泉县', '319', '255');
INSERT INTO `sh_region` VALUES ('2686', '富县', '319', '255');
INSERT INTO `sh_region` VALUES ('2687', '洛川县', '319', '255');
INSERT INTO `sh_region` VALUES ('2688', '宜川县', '319', '255');
INSERT INTO `sh_region` VALUES ('2689', '黄龙县', '319', '255');
INSERT INTO `sh_region` VALUES ('2690', '黄陵县', '319', '255');
INSERT INTO `sh_region` VALUES ('2691', '榆阳区', '320', '255');
INSERT INTO `sh_region` VALUES ('2692', '神木县', '320', '255');
INSERT INTO `sh_region` VALUES ('2693', '府谷县', '320', '255');
INSERT INTO `sh_region` VALUES ('2694', '横山县', '320', '255');
INSERT INTO `sh_region` VALUES ('2695', '靖边县', '320', '255');
INSERT INTO `sh_region` VALUES ('2696', '定边县', '320', '255');
INSERT INTO `sh_region` VALUES ('2697', '绥德县', '320', '255');
INSERT INTO `sh_region` VALUES ('2698', '米脂县', '320', '255');
INSERT INTO `sh_region` VALUES ('2699', '佳县', '320', '255');
INSERT INTO `sh_region` VALUES ('2700', '吴堡县', '320', '255');
INSERT INTO `sh_region` VALUES ('2701', '清涧县', '320', '255');
INSERT INTO `sh_region` VALUES ('2702', '子洲县', '320', '255');
INSERT INTO `sh_region` VALUES ('2703', '长宁区', '321', '255');
INSERT INTO `sh_region` VALUES ('2704', '闸北区', '321', '255');
INSERT INTO `sh_region` VALUES ('2705', '闵行区', '321', '255');
INSERT INTO `sh_region` VALUES ('2706', '徐汇区', '321', '255');
INSERT INTO `sh_region` VALUES ('2707', '浦东新区', '321', '255');
INSERT INTO `sh_region` VALUES ('2708', '杨浦区', '321', '255');
INSERT INTO `sh_region` VALUES ('2709', '普陀区', '321', '255');
INSERT INTO `sh_region` VALUES ('2710', '静安区', '321', '255');
INSERT INTO `sh_region` VALUES ('2711', '卢湾区', '321', '255');
INSERT INTO `sh_region` VALUES ('2712', '虹口区', '321', '255');
INSERT INTO `sh_region` VALUES ('2713', '黄浦区', '321', '255');
INSERT INTO `sh_region` VALUES ('2714', '南汇区', '321', '255');
INSERT INTO `sh_region` VALUES ('2715', '松江区', '321', '255');
INSERT INTO `sh_region` VALUES ('2716', '嘉定区', '321', '255');
INSERT INTO `sh_region` VALUES ('2717', '宝山区', '321', '255');
INSERT INTO `sh_region` VALUES ('2718', '青浦区', '321', '255');
INSERT INTO `sh_region` VALUES ('2719', '金山区', '321', '255');
INSERT INTO `sh_region` VALUES ('2720', '奉贤区', '321', '255');
INSERT INTO `sh_region` VALUES ('2721', '崇明县', '321', '255');
INSERT INTO `sh_region` VALUES ('2722', '青羊区', '322', '255');
INSERT INTO `sh_region` VALUES ('2723', '锦江区', '322', '255');
INSERT INTO `sh_region` VALUES ('2724', '金牛区', '322', '255');
INSERT INTO `sh_region` VALUES ('2725', '武侯区', '322', '255');
INSERT INTO `sh_region` VALUES ('2726', '成华区', '322', '255');
INSERT INTO `sh_region` VALUES ('2727', '龙泉驿区', '322', '255');
INSERT INTO `sh_region` VALUES ('2728', '青白江区', '322', '255');
INSERT INTO `sh_region` VALUES ('2729', '新都区', '322', '255');
INSERT INTO `sh_region` VALUES ('2730', '温江区', '322', '255');
INSERT INTO `sh_region` VALUES ('2731', '高新区', '322', '255');
INSERT INTO `sh_region` VALUES ('2732', '高新西区', '322', '255');
INSERT INTO `sh_region` VALUES ('2733', '都江堰市', '322', '255');
INSERT INTO `sh_region` VALUES ('2734', '彭州市', '322', '255');
INSERT INTO `sh_region` VALUES ('2735', '邛崃市', '322', '255');
INSERT INTO `sh_region` VALUES ('2736', '崇州市', '322', '255');
INSERT INTO `sh_region` VALUES ('2737', '金堂县', '322', '255');
INSERT INTO `sh_region` VALUES ('2738', '双流县', '322', '255');
INSERT INTO `sh_region` VALUES ('2739', '郫县', '322', '255');
INSERT INTO `sh_region` VALUES ('2740', '大邑县', '322', '255');
INSERT INTO `sh_region` VALUES ('2741', '蒲江县', '322', '255');
INSERT INTO `sh_region` VALUES ('2742', '新津县', '322', '255');
INSERT INTO `sh_region` VALUES ('2743', '都江堰市', '322', '255');
INSERT INTO `sh_region` VALUES ('2744', '彭州市', '322', '255');
INSERT INTO `sh_region` VALUES ('2745', '邛崃市', '322', '255');
INSERT INTO `sh_region` VALUES ('2746', '崇州市', '322', '255');
INSERT INTO `sh_region` VALUES ('2747', '金堂县', '322', '255');
INSERT INTO `sh_region` VALUES ('2748', '双流县', '322', '255');
INSERT INTO `sh_region` VALUES ('2749', '郫县', '322', '255');
INSERT INTO `sh_region` VALUES ('2750', '大邑县', '322', '255');
INSERT INTO `sh_region` VALUES ('2751', '蒲江县', '322', '255');
INSERT INTO `sh_region` VALUES ('2752', '新津县', '322', '255');
INSERT INTO `sh_region` VALUES ('2753', '涪城区', '323', '255');
INSERT INTO `sh_region` VALUES ('2754', '游仙区', '323', '255');
INSERT INTO `sh_region` VALUES ('2755', '江油市', '323', '255');
INSERT INTO `sh_region` VALUES ('2756', '盐亭县', '323', '255');
INSERT INTO `sh_region` VALUES ('2757', '三台县', '323', '255');
INSERT INTO `sh_region` VALUES ('2758', '平武县', '323', '255');
INSERT INTO `sh_region` VALUES ('2759', '安县', '323', '255');
INSERT INTO `sh_region` VALUES ('2760', '梓潼县', '323', '255');
INSERT INTO `sh_region` VALUES ('2761', '北川县', '323', '255');
INSERT INTO `sh_region` VALUES ('2762', '马尔康县', '324', '255');
INSERT INTO `sh_region` VALUES ('2763', '汶川县', '324', '255');
INSERT INTO `sh_region` VALUES ('2764', '理县', '324', '255');
INSERT INTO `sh_region` VALUES ('2765', '茂县', '324', '255');
INSERT INTO `sh_region` VALUES ('2766', '松潘县', '324', '255');
INSERT INTO `sh_region` VALUES ('2767', '九寨沟县', '324', '255');
INSERT INTO `sh_region` VALUES ('2768', '金川县', '324', '255');
INSERT INTO `sh_region` VALUES ('2769', '小金县', '324', '255');
INSERT INTO `sh_region` VALUES ('2770', '黑水县', '324', '255');
INSERT INTO `sh_region` VALUES ('2771', '壤塘县', '324', '255');
INSERT INTO `sh_region` VALUES ('2772', '阿坝县', '324', '255');
INSERT INTO `sh_region` VALUES ('2773', '若尔盖县', '324', '255');
INSERT INTO `sh_region` VALUES ('2774', '红原县', '324', '255');
INSERT INTO `sh_region` VALUES ('2775', '巴州区', '325', '255');
INSERT INTO `sh_region` VALUES ('2776', '通江县', '325', '255');
INSERT INTO `sh_region` VALUES ('2777', '南江县', '325', '255');
INSERT INTO `sh_region` VALUES ('2778', '平昌县', '325', '255');
INSERT INTO `sh_region` VALUES ('2779', '通川区', '326', '255');
INSERT INTO `sh_region` VALUES ('2780', '万源市', '326', '255');
INSERT INTO `sh_region` VALUES ('2781', '达县', '326', '255');
INSERT INTO `sh_region` VALUES ('2782', '宣汉县', '326', '255');
INSERT INTO `sh_region` VALUES ('2783', '开江县', '326', '255');
INSERT INTO `sh_region` VALUES ('2784', '大竹县', '326', '255');
INSERT INTO `sh_region` VALUES ('2785', '渠县', '326', '255');
INSERT INTO `sh_region` VALUES ('2786', '旌阳区', '327', '255');
INSERT INTO `sh_region` VALUES ('2787', '广汉市', '327', '255');
INSERT INTO `sh_region` VALUES ('2788', '什邡市', '327', '255');
INSERT INTO `sh_region` VALUES ('2789', '绵竹市', '327', '255');
INSERT INTO `sh_region` VALUES ('2790', '罗江县', '327', '255');
INSERT INTO `sh_region` VALUES ('2791', '中江县', '327', '255');
INSERT INTO `sh_region` VALUES ('2792', '康定县', '328', '255');
INSERT INTO `sh_region` VALUES ('2793', '丹巴县', '328', '255');
INSERT INTO `sh_region` VALUES ('2794', '泸定县', '328', '255');
INSERT INTO `sh_region` VALUES ('2795', '炉霍县', '328', '255');
INSERT INTO `sh_region` VALUES ('2796', '九龙县', '328', '255');
INSERT INTO `sh_region` VALUES ('2797', '甘孜县', '328', '255');
INSERT INTO `sh_region` VALUES ('2798', '雅江县', '328', '255');
INSERT INTO `sh_region` VALUES ('2799', '新龙县', '328', '255');
INSERT INTO `sh_region` VALUES ('2800', '道孚县', '328', '255');
INSERT INTO `sh_region` VALUES ('2801', '白玉县', '328', '255');
INSERT INTO `sh_region` VALUES ('2802', '理塘县', '328', '255');
INSERT INTO `sh_region` VALUES ('2803', '德格县', '328', '255');
INSERT INTO `sh_region` VALUES ('2804', '乡城县', '328', '255');
INSERT INTO `sh_region` VALUES ('2805', '石渠县', '328', '255');
INSERT INTO `sh_region` VALUES ('2806', '稻城县', '328', '255');
INSERT INTO `sh_region` VALUES ('2807', '色达县', '328', '255');
INSERT INTO `sh_region` VALUES ('2808', '巴塘县', '328', '255');
INSERT INTO `sh_region` VALUES ('2809', '得荣县', '328', '255');
INSERT INTO `sh_region` VALUES ('2810', '广安区', '329', '255');
INSERT INTO `sh_region` VALUES ('2811', '华蓥市', '329', '255');
INSERT INTO `sh_region` VALUES ('2812', '岳池县', '329', '255');
INSERT INTO `sh_region` VALUES ('2813', '武胜县', '329', '255');
INSERT INTO `sh_region` VALUES ('2814', '邻水县', '329', '255');
INSERT INTO `sh_region` VALUES ('2815', '利州区', '330', '255');
INSERT INTO `sh_region` VALUES ('2816', '元坝区', '330', '255');
INSERT INTO `sh_region` VALUES ('2817', '朝天区', '330', '255');
INSERT INTO `sh_region` VALUES ('2818', '旺苍县', '330', '255');
INSERT INTO `sh_region` VALUES ('2819', '青川县', '330', '255');
INSERT INTO `sh_region` VALUES ('2820', '剑阁县', '330', '255');
INSERT INTO `sh_region` VALUES ('2821', '苍溪县', '330', '255');
INSERT INTO `sh_region` VALUES ('2822', '峨眉山市', '331', '255');
INSERT INTO `sh_region` VALUES ('2823', '乐山市', '331', '255');
INSERT INTO `sh_region` VALUES ('2824', '犍为县', '331', '255');
INSERT INTO `sh_region` VALUES ('2825', '井研县', '331', '255');
INSERT INTO `sh_region` VALUES ('2826', '夹江县', '331', '255');
INSERT INTO `sh_region` VALUES ('2827', '沐川县', '331', '255');
INSERT INTO `sh_region` VALUES ('2828', '峨边', '331', '255');
INSERT INTO `sh_region` VALUES ('2829', '马边', '331', '255');
INSERT INTO `sh_region` VALUES ('2830', '西昌市', '332', '255');
INSERT INTO `sh_region` VALUES ('2831', '盐源县', '332', '255');
INSERT INTO `sh_region` VALUES ('2832', '德昌县', '332', '255');
INSERT INTO `sh_region` VALUES ('2833', '会理县', '332', '255');
INSERT INTO `sh_region` VALUES ('2834', '会东县', '332', '255');
INSERT INTO `sh_region` VALUES ('2835', '宁南县', '332', '255');
INSERT INTO `sh_region` VALUES ('2836', '普格县', '332', '255');
INSERT INTO `sh_region` VALUES ('2837', '布拖县', '332', '255');
INSERT INTO `sh_region` VALUES ('2838', '金阳县', '332', '255');
INSERT INTO `sh_region` VALUES ('2839', '昭觉县', '332', '255');
INSERT INTO `sh_region` VALUES ('2840', '喜德县', '332', '255');
INSERT INTO `sh_region` VALUES ('2841', '冕宁县', '332', '255');
INSERT INTO `sh_region` VALUES ('2842', '越西县', '332', '255');
INSERT INTO `sh_region` VALUES ('2843', '甘洛县', '332', '255');
INSERT INTO `sh_region` VALUES ('2844', '美姑县', '332', '255');
INSERT INTO `sh_region` VALUES ('2845', '雷波县', '332', '255');
INSERT INTO `sh_region` VALUES ('2846', '木里', '332', '255');
INSERT INTO `sh_region` VALUES ('2847', '东坡区', '333', '255');
INSERT INTO `sh_region` VALUES ('2848', '仁寿县', '333', '255');
INSERT INTO `sh_region` VALUES ('2849', '彭山县', '333', '255');
INSERT INTO `sh_region` VALUES ('2850', '洪雅县', '333', '255');
INSERT INTO `sh_region` VALUES ('2851', '丹棱县', '333', '255');
INSERT INTO `sh_region` VALUES ('2852', '青神县', '333', '255');
INSERT INTO `sh_region` VALUES ('2853', '阆中市', '334', '255');
INSERT INTO `sh_region` VALUES ('2854', '南部县', '334', '255');
INSERT INTO `sh_region` VALUES ('2855', '营山县', '334', '255');
INSERT INTO `sh_region` VALUES ('2856', '蓬安县', '334', '255');
INSERT INTO `sh_region` VALUES ('2857', '仪陇县', '334', '255');
INSERT INTO `sh_region` VALUES ('2858', '顺庆区', '334', '255');
INSERT INTO `sh_region` VALUES ('2859', '高坪区', '334', '255');
INSERT INTO `sh_region` VALUES ('2860', '嘉陵区', '334', '255');
INSERT INTO `sh_region` VALUES ('2861', '西充县', '334', '255');
INSERT INTO `sh_region` VALUES ('2862', '市中区', '335', '255');
INSERT INTO `sh_region` VALUES ('2863', '东兴区', '335', '255');
INSERT INTO `sh_region` VALUES ('2864', '威远县', '335', '255');
INSERT INTO `sh_region` VALUES ('2865', '资中县', '335', '255');
INSERT INTO `sh_region` VALUES ('2866', '隆昌县', '335', '255');
INSERT INTO `sh_region` VALUES ('2867', '东  区', '336', '255');
INSERT INTO `sh_region` VALUES ('2868', '西  区', '336', '255');
INSERT INTO `sh_region` VALUES ('2869', '仁和区', '336', '255');
INSERT INTO `sh_region` VALUES ('2870', '米易县', '336', '255');
INSERT INTO `sh_region` VALUES ('2871', '盐边县', '336', '255');
INSERT INTO `sh_region` VALUES ('2872', '船山区', '337', '255');
INSERT INTO `sh_region` VALUES ('2873', '安居区', '337', '255');
INSERT INTO `sh_region` VALUES ('2874', '蓬溪县', '337', '255');
INSERT INTO `sh_region` VALUES ('2875', '射洪县', '337', '255');
INSERT INTO `sh_region` VALUES ('2876', '大英县', '337', '255');
INSERT INTO `sh_region` VALUES ('2877', '雨城区', '338', '255');
INSERT INTO `sh_region` VALUES ('2878', '名山县', '338', '255');
INSERT INTO `sh_region` VALUES ('2879', '荥经县', '338', '255');
INSERT INTO `sh_region` VALUES ('2880', '汉源县', '338', '255');
INSERT INTO `sh_region` VALUES ('2881', '石棉县', '338', '255');
INSERT INTO `sh_region` VALUES ('2882', '天全县', '338', '255');
INSERT INTO `sh_region` VALUES ('2883', '芦山县', '338', '255');
INSERT INTO `sh_region` VALUES ('2884', '宝兴县', '338', '255');
INSERT INTO `sh_region` VALUES ('2885', '翠屏区', '339', '255');
INSERT INTO `sh_region` VALUES ('2886', '宜宾县', '339', '255');
INSERT INTO `sh_region` VALUES ('2887', '南溪县', '339', '255');
INSERT INTO `sh_region` VALUES ('2888', '江安县', '339', '255');
INSERT INTO `sh_region` VALUES ('2889', '长宁县', '339', '255');
INSERT INTO `sh_region` VALUES ('2890', '高县', '339', '255');
INSERT INTO `sh_region` VALUES ('2891', '珙县', '339', '255');
INSERT INTO `sh_region` VALUES ('2892', '筠连县', '339', '255');
INSERT INTO `sh_region` VALUES ('2893', '兴文县', '339', '255');
INSERT INTO `sh_region` VALUES ('2894', '屏山县', '339', '255');
INSERT INTO `sh_region` VALUES ('2895', '雁江区', '340', '255');
INSERT INTO `sh_region` VALUES ('2896', '简阳市', '340', '255');
INSERT INTO `sh_region` VALUES ('2897', '安岳县', '340', '255');
INSERT INTO `sh_region` VALUES ('2898', '乐至县', '340', '255');
INSERT INTO `sh_region` VALUES ('2899', '大安区', '341', '255');
INSERT INTO `sh_region` VALUES ('2900', '自流井区', '341', '255');
INSERT INTO `sh_region` VALUES ('2901', '贡井区', '341', '255');
INSERT INTO `sh_region` VALUES ('2902', '沿滩区', '341', '255');
INSERT INTO `sh_region` VALUES ('2903', '荣县', '341', '255');
INSERT INTO `sh_region` VALUES ('2904', '富顺县', '341', '255');
INSERT INTO `sh_region` VALUES ('2905', '江阳区', '342', '255');
INSERT INTO `sh_region` VALUES ('2906', '纳溪区', '342', '255');
INSERT INTO `sh_region` VALUES ('2907', '龙马潭区', '342', '255');
INSERT INTO `sh_region` VALUES ('2908', '泸县', '342', '255');
INSERT INTO `sh_region` VALUES ('2909', '合江县', '342', '255');
INSERT INTO `sh_region` VALUES ('2910', '叙永县', '342', '255');
INSERT INTO `sh_region` VALUES ('2911', '古蔺县', '342', '255');
INSERT INTO `sh_region` VALUES ('2912', '和平区', '343', '255');
INSERT INTO `sh_region` VALUES ('2913', '河西区', '343', '255');
INSERT INTO `sh_region` VALUES ('2914', '南开区', '343', '255');
INSERT INTO `sh_region` VALUES ('2915', '河北区', '343', '255');
INSERT INTO `sh_region` VALUES ('2916', '河东区', '343', '255');
INSERT INTO `sh_region` VALUES ('2917', '红桥区', '343', '255');
INSERT INTO `sh_region` VALUES ('2918', '东丽区', '343', '255');
INSERT INTO `sh_region` VALUES ('2919', '津南区', '343', '255');
INSERT INTO `sh_region` VALUES ('2920', '西青区', '343', '255');
INSERT INTO `sh_region` VALUES ('2921', '北辰区', '343', '255');
INSERT INTO `sh_region` VALUES ('2922', '塘沽区', '343', '255');
INSERT INTO `sh_region` VALUES ('2923', '汉沽区', '343', '255');
INSERT INTO `sh_region` VALUES ('2924', '大港区', '343', '255');
INSERT INTO `sh_region` VALUES ('2925', '武清区', '343', '255');
INSERT INTO `sh_region` VALUES ('2926', '宝坻区', '343', '255');
INSERT INTO `sh_region` VALUES ('2927', '经济开发区', '343', '255');
INSERT INTO `sh_region` VALUES ('2928', '宁河县', '343', '255');
INSERT INTO `sh_region` VALUES ('2929', '静海县', '343', '255');
INSERT INTO `sh_region` VALUES ('2930', '蓟县', '343', '255');
INSERT INTO `sh_region` VALUES ('2931', '城关区', '344', '255');
INSERT INTO `sh_region` VALUES ('2932', '林周县', '344', '255');
INSERT INTO `sh_region` VALUES ('2933', '当雄县', '344', '255');
INSERT INTO `sh_region` VALUES ('2934', '尼木县', '344', '255');
INSERT INTO `sh_region` VALUES ('2935', '曲水县', '344', '255');
INSERT INTO `sh_region` VALUES ('2936', '堆龙德庆县', '344', '255');
INSERT INTO `sh_region` VALUES ('2937', '达孜县', '344', '255');
INSERT INTO `sh_region` VALUES ('2938', '墨竹工卡县', '344', '255');
INSERT INTO `sh_region` VALUES ('2939', '噶尔县', '345', '255');
INSERT INTO `sh_region` VALUES ('2940', '普兰县', '345', '255');
INSERT INTO `sh_region` VALUES ('2941', '札达县', '345', '255');
INSERT INTO `sh_region` VALUES ('2942', '日土县', '345', '255');
INSERT INTO `sh_region` VALUES ('2943', '革吉县', '345', '255');
INSERT INTO `sh_region` VALUES ('2944', '改则县', '345', '255');
INSERT INTO `sh_region` VALUES ('2945', '措勤县', '345', '255');
INSERT INTO `sh_region` VALUES ('2946', '昌都县', '346', '255');
INSERT INTO `sh_region` VALUES ('2947', '江达县', '346', '255');
INSERT INTO `sh_region` VALUES ('2948', '贡觉县', '346', '255');
INSERT INTO `sh_region` VALUES ('2949', '类乌齐县', '346', '255');
INSERT INTO `sh_region` VALUES ('2950', '丁青县', '346', '255');
INSERT INTO `sh_region` VALUES ('2951', '察雅县', '346', '255');
INSERT INTO `sh_region` VALUES ('2952', '八宿县', '346', '255');
INSERT INTO `sh_region` VALUES ('2953', '左贡县', '346', '255');
INSERT INTO `sh_region` VALUES ('2954', '芒康县', '346', '255');
INSERT INTO `sh_region` VALUES ('2955', '洛隆县', '346', '255');
INSERT INTO `sh_region` VALUES ('2956', '边坝县', '346', '255');
INSERT INTO `sh_region` VALUES ('2957', '林芝县', '347', '255');
INSERT INTO `sh_region` VALUES ('2958', '工布江达县', '347', '255');
INSERT INTO `sh_region` VALUES ('2959', '米林县', '347', '255');
INSERT INTO `sh_region` VALUES ('2960', '墨脱县', '347', '255');
INSERT INTO `sh_region` VALUES ('2961', '波密县', '347', '255');
INSERT INTO `sh_region` VALUES ('2962', '察隅县', '347', '255');
INSERT INTO `sh_region` VALUES ('2963', '朗县', '347', '255');
INSERT INTO `sh_region` VALUES ('2964', '那曲县', '348', '255');
INSERT INTO `sh_region` VALUES ('2965', '嘉黎县', '348', '255');
INSERT INTO `sh_region` VALUES ('2966', '比如县', '348', '255');
INSERT INTO `sh_region` VALUES ('2967', '聂荣县', '348', '255');
INSERT INTO `sh_region` VALUES ('2968', '安多县', '348', '255');
INSERT INTO `sh_region` VALUES ('2969', '申扎县', '348', '255');
INSERT INTO `sh_region` VALUES ('2970', '索县', '348', '255');
INSERT INTO `sh_region` VALUES ('2971', '班戈县', '348', '255');
INSERT INTO `sh_region` VALUES ('2972', '巴青县', '348', '255');
INSERT INTO `sh_region` VALUES ('2973', '尼玛县', '348', '255');
INSERT INTO `sh_region` VALUES ('2974', '日喀则市', '349', '255');
INSERT INTO `sh_region` VALUES ('2975', '南木林县', '349', '255');
INSERT INTO `sh_region` VALUES ('2976', '江孜县', '349', '255');
INSERT INTO `sh_region` VALUES ('2977', '定日县', '349', '255');
INSERT INTO `sh_region` VALUES ('2978', '萨迦县', '349', '255');
INSERT INTO `sh_region` VALUES ('2979', '拉孜县', '349', '255');
INSERT INTO `sh_region` VALUES ('2980', '昂仁县', '349', '255');
INSERT INTO `sh_region` VALUES ('2981', '谢通门县', '349', '255');
INSERT INTO `sh_region` VALUES ('2982', '白朗县', '349', '255');
INSERT INTO `sh_region` VALUES ('2983', '仁布县', '349', '255');
INSERT INTO `sh_region` VALUES ('2984', '康马县', '349', '255');
INSERT INTO `sh_region` VALUES ('2985', '定结县', '349', '255');
INSERT INTO `sh_region` VALUES ('2986', '仲巴县', '349', '255');
INSERT INTO `sh_region` VALUES ('2987', '亚东县', '349', '255');
INSERT INTO `sh_region` VALUES ('2988', '吉隆县', '349', '255');
INSERT INTO `sh_region` VALUES ('2989', '聂拉木县', '349', '255');
INSERT INTO `sh_region` VALUES ('2990', '萨嘎县', '349', '255');
INSERT INTO `sh_region` VALUES ('2991', '岗巴县', '349', '255');
INSERT INTO `sh_region` VALUES ('2992', '乃东县', '350', '255');
INSERT INTO `sh_region` VALUES ('2993', '扎囊县', '350', '255');
INSERT INTO `sh_region` VALUES ('2994', '贡嘎县', '350', '255');
INSERT INTO `sh_region` VALUES ('2995', '桑日县', '350', '255');
INSERT INTO `sh_region` VALUES ('2996', '琼结县', '350', '255');
INSERT INTO `sh_region` VALUES ('2997', '曲松县', '350', '255');
INSERT INTO `sh_region` VALUES ('2998', '措美县', '350', '255');
INSERT INTO `sh_region` VALUES ('2999', '洛扎县', '350', '255');
INSERT INTO `sh_region` VALUES ('3000', '加查县', '350', '255');
INSERT INTO `sh_region` VALUES ('3001', '隆子县', '350', '255');
INSERT INTO `sh_region` VALUES ('3002', '错那县', '350', '255');
INSERT INTO `sh_region` VALUES ('3003', '浪卡子县', '350', '255');
INSERT INTO `sh_region` VALUES ('3004', '天山区', '351', '255');
INSERT INTO `sh_region` VALUES ('3005', '沙依巴克区', '351', '255');
INSERT INTO `sh_region` VALUES ('3006', '新市区', '351', '255');
INSERT INTO `sh_region` VALUES ('3007', '水磨沟区', '351', '255');
INSERT INTO `sh_region` VALUES ('3008', '头屯河区', '351', '255');
INSERT INTO `sh_region` VALUES ('3009', '达坂城区', '351', '255');
INSERT INTO `sh_region` VALUES ('3010', '米东区', '351', '255');
INSERT INTO `sh_region` VALUES ('3011', '乌鲁木齐县', '351', '255');
INSERT INTO `sh_region` VALUES ('3012', '阿克苏市', '352', '255');
INSERT INTO `sh_region` VALUES ('3013', '温宿县', '352', '255');
INSERT INTO `sh_region` VALUES ('3014', '库车县', '352', '255');
INSERT INTO `sh_region` VALUES ('3015', '沙雅县', '352', '255');
INSERT INTO `sh_region` VALUES ('3016', '新和县', '352', '255');
INSERT INTO `sh_region` VALUES ('3017', '拜城县', '352', '255');
INSERT INTO `sh_region` VALUES ('3018', '乌什县', '352', '255');
INSERT INTO `sh_region` VALUES ('3019', '阿瓦提县', '352', '255');
INSERT INTO `sh_region` VALUES ('3020', '柯坪县', '352', '255');
INSERT INTO `sh_region` VALUES ('3021', '阿拉尔市', '353', '255');
INSERT INTO `sh_region` VALUES ('3022', '库尔勒市', '354', '255');
INSERT INTO `sh_region` VALUES ('3023', '轮台县', '354', '255');
INSERT INTO `sh_region` VALUES ('3024', '尉犁县', '354', '255');
INSERT INTO `sh_region` VALUES ('3025', '若羌县', '354', '255');
INSERT INTO `sh_region` VALUES ('3026', '且末县', '354', '255');
INSERT INTO `sh_region` VALUES ('3027', '焉耆', '354', '255');
INSERT INTO `sh_region` VALUES ('3028', '和静县', '354', '255');
INSERT INTO `sh_region` VALUES ('3029', '和硕县', '354', '255');
INSERT INTO `sh_region` VALUES ('3030', '博湖县', '354', '255');
INSERT INTO `sh_region` VALUES ('3031', '博乐市', '355', '255');
INSERT INTO `sh_region` VALUES ('3032', '精河县', '355', '255');
INSERT INTO `sh_region` VALUES ('3033', '温泉县', '355', '255');
INSERT INTO `sh_region` VALUES ('3034', '呼图壁县', '356', '255');
INSERT INTO `sh_region` VALUES ('3035', '米泉市', '356', '255');
INSERT INTO `sh_region` VALUES ('3036', '昌吉市', '356', '255');
INSERT INTO `sh_region` VALUES ('3037', '阜康市', '356', '255');
INSERT INTO `sh_region` VALUES ('3038', '玛纳斯县', '356', '255');
INSERT INTO `sh_region` VALUES ('3039', '奇台县', '356', '255');
INSERT INTO `sh_region` VALUES ('3040', '吉木萨尔县', '356', '255');
INSERT INTO `sh_region` VALUES ('3041', '木垒', '356', '255');
INSERT INTO `sh_region` VALUES ('3042', '哈密市', '357', '255');
INSERT INTO `sh_region` VALUES ('3043', '伊吾县', '357', '255');
INSERT INTO `sh_region` VALUES ('3044', '巴里坤', '357', '255');
INSERT INTO `sh_region` VALUES ('3045', '和田市', '358', '255');
INSERT INTO `sh_region` VALUES ('3046', '和田县', '358', '255');
INSERT INTO `sh_region` VALUES ('3047', '墨玉县', '358', '255');
INSERT INTO `sh_region` VALUES ('3048', '皮山县', '358', '255');
INSERT INTO `sh_region` VALUES ('3049', '洛浦县', '358', '255');
INSERT INTO `sh_region` VALUES ('3050', '策勒县', '358', '255');
INSERT INTO `sh_region` VALUES ('3051', '于田县', '358', '255');
INSERT INTO `sh_region` VALUES ('3052', '民丰县', '358', '255');
INSERT INTO `sh_region` VALUES ('3053', '喀什市', '359', '255');
INSERT INTO `sh_region` VALUES ('3054', '疏附县', '359', '255');
INSERT INTO `sh_region` VALUES ('3055', '疏勒县', '359', '255');
INSERT INTO `sh_region` VALUES ('3056', '英吉沙县', '359', '255');
INSERT INTO `sh_region` VALUES ('3057', '泽普县', '359', '255');
INSERT INTO `sh_region` VALUES ('3058', '莎车县', '359', '255');
INSERT INTO `sh_region` VALUES ('3059', '叶城县', '359', '255');
INSERT INTO `sh_region` VALUES ('3060', '麦盖提县', '359', '255');
INSERT INTO `sh_region` VALUES ('3061', '岳普湖县', '359', '255');
INSERT INTO `sh_region` VALUES ('3062', '伽师县', '359', '255');
INSERT INTO `sh_region` VALUES ('3063', '巴楚县', '359', '255');
INSERT INTO `sh_region` VALUES ('3064', '塔什库尔干', '359', '255');
INSERT INTO `sh_region` VALUES ('3065', '克拉玛依市', '360', '255');
INSERT INTO `sh_region` VALUES ('3066', '阿图什市', '361', '255');
INSERT INTO `sh_region` VALUES ('3067', '阿克陶县', '361', '255');
INSERT INTO `sh_region` VALUES ('3068', '阿合奇县', '361', '255');
INSERT INTO `sh_region` VALUES ('3069', '乌恰县', '361', '255');
INSERT INTO `sh_region` VALUES ('3070', '石河子市', '362', '255');
INSERT INTO `sh_region` VALUES ('3071', '图木舒克市', '363', '255');
INSERT INTO `sh_region` VALUES ('3072', '吐鲁番市', '364', '255');
INSERT INTO `sh_region` VALUES ('3073', '鄯善县', '364', '255');
INSERT INTO `sh_region` VALUES ('3074', '托克逊县', '364', '255');
INSERT INTO `sh_region` VALUES ('3075', '五家渠市', '365', '255');
INSERT INTO `sh_region` VALUES ('3076', '阿勒泰市', '366', '255');
INSERT INTO `sh_region` VALUES ('3077', '布克赛尔', '366', '255');
INSERT INTO `sh_region` VALUES ('3078', '伊宁市', '366', '255');
INSERT INTO `sh_region` VALUES ('3079', '布尔津县', '366', '255');
INSERT INTO `sh_region` VALUES ('3080', '奎屯市', '366', '255');
INSERT INTO `sh_region` VALUES ('3081', '乌苏市', '366', '255');
INSERT INTO `sh_region` VALUES ('3082', '额敏县', '366', '255');
INSERT INTO `sh_region` VALUES ('3083', '富蕴县', '366', '255');
INSERT INTO `sh_region` VALUES ('3084', '伊宁县', '366', '255');
INSERT INTO `sh_region` VALUES ('3085', '福海县', '366', '255');
INSERT INTO `sh_region` VALUES ('3086', '霍城县', '366', '255');
INSERT INTO `sh_region` VALUES ('3087', '沙湾县', '366', '255');
INSERT INTO `sh_region` VALUES ('3088', '巩留县', '366', '255');
INSERT INTO `sh_region` VALUES ('3089', '哈巴河县', '366', '255');
INSERT INTO `sh_region` VALUES ('3090', '托里县', '366', '255');
INSERT INTO `sh_region` VALUES ('3091', '青河县', '366', '255');
INSERT INTO `sh_region` VALUES ('3092', '新源县', '366', '255');
INSERT INTO `sh_region` VALUES ('3093', '裕民县', '366', '255');
INSERT INTO `sh_region` VALUES ('3094', '和布克赛尔', '366', '255');
INSERT INTO `sh_region` VALUES ('3095', '吉木乃县', '366', '255');
INSERT INTO `sh_region` VALUES ('3096', '昭苏县', '366', '255');
INSERT INTO `sh_region` VALUES ('3097', '特克斯县', '366', '255');
INSERT INTO `sh_region` VALUES ('3098', '尼勒克县', '366', '255');
INSERT INTO `sh_region` VALUES ('3099', '察布查尔', '366', '255');
INSERT INTO `sh_region` VALUES ('3100', '盘龙区', '367', '255');
INSERT INTO `sh_region` VALUES ('3101', '五华区', '367', '255');
INSERT INTO `sh_region` VALUES ('3102', '官渡区', '367', '255');
INSERT INTO `sh_region` VALUES ('3103', '西山区', '367', '255');
INSERT INTO `sh_region` VALUES ('3104', '东川区', '367', '255');
INSERT INTO `sh_region` VALUES ('3105', '安宁市', '367', '255');
INSERT INTO `sh_region` VALUES ('3106', '呈贡县', '367', '255');
INSERT INTO `sh_region` VALUES ('3107', '晋宁县', '367', '255');
INSERT INTO `sh_region` VALUES ('3108', '富民县', '367', '255');
INSERT INTO `sh_region` VALUES ('3109', '宜良县', '367', '255');
INSERT INTO `sh_region` VALUES ('3110', '嵩明县', '367', '255');
INSERT INTO `sh_region` VALUES ('3111', '石林县', '367', '255');
INSERT INTO `sh_region` VALUES ('3112', '禄劝', '367', '255');
INSERT INTO `sh_region` VALUES ('3113', '寻甸', '367', '255');
INSERT INTO `sh_region` VALUES ('3114', '兰坪', '368', '255');
INSERT INTO `sh_region` VALUES ('3115', '泸水县', '368', '255');
INSERT INTO `sh_region` VALUES ('3116', '福贡县', '368', '255');
INSERT INTO `sh_region` VALUES ('3117', '贡山', '368', '255');
INSERT INTO `sh_region` VALUES ('3118', '宁洱', '369', '255');
INSERT INTO `sh_region` VALUES ('3119', '思茅区', '369', '255');
INSERT INTO `sh_region` VALUES ('3120', '墨江', '369', '255');
INSERT INTO `sh_region` VALUES ('3121', '景东', '369', '255');
INSERT INTO `sh_region` VALUES ('3122', '景谷', '369', '255');
INSERT INTO `sh_region` VALUES ('3123', '镇沅', '369', '255');
INSERT INTO `sh_region` VALUES ('3124', '江城', '369', '255');
INSERT INTO `sh_region` VALUES ('3125', '孟连', '369', '255');
INSERT INTO `sh_region` VALUES ('3126', '澜沧', '369', '255');
INSERT INTO `sh_region` VALUES ('3127', '西盟', '369', '255');
INSERT INTO `sh_region` VALUES ('3128', '古城区', '370', '255');
INSERT INTO `sh_region` VALUES ('3129', '宁蒗', '370', '255');
INSERT INTO `sh_region` VALUES ('3130', '玉龙', '370', '255');
INSERT INTO `sh_region` VALUES ('3131', '永胜县', '370', '255');
INSERT INTO `sh_region` VALUES ('3132', '华坪县', '370', '255');
INSERT INTO `sh_region` VALUES ('3133', '隆阳区', '371', '255');
INSERT INTO `sh_region` VALUES ('3134', '施甸县', '371', '255');
INSERT INTO `sh_region` VALUES ('3135', '腾冲县', '371', '255');
INSERT INTO `sh_region` VALUES ('3136', '龙陵县', '371', '255');
INSERT INTO `sh_region` VALUES ('3137', '昌宁县', '371', '255');
INSERT INTO `sh_region` VALUES ('3138', '楚雄市', '372', '255');
INSERT INTO `sh_region` VALUES ('3139', '双柏县', '372', '255');
INSERT INTO `sh_region` VALUES ('3140', '牟定县', '372', '255');
INSERT INTO `sh_region` VALUES ('3141', '南华县', '372', '255');
INSERT INTO `sh_region` VALUES ('3142', '姚安县', '372', '255');
INSERT INTO `sh_region` VALUES ('3143', '大姚县', '372', '255');
INSERT INTO `sh_region` VALUES ('3144', '永仁县', '372', '255');
INSERT INTO `sh_region` VALUES ('3145', '元谋县', '372', '255');
INSERT INTO `sh_region` VALUES ('3146', '武定县', '372', '255');
INSERT INTO `sh_region` VALUES ('3147', '禄丰县', '372', '255');
INSERT INTO `sh_region` VALUES ('3148', '大理市', '373', '255');
INSERT INTO `sh_region` VALUES ('3149', '祥云县', '373', '255');
INSERT INTO `sh_region` VALUES ('3150', '宾川县', '373', '255');
INSERT INTO `sh_region` VALUES ('3151', '弥渡县', '373', '255');
INSERT INTO `sh_region` VALUES ('3152', '永平县', '373', '255');
INSERT INTO `sh_region` VALUES ('3153', '云龙县', '373', '255');
INSERT INTO `sh_region` VALUES ('3154', '洱源县', '373', '255');
INSERT INTO `sh_region` VALUES ('3155', '剑川县', '373', '255');
INSERT INTO `sh_region` VALUES ('3156', '鹤庆县', '373', '255');
INSERT INTO `sh_region` VALUES ('3157', '漾濞', '373', '255');
INSERT INTO `sh_region` VALUES ('3158', '南涧', '373', '255');
INSERT INTO `sh_region` VALUES ('3159', '巍山', '373', '255');
INSERT INTO `sh_region` VALUES ('3160', '潞西市', '374', '255');
INSERT INTO `sh_region` VALUES ('3161', '瑞丽市', '374', '255');
INSERT INTO `sh_region` VALUES ('3162', '梁河县', '374', '255');
INSERT INTO `sh_region` VALUES ('3163', '盈江县', '374', '255');
INSERT INTO `sh_region` VALUES ('3164', '陇川县', '374', '255');
INSERT INTO `sh_region` VALUES ('3165', '香格里拉县', '375', '255');
INSERT INTO `sh_region` VALUES ('3166', '德钦县', '375', '255');
INSERT INTO `sh_region` VALUES ('3167', '维西', '375', '255');
INSERT INTO `sh_region` VALUES ('3168', '泸西县', '376', '255');
INSERT INTO `sh_region` VALUES ('3169', '蒙自县', '376', '255');
INSERT INTO `sh_region` VALUES ('3170', '个旧市', '376', '255');
INSERT INTO `sh_region` VALUES ('3171', '开远市', '376', '255');
INSERT INTO `sh_region` VALUES ('3172', '绿春县', '376', '255');
INSERT INTO `sh_region` VALUES ('3173', '建水县', '376', '255');
INSERT INTO `sh_region` VALUES ('3174', '石屏县', '376', '255');
INSERT INTO `sh_region` VALUES ('3175', '弥勒县', '376', '255');
INSERT INTO `sh_region` VALUES ('3176', '元阳县', '376', '255');
INSERT INTO `sh_region` VALUES ('3177', '红河县', '376', '255');
INSERT INTO `sh_region` VALUES ('3178', '金平', '376', '255');
INSERT INTO `sh_region` VALUES ('3179', '河口', '376', '255');
INSERT INTO `sh_region` VALUES ('3180', '屏边', '376', '255');
INSERT INTO `sh_region` VALUES ('3181', '临翔区', '377', '255');
INSERT INTO `sh_region` VALUES ('3182', '凤庆县', '377', '255');
INSERT INTO `sh_region` VALUES ('3183', '云县', '377', '255');
INSERT INTO `sh_region` VALUES ('3184', '永德县', '377', '255');
INSERT INTO `sh_region` VALUES ('3185', '镇康县', '377', '255');
INSERT INTO `sh_region` VALUES ('3186', '双江', '377', '255');
INSERT INTO `sh_region` VALUES ('3187', '耿马', '377', '255');
INSERT INTO `sh_region` VALUES ('3188', '沧源', '377', '255');
INSERT INTO `sh_region` VALUES ('3189', '麒麟区', '378', '255');
INSERT INTO `sh_region` VALUES ('3190', '宣威市', '378', '255');
INSERT INTO `sh_region` VALUES ('3191', '马龙县', '378', '255');
INSERT INTO `sh_region` VALUES ('3192', '陆良县', '378', '255');
INSERT INTO `sh_region` VALUES ('3193', '师宗县', '378', '255');
INSERT INTO `sh_region` VALUES ('3194', '罗平县', '378', '255');
INSERT INTO `sh_region` VALUES ('3195', '富源县', '378', '255');
INSERT INTO `sh_region` VALUES ('3196', '会泽县', '378', '255');
INSERT INTO `sh_region` VALUES ('3197', '沾益县', '378', '255');
INSERT INTO `sh_region` VALUES ('3198', '文山县', '379', '255');
INSERT INTO `sh_region` VALUES ('3199', '砚山县', '379', '255');
INSERT INTO `sh_region` VALUES ('3200', '西畴县', '379', '255');
INSERT INTO `sh_region` VALUES ('3201', '麻栗坡县', '379', '255');
INSERT INTO `sh_region` VALUES ('3202', '马关县', '379', '255');
INSERT INTO `sh_region` VALUES ('3203', '丘北县', '379', '255');
INSERT INTO `sh_region` VALUES ('3204', '广南县', '379', '255');
INSERT INTO `sh_region` VALUES ('3205', '富宁县', '379', '255');
INSERT INTO `sh_region` VALUES ('3206', '景洪市', '380', '255');
INSERT INTO `sh_region` VALUES ('3207', '勐海县', '380', '255');
INSERT INTO `sh_region` VALUES ('3208', '勐腊县', '380', '255');
INSERT INTO `sh_region` VALUES ('3209', '红塔区', '381', '255');
INSERT INTO `sh_region` VALUES ('3210', '江川县', '381', '255');
INSERT INTO `sh_region` VALUES ('3211', '澄江县', '381', '255');
INSERT INTO `sh_region` VALUES ('3212', '通海县', '381', '255');
INSERT INTO `sh_region` VALUES ('3213', '华宁县', '381', '255');
INSERT INTO `sh_region` VALUES ('3214', '易门县', '381', '255');
INSERT INTO `sh_region` VALUES ('3215', '峨山', '381', '255');
INSERT INTO `sh_region` VALUES ('3216', '新平', '381', '255');
INSERT INTO `sh_region` VALUES ('3217', '元江', '381', '255');
INSERT INTO `sh_region` VALUES ('3218', '昭阳区', '382', '255');
INSERT INTO `sh_region` VALUES ('3219', '鲁甸县', '382', '255');
INSERT INTO `sh_region` VALUES ('3220', '巧家县', '382', '255');
INSERT INTO `sh_region` VALUES ('3221', '盐津县', '382', '255');
INSERT INTO `sh_region` VALUES ('3222', '大关县', '382', '255');
INSERT INTO `sh_region` VALUES ('3223', '永善县', '382', '255');
INSERT INTO `sh_region` VALUES ('3224', '绥江县', '382', '255');
INSERT INTO `sh_region` VALUES ('3225', '镇雄县', '382', '255');
INSERT INTO `sh_region` VALUES ('3226', '彝良县', '382', '255');
INSERT INTO `sh_region` VALUES ('3227', '威信县', '382', '255');
INSERT INTO `sh_region` VALUES ('3228', '水富县', '382', '255');
INSERT INTO `sh_region` VALUES ('3229', '西湖区', '383', '255');
INSERT INTO `sh_region` VALUES ('3230', '上城区', '383', '255');
INSERT INTO `sh_region` VALUES ('3231', '下城区', '383', '255');
INSERT INTO `sh_region` VALUES ('3232', '拱墅区', '383', '255');
INSERT INTO `sh_region` VALUES ('3233', '滨江区', '383', '255');
INSERT INTO `sh_region` VALUES ('3234', '江干区', '383', '255');
INSERT INTO `sh_region` VALUES ('3235', '萧山区', '383', '255');
INSERT INTO `sh_region` VALUES ('3236', '余杭区', '383', '255');
INSERT INTO `sh_region` VALUES ('3237', '市郊', '383', '255');
INSERT INTO `sh_region` VALUES ('3238', '建德市', '383', '255');
INSERT INTO `sh_region` VALUES ('3239', '富阳市', '383', '255');
INSERT INTO `sh_region` VALUES ('3240', '临安市', '383', '255');
INSERT INTO `sh_region` VALUES ('3241', '桐庐县', '383', '255');
INSERT INTO `sh_region` VALUES ('3242', '淳安县', '383', '255');
INSERT INTO `sh_region` VALUES ('3243', '吴兴区', '384', '255');
INSERT INTO `sh_region` VALUES ('3244', '南浔区', '384', '255');
INSERT INTO `sh_region` VALUES ('3245', '德清县', '384', '255');
INSERT INTO `sh_region` VALUES ('3246', '长兴县', '384', '255');
INSERT INTO `sh_region` VALUES ('3247', '安吉县', '384', '255');
INSERT INTO `sh_region` VALUES ('3248', '南湖区', '385', '255');
INSERT INTO `sh_region` VALUES ('3249', '秀洲区', '385', '255');
INSERT INTO `sh_region` VALUES ('3250', '海宁市', '385', '255');
INSERT INTO `sh_region` VALUES ('3251', '嘉善县', '385', '255');
INSERT INTO `sh_region` VALUES ('3252', '平湖市', '385', '255');
INSERT INTO `sh_region` VALUES ('3253', '桐乡市', '385', '255');
INSERT INTO `sh_region` VALUES ('3254', '海盐县', '385', '255');
INSERT INTO `sh_region` VALUES ('3255', '婺城区', '386', '255');
INSERT INTO `sh_region` VALUES ('3256', '金东区', '386', '255');
INSERT INTO `sh_region` VALUES ('3257', '兰溪市', '386', '255');
INSERT INTO `sh_region` VALUES ('3258', '市区', '386', '255');
INSERT INTO `sh_region` VALUES ('3259', '佛堂镇', '386', '255');
INSERT INTO `sh_region` VALUES ('3260', '上溪镇', '386', '255');
INSERT INTO `sh_region` VALUES ('3261', '义亭镇', '386', '255');
INSERT INTO `sh_region` VALUES ('3262', '大陈镇', '386', '255');
INSERT INTO `sh_region` VALUES ('3263', '苏溪镇', '386', '255');
INSERT INTO `sh_region` VALUES ('3264', '赤岸镇', '386', '255');
INSERT INTO `sh_region` VALUES ('3265', '东阳市', '386', '255');
INSERT INTO `sh_region` VALUES ('3266', '永康市', '386', '255');
INSERT INTO `sh_region` VALUES ('3267', '武义县', '386', '255');
INSERT INTO `sh_region` VALUES ('3268', '浦江县', '386', '255');
INSERT INTO `sh_region` VALUES ('3269', '磐安县', '386', '255');
INSERT INTO `sh_region` VALUES ('3270', '莲都区', '387', '255');
INSERT INTO `sh_region` VALUES ('3271', '龙泉市', '387', '255');
INSERT INTO `sh_region` VALUES ('3272', '青田县', '387', '255');
INSERT INTO `sh_region` VALUES ('3273', '缙云县', '387', '255');
INSERT INTO `sh_region` VALUES ('3274', '遂昌县', '387', '255');
INSERT INTO `sh_region` VALUES ('3275', '松阳县', '387', '255');
INSERT INTO `sh_region` VALUES ('3276', '云和县', '387', '255');
INSERT INTO `sh_region` VALUES ('3277', '庆元县', '387', '255');
INSERT INTO `sh_region` VALUES ('3278', '景宁', '387', '255');
INSERT INTO `sh_region` VALUES ('3279', '海曙区', '388', '255');
INSERT INTO `sh_region` VALUES ('3280', '江东区', '388', '255');
INSERT INTO `sh_region` VALUES ('3281', '江北区', '388', '255');
INSERT INTO `sh_region` VALUES ('3282', '镇海区', '388', '255');
INSERT INTO `sh_region` VALUES ('3283', '北仑区', '388', '255');
INSERT INTO `sh_region` VALUES ('3284', '鄞州区', '388', '255');
INSERT INTO `sh_region` VALUES ('3285', '余姚市', '388', '255');
INSERT INTO `sh_region` VALUES ('3286', '慈溪市', '388', '255');
INSERT INTO `sh_region` VALUES ('3287', '奉化市', '388', '255');
INSERT INTO `sh_region` VALUES ('3288', '象山县', '388', '255');
INSERT INTO `sh_region` VALUES ('3289', '宁海县', '388', '255');
INSERT INTO `sh_region` VALUES ('3290', '越城区', '389', '255');
INSERT INTO `sh_region` VALUES ('3291', '上虞市', '389', '255');
INSERT INTO `sh_region` VALUES ('3292', '嵊州市', '389', '255');
INSERT INTO `sh_region` VALUES ('3293', '绍兴县', '389', '255');
INSERT INTO `sh_region` VALUES ('3294', '新昌县', '389', '255');
INSERT INTO `sh_region` VALUES ('3295', '诸暨市', '389', '255');
INSERT INTO `sh_region` VALUES ('3296', '椒江区', '390', '255');
INSERT INTO `sh_region` VALUES ('3297', '黄岩区', '390', '255');
INSERT INTO `sh_region` VALUES ('3298', '路桥区', '390', '255');
INSERT INTO `sh_region` VALUES ('3299', '温岭市', '390', '255');
INSERT INTO `sh_region` VALUES ('3300', '临海市', '390', '255');
INSERT INTO `sh_region` VALUES ('3301', '玉环县', '390', '255');
INSERT INTO `sh_region` VALUES ('3302', '三门县', '390', '255');
INSERT INTO `sh_region` VALUES ('3303', '天台县', '390', '255');
INSERT INTO `sh_region` VALUES ('3304', '仙居县', '390', '255');
INSERT INTO `sh_region` VALUES ('3305', '鹿城区', '391', '255');
INSERT INTO `sh_region` VALUES ('3306', '龙湾区', '391', '255');
INSERT INTO `sh_region` VALUES ('3307', '瓯海区', '391', '255');
INSERT INTO `sh_region` VALUES ('3308', '瑞安市', '391', '255');
INSERT INTO `sh_region` VALUES ('3309', '乐清市', '391', '255');
INSERT INTO `sh_region` VALUES ('3310', '洞头县', '391', '255');
INSERT INTO `sh_region` VALUES ('3311', '永嘉县', '391', '255');
INSERT INTO `sh_region` VALUES ('3312', '平阳县', '391', '255');
INSERT INTO `sh_region` VALUES ('3313', '苍南县', '391', '255');
INSERT INTO `sh_region` VALUES ('3314', '文成县', '391', '255');
INSERT INTO `sh_region` VALUES ('3315', '泰顺县', '391', '255');
INSERT INTO `sh_region` VALUES ('3316', '定海区', '392', '255');
INSERT INTO `sh_region` VALUES ('3317', '普陀区', '392', '255');
INSERT INTO `sh_region` VALUES ('3318', '岱山县', '392', '255');
INSERT INTO `sh_region` VALUES ('3319', '嵊泗县', '392', '255');
INSERT INTO `sh_region` VALUES ('3320', '衢州市', '393', '255');
INSERT INTO `sh_region` VALUES ('3321', '江山市', '393', '255');
INSERT INTO `sh_region` VALUES ('3322', '常山县', '393', '255');
INSERT INTO `sh_region` VALUES ('3323', '开化县', '393', '255');
INSERT INTO `sh_region` VALUES ('3324', '龙游县', '393', '255');
INSERT INTO `sh_region` VALUES ('3325', '合川区', '394', '255');
INSERT INTO `sh_region` VALUES ('3326', '江津区', '394', '255');
INSERT INTO `sh_region` VALUES ('3327', '南川区', '394', '255');
INSERT INTO `sh_region` VALUES ('3328', '永川区', '394', '255');
INSERT INTO `sh_region` VALUES ('3329', '南岸区', '394', '255');
INSERT INTO `sh_region` VALUES ('3330', '渝北区', '394', '255');
INSERT INTO `sh_region` VALUES ('3331', '万盛区', '394', '255');
INSERT INTO `sh_region` VALUES ('3332', '大渡口区', '394', '255');
INSERT INTO `sh_region` VALUES ('3333', '万州区', '394', '255');
INSERT INTO `sh_region` VALUES ('3334', '北碚区', '394', '255');
INSERT INTO `sh_region` VALUES ('3335', '沙坪坝区', '394', '255');
INSERT INTO `sh_region` VALUES ('3336', '巴南区', '394', '255');
INSERT INTO `sh_region` VALUES ('3337', '涪陵区', '394', '255');
INSERT INTO `sh_region` VALUES ('3338', '江北区', '394', '255');
INSERT INTO `sh_region` VALUES ('3339', '九龙坡区', '394', '255');
INSERT INTO `sh_region` VALUES ('3340', '渝中区', '394', '255');
INSERT INTO `sh_region` VALUES ('3341', '黔江开发区', '394', '255');
INSERT INTO `sh_region` VALUES ('3342', '长寿区', '394', '255');
INSERT INTO `sh_region` VALUES ('3343', '双桥区', '394', '255');
INSERT INTO `sh_region` VALUES ('3344', '綦江县', '394', '255');
INSERT INTO `sh_region` VALUES ('3345', '潼南县', '394', '255');
INSERT INTO `sh_region` VALUES ('3346', '铜梁县', '394', '255');
INSERT INTO `sh_region` VALUES ('3347', '大足县', '394', '255');
INSERT INTO `sh_region` VALUES ('3348', '荣昌县', '394', '255');
INSERT INTO `sh_region` VALUES ('3349', '璧山县', '394', '255');
INSERT INTO `sh_region` VALUES ('3350', '垫江县', '394', '255');
INSERT INTO `sh_region` VALUES ('3351', '武隆县', '394', '255');
INSERT INTO `sh_region` VALUES ('3352', '丰都县', '394', '255');
INSERT INTO `sh_region` VALUES ('3353', '城口县', '394', '255');
INSERT INTO `sh_region` VALUES ('3354', '梁平县', '394', '255');
INSERT INTO `sh_region` VALUES ('3355', '开县', '394', '255');
INSERT INTO `sh_region` VALUES ('3356', '巫溪县', '394', '255');
INSERT INTO `sh_region` VALUES ('3357', '巫山县', '394', '255');
INSERT INTO `sh_region` VALUES ('3358', '奉节县', '394', '255');
INSERT INTO `sh_region` VALUES ('3359', '云阳县', '394', '255');
INSERT INTO `sh_region` VALUES ('3360', '忠县', '394', '255');
INSERT INTO `sh_region` VALUES ('3361', '石柱', '394', '255');
INSERT INTO `sh_region` VALUES ('3362', '彭水', '394', '255');
INSERT INTO `sh_region` VALUES ('3363', '酉阳', '394', '255');
INSERT INTO `sh_region` VALUES ('3364', '秀山', '394', '255');
INSERT INTO `sh_region` VALUES ('3365', '沙田区', '395', '255');
INSERT INTO `sh_region` VALUES ('3366', '东区', '395', '255');
INSERT INTO `sh_region` VALUES ('3367', '观塘区', '395', '255');
INSERT INTO `sh_region` VALUES ('3368', '黄大仙区', '395', '255');
INSERT INTO `sh_region` VALUES ('3369', '九龙城区', '395', '255');
INSERT INTO `sh_region` VALUES ('3370', '屯门区', '395', '255');
INSERT INTO `sh_region` VALUES ('3371', '葵青区', '395', '255');
INSERT INTO `sh_region` VALUES ('3372', '元朗区', '395', '255');
INSERT INTO `sh_region` VALUES ('3373', '深水埗区', '395', '255');
INSERT INTO `sh_region` VALUES ('3374', '西贡区', '395', '255');
INSERT INTO `sh_region` VALUES ('3375', '大埔区', '395', '255');
INSERT INTO `sh_region` VALUES ('3376', '湾仔区', '395', '255');
INSERT INTO `sh_region` VALUES ('3377', '油尖旺区', '395', '255');
INSERT INTO `sh_region` VALUES ('3378', '北区', '395', '255');
INSERT INTO `sh_region` VALUES ('3379', '南区', '395', '255');
INSERT INTO `sh_region` VALUES ('3380', '荃湾区', '395', '255');
INSERT INTO `sh_region` VALUES ('3381', '中西区', '395', '255');
INSERT INTO `sh_region` VALUES ('3382', '离岛区', '395', '255');
INSERT INTO `sh_region` VALUES ('3383', '澳门', '396', '255');
INSERT INTO `sh_region` VALUES ('3384', '台北', '397', '255');
INSERT INTO `sh_region` VALUES ('3385', '高雄', '397', '255');
INSERT INTO `sh_region` VALUES ('3386', '基隆', '397', '255');
INSERT INTO `sh_region` VALUES ('3387', '台中', '397', '255');
INSERT INTO `sh_region` VALUES ('3388', '台南', '397', '255');
INSERT INTO `sh_region` VALUES ('3389', '新竹', '397', '255');
INSERT INTO `sh_region` VALUES ('3390', '嘉义', '397', '255');
INSERT INTO `sh_region` VALUES ('3391', '宜兰县', '397', '255');
INSERT INTO `sh_region` VALUES ('3392', '桃园县', '397', '255');
INSERT INTO `sh_region` VALUES ('3393', '苗栗县', '397', '255');
INSERT INTO `sh_region` VALUES ('3394', '彰化县', '397', '255');
INSERT INTO `sh_region` VALUES ('3395', '南投县', '397', '255');
INSERT INTO `sh_region` VALUES ('3396', '云林县', '397', '255');
INSERT INTO `sh_region` VALUES ('3397', '屏东县', '397', '255');
INSERT INTO `sh_region` VALUES ('3398', '台东县', '397', '255');
INSERT INTO `sh_region` VALUES ('3399', '花莲县', '397', '255');
INSERT INTO `sh_region` VALUES ('3400', '澎湖县', '397', '255');
INSERT INTO `sh_region` VALUES ('3401', '合肥', '3', '255');
INSERT INTO `sh_region` VALUES ('3402', '庐阳区', '3401', '255');
INSERT INTO `sh_region` VALUES ('3403', '瑶海区', '3401', '255');
INSERT INTO `sh_region` VALUES ('3404', '蜀山区', '3401', '255');
INSERT INTO `sh_region` VALUES ('3405', '包河区', '3401', '255');
INSERT INTO `sh_region` VALUES ('3406', '长丰县', '3401', '255');
INSERT INTO `sh_region` VALUES ('3407', '肥东县', '3401', '255');
INSERT INTO `sh_region` VALUES ('3408', '肥西县', '3401', '255');

-- ----------------------------
-- Table structure for `sh_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sh_sessions`;
CREATE TABLE `sh_sessions` (
  `sesskey` char(32) NOT NULL DEFAULT '',
  `expiry` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `adminid` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `data` char(255) NOT NULL DEFAULT '',
  `is_overflow` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_sessions
-- ----------------------------
INSERT INTO `sh_sessions` VALUES ('081a5efc4d51a24eeef013211476f6bf', '1452857117', '0', '0', '127.0.0.1', 'admin_info|a:5:{s:7:\"user_id\";s:1:\"1\";s:9:\"user_name\";s:5:\"admin\";s:8:\"reg_time\";s:10:\"1425869615\";s:10:\"last_login\";s:10:\"1452848185\";s:7:\"last_ip\";s:9:\"127.0.0.1\";}', '0');
INSERT INTO `sh_sessions` VALUES ('ba76dfd519ae3f5277b4ab0c0bcf643f', '1453557147', '0', '0', '127.0.0.1', 'admin_info|a:5:{s:7:\"user_id\";s:1:\"1\";s:9:\"user_name\";s:5:\"admin\";s:8:\"reg_time\";s:10:\"1425869615\";s:10:\"last_login\";s:10:\"1452848221\";s:7:\"last_ip\";s:9:\"127.0.0.1\";}', '0');

-- ----------------------------
-- Table structure for `sh_sessions_data`
-- ----------------------------
DROP TABLE IF EXISTS `sh_sessions_data`;
CREATE TABLE `sh_sessions_data` (
  `sesskey` varchar(32) NOT NULL DEFAULT '',
  `expiry` int(11) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_sessions_data
-- ----------------------------

-- ----------------------------
-- Table structure for `sh_uploaded_file`
-- ----------------------------
DROP TABLE IF EXISTS `sh_uploaded_file`;
CREATE TABLE `sh_uploaded_file` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_type` varchar(60) NOT NULL DEFAULT '',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_path` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `belong` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_uploaded_file
-- ----------------------------
INSERT INTO `sh_uploaded_file` VALUES ('1', '2', 'image/jpeg', '150297', '54bc992b9b443.jpg', 'data/files/store_2/goods_133/201503091348536895.jpg', '1425851333', '2', '1');
INSERT INTO `sh_uploaded_file` VALUES ('2', '2', 'image/jpeg', '15522', '11.jpg', 'data/files/store_2/goods_167/201504031016075387.jpg', '1427998567', '2', '2');

-- ----------------------------
-- Table structure for `sh_user_priv`
-- ----------------------------
DROP TABLE IF EXISTS `sh_user_priv`;
CREATE TABLE `sh_user_priv` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `privs` text NOT NULL,
  PRIMARY KEY (`user_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_user_priv
-- ----------------------------
INSERT INTO `sh_user_priv` VALUES ('1', '0', 'all');
INSERT INTO `sh_user_priv` VALUES ('2', '2', 'all');
INSERT INTO `sh_user_priv` VALUES ('2', '0', 'default|all,consulting|all');
