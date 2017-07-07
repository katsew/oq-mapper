CREATE TABLE `mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `package_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` varchar(8000) DEFAULT NULL,
  `is_sent` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'ユーザーに送信したかどうか\n\n0: 未送信\n1: 送信済',
  `created_at` datetime NOT NULL COMMENT '作成日\n\n※これはmailboxには入らない',
  `updated_at` datetime NOT NULL COMMENT '最終更新日時\n\n※これはmailboxには入らない',
  PRIMARY KEY (`id`),
  KEY `fk_mail_senders_idx` (`sender_id`),
  CONSTRAINT `fk_mail_senders` FOREIGN KEY (`sender_id`) REFERENCES `senders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;