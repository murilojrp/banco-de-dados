select 
    products.id,
    products.name
    from products
    inner join categories as ca on (products.id_categories = ca.id)
    where ca.name like 'super%'