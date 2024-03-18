SELECT
  COUNT(DISTINCT geolocation_city)   AS Total_City
 ,COUNT(DISTINCT geolocation_state)  AS Total_State
FROM `Target_Case_Study.geolocation`