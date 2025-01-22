/* le fichier stg_xxx.sql sert à transformer les données depuis la table "raw" */

with source as (
    select * from {{ source('my_dbt_db', 'raw_customers') }}
),
renamed as (
    select
        id as customer_id, /* Changement du nom de la colonne pour la vue (clé primaire) */
        name as customer_name /* Changement de nom pour la colonne */
    from source
)
select * from renamed