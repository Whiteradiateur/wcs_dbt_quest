with source as (
    select * from {{ source('my_dbt_db', 'raw_orders') }}
),
renamed as (
    select
        id as orders_id, /* Changement du nom de la colonne pour la vue */
        customer as customer_id, /* Changement du nom de la colonne pour la vue (clé primaire) */
        ordered_at as orders_ordered_at, /* Changement du nom de la colonne pour la vue */
        store_id as orders_store_id /* Changement du nom de la colonne pour la vue */
    from source
)
select * from renamed