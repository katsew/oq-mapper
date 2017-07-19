# Abstract

Object/Query Mapper for Node.js.

:zap: Currently support only `CREATE TABLE` statement.

# Behaviour

This query outputs...

```

CREATE TABLE IF NOT EXISTS `dvd_collection`.`movies` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `movie_title` VARCHAR(45) NOT NULL,
  `release_date` DATE NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB

```

This kind of object structure!

```

[
   {
      "dbName": "dvd_collection",
      "tableName": "movies",
      "pk": [
         "movie_id"
      ],
      "fields": [
         {
            "name": "movie_id",
            "type": "int",
            "sign": "signed",
            "length": 0,
            "min": -2147483648,
            "max": 2147483647,
            "bites": 4,
            "allowNull": false,
            "default": 0,
            "autoIncrement": true
         },
         {
            "name": "movie_title",
            "type": "varchar",
            "length": 0,
            "allowNull": false,
            "default": "",
            "autoIncrement": false
         },
         {
            "name": "release_date",
            "type": "date",
            "allowNull": true,
            "default": "CURRENT_TIMESTAMP",
            "autoIncrement": false
         }
      ],
      "constraint": [],
      "index": []
   }
]

```

# Features

## Parse tags in comment

When you add comment with tags, like [Go#StructTag](https://golang.org/pkg/reflect/#example_StructTag), 

```

CREATE TABLE IF NOT EXISTS `dvd_collection`.`movies` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `movie_title` VARCHAR(45) NOT NULL,
  `is_sold` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '`types:"0,1" strategy:"random"`',
  `release_date` DATE NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB

```

parse that tag, and create object like following.

```
[
  ...
  "fields": [
    {
      "name": "is_sold",
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