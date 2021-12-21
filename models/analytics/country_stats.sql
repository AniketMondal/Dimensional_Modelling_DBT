select * from {{ ref('full_wide_table') }}
where location_level = 'Country'