SELECT user_id,
       CASE WHEN MAX(days_later) > 0 THEN 1 ELSE 0 END AS retained
  FROM gbofysil.communicated_daily
 GROUP BY user_id
