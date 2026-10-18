-- Query 1: Top five assignments based on total value of donations by donor type
SELECT 
    a.assignment_name,
    a.region,
    ROUND(SUM(d.donation_amount)::numeric, 2) AS rounded_total_donation_amount,
    don.donor_type
FROM public.assignments AS a
JOIN public.donations AS d ON a.assignment_id = d.assignment_id
JOIN public.donors AS don ON d.donor_id = don.donor_id
GROUP BY a.assignment_name, a.region, don.donor_type
ORDER BY rounded_total_donation_amount DESC
LIMIT 5;

-- Query 2: Assignment with the highest impact score in each region
WITH ranking AS (
    SELECT 
        a.assignment_name, 
        a.region, 
        a.impact_score, 
        COUNT(d.donation_id) AS num_total_donations, 
        ROW_NUMBER() OVER (PARTITION BY a.region ORDER BY a.impact_score DESC) AS rn 
    FROM public.assignments AS a 
    INNER JOIN public.donations AS d ON a.assignment_id = d.assignment_id 
    GROUP BY a.assignment_name, a.region, a.impact_score 
    HAVING COUNT(d.donation_id) >= 1
) 
SELECT 
    assignment_name, 
    region, 
    impact_score, 
    num_total_donations 
FROM ranking 
WHERE rn = 1 
ORDER BY region;
