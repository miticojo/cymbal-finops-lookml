view: dp_finance_customer_360_golden {
  sql_table_name: `giorgioc-looker.cymbal_finops_focus.dp_finance_customer_360_golden` ;;
  label: "Data Product UDM Finance — Customer 360 & Golden Rule"

  dimension: customer_id {
    primary_key: yes
    type: string
    label: "ID Cliente UDM"
    description: "Primary Key univoca del cliente nel Golden Layer UDM"
    sql: ${TABLE}.customer_id ;;
  }

  dimension: msisdn {
    type: string
    label: "MSISDN"
    sql: ${TABLE}.msisdn ;;
  }

  dimension: business_segment {
    type: string
    label: "Segmento di Business UDM (B2C / B2B)"
    description: "Fastweb Core B2C, Vodafone Next B2C, Fastweb+Vodafone Enterprise B2B, ho.Mobile Digital"
    sql: ${TABLE}.business_segment ;;
  }

  dimension: sales_channel {
    type: string
    label: "Canale di Vendita (Ultimo Miglio BU)"
    sql: ${TABLE}.sales_channel ;;
  }

  dimension: donor_operator {
    type: string
    label: "Operatore Donor MNP"
    sql: ${TABLE}.donor_operator ;;
  }

  dimension: portability_status {
    type: string
    label: "Stato Portabilità MNP"
    sql: ${TABLE}.portability_status ;;
  }

  dimension: has_activation_drop {
    type: number
    label: "Flag Drop-Off Attivazione (0/1)"
    sql: ${TABLE}.has_activation_drop ;;
  }

  measure: customer_count {
    type: count
    label: "Totale Clienti UDM"
  }

  measure: total_observed_revenue_eur {
    type: sum
    label: "Ricavo Actual Certificato Finance (€) [Golden Rule]"
    description: "Somma del ricavo effettivo certificato da Finance (canone + CDR traffico)"
    sql: ${TABLE}.observed_revenue_eur ;;
    value_format_name: eur
  }

  measure: total_budget_arpu_eur {
    type: sum
    label: "Target Ricavi a Budget/Piano (€)"
    sql: ${TABLE}.budget_arpu_eur ;;
    value_format_name: eur
  }

  measure: total_variance_vs_budget_eur {
    type: sum
    label: "Scostamento Actual vs Budget (€)"
    sql: ${TABLE}.variance_vs_budget_eur ;;
    value_format_name: eur
  }

  measure: total_certified_ebitda_eur {
    type: sum
    label: "Margine EBITDA Certificato Finance (€)"
    sql: ${TABLE}.certified_ebitda_contribution_eur ;;
    value_format_name: eur
  }

  measure: avg_arpu_actual_eur {
    type: average
    label: "ARPU Medio Certificato (€/cliente)"
    sql: ${TABLE}.observed_revenue_eur ;;
    value_format_name: eur
  }

  measure: avg_network_latency_ms {
    type: average
    label: "Latenza Media Radio Databricks (ms)"
    description: "Metrica QoS federata da Databricks Unity Catalog (dbx_catalog.cell_network_qos)"
    sql: ${TABLE}.avg_network_latency_ms ;;
    value_format: "0.0"
  }

  measure: total_data_volume_gb {
    type: sum
    label: "Volume Traffico Dati CDR (GB)"
    sql: ${TABLE}.data_volume_gb ;;
    value_format: "0.0"
  }
}
