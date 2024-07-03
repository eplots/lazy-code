-- Reset entire rss-feed
UPDATE rss_item
   SET unread = 1
 WHERE feedurl = '' -- get from urls file
