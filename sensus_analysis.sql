/* Following are the SQL Queries for PROJECT-2 */

#First/last timestamps of recorded data
SELECT ParticipantId, MIN(Formatted_time) AS first_record_time, MAX(Formatted_time) AS last_record_time
FROM survey_result
GROUP BY ParticipantId;

#Number of records for each probe
SELECT ParticipantId, Type AS Probe, COUNT(*) AS record_count
FROM survey_result
GROUP BY ParticipantId, Type
ORDER BY ParticipantId, Probe;


#Most frequent activity
WITH activity_counts AS (
    SELECT ParticipantId, Activity, COUNT(*) AS activity_count,
        ROW_NUMBER() OVER (
            PARTITION BY ParticipantId
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM survey_result
    WHERE Activity IS NOT NULL AND Activity <> ''
    GROUP BY ParticipantId, Activity
)
SELECT ParticipantId, Activity AS most_frequent_activity, activity_count
FROM activity_counts
WHERE rn = 1;


#History of device battery level
SELECT ParticipantId, Formatted_time, BatteryLevel
FROM survey_result
WHERE BatteryLevel IS NOT NULL
ORDER BY ParticipantId, Formatted_time;