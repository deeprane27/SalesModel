CLASS zcl_load_global_sales DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PRIVATE SECTION.
    METHODS load_master.
    METHODS load_sales.
ENDCLASS.

CLASS zcl_load_global_sales IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        me->load_master( ).
        me->load_sales( ).
        out->write( |Global Sales demo data loaded successfully.| ).
      CATCH cx_root INTO DATA(lx).
        out->write( |Error: { lx->get_text( ) }| ).
    ENDTRY.
  ENDMETHOD.

  METHOD load_master.
    DATA lt_curr TYPE STANDARD TABLE OF zrd_currency.
    lt_curr = VALUE #(
      ( client = sy-mandt currency_code = 'USD' currency_name = 'US Dollar' )
      ( client = sy-mandt currency_code = 'EUR' currency_name = 'Euro' )
      ( client = sy-mandt currency_code = 'INR' currency_name = 'Indian Rupee' )
      ( client = sy-mandt currency_code = 'GBP' currency_name = 'Pound Sterling' )
      ( client = sy-mandt currency_code = 'JPY' currency_name = 'Japanese Yen' )
      ( client = sy-mandt currency_code = 'AUD' currency_name = 'Australian Dollar' )
      ( client = sy-mandt currency_code = 'BRL' currency_name = 'Brazilian Real' )
      ( client = sy-mandt currency_code = 'ZAR' currency_name = 'South African Rand' )
      ( client = sy-mandt currency_code = 'SGD' currency_name = 'Singapore Dollar' ) ).
    DELETE FROM zrd_currency.
    INSERT zrd_currency FROM TABLE @lt_curr.

    DATA lt_country TYPE STANDARD TABLE OF zrd_country.
    lt_country = VALUE #(
      ( client = sy-mandt country_code = 'USA' country_name = 'United States' region = 'NA' )
      ( client = sy-mandt country_code = 'DEU' country_name = 'Germany'       region = 'EU' )
      ( client = sy-mandt country_code = 'IND' country_name = 'India'         region = 'APAC' )
      ( client = sy-mandt country_code = 'GBR' country_name = 'United Kingdom' region = 'EU' )
      ( client = sy-mandt country_code = 'JPN' country_name = 'Japan'         region = 'APAC' )
      ( client = sy-mandt country_code = 'AUS' country_name = 'Australia'     region = 'APAC' )
      ( client = sy-mandt country_code = 'BRA' country_name = 'Brazil'        region = 'LATAM' )
      ( client = sy-mandt country_code = 'FRA' country_name = 'France'        region = 'EU' )
      ( client = sy-mandt country_code = 'ZAF' country_name = 'South Africa'  region = 'AF' )
      ( client = sy-mandt country_code = 'SGP' country_name = 'Singapore'     region = 'APAC' ) ).
    DELETE FROM zrd_country.
    INSERT zrd_country FROM TABLE @lt_country.


    DATA lt_prod TYPE STANDARD TABLE OF zrd_product.
    lt_prod = VALUE #(
      ( client = sy-mandt product_id = 'ELC-IPH15' product_name = 'Smartphone iPhone 15' category = 'Electronics' unit_price = '999'  currency_code = 'USD' )
      ( client = sy-mandt product_id = 'ELC-PIX8'  product_name = 'Smartphone Pixel 8'  category = 'Electronics' unit_price = '799'  currency_code = 'USD' )
      ( client = sy-mandt product_id = 'ELC-SONH'  product_name = 'Noise Cancelling Headphones' category = 'Electronics' unit_price = '299'  currency_code = 'USD' )
      ( client = sy-mandt product_id = 'FUR-CHR1'  product_name = 'Ergo Office Chair' category = 'Furniture'   unit_price = '199'  currency_code = 'EUR' )
      ( client = sy-mandt product_id = 'APP-SHOE'  product_name = 'Running Shoes'     category = 'Apparel'     unit_price = '129'  currency_code = 'EUR' )
      ( client = sy-mandt product_id = 'FOO-TEA1'  product_name = 'Organic Tea 250g'  category = 'Food'        unit_price = '8'    currency_code = 'GBP' )
      ( client = sy-mandt product_id = 'FOO-COF1'  product_name = 'Ground Coffee 500g' category = 'Food'       unit_price = '12'   currency_code = 'USD' )
      ( client = sy-mandt product_id = 'ELC-KETL'  product_name = 'Electric Kettle'   category = 'Home'        unit_price = '25'   currency_code = 'GBP' )
      ( client = sy-mandt product_id = 'HOM-LAMP'  product_name = 'LED Table Lamp'    category = 'Home'        unit_price = '18'   currency_code = 'EUR' )
      ( client = sy-mandt product_id = 'APP-JKT1'  product_name = 'Winter Jacket'     category = 'Apparel'     unit_price = '149'  currency_code = 'USD' ) ).
    DELETE FROM zrd_product.
    INSERT zrd_product FROM TABLE @lt_prod.

    DATA lt_cust TYPE STANDARD TABLE OF zrd_customer.
    lt_cust = VALUE #(
      ( client = sy-mandt customer_id  = 'CUST000001' name = 'Acme Retail LLC'      email = 'orders@acme.us'     phone = '+1-415-555-0111' city = 'San Francisco' country_code = 'USA' )
      ( client = sy-mandt customer_id = 'CUST000002' name = 'Berlin Office GmbH'   email = 'info@berlin-office.de' phone = '+49-30-555-1122' city = 'Berlin' country_code = 'DEU' )
      ( client = sy-mandt customer_id = 'CUST000003' name = 'Mumbai Mart Pvt Ltd'  email = 'buy@mumbaimart.in'  phone = '+91-22-4012-3344' city = 'Mumbai' country_code = 'IND' )
      ( client = sy-mandt customer_id = 'CUST000004' name = 'London Supply Co'     email = 'ap@lonsupply.uk'    phone = '+44-20-7946-0033' city = 'London' country_code = 'GBR' )
      ( client = sy-mandt customer_id = 'CUST000005' name = 'Tokyo Stationers KK'  email = 'po@tokyo-sta.jp'    phone = '+81-3-1234-5678' city = 'Tokyo' country_code = 'JPN' )
      ( client = sy-mandt customer_id = 'CUST000006' name = 'Sydney Home Goods'    email = 'sales@sydneyhg.au'  phone = '+61-2-5550-0101' city = 'Sydney' country_code = 'AUS' )
      ( client = sy-mandt customer_id = 'CUST000007' name = 'Sao Paulo Distribuidora' email = 'contato@spd.com.br' phone = '+55-11-4444-2222' city = 'Sao Paulo' country_code = 'BRA' )
      ( client = sy-mandt customer_id = 'CUST000008' name = 'Paris Maison SARL'    email = 'achat@parismaison.fr' phone = '+33-1-4020-1122' city = 'Paris' country_code = 'FRA' )
      ( client = sy-mandt customer_id = 'CUST000009' name = 'CapeTown Traders'     email = 'orders@cttraders.za' phone = '+27-21-555-8899' city = 'Cape Town' country_code = 'ZAF' )
      ( client = sy-mandt customer_id = 'CUST000010' name = 'Singapura Bazaar'     email = 'buy@bazaar.sg'      phone = '+65-6512-3344' city = 'Singapore' country_code = 'SGP' ) ).
    DELETE FROM zrd_customer.
    INSERT zrd_customer FROM TABLE @lt_cust.
  ENDMETHOD.

  METHOD load_sales.
    DATA: ls_head TYPE zrd_salesorder,
          ls_item TYPE zrd_salesitem.

    DELETE FROM zrd_salesitem.
    DELETE FROM zrd_salesorder.

    DATA(lv_today) =  cl_abap_context_info=>get_system_date( ).
    DATA lv_idx TYPE i.

    DO 200 TIMES.
      lv_idx = sy-index.
      CLEAR ls_head.
      ls_head-client       = sy-mandt.
      ls_head-so_id        = |SO{ lv_idx WIDTH = 14 PAD = '0' }|.

      ls_head-customer_id  = SWITCH #( lv_idx MOD 10
          WHEN 0 THEN 'CUST000010'
          WHEN 1 THEN 'CUST000001'
          WHEN 2 THEN 'CUST000002'
          WHEN 3 THEN 'CUST000003'
          WHEN 4 THEN 'CUST000004'
          WHEN 5 THEN 'CUST000005'
          WHEN 6 THEN 'CUST000006'
          WHEN 7 THEN 'CUST000007'
          WHEN 8 THEN 'CUST000008'
          else 'CUST000009' ).

      ls_head-order_date   = lv_today - ( lv_idx MOD 720 ).         " ~ last 2 years
      ls_head-currency_code = SWITCH #( lv_idx MOD 9
                              WHEN 0 THEN 'USD'
                              WHEN 1 THEN 'EUR'
                              WHEN 2 THEN 'INR'
                              WHEN 3 THEN 'GBP'
                              WHEN 4 THEN 'JPY'
                              WHEN 5 THEN 'AUD'
                              WHEN 6 THEN 'BRL'
                              WHEN 7 THEN 'ZAR'
                              else  'SGD' ).


      ls_head-total_amount = 0.
      INSERT zrd_salesorder FROM @ls_head.

      DATA(lv_items) = 1 + ( lv_idx MOD 4 ).
      DO lv_items TIMES.
        CLEAR ls_item.
        ls_item-client     = sy-mandt.
        ls_item-so_id      = ls_head-so_id.
        ls_item-item_no    = sy-index.
        DATA(lv_prodix) = ( lv_idx + sy-index ) MOD 10 + 1.
        DATA lv_prod TYPE zrd_product.
        " pick product by index
        CASE lv_prodix.
          WHEN 1. lv_prod = VALUE #( client = sy-mandt product_id = 'ELC-IPH15' product_name = '' category = '' unit_price = '999' currency_code = 'USD' ).
          WHEN 2. lv_prod = VALUE #( client = sy-mandt product_id = 'ELC-PIX8'  product_name = '' category = '' unit_price = '799' currency_code = 'USD' ).
          WHEN 3. lv_prod = VALUE #( client = sy-mandt product_id = 'ELC-SONH'  product_name = '' category = '' unit_price = '299' currency_code = 'USD' ).
          WHEN 4. lv_prod = VALUE #( client = sy-mandt product_id = 'FUR-CHR1'  product_name = '' category = '' unit_price = '199' currency_code = 'EUR' ).
          WHEN 5. lv_prod = VALUE #( client = sy-mandt product_id = 'APP-SHOE'  product_name = '' category = '' unit_price = '129' currency_code = 'EUR' ).
          WHEN 6. lv_prod = VALUE #( client = sy-mandt product_id = 'FOO-TEA1'  product_name = '' category = '' unit_price = '8'   currency_code = 'GBP' ).
          WHEN 7. lv_prod = VALUE #( client = sy-mandt product_id = 'FOO-COF1'  product_name = '' category = '' unit_price = '12'  currency_code = 'USD' ).
          WHEN 8. lv_prod = VALUE #( client = sy-mandt product_id = 'ELC-KETL'  product_name = '' category = '' unit_price = '25'  currency_code = 'GBP' ).
          WHEN 9. lv_prod = VALUE #( client = sy-mandt product_id = 'HOM-LAMP'  product_name = '' category = '' unit_price = '18'  currency_code = 'EUR' ).
          WHEN OTHERS. lv_prod = VALUE #( client = sy-mandt product_id = 'APP-JKT1'  product_name = '' category = '' unit_price = '149' currency_code = 'USD' ).
        ENDCASE.
        ls_item-product_id = lv_prod-product_id.
        ls_item-quantity   = 1 + ( ( lv_idx + sy-index ) MOD 5 ).
        ls_item-unit_price = lv_prod-unit_price.
        ls_item-net_amount = ls_item-quantity * ls_item-unit_price.
        INSERT zrd_salesitem FROM @ls_item.
        UPDATE zrd_salesorder SET total_amount = total_amount + @ls_item-net_amount WHERE so_id = @ls_head-so_id.
      ENDDO.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
