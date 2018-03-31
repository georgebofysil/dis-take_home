SELECT user_id,
       SUM(CASE WHEN event = 'start_listening' THEN 1 ELSE 0 END) AS start_listening,
       SUM(CASE WHEN event = 'start_speaking'  THEN 1 ELSE 0 END) AS start_speaking,
       SUM(CASE WHEN event = 'read_message'    THEN 1 ELSE 0 END) AS read_message,
       SUM(CASE WHEN event = 'send_message'    THEN 1 ELSE 0 END) AS send_message,
       SUM(CASE WHEN event = 'send_message' OR event = 'start_speaking'     THEN 1 ELSE 0 END) AS proactive_events,
       SUM(CASE WHEN event = 'read_message' OR event = 'start_listening'    THEN 1 ELSE 0 END) AS reactive_events,
       SUM(CASE WHEN event = 'start_listening' OR event = 'start_speaking'  THEN 1 ELSE 0 END) AS voice_events,
       SUM(CASE WHEN event = 'read_message' OR event = 'send_message'       THEN 1 ELSE 0 END) AS message_events,
       COUNT(*) AS total_events
  FROM gbofysil.communicated_daily
 WHERE days_later = 0
 GROUP BY user_id
