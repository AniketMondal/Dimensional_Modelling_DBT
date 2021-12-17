with facts as
        (select
        date_id,
        location_sk,
        new_cases_per_million,
        new_cases,
        growth_factor_of_new_cases,
        new_deaths_per_million,
        new_deaths,
        growth_factor_of_new_deaths,
        new_recovered,
        new_active_cases,
        total_cases_per_million,
        total_cases,
        total_deaths_per_million,
        total_deaths,
        total_recovered,
        total_active_cases,
        case_recovered_rate,
        case_fatality_rate
        from
        {{ source('raw_tbl', 'COVID_19_INDONESIA_ANIKET_MONDAL') }} src,
        {{ ref('location') }} loc,
        {{ ref('date') }} dt
        where
        cast(src.date as date) = dt.date and
        (loc.location = src.location and
        loc.latitude = src.latitude and
        loc.longitude = src.longitude and
        loc.location_iso_code = src.location_iso_code))

select * from facts
order by date_id