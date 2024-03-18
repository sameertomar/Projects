SELECT
  Distinct geolocation_zip_code_prefix AS Zipcodes_need_to_focus_to_expand_business
FROM `Target_Case_Study.geolocation` Geo
LEFT JOIN `Target_Case_Study.customers` C ON C.customer_zip_code_prefix = Geo.geolocation_zip_code_prefix
where customer_zip_code_prefix is null