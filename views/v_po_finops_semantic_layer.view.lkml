view: v_po_finops_semantic_layer {
  sql_table_name: `giorgioc-looker.cymbal_finops_focus.v_po_finops_semantic_layer` ;;
  label: "Riconciliazione FinOps 3-Livelli (CdC/WBS ↔ PO SAP/Fattura ↔ Project ID)"

  dimension: po_code {
    primary_key: yes
    type: string
    label: "CdC & WBS Demand (ID Combinato)"
    description: "Identificativo combinato Centro di Costo (Controlling) e WBS Demand IT (es. CDC-200 (WBS-DEM-DATA-200))"
    sql: ${TABLE}.po_code ;;
  }

  dimension: cdc_code {
    type: string
    label: "Centro di Costo (CdC)"
    description: "Codice Centro di Costo Controlling / Budget Owner (CDC-100, CDC-200, CDC-300)"
    sql: ${TABLE}.cdc_code ;;
  }

  dimension: wbs_demand_code {
    type: string
    label: "Codice WBS Demand (VBC)"
    description: "Work Breakdown Structure (WBS / VBC) del progetto IT Demand (WBS-DEM-AI-100, WBS-DEM-DATA-200, WBS-DEM-CORE-300)"
    sql: ${TABLE}.wbs_demand_code ;;
  }

  dimension: business_unit_name {
    type: string
    label: "Business Unit / Area IT Demand"
    description: "Direzione di Business / IT Demand proprietaria del budget"
    sql: ${TABLE}.business_unit_name ;;
  }

  dimension: po_name {
    type: string
    label: "BU + Purchase Order SAP + Fattura"
    description: "Riepilogo Business Unit, Ordine d'Acquisto SAP e Fattura Passiva"
    sql: ${TABLE}.po_name ;;
  }

  dimension: sap_purchase_order_id {
    type: string
    label: "Purchase Order SAP (Ufficio Acquisti)"
    description: "Numero Ordine d'Acquisto SAP emesso dal Procurement (PO-SAP-45009101, PO-SAP-45009205, PO-SAP-45009312)"
    sql: ${TABLE}.sap_purchase_order_id ;;
  }

  dimension: invoice_id {
    type: string
    label: "Numero Fattura Passiva (Invoice ID)"
    description: "Fattura passiva mensile del fornitore Cloud riconciliata sul PO SAP (INV-2026-09-FSP-9101, INV-2026-09-DATA-9205, INV-2026-09-CORE-9312)"
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: contract_commitment_type {
    type: string
    label: "Contratto & Commitment Cloud"
    description: "Tipologia di contratto quadro o commitment (Google FSP, Enterprise Agreement, Reserved Instance / CUD)"
    sql: ${TABLE}.contract_commitment_type ;;
  }

  dimension: po_burnout_date_as_is {
    type: string
    label: "Burn-Out Date Plafond PO (As-Is)"
    description: "Data di esaurimento anticipato del plafond sul Purchase Order SAP senza azioni FinOps (es. 2026-11-14)"
    sql: ${TABLE}.po_burnout_date_as_is ;;
  }

  dimension: po_burnout_date_remediated {
    type: string
    label: "Burn-Out Date Plafond PO (Post-Remediation)"
    description: "Data di copertura del plafond PO SAP dopo le azioni di remediation (2026-12-31)"
    sql: ${TABLE}.po_burnout_date_remediated ;;
  }

  dimension: technical_project_account_id {
    type: string
    label: "Project ID / Account / Subscription Cloud"
    description: "Risorse tecniche Cloud (GCP Project ID, AWS Account, Azure Subscription, OCI Tenancy) ribaltate sulla WBS e sul PO SAP"
    sql: ${TABLE}.technical_project_account_id ;;
  }

  dimension: remediation_plan {
    type: string
    label: "Piano di Remediation (Best Practices MCP)"
    description: "Azioni tecniche validate su Google Developer Knowledge MCP per eliminare gli sprechi"
    sql: ${TABLE}.remediation_plan ;;
  }

  measure: total_po_plafond_annual_eur {
    type: sum
    label: "Plafond Annuo PO SAP (€)"
    description: "Capienza contrattuale annua stanziata sul Purchase Order SAP"
    sql: ${TABLE}.po_plafond_annual_eur ;;
    value_format_name: eur_0
  }

  measure: total_budget_monthly_eur {
    type: sum
    label: "Budget Mensile CdC/WBS (€)"
    sql: ${TABLE}.budget_monthly_eur ;;
    value_format_name: eur_0
  }

  measure: total_actual_mtd_eur {
    type: sum
    label: "Spesa Effettiva MTD (€)"
    sql: ${TABLE}.actual_mtd_eur ;;
    value_format_name: eur_0
  }

  measure: total_projected_eom_eur {
    type: sum
    label: "Proiezione Fine Mese As-Is (€)"
    sql: ${TABLE}.projected_eom_eur ;;
    value_format_name: eur_0
  }

  measure: total_identifiable_waste_eur {
    type: sum
    label: "Saving da Best Practices / Spreco (€)"
    sql: ${TABLE}.identifiable_waste_eur ;;
    value_format_name: eur_0
  }

  measure: total_post_remediation_eom_eur {
    type: sum
    label: "Proiezione Fine Mese Post-Remediation (€)"
    sql: ${TABLE}.post_remediation_eom_eur ;;
    value_format_name: eur_0
  }

  measure: avg_eom_overrun_pct {
    type: average
    label: "Sforamento EOM vs Budget (%)"
    sql: ${TABLE}.eom_overrun_pct ;;
    value_format: "0.0\%"
  }
}
