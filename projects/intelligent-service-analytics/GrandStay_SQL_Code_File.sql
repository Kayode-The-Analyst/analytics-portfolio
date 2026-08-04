SELECT * FROM agent_performance_logs;

--DROP VIEW vw_support_analytics

CREATE OR ALTER VIEW vw_support_analytics AS
SELECT
    apl.ticket_id,
    apl.agent_id,
    apl.agent_team,
    apl.region,
    apl.channel,
    apl.inquiry_category,
    apl.is_repetitive,
    apl.is_peak_hour AS ticket_peak_hour,
    apl.sla_breached,
    apl.total_handle_time_min,
    apl.csat_score,
    apl.date,
    apl.language,
    apl.hour_of_day,
    apl.month,

    kel.needed_knowledge_base_search,
    kel.kb_search_time_min,
    kel.was_escalated,
    kel.escalation_reason,
    kel.escalation_time_min,
    kel.response_variance_score,
    kel.time_saved_if_automated_min,

    ivp.inquiry_volume AS hourly_inquiry_volume,
    ivp.abandoned_inquiries,
    ivp.abandonment_rate,
    ivp.day_of_week,
    ivp.growth_factor,
    ivp.is_peak_hour AS volume_peak_hour,

    
    cem.total_cost_usd,
    cem.cost_per_contact_usd,
    cem.total_inquiries AS monthly_total_inquiries,
    cem.overtime_hours,
    cem.training_hours,
    cem.missed_upsell_opportunities,
    cem.missed_revenue_usd,
    cem.avg_handle_time_min AS monthly_avg_handle_time_min,
    cem.avg_response_time_min AS monthly_avg_response_time_min,
    cem.repetitive_inquiry_percentage,
    cem.agent_utilization_rate,
    cem.agent_turnover_rate
FROM agent_performance_logs apl
LEFT JOIN knowledge_escalation_logs kel
    ON CAST(apl.ticket_id AS VARCHAR(100)) = CAST(kel.ticket_id AS VARCHAR(100))
LEFT JOIN inquiry_volume_patterns ivp
    ON apl.date = ivp.date
    AND apl.hour_of_day = ivp.hour
    AND apl.region = ivp.region
    AND apl.channel = ivp.channel
LEFT JOIN cost_efficiency_metrics cem
    ON apl.month = cem.month;


    SELECT * FROM vw_support_analytics


    -- Escalation Rate by Inquiry Category  (Identifies categories needing better knowledge base coverage) ***

