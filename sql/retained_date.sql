WITH min_days_later AS (

-- minimum 'days_later' per user omitting "0"
-- (when the user was first classified as retained)
SELECT user_id,
       MIN(days_later) AS days_later
  FROM gbofysil.communicated_daily
 WHERE days_later > 0
 GROUP BY user_id

)

SELECT md.user_id,
       r.timestamp + md.days_later * INTERVAL '1 day' AS retained_date
FROM min_days_later md
JOIN gbofysil.register r
     ON md.user_id = r.user_id
