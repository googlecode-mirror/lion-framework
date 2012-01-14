-- 
-- Table structure for table `roles`
-- 

CREATE TABLE `roles` (
  `role` varchar(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  PRIMARY KEY  (`role`,`user_id`)
);

-- ------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `id` int(32) NOT NULL auto_increment,
  `login` varchar(150) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login` (`login`)
);
