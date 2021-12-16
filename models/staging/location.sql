with loc as
        (select distinct
        location,
        location_iso_code,
        longitude,
        latitude,
        location_level,
        province,
        country,
        island,
        special_status,
        continent,
        time_zone,
        population,
        population_density,
        area_km_2_,
        total_rural_villages,
        total_urban_villages,
        total_districts,
        total_cities,
        total_regencies
        from {{ source('raw_tbl', 'COVID_19_INDONESIA_ANIKET_MONDAL') }}),
    
     final as
        (select row_number() over(order by population desc,location) as location_sk,
        loc.*
        from loc)

select * from final             