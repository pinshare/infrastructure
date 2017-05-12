SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `pins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` text,
  `phrase` text,
  `url` text NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rel_pin_tags` (
  `pin_id` int(11) unsigned NOT NULL DEFAULT '0',
  `tag_id` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'ユーザID',
  `facebook_id` varchar(255) DEFAULT NULL COMMENT 'FacebookID',
  `github_id` varchar(255) DEFAULT NULL COMMENT 'GithubID',
  `twitter_id` varchar(255) DEFAULT NULL COMMENT 'TwitterID',
  `token` varchar(64) NOT NULL COMMENT 'アクセストークン',
  `profile_url` text,
  `username` varchar(64) NOT NULL COMMENT 'ユーザ名',
  `created_at` datetime NOT NULL COMMENT '作成日時',
  `updated_at` datetime NOT NULL COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for table `pins`
--
ALTER TABLE `pins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rel_pin_tags`
--
ALTER TABLE `rel_pin_tags`
  ADD KEY `pin_tag_id` (`pin_id`,`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pins`
--
ALTER TABLE `pins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ユーザID',AUTO_INCREMENT;
