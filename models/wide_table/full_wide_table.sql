select
    date,
    day,
    day_name,
    month,
    month_name,
    quarter,
    year,
    iso_week,
    iso_year_of_week,
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
    total_regencies,
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
    total_recovered_per_million,
    total_recovered,
    total_active_cases_per_million,
    total_active_cases,
    case_recovered_rate,
    case_fatality_rate
from
{{ ref('date') }} dt,
{{ ref('location') }} loc,
{{ ref('covid_stats') }} stats
where
dt.date_sk = stats.date_sk and
loc.location_sk = stats.location_sk