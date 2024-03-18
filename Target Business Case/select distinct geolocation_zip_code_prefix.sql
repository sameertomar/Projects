select distinct geolocation_zip_code_prefix
FROM `Target_Case_Study.geolocation`
where geolocation_zip_code_prefix IN ((Select distinct customer_zip_code_prefix
                                       FROM `Target_Case_Study.customers`
                                       where customer_zip_code_prefix NOT IN (SELECT Distinct geolocation_zip_code_prefix
                                                                              FROM `Target_Case_Study.geolocation` Geo
                                                                              LEFT JOIN `Target_Case_Study.customers` C ON C.customer_zip_code_prefix = Geo.geolocation_zip_code_prefix
                                                                              where customer_zip_code_prefix is not null))
)