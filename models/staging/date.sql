with dates as
        (select distinct(cast(date as date)) as date from {{ source('raw_tbl', 'COVID_19_INDONESIA_ANIKET_MONDAL') }}),
     final as
        (select concat(year(date),lpad(cast(month(date) as varchar),2,'0'),lpad(cast(day(date) as varchar),2,'0'))::int as date_sk,
        date,
        day(date) as day,
        dayname(date) as day_name,
        month(date) as month,
        monthname(date) as month_name,
        year(date) as year,
        weekiso(date) as iso_week,
        yearofweekiso(date) as iso_year_of_week,
        quarter(date) as quarter_of_year
        from dates order by date)

select * from final