CREATE VIEW Escalation_Rate_by_Inquiry_Cat AS
    SELECT
    inquiry_category,
    COUNT(*) AS total_tickets,
    SUM(CASE WHEN was_escalated = 1 THEN 1 ELSE 0 END) AS escalations,
    CAST(SUM(CASE WHEN was_escalated = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS escalation_rate_pct
FROM vw_support_analytics
GROUP BY inquiry_category


 
-- Knowledge Base Impact on Resolution Time  (Measures efficiency of KB usage) ***

CREATE VIEW Knowledge_Base_Impact_on_Resolution_Time AS
SELECT
    needed_knowledge_base_search,
    AVG(total_handle_time_min) AS avg_handle_time,
    AVG(kb_search_time_min) AS avg_kb_search_time
FROM vw_support_analytics
GROUP BY needed_knowledge_base_search;

--Peak Hour vs SLA Breaches  (Determines staffing gaps during peak periods)   ***

CREATE VIEW Peak_Hour_vs_SLA_Breaches AS
SELECT
    ticket_peak_hour,
    COUNT(*) AS total_tickets,
    SUM(CASE WHEN sla_breached = 1 THEN 1 ELSE 0 END) AS sla_breaches,
    CAST(SUM(CASE WHEN sla_breached = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS breach_rate_pct
FROM vw_support_analytics
GROUP BY ticket_peak_hour;

-- Agent Performance vs CSAT  (Identifies top-performing agents and coaching opportunities)  ***

CREATE VIEW Agent_Performance_vs_CSAT AS
SELECT
    agent_id,
    COUNT(ticket_id) AS tickets_handled,
    AVG(total_handle_time_min) AS avg_handle_time,
    AVG(csat_score) AS avg_csat
FROM vw_support_analytics
GROUP BY agent_id
HAVING COUNT(ticket_id) > 30


-- Cost per Contact vs Escalation Rate (Monthly)   (Shows cost inefficiencies driven by escalations)  ***

CREATE VIEW Cost_per_Contact_vs_Escalation_Rate AS
SELECT
    month,
    AVG(cost_per_contact_usd) AS avg_cost_per_contact,
    CAST(SUM(CASE WHEN was_escalated = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS escalation_rate_pct
FROM vw_support_analytics
GROUP BY month


--Repetitive Inquiries Impact on Cost & Time  (Quantifies ROI potential for automation/self-service) ***

CREATE VIEW Repetitive_Inquiries_Impact_on_Cost_and_Time AS
SELECT
    is_repetitive,
    COUNT(*) AS total_tickets,
    AVG(total_handle_time_min) AS avg_handle_time,
    AVG(cost_per_contact_usd) AS avg_cost
FROM vw_support_analytics
GROUP BY is_repetitive;


-- Abandonment Rate vs Inquiry Volume  (Confirms overload thresholds that increase abandonment)
DROP VIEW Rate_Inquiry_Volume
CREATE VIEW Rate_Inquiry_Volume AS
SELECT
    inquiry_volume,
    abandonment_rate
FROM inquiry_volume_patterns


-- Escalation Drivers Analysis    (Root causes behind escalations)  ***

CREATE VIEW Escalation_Drivers_Analysis AS
SELECT
    escalation_reason,
    COUNT(*) AS escalation_count,
    AVG(escalation_time_min) AS avg_escalation_time
FROM knowledge_escalation_logs
WHERE was_escalated = 1
GROUP BY escalation_reason



-- Strategic Insights Derived fro the above

-- Identify high-cost inquiry categories
-- Justify knowledge base improvements
-- Optimize agent staffing during peak hours
-- Detect automation candidates
-- Link operational inefficiencies to financial impact



-- Knowledge Base Effectiveness & Automation ROI  ***

CREATE VIEW Base_Effectiveness_and_Automation_ROI AS
SELECT
    kb_article_id,
    kb_article_version,
    COUNT(*) AS escalations,
    AVG(escalation_time_min) AS avg_escalation_time
FROM knowledge_escalation_logs
WHERE was_escalated = 1
GROUP BY kb_article_id, kb_article_version


-- Inconsistent Responses → CSAT Impact

DROP VIEW Inconsistent_Responses_and_CSAT_Impact
CREATE VIEW Inconsistent_Responses_and_CSAT_Impact AS
SELECT
    response_inconsistency_flag,
    AVG(csAT_score) AS avg_csat,
    AVG(response_variance_score) AS variance
FROM knowledge_escalation_logs kel
JOIN agent_performance_logs apl
    ON kel.ticket_id = apl.ticket_id
GROUP BY response_inconsistency_flag;


-- Agent Turnover vs CSAT & Handle Time

CREATE VIEW Agent_Turnover_vs_CSAT_and_Handletime AS
SELECT
    cem.agent_turnover_rate,
    AVG(apl.csat_score) AS avg_csat,
    AVG(apl.total_handle_time_min) AS avg_handle_time
FROM agent_performance_logs apl
JOIN cost_efficiency_metrics cem
    ON apl.month = cem.month
GROUP BY cem.agent_turnover_rate;

--Training Hours Impact on Escalations

DROP VIEW Training_Hour_Impact_on_Escalation 
CREATE VIEW Training_Hour_Impact_on_Escalation AS
SELECT
    cem.training_hours,
    CAST(SUM(CASE WHEN kel.was_escalated = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS escalation_rate_pct
FROM agent_performance_logs apl
JOIN knowledge_escalation_logs kel
    ON apl.ticket_id = kel.ticket_id
JOIN cost_efficiency_metrics cem
    ON apl.month = cem.month
GROUP BY cem.training_hours



--Demand Forecasting & Capacity Planning  ***

CREATE VIEW Demand_Forecasting_and_Capacity_Planning AS
SELECT
    date,
    inquiry_volume,
    growth_factor,
    abandonment_rate
FROM inquiry_volume_patterns


-- Channel-Specific Overload Risk

DROP VIEW  Channel_Specific_Overload_Risk
CREATE VIEW Channel_Specific_Overload_Risk AS
SELECT
    channel,
    AVG(inquiry_volume) AS avg_volume,
    AVG(abandonment_rate) AS avg_abandonment
FROM inquiry_volume_patterns
GROUP BY channel


--Regional SLA Risk During Peaks  ***
 
CREATE VIEW Regional_SLA_Risk_During_Peaks AS
SELECT
    region,
    COUNT(*) AS peak_tickets,
    SUM(CASE WHEN sla_breached = 1 THEN 1 ELSE 0 END) AS breaches
FROM agent_performance_logs
WHERE is_peak_hour = 1
GROUP BY region


-- Missed Upsell Opportunities by Inquiry Type  (Financial Leakage or Loss)

DROP VIEW Missed_Upsell_Opportunities_by_Inquiry_Type
CREATE VIEW Missed_Upsell_Opportunities_by_Inquiry_Type AS
SELECT
    inquiry_category,
    SUM(missed_upsell_opportunities) AS missed_upsells,
    SUM(missed_revenue_usd) AS lost_revenue
FROM cost_efficiency_metrics cem
JOIN agent_performance_logs apl
    ON cem.month = apl.month
GROUP BY inquiry_category


-- Cost vs Utilization Sweet Spot

DROP VIEW Cost_vs_Utilization_Sweet_Spot
CREATE VIEW Cost_vs_Utilization_Sweet_Spot AS
SELECT
    agent_utilization_rate,
    AVG(cost_per_contact_usd) AS avg_cost,
    AVG(csAT_score) AS avg_csat
FROM vw_support_analytics
GROUP BY agent_utilization_rate



-- First Response Time vs CSAT (Customer Experience (CX) Drivers)  ***

CREATE VIEW First_Response_Time_vs_CSAT AS
SELECT
    CASE
        WHEN time_to_first_response_min <= 5 THEN '0-5 min'
        WHEN time_to_first_response_min <= 15 THEN '6-15 min'
        ELSE '15+ min'
    END AS response_bucket,
    AVG(csat_score) AS avg_csat
FROM agent_performance_logs
GROUP BY
    CASE
        WHEN time_to_first_response_min <= 5 THEN '0-5 min'
        WHEN time_to_first_response_min <= 15 THEN '6-15 min'
        ELSE '15+ min'
    END;

    SELECT * FROM First_Response_Time_vs_CSAT

-- Transfer Count Impact on Satisfaction
DROP VIEW Transfer_Count_Impact_on_Satisfaction
CREATE VIEW Transfer_Count_Impact_on_Satisfaction AS
SELECT
    transfers_count,
    AVG(csat_score) AS avg_csat
FROM agent_performance_logs
GROUP BY transfers_count




-- Automation Readiness Score ***


CREATE VIEW vw_automation_readiness AS
SELECT
    inquiry_category,
    AVG(is_repetitive * 1.0) AS repetitive_ratio,
    AVG(time_saved_if_automated_min) AS avg_time_saved,
    AVG(cost_per_contact_usd) AS avg_cost
FROM vw_support_analytics
GROUP BY inquiry_category


-- Key takeaways (advice) 

-- Reduce escalations by fixing specific KB articles

-- Prioritize automation with quantified ROI

-- Prevent agent burnout before turnover spikes

-- Recover missed revenue

-- Forecast staffing needs accurately













