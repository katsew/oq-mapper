# Abstract

Object/Query Mapper for Node.js.

:zap: Currently support only `CREATE TABLE` statement.

# Behaviour

This query outputs...

```

CREATE TABLE `mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` varchar(4000) DEFAULT NULL,
  `is_sent` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0: not, 1:sent',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mail_senders_idx` (`sender_id`),
  CONSTRAINT `fk_mail_senders` FOREIGN KEY (`sender_id`) REFERENCES `senders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

```

This kind of object structure!

```

[
  {
    dbName: "",
    tableName: "mail"
    fields: [
      {
        name: "id",
        type: "int",
        length: 10,
        auto_increment: true,
        default: null,
      }
      ...
    ]
  }
  ...
]

```

# Features

## Parse tag in comments

When you add comment with tags, like [Go#StructTag](https://golang.org/pkg/reflect/#example_StructTag), 

```
CREATE TABLE `mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_sent` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '`types:"0,1" strategy:"random"`',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

parse that tag, and create object like following.

```
[
  ...
  "fields": [
    {
      "name": "is_sent",
      ...
      "comment": "`types:'0, 1' strategy:'random'`",
      "tags": [
          {
            "types": "0,1"
          },
          {
            "strategy": "random"
          }
      ]
    }
  ]
  ...
]
```