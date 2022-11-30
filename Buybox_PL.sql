select max(la.create_date) as date_,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 710 
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' 
        then la.amount end) as Santander,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 660 
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' 
        then la.amount end) as Sunrise,        
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 680 
        and la.amount <= 35000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' 
        then la.amount end) as Patriot,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 660 
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.s_g082  <= 0 or decisioning.s_g082 is null) --accts currently dq
        and decisioning.s207a not in (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12) --mos since bk
        and (decisioning.s_at13 >= 3 or decisioning.s_at13 <0 or decisioning.s_at13 is null) --open accts(18mos)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' 
        then la.amount end) as Presidential,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 20000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'NEW_JERSEY' 
        then la.amount end) as Monroe,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 660 
        and la.amount <= 50000 
        and l.apr <= .36
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.s_g082  <= 0 or decisioning.s_g082 is null) --accts currently dq
        and (decisioning.s207a < 0 or decisioning.s207a >= 36 or decisioning.s207a is null) --mos since bk
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' 
        then la.amount end) as intrust,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 680 
        and la.amount <= 30000 
        and l.apr <= .36
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.s_g082  <= 0 or decisioning.s_g082 is null) --accts currently dq
        and (decisioning.s207a < 0 or decisioning.s207a >= 36 or decisioning.s207a is null) --mos since bk        
        and br.state <> 'MAINE' then la.amount end) as hometrust,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 700 
        and la.amount <= 50000 
        and l.apr <= .2
        and primary_details.pre_loan_dti_stated <= .43 
        and locc.post_loan_dti_stated <= .43
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as fnb_danville,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 700 
        and la.amount <= 50000 
        and l.apr <= .36
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'UTAH' then la.amount end) as Cache_valley,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 720
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
       -- and l.term in (24, 36, 48, 60, 66, 72, 84)
       -- and l.apr<=.36
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and ((l.segment in ('PRIME_PLUS','PRIME') and l.term in (66,72,84) and l.apr<=.36) or (l.segment in ('PRIME_PLUS','PRIME') and l.term in (26,36,48,60) and l.apr<=.18))
        and br.state <> 'MAINE' then la.amount end) as broadway,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680 
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
       -- and l.term in (24, 36, 48, 60, 66, 72, 84)
       -- and l.apr<=.36
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and ((l.segment in ('PRIME_PLUS','PRIME') and l.term in (66,72,84) and l.apr <= .36) or (l.segment in ('PRIME','PRIME_PLUS') and l.term in (24, 36, 48, 60) and l.apr<=18)) 
        and br.state <> 'MAINE' then la.amount end) as Amerant,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 680 
        and la.amount <= 50000 
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'TEXAS' then la.amount end) as Neighborhood_CU,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and lap.final_grade <= 20
        and l.apr <=.36
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED') 
        and l.term in (36, 48, 60, 66, 72, 84)
        and br.state <>'MAINE'
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        then la.amount end) as banco_popular,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <=.18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as First_western,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680 
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and l.apr <= .36
        and br.state <> 'MAINE' then la.amount end) as Bay_first,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.apr <= .36
        and l.decisioning_primary_fico_score >= 660 
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as First_neighbor,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680 
        and l.apr <=.18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and locc.post_loan_dti_stated <= .65 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as Seattle,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and la.amount <= 20000 
        and l.apr <=.36
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as MC_Bank,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and la.amount <= 30000 
        and l.apr<=.36
        and locc.post_loan_dti_stated <= .40 
        and l.term in (24, 36, 48, 60)
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state in ('LOUISIANA','ILLINOIS','MISSOURI','MICHIGAN','ALABAMA','KENTUCKY','KANSAS','TEXAS','MISSISSIPPI','TENNESSEE') then la.amount end) as Liberty,
sum(case when 
        lir.purpose in ('CREDIT_CARD','DEBT_CONSOLIDATION','HOME_IMPROVEMENT','LARGE_PURCHASE','OTHER')
        and la.amount <= 35000 
        and l.apr <=.18
        and lap.auto_secured_type = 'UNCOLLATERALIZED' 
        and ((l.segment = 'PRIME' and lap.final_grade <= 12 and l.term in (24,36,48,60) and l.decisioning_primary_fico_score between 660 and 719)
                        or (l.segment = 'PRIME' and lap.final_grade between 6 and 9 and l.term in (24,36,48,60) and l.decisioning_primary_fico_score>=720)
                        or (l.segment = 'PRIME_PLUS' and l.term in (24,36,48,60) and l.decisioning_primary_fico_score >= 660))
        and br.state not in ('IOWA', 'WEST_VIRGINIA', 'MAINE') then la.amount end) as PenFed,
sum(case when 
        l.decisioning_primary_fico_score >= 640 
        and l.apr <= .18
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.segment in ('PRIME','PRIME_PLUS')
        and primary_details.pre_loan_dti_stated <= .40 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as Carter,
sum(case when 
        l.decisioning_primary_fico_score >= 640 
        and la.amount <= 40000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and l.apr<=.18
        and l.segment in ('PRIME','PRIME_PLUS')
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'OHIO' then la.amount end) as Pathways,
sum(case when 
        l.decisioning_primary_fico_score >= 660 
        and l.apr <=.18
        and l.interest_rate <=.18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .30 
        and locc.post_loan_dti_stated <= .45
        and (decisioning.s_g082  <= 5 or decisioning.s_g082 is null)
        and (decisioning.g238s<= 6 or decisioning.g238s is null)
        and (decisioning.co02s<=3 or decisioning.co02s is null)
        and lap.auto_secured_type in ('UNCOLLATERALIZED') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and til.borrower_zip_code in (45241, 45246, 45003, 45014, 45327, 45011, 45013, 45015, 45042, 45044, 45050, 45053, 45056, 45062, 45064, 45067, 45069, 43002, 43004, 43109, 43110, 43085, 43201, 43202, 43203, 43204, 43205, 43206, 43207, 43209, 43210, 43211, 43212, 43213, 43214, 43215, 43217, 43219, 43220, 43221, 43222, 43223, 43224, 43227, 43228, 43229, 43230, 43231, 43232, 43235, 43016, 43017, 43119, 43123, 43125, 43126, 43026, 43137, 43140, 43054, 43146, 43147, 43064, 43065, 43068, 43081, 43302, 43307, 43301, 43306, 45304, 45309, 45311, 45003, 45320, 45321, 45327, 45330, 45338, 45042, 45347, 45064, 45378, 45381, 45070, 45382, 43009, 45312, 45389, 45317, 43318, 43044, 43045, 45344, 43060, 43343, 43070, 43072, 45365, 45502, 43078, 43357, 43084, 45301, 45305, 45307, 45314, 45316, 45424, 45430, 45431, 45432, 45433, 45434, 45440, 45458, 45459, 45324, 45335, 45169, 45368, 43153, 45370, 45068, 45384, 45385, 45387, 45304, 45308, 45312, 45317, 45318, 45424, 45322, 45326, 45337, 45339, 45344, 45356, 45359, 45361, 45371, 45373, 45383, 44805, 44813, 44822, 44827, 43019, 44833, 44837, 44843, 44902, 44903, 44904, 44905, 44906, 44907, 44901, 44864, 44865, 44875, 44878, 43010, 45314, 45316, 45319, 45323, 45324, 43140, 43044, 45341, 45344, 45349, 45368, 43153, 45369, 45502, 45503, 45504, 45505, 45506, 45372, 43078, 45387, 45001, 45111, 45202, 45203, 45204, 45205, 45206, 45207, 45208, 45209, 45211, 45212, 45213, 45214, 45215, 45216, 45217, 45218, 45219, 45220, 45223, 45224, 45225, 45226, 45227, 45229, 45230, 45231, 45232, 45233, 45236, 45237, 45238, 45239, 45240, 45241, 45242, 45243, 45244, 45246, 45247, 45248, 45249, 45251, 45252, 45255, 45002, 45013, 45030, 45033, 45140, 45041, 45147, 45150, 45051, 45052, 45174, 45309, 45315, 45402, 45403, 45404, 45405, 45406, 45409, 45410, 45414, 45415, 45416, 45417, 45418, 45419, 45420, 45424, 45426, 45429, 45431, 45432, 45433, 45439, 45440, 45449, 45458, 45459, 45428, 45322, 45325, 45005, 45327, 45342, 45344, 45345, 45354, 45066, 45371, 45377, 45381, 43015, 43016, 43017, 43319, 43029, 43036, 43302, 43040, 43045, 43340, 43060, 43061, 43064, 43342, 43067, 43344, 43077, 43358, 43084, 43015, 43035, 43001, 43721, 43008, 43011, 43013, 43822, 43739, 43023, 43740, 43056, 43025, 43746, 43030, 43031, 43033, 43046, 43760, 43830, 43055, 43062, 43147, 43068, 43071, 43074, 43076, 43080, 43003, 44813, 43314, 43315, 43011, 43317, 43320, 43019, 43321, 44833, 44903, 44904, 43334, 43338, 43050, 43356, 45107, 45241, 45249, 45113, 45458, 45005, 45122, 45032, 45034, 45036, 45140, 45039, 45040, 45342, 45042, 45044, 45050, 45152, 45054, 45162, 45065, 45066, 45068, 43102, 43105, 43107, 43110, 43112, 43113, 43130, 43136, 43046, 43062, 43147, 43148, 43068, 43150, 43154, 43155, 43076, 43157, 43119, 43026, 43029, 43140, 43044, 43143, 43146, 43064, 43151, 43153, 45369, 43162, 43102, 43103, 43110, 43113, 43115, 43116, 43117, 43125, 45644, 43135, 43137, 43143, 43145, 43146, 43154, 43156, 43164)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        then la.amount end) as Telhio,
sum(case when 
        l.decisioning_primary_fico_score >= 700 
        and l.apr <=.18
        and la.amount <= 20000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED','AUTO','CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and til.borrower_zip_code in (14001, 14004, 14006, 14010, 14025, 14026, 14027, 14030, 14031, 14032, 14033, 14034, 14035, 14038, 14043, 14047, 14051, 14052, 14055, 14057, 14059, 14061, 14068, 14069, 14070, 14072, 14075, 14080, 14085, 14086, 14091, 14102, 14110, 14111, 14112, 14127, 14134, 14139, 14140, 14141, 14150, 14151, 14169, 14170, 14201, 14202, 14203, 14204, 14205, 14206, 14207, 14208, 14209, 14210, 14211, 14212, 14213, 14214, 14215, 14216, 14217, 14218, 14219, 14220, 14221, 14222, 14223, 14224, 14225, 14226, 14227, 14228, 14231, 14233, 14240, 14241, 14260, 14261, 14263, 14264, 14265, 14267, 14269, 14270, 14272, 14273, 14276, 14280)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        then la.amount end) as great_erie,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680 
        and l.apr<=.18
        and la.amount <= 30000 
        and primary_details.pre_loan_dti_stated <= .35 
        and locc.post_loan_dti_stated <= .35 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as Allegius,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 640 
        and l.apr<=.36
        and la.amount between 2000 and 30000
        and primary_details.pre_loan_dti_stated <= .36
        and locc.post_loan_dti_stated<=.36
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'
        then la.amount end) as southern_independent,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr<=.20
        and la.amount <=50000
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (23083, 23105, 23002, 24574, 24572, 24521, 24595, 24533, 23958, 24522, 23939, 24593, 24476, 24477, 24469, 24463, 24467, 22952, 24486, 24485, 24479, 24482, 24430, 24431, 24432, 22939, 24411, 24421, 24440, 22843, 24437, 24459, 24570, 24551, 24536, 24178, 24104, 24095, 24523, 24556, 24526, 24121, 24122, 24174, 24550, 24538, 24528, 24517, 24554, 24576, 24588, 24571, 22501, 22514, 22535, 22427, 22428, 22446, 22546, 22580, 22552, 22538, 23030, 23147, 23838, 23234, 23235, 23112, 23113, 23114, 23120, 23836, 23297, 23237, 23236, 23831, 23832, 23027, 23040, 23840, 23885, 23841, 23872, 23850, 23830, 23822, 23894, 23833, 24102, 24184, 24092, 24101, 24146, 24137, 24176, 24151, 24065, 24067, 24088, 23851, 23102, 23129, 23065, 23153, 23103, 23160, 23039, 23014, 23063, 23067, 24534, 24577, 24520, 24589, 24592, 24558, 24539, 24598, 24535, 24597, 23146, 23116, 23111, 23162, 23005, 23192, 23047, 23015, 23069, 23288, 23058, 23226, 23075, 23060, 23075, 23150, 23294, 23250, 23255, 23233, 23242, 23238, 23231, 23228, 23227, 23229, 23230, 23059, 23289, 24089, 24078, 24055, 24148, 24165, 24168, 24054, 23177, 23148, 23161, 23156, 23126, 23091, 23085, 23110, 23023, 23108, 23106, 23009, 23181, 23086, 23170, 23117, 23093, 23024, 23141, 23124, 23140, 23011, 23089, 24171, 24053, 24177, 24185, 24082, 24120, 24076, 24133, 24161, 24594, 24565, 24069, 24586, 24569, 24563, 24566, 24531, 24557, 24139, 24549, 24527, 24530, 23139, 23801, 23842, 23875, 24179, 24059, 24070, 24018, 24020, 24019, 24030, 24029, 24032, 24031, 24028, 24025, 24024, 24027, 24026, 24040, 24038, 24043, 24042, 24037, 24034, 24033, 24036, 24035, 24023, 24007, 24006, 24009, 24008, 24005, 24002, 24001, 24004, 24003, 24016, 24015, 24022, 24017, 24014, 24011, 24010, 24013, 24012, 23897, 23884, 23891, 23888, 23890, 23882, 27305, 27379, 27315, 27212, 27291, 27314, 27311, 27048, 27320, 27375, 27027, 27025, 27326, 27288, 27323, 27289, 27042, 27022, 27019, 27046, 27052, 27043, 27021, 27016, 23834, 24540, 24541, 24543, 23860, 24501, 24502, 24503, 24504, 24505, 24506, 24513, 24514, 24515, 24112, 24113, 24114, 24115, 23801, 23803, 23804, 23805, 23806, 23173, 23218, 23219, 23220, 23221, 23222, 23223, 23224, 23225, 23226, 23227, 23228, 23229, 23230, 23231, 23232, 23233, 23234, 23235, 23236, 23237, 23238, 23241, 23242, 23249, 23250, 23255, 23260, 23261, 23269, 23273, 23274, 23276, 23278, 23279, 23282, 23284, 23285, 23286, 23288, 23289, 23290, 23291, 23292, 23293, 23294, 23295, 23297, 23298, 24001, 24002, 24003, 24004, 24005, 24006, 24007, 24008, 24009, 24010, 24011, 24012, 24013, 24014, 24015, 24016, 24017, 24018, 24019, 24020, 24022, 24023, 24024, 24025, 24026, 24027, 24028, 24029, 24030, 24031, 24032, 24033, 24034, 24035, 24036, 24037, 24038, 24040, 24042, 24043, 24050, 24155, 24157, 24153, 24401, 24402, 22980, 27288, 27289, 27932, 28672, 27021, 28086, 28150, 28379, 28380, 28645, 27320, 27323)
        then la.amount end) as valleystar,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr<=.18
        and la.amount <= 50000
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'WASHINGTON' then la.amount end) as white_river,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 700
        and l.apr<=.18
        and la.amount <= 35000
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72)
        and br.state <> 'MAINE'
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        then la.amount end) as usps,
sum(case when 
        l.decisioning_primary_fico_score >= 660 
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and ((lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') and l.segment='PRIME' and l.term in (24,48,66,72,84) and l.apr<=.36)
                or (lap.auto_secured_type in ('AUTO_REFINANCE') and l.segment in ('PRIME','PRIME_PLUS','NEAR_PRIME') and l.term in (24,36,48,60,66,72,84) and l.apr<=.36)
                or  (lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') and l.segment in ('PRIME_PLUS') and l.term in (24,36,48,60,66,72,84) and l.apr<=.36)
                or (lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') and l.segment in ('PRIME') and l.term in (36) and l.apr<=.19)
                or (lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') and l.segment in ('PRIME') and l.term in (60) and l.apr<=.36)
                or (lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE','AUTO_REFINANCE') and l.segment in ('PRIME_PLUS','PRIME') and l.term in (24,36,48,60,66,72,84) and l.apr<=.36 and br.state ='WEST_VIRGINIA'))
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        then la.amount end) as Valley_Strong_FFA,
sum(case when 
        la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and l.apr <=.18         
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (  (l.segment='PRIME_PLUS' and l.term in (36, 48, 60, 66, 72, 84) and br.state <> 'MAINE'and l.decisioning_primary_fico_score >= 660)
                        or   (l.segment='PRIME' and l.term in (36, 48, 60, 66, 72, 84) and br.state <> 'MAINE' and l.decisioning_primary_fico_score >= 660))
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        then la.amount end) as American_Heritage,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr<=.18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and decisioning.at20s>=36
        and mla.military_lending_account_search_status = 'match'
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as Marine_Federal,
sum(case when
        la.amount <= 20000
        and locc.post_loan_dti_stated<=.50
        and (decisioning.s207a < 0 or decisioning.s207a >=36 or decisioning.s207a is null) --mos since bk
        and (decisioning.co02s < 0 or decisioning.co02s >=12 or decisioning.co02s is null)
        and (decisioning.c_s061 >=6 or decisioning.c_s061 is null or decisioning.c_s061 < 0)
        and l.apr<=.18
        and lap.auto_secured_type in ('UNCOLLATERALIZED')
        and l.segment in ('PRIME_PLUS','PRIME')
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and l.decisioning_primary_fico_score >= 660
        and br.state not in ('MAINE','HAWAII','IOWA','MASSACHUSETTS','OREGON','WASHINGTON') then la.amount end) as PSECU,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr between .05 and .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .45 
        and locc.post_loan_dti_stated <= .50
        and lap.auto_secured_type in ('UNCOLLATERALIZED') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        And decisioning.vantage3>=600
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state not in ('CALIFORNIA','CONNECTICUT','DISTRICT_OF_COLUMBIA','HAWAI','ILLINOIS','IOWA','NEVADA','NEW_JERSEY','NEW_MEXICO','NEW_YORK','PENNSYLVANIA', 'MAINE') then la.amount end) as Members_choice,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 35000 
        and primary_details.pre_loan_dti_stated <= .60 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and decisioning.at20s >= 24 --min credit history
        and br.state = 'TEXAS' then la.amount end) as Cooperative_Teachers,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 640 
        and l.apr <= .21
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        or (lap.auto_secured_type = 'AUTO_REFINANCE' 
                and l.segment in ('PRIME_PLUS','PRIME','NEAR_PRIME')
                and l.decisioning_primary_fico_score >= 620
                and l.apr <= .21
                and l.term in (24, 36, 48, 60, 66, 72, 84))--auto composite
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as Green_state,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 35000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as True_Sky,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.apr <= .18
        and l.decisioning_primary_fico_score between 660 and 730
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'MICHIGAN' then la.amount end) as Elga,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 30000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state in ('NEW_JERSEY','PENNSYLVANIA','DELAWARE','MARYLAND','NEW_YORK','VIRGINIA','WEST_VIRGINIA','MASSACHUSETTS','CONNECTICUT','NEW_HAMPSHIRE','RHODE_ISLAND','VERMONT') then la.amount end) as CUNJ,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40        
        And (lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO',  'CASH_OUT_AUTO_REFINANCE') and l.decisioning_primary_fico_score >= 670 and l.term in (24,36,48,60) and la.amount<=25000 and br.state <> 'MAINE')
         Or (lap.auto_secured_type in ( 'AUTO_REFINANCE') and l.decisioning_primary_fico_score between  670 and 729 and l.term in (24,36,48,60,66,72) and la.amount<=35000)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        then la.amount end) as US_Senate,
sum(case when 
        l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        And (l.term in (24, 36, 48, 60) and l.segment ='PRIME_PLUS') or (l.term in (24,36,48,60) and l.segment='PRIME')
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as NIH,
sum(case when 
        l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .36
        and primary_details.pre_loan_dti_stated <= .40 
        and (lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
                and l.segment in ('PRIME_PLUS','PRIME') 
                and l.term in (24,36,48,60,66,72,84) 
                or (lap.auto_secured_type in ('AUTO_REFINANCE') and l.segment in ('PRIME_PLUS','PRIME','NEAR_PRIME') and l.term in (24,36,48,60,66,72,84)))
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (93201, 93202, 93203, 93204, 93205, 93206, 93207, 93208, 93210, 93212, 93215, 93216, 93218, 93219, 93220, 93221, 93222, 93223, 93224, 93225, 93226, 93227, 93230, 93232, 93234, 93235, 93237, 93238, 93239, 93240, 93241, 93242, 93243, 93244, 93245, 93247, 93249, 93250, 93251, 93252, 93255, 93256, 93257, 93258, 93260, 93261, 93262, 93263, 93265, 93266, 93267, 93268, 93270, 93271, 93272, 93274, 93275, 93276, 93277, 93278, 93279, 93280, 93282, 93283, 93285, 93286, 93287, 93290, 93291, 93292, 93301, 93302, 93303, 93304, 93305, 93306, 93307, 93308, 93309, 93311, 93312, 93313, 93380, 93381, 93382, 93383, 93384, 93385, 93386, 93387, 93388, 93389, 93390, 93401, 93402, 93403, 93405, 93406, 93407, 93408, 93409, 93410, 93412, 93420, 93421, 93422, 93423, 93424, 93428, 93430, 93432, 93433, 93435, 93442, 93443, 93444, 93445, 93446, 93447, 93448, 93449, 93451, 93452, 93453, 93461, 93465, 93483, 93501, 93502, 93504, 93505, 93516, 93518, 93519, 93523, 93527, 93528, 93531, 93554, 93555, 93556, 93560, 93561, 93581, 93596, 93602, 93603, 93605, 93606, 93607, 93608, 93609, 93611, 93612, 93613, 93615, 93616, 93618, 93621, 93622, 93624, 93625, 93626, 93627, 93628, 93630, 93631, 93633, 93634, 93640, 93641, 93642, 93646, 93647, 93648, 93649, 93650, 93651, 93652, 93654, 93656, 93657, 93660, 93662, 93664, 93666, 93667, 93668, 93670, 93673, 93675, 93701, 93702, 93703, 93704, 93705, 93706, 93707, 93708, 93709, 93710, 93711, 93712, 93714, 93715, 93716, 93717, 93718, 93720, 93721, 93722, 93725, 93726, 93727, 93728, 93729, 93744, 93745, 93747, 93755, 93771, 93772, 93773, 93774, 93775, 93776, 93777, 93778, 93779, 93790, 93791, 93792, 93793, 93794, 93601, 93604, 93610, 93614, 93637, 93638, 93639, 93643, 93644, 93645, 93653, 93669, 93669, 93623, 95306, 95311, 95318, 95325, 95338, 95345, 95389, 95306, 95389, 95389, 93620, 93635, 93661, 93665, 95301, 95303, 95312, 95315, 95317, 95322, 95322, 95324, 95333, 95334, 95340, 95365, 95369, 95374, 95388, 95341, 95342, 95344, 95348, 95201, 95220, 95227, 95230, 95231, 95234, 95236, 95237, 95240, 95253, 95258, 95304, 95304, 95320, 95330, 95336, 95366, 95385, 95391, 95686, 95307, 95313, 95316, 95319, 95323, 95326, 95328, 95329, 95350, 95360, 95361, 95361, 95361, 95363, 95367, 95368, 95380, 95386, 95387)
        and mla.military_lending_account_search_status = 'noMatch'
        then la.amount end) as valley_strong,   
sum(case when 
        l.decisioning_primary_fico_score >= 660
        and la.amount <= 10000
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.segment in ('PRIME_PLUS','PRIME') 
        and l.term in (24,36,48,60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (71171, 71172, 71037, 71051, 71067, 71110, 71064, 71111, 71113, 71006, 71112, 71164, 71163, 71166, 71165, 71103, 71104, 71102, 71082, 71101, 71108, 71109, 71107, 71105, 71106, 71069, 71029, 71033, 71009, 71004, 71007, 71060, 71061, 71047, 71043, 71044, 71115, 71151, 71152, 71150, 71148, 71149, 71161, 71162, 71156, 71153, 71154, 71138, 71129, 71130, 71120, 71118, 71119, 71136, 71137, 71135, 71133, 71134, 71032, 71046, 71027, 71030, 71049, 71063, 71078, 71050, 71052)
        then la.amount end) as aneca,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 10000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE','AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state not in ('IOWA', 'MAINE') then la.amount end) as Tennessee,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 750 
        and l.apr <= .18
        and la.amount <= 20000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state not in ('IOWA','MAINE') then la.amount end) as Mid_Illini,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 710 
        and l.apr <= .18
        and la.amount <= 40000 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as Veridian,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and l.apr <= .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (20810, 20811, 20812, 20813, 20814, 20815, 20816, 20817, 20818, 20824, 20825, 20827, 20830, 20832, 20833, 20837, 20838, 20839, 20841, 20842, 20847, 20848, 20849, 20850, 20851, 20852, 20853, 20854, 20855, 20857, 20859, 20860, 20861, 20862, 20866, 20868, 20871, 20872, 20874, 20875, 20876, 20877, 20878, 20879, 20880, 20882, 20883, 20884, 20885, 20886, 20889, 20891, 20892, 20894, 20895, 20896, 20897, 20898, 20899, 20901, 20902, 20903, 20904, 20905, 20906, 20907, 20908, 20910, 20911, 20912, 20913, 20914, 20915, 20916, 20918, 20993, 20997, 21701, 21702, 21703, 21704, 21705, 21709, 21710, 21714, 21716, 21717, 21718, 21727, 21754, 21755, 21758, 21759, 21762, 21769, 21770, 21771, 21773, 21774, 21775, 21777, 21778, 21780, 21788, 21790, 21792, 21793, 21798)
        then la.amount end) as Nymeo,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680 
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40 
        and la.amount <= 50000 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60,66,72,84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (18056, 19503, 19507, 19508, 19510, 19511, 19516, 19518, 19522, 19526, 19533, 19534, 19536, 19538, 19540, 19541, 19544, 19545, 19547, 19548, 19550, 19554, 19555, 19559, 19560, 19562, 19564, 19565, 19601, 19602, 19603, 19604, 19605, 19606, 19607, 19608, 19609, 19610, 19611, 19612)
        then la.amount end) as riverfront,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40 
        and la.amount <= 50000 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60,66,72,84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state='MICHIGAN'
        then la.amount end) as frankenmuth,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680 
        and l.apr <= .21
        and locc.post_loan_dti_stated <= .50
        and la.amount <= 30000 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'COLORADO' then la.amount end) as Westerra,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state not in ('IDAHO','IOWA', 'MAINE','OREGON') then la.amount end) as Rogue,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680 
        and l.apr <= .18
        and la.amount <= 40000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72)
        and (decisioning.s207a <0 and decisioning.s207a is null or decisioning.s207a >=36) --mos since bk
        and (decisioning.s_g082  <= 0 or decisioning.s_g082 is null) --accts currently dq
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'TEXAS' then la.amount end) as Texell,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.apr <= .25
        and l.decisioning_primary_fico_score >= 630 
        and la.amount <= 35000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'MICHIGAN' then la.amount end) as Zeal,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state not in ('CALIFORNIA','VIRGINIA', 'MAINE') then la.amount end) as Three_Rivers,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME','NEAR_PRIME')
        and l.decisioning_primary_fico_score >= 650
        and la.amount <= 20000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 06790, 06776, 06795, 06098, 06798, 06786, 06787, 06759, 06057, 06779, 06791, 06751, 06063, 06018, 06782, 06756, 06069, 06783, 06763, 06058, 06068, 06752, 06039, 06777, 06031, 06754, 06757, 06021, 06785, 06794, 06793, 
        06796, 06750, 06778, 06091, 06755, 06065, 06024, 06059, 06061, 06079, 06094, 06753, 06758, 06781, 06792, 06516, 06511, 06492, 06513, 06460, 06450, 06770, 06708, 06410, 06514, 06512, 06405, 06704, 06705, 06473, 06451, 06437, 06488, 06518, 06401, 06515, 
        06443, 06716, 06483, 06519, 06461, 06706, 06477, 06517, 06478, 06418, 06712, 06710, 06525, 06762, 06471, 06472, 06403, 06524, 06510, 06702, 06408, 06411, 06454, 06487, 06493, 06494, 06495, 06501, 06502, 06503, 06504, 06505, 06506, 06507, 06508, 06509, 
        06520, 06521, 06530, 06531, 06532, 06533, 06534, 06535, 06536, 06537, 06538, 06540, 06701, 06703, 06720, 06721, 06722, 06723, 06724, 06725, 06726, 06902, 06810, 06606, 06484, 06611, 06824, 06614, 06811, 06854, 06880, 06604, 06851, 06877, 06830, 06610, 
        06905, 06605, 06820, 06825, 06840, 06468, 06801, 06850, 06615, 06897, 06804, 06470, 06831, 06903, 06608, 06812, 06482, 06906, 06883, 06855, 06896, 06878, 06607, 06907, 06901, 06612, 06870, 06807, 06784, 06890, 06853, 06922, 06404, 06440, 06491, 06497, 06601, 
        06602, 06650, 06673, 06699, 06813, 06814, 06816, 06817, 06828, 06829, 06832, 06836, 06838, 06842, 06852, 06856, 06857, 06858, 06859, 06860, 06875, 06876, 06879, 06881, 06888, 06889, 06904, 06910, 06911, 06912, 06913, 06914, 06920, 06921, 06925, 06926, 06927, 06928, 06749)
        then la.amount end) as sound,   
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 640 
        and l.apr <= .18
        and la.amount <= 25000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'MAINE' then la.amount end) as Maine_Savings,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'MICHIGAN' then la.amount end) as Frakenmuth,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and locc.post_loan_dti_stated <= .65
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state in ('CONNECTICUT','RHODE_ISLAND','MASSACHUSETTS','NEW_HAMPSHIRE','VERMONT','NEW_YORK') then la.amount end) as Westerly,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680 
        and l.apr <= .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type = 'UNCOLLATERALIZED' 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state in ('MINNESOTA','WISCONSIN','SOUTH DAKOTA','NEBRASKA','NORTH DAKOTA') then la.amount end) as Altra,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state NOT IN ('ALASKA','HAWAII','MAINE') then la.amount end) as Signal_CU,
sum(case when 
        l.decisioning_primary_fico_score >= 680 
        and la.amount <= 50000 
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40 
        and locc.post_loan_dti_stated <= .65 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.s207a > 24 or decisioning.s207a <0 or decisioning.s207a  is null)--mos since bk
        and l.term in (24, 36, 48, 60)
        and decisioning.at20s >= 24 --min credit history
        and br.state <> 'MAINE' then la.amount end) as Franklin_Mint,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 20000 
        and primary_details.pre_loan_dti_stated <= .25
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and secondary_details.loan_app_id is null
        and br.state in ('DELAWARE','MARYLAND','NEW_JERSEY','PENNSYLVANIA') then la.amount end) as Sun_east,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 35000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as Unify,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 620 
        and l.apr <= .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state not in ('ALASKA','HAWAII','TEXAS','MAINE') then la.amount end) as Financial_Resources_PL,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and la.amount <= 50000 
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .35 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state in ('VIRGINA','MARYLAND','PENNSYLVANIA','DELAWARE','WEST_VIRGINIA','NORTH_CAROLINA','SOUTH_CAROLINA') then la.amount end) as Topside,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680 
        and l.apr <= .18
        and la.amount <= 35000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and secondary_details.loan_app_id is null
        and br.state = 'PENNSYLVANIA' then la.amount end) as Utilities,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 30000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (93201, 93202, 93203, 93204, 93205, 93206, 93207, 93208, 93210, 93212, 93215, 93216, 93218, 93219, 93220, 93221, 93222, 93223, 93224, 93225, 93226, 93227, 93230, 93232, 93234,
         93235, 93237, 93238, 93239, 93240, 93241, 93242, 93243, 93244, 93245, 93246, 93247, 93249, 93250, 93251, 93252, 93255, 93256, 93257, 93258, 93260, 93261, 93262, 93263, 93265, 93266, 93267, 93268, 93270, 93271, 
         93272, 93274, 93275, 93276, 93277, 93278, 93279, 93280, 93282, 93283, 93285, 93286, 93287, 93290, 93291, 93292, 93301, 93302, 93303, 93304, 93305, 93306, 93307, 93308, 93309, 93311, 93312, 93313, 93314, 93380,
          93383, 93384, 93385, 93386, 93387, 93388, 93389, 93390, 93501, 93502, 93504, 93505, 93516, 93518, 93519, 93523, 93524, 93527, 93528, 93531, 93554, 93555, 93556, 93558, 93560, 93561, 93581, 93596, 93602, 93603, 
          93605, 93606, 93607, 93608, 93609, 93611, 93612, 93613, 93615, 93616, 93618, 93619, 93621, 93622, 93624, 93625, 93626, 93627, 93628, 93630, 93631, 93633, 93634, 93640, 93641, 93642, 93646, 93647, 93648, 93649, 
          93650, 93651, 93652, 93654, 93656, 93657, 93660, 93662, 93664, 93666, 93667, 93668, 93670, 93673, 93675, 93701, 93702, 93703, 93704, 93705, 93706, 93707, 93708, 93709, 93710, 93711, 93712, 93714, 93715, 93716, 93717, 
          93718, 93720, 93721, 93722, 93723, 93724, 93725, 93726, 93727, 93728, 93729, 93730, 93737, 93740, 93741, 93744, 93745, 93747, 93750, 93755, 93760, 93761, 93764, 93765, 93771, 93772, 93773, 93774, 93775, 93776, 93777, 93778, 93779, 93786, 93790, 93791, 93792, 93793, 93794, 93844, 93888)
        then la.amount end) as safe_1,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and secondary_details.loan_app_id is null
        and br.state <> 'MAINE' then la.amount end) as lookout,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 710 
        and la.amount <= 30000 
        And l.apr<=.18
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and locc.post_loan_dti_stated <= .50 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'CALIFORNIA' then la.amount end) as Golden_1,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 700 
        and la.amount <= 25000 
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'MICHIGAN' then la.amount end) as Freestar,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680 
        and la.amount <= 30000 
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .30
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'MICHIGAN'
        --and til.borrower_zip_code in (46303, 46307, 46308, 46311, 46312, 46319, 46320, 46321, 46322, 46323, 46324, 46325, 46327, 46341, 46342, 46355, 46356, 46373, 46375, 46376, 46377, 46394, 46401, 46402, 46403, 46404, 46405, 46406, 46407, 46408, 46409, 46410, 46411, 46360, 46385, 46383, 46368, 46304, 46391, 46347, 46301, 46384, 46393, 46302, 46350, 46574, 46552, 46371, 46390, 46532, 46382, 46348, 46365, 46340, 46346, 46352, 46361, 46345, 46544, 46530, 46614, 46628, 46545, 46619, 46637, 46615, 46561, 46617, 46613, 46506, 46556, 46635, 46601, 46616, 46554, 46573, 46536, 46546, 46595, 46612, 46604, 46624, 46620, 46626, 46634, 46629, 46680, 46660, 46699, 46514, 46526, 46516, 46517, 46528, 46540, 46550, 46507, 46567, 46553, 46543, 46515, 46527, 46761, 46565, 46795, 46571, 46746, 46747, 46776, 46771, 46786, 46789, 46703, 46737, 46742, 46779, 46705, 46310, 46349, 47951, 47963, 47922, 47943, 46372, 46379, 46381, 47964, 47978, 46392, 47946, 47957, 47948, 46380, 46534, 46960, 46531, 46374, 46563, 46501, 46504, 46572, 46513, 46537, 46580, 46582, 46962, 46538, 46542, 46590, 46510, 46524, 46555, 46502, 46508, 46581, 46755, 46767, 46701, 46710, 46784, 46732, 46763, 46794, 46760, 46796, 46738, 46721, 46793, 46785, 46730, 54534, 54546, 54547, 54550, 54525, 54565, 54536, 54519, 54554, 54557, 54540, 54512, 54545, 54560, 54561, 54520, 54541, 54511, 54566, 54542, 54103, 54151, 54121, 54120, 54143, 54177, 54159, 54156, 54119, 54102)
        then la.amount end) as Honor_CU,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 700 
        and la.amount <= 50000
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as First_florida,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 700 
        and la.amount <= 50000
        and l.apr between .05 and .36
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (00501, 00544, 06390, 07001, 07002, 07003, 07004, 07005, 07006, 07007, 07008, 07009, 07010, 07011, 07012, 07013, 07014, 07015, 07016, 07017, 07018, 07019, 07020, 07021, 07022, 07023, 07024,
         07026, 07027, 07028, 07029, 07030, 07031, 07032, 07033, 07034, 07035, 07036, 07039, 07040, 07041, 07042, 07043, 07044, 07045, 07046, 07047, 07050, 07051, 07052, 07054, 07055, 07057, 07058, 07059, 07060, 07061, 07062, 07063, 
         07064, 07065, 07066, 07067, 07068, 07069, 07070, 07071, 07072, 07073, 07074, 07075, 07076, 07077, 07078, 07079, 07080, 07081, 07082, 07083, 07086, 07087, 07088, 07090, 07091, 07092, 07093, 07094, 07095, 07096, 07097, 07099, 07101, 
         07102, 07103, 07104, 07105, 07106, 07107, 07108, 07109, 07110, 07111, 07112, 07114, 07175, 07184, 07188, 07189, 07191, 07192, 07193, 07195, 07198, 07199, 07201, 07202, 07203, 07204, 07205, 07206, 07207, 07208, 07302, 07303, 07304, 
         07305, 07306, 07307, 07308, 07310, 07311, 07395, 07399, 07401, 07403, 07405, 07407, 07410, 07416, 07417, 07418, 07419, 07420, 07421, 07422, 07423, 07424, 07428, 07430, 07432, 07435, 07436, 07438, 07439, 07440, 07442, 07444, 07446, 07450, 
         07451, 07452, 07456, 07457, 07458, 07460, 07461, 07462, 07463, 07465, 07470, 07474, 07480, 07481, 07495, 07501, 07502, 07503, 07504, 07505, 07506, 07507, 07508, 07509, 07510, 07511, 07512, 07513, 07514, 07522, 07524, 07533, 07538, 07543, 07544, 
         07601, 07602, 07603, 07604, 07605, 07606, 07607, 07608, 07620, 07621, 07624, 07626, 07627, 07628, 07630, 07631, 07632, 07640, 07641, 07642, 07643, 07644, 07645, 07646, 07647, 07648, 07649, 07650, 07652, 07653, 07656, 07657, 07660, 07661, 07662, 
         07663, 07666, 07670, 07675, 07676, 07677, 07699, 07701, 07702, 07703, 07704, 07710, 07711, 07712, 07715, 07716, 07717, 07718, 07719, 07720, 07721, 07722, 07723, 07724, 07726, 07727, 07728, 07730, 07731, 07732, 07733, 07734, 07735, 07737, 07738, 07739, 
         07740, 07746, 07747, 07748, 07750, 07751, 07752, 07753, 07754, 07755, 07756, 07757, 07758, 07760, 07762, 07763, 07764, 07765, 07799, 07801, 07802, 07803, 07806, 07820, 07821, 07822, 07823, 07825, 07826, 07827, 07828, 07829, 07830, 07831, 07832, 07833, 
         07834, 07836, 07837, 07838, 07839, 07840, 07842, 07843, 07844, 07845, 07846, 07847, 07848, 07849, 07850, 07851, 07852, 07853, 07855, 07856, 07857, 07860, 07863, 07865, 07866, 07869, 07870, 07871, 07874, 07875, 07876, 07877, 07878, 07879, 07880, 07881, 
         07882, 07885, 07890, 07901, 07902, 07920, 07921, 07922, 07924, 07926, 07927, 07928, 07930, 07931, 07932, 07933, 07934, 07935, 07936, 07938, 07939, 07940, 07945, 07946, 07950, 07960, 07961, 07962, 07963, 07970, 07974, 07976, 07977, 07978, 07979, 07980, 
         07981, 07999, 08001, 08002, 08003, 08004, 08005, 08006, 08007, 08008, 08009, 08010, 08011, 08012, 08014, 08015, 08016, 08018, 08019, 08020, 08021, 08022, 08023, 08025, 08026, 08027, 08028, 08029, 08030, 08031, 08032, 08033, 08034, 08035, 08036, 08037, 
         08038, 08039, 08041, 08042, 08043, 08045, 08046, 08048, 08049, 08050, 08051, 08052, 08053, 08054, 08055, 08055, 08056, 08057, 08059, 08060, 08061, 08062, 08062, 08063, 08064, 08065, 08066, 08067, 08068, 08069, 08070, 08071, 08072, 08073, 08074, 08075, 
         08075, 08075, 08076, 08077, 08078, 08079, 08080, 08081, 08083, 08084, 08085, 08086, 08087, 08087, 08088, 08088, 08088, 08088, 08089, 08090, 08091, 08092, 08093, 08094, 08095, 08096, 08096, 08097, 08098, 08099, 08101, 08102, 08103, 08104, 08105, 08106, 08107, 
         08108, 08109, 08110, 08201, 08202, 08203, 08204, 08205, 08210, 08212, 08213, 08214, 08215, 08217, 08218, 08219, 08220, 08221, 08223, 08224, 08225, 08226, 08230, 08231, 08232, 08234, 08240, 08241, 08242, 08243, 08244, 08245, 08246, 08247, 08248, 08250, 08251, 
         08252, 08260, 08270, 08302, 08310, 08311, 08312, 08313, 08314, 08315, 08316, 08317, 08318, 08319, 08320, 08321, 08322, 08323, 08324, 08326, 08327, 08328, 08329, 08330, 08332, 08340, 08341, 08342, 08343, 08344, 08345, 08346, 08347, 08348, 08349, 08350, 08352, 
         08353, 08360, 08361, 08362, 08401, 08402, 08403, 08404, 08405, 08406, 08501, 08502, 08504, 08505, 08510, 08511, 08512, 08514, 08515, 08518, 08520, 08525, 08526, 08527, 08528, 08530, 08533, 08534, 08535, 08536, 08540, 08541, 08542, 08543, 08544, 08550, 08551, 
         08553, 08554, 08555, 08556, 08557, 08558, 08559, 08560, 08561, 08562, 08601, 08602, 08603, 08604, 08605, 08606, 08607, 08608, 08609, 08610, 08611, 08618, 08619, 08620, 08625, 08628, 08629, 08638, 08640, 08641, 08645, 08646, 08647, 08648, 08650, 08666, 08690, 
         08691, 08695, 08701, 08720, 08721, 08722, 08723, 08724, 08730, 08731, 08732, 08733, 08734, 08735, 08736, 08738, 08739, 08740, 08741, 08742, 08750, 08751, 08752, 08753, 08754, 08755, 08756, 08757, 08758, 08759, 08801, 08802, 08803, 08804, 08805, 08807, 08808, 
         08809, 08810, 08812, 08816, 08817, 08818, 08820, 08821, 08822, 08823, 08824, 08825, 08826, 08827, 08828, 08829, 08830, 08831, 08832, 08833, 08834, 08835, 08836, 08837, 08840, 08844, 08846, 08848, 08850, 08852, 08853, 08854, 08855, 08857, 08858, 08859, 08861, 
         08862, 08863, 08865, 08867, 08868, 08869, 08870, 08871, 08872, 08873, 08875, 08876, 08879, 08880, 08882, 08884, 08885, 08886, 08887, 08888, 08889, 08890, 08899, 08901, 08902, 08903, 08904, 08906, 08933, 08989, 10001, 10002, 10003, 10004, 10005, 10006, 10007, 
         10008, 10009, 10010, 10011, 10012, 10013, 10014, 10015, 10016, 10017, 10018, 10019, 10020, 10021, 10022, 10023, 10024, 10025, 10026, 10027, 10028, 10029, 10030, 10031, 10032, 10033, 10034, 10035, 10036, 10037, 10038, 10039, 10040, 10041, 10043, 10044, 10045, 
         10046, 10047, 10048, 10055, 10060, 10065, 10069, 10072, 10075, 10079, 10080, 10081, 10082, 10087, 10090, 10094, 10095, 10096, 10098, 10099, 10101, 10102, 10103, 10104, 10105, 10106, 10107, 10108, 10109, 10110, 10111, 10112, 10113, 10114, 10115, 10116, 10117, 10118, 10119, 10120, 10121, 10122, 10123, 10124, 10125, 10126, 10128, 10129, 10130, 10131, 10132, 10133, 10138, 10149, 10150, 10151, 10152, 10153, 10154, 10155, 10156, 10157, 10158, 10159, 10160, 10161, 10162, 10163, 10164, 10165, 10166, 10167, 10168, 10169, 10170, 10171, 10172, 10173, 10174, 10175, 10176, 10177, 10178, 10179, 10184, 10185, 10196, 10197, 10199, 10203, 10211, 10212, 10213, 10242, 10249, 10256, 10257, 10258, 10259, 10260, 10261, 10265, 10268, 10269, 10270, 10271, 10272, 10273, 10274, 10275, 10276, 10277, 10278, 10279, 10280, 10281, 10282, 10285, 10286, 10292, 10301, 10302, 10303, 10304, 10305, 10306, 10307, 10308, 10309, 10310, 10311, 10312, 10313, 10314, 10451, 10452, 10453, 10454, 10455, 10456, 10457, 10458, 10459, 10460, 10461, 10462, 10463, 10464, 10465, 10466, 10467, 10468, 10469, 10470, 10471, 10472, 10473, 10474, 10475, 10499, 10501, 10502, 10503, 10504, 10505, 10506, 10507, 10509, 10510, 10511, 10512, 10514, 10516, 10517, 10518, 10519, 10520, 10521, 10522, 10523, 10524, 10526, 10527, 10528, 10530, 10532, 10533, 10535, 10536, 10537, 10538, 10540, 10541, 10542, 10543, 10545, 10546, 10547, 10548, 10549, 10550, 10551, 10552, 10553, 10557, 10558, 10560, 10562, 10566, 10567, 10570, 10571, 10572, 10573, 10576, 10577, 10578, 10579, 10580, 10583, 10587, 10588, 10589, 10590, 10591, 10594, 10595, 10596, 10597, 10598, 10601, 10602, 10603, 10604, 10605, 10606, 10607, 10610, 10701, 10702, 10703, 10704, 10705, 10706, 10707, 10708, 10709, 10710, 10801, 10802, 10803, 10804, 10805, 10901, 10910, 10911, 10912, 10913, 10914, 10915, 10916, 10917, 10918, 10919, 10920, 10921, 10922, 10923, 10924, 10925, 10926, 10927, 10928, 10930, 10931, 10932, 10933, 10940, 10941, 10943, 10949, 10950, 10952, 10953, 10954, 10956, 10958, 10959, 10960, 10962, 10963, 10964, 10965, 10968, 10969, 10970, 10973, 10974, 10975, 10976, 10977, 10979, 10980, 10981, 10982, 10983, 10984, 10985, 10986, 10987, 10988, 10989, 10990, 10992, 10993, 10994, 10996, 10997, 10998, 11002, 11003, 11004, 11005, 11010, 11020, 11021, 11022, 11023, 11024, 11025, 11026, 11027, 11030, 11040, 11040, 11041, 11042, 11043, 11044, 11050, 11051, 11052, 11053, 11054, 11055, 11099, 11101, 11102, 11103, 11104, 11105, 11106, 11120, 11201, 11202, 11203, 11204, 11205, 11206, 11207, 11208, 11209, 11210, 11211, 11212, 11213, 11214, 11215, 11216, 11217, 11218, 11219, 11220, 11221, 11222, 11223, 11224, 11225, 11226, 11228, 11229, 11230, 11231, 11232, 11233, 11234, 11235, 11236, 11237, 11238, 11239, 11240, 11241, 11242, 11243, 11244, 11245, 11247, 11248, 11249, 11251, 11252, 11254, 11255, 11256, 11351, 11352, 11354, 11355, 11356, 11357, 11358, 11359, 11360, 11361, 11362, 11363, 11364, 11365, 11366, 11367, 11368, 11369, 11370, 11371, 11372, 11373, 11374, 11375, 11377, 11378, 11379, 11380, 11381, 11385, 11386, 11390, 11405, 11411, 11412, 11413, 11414, 11415, 11416, 11417, 11418, 11419, 11420, 11421, 11422, 11423, 11424, 11426, 11427, 11428, 11429, 11430, 11431, 11432, 11433, 11434, 11435, 11436, 11437, 11439, 11451, 11499, 11501, 11507, 11509, 11510, 11514, 11516, 11518, 11520, 11530, 11531, 11535, 11536, 11542, 11545, 11547, 11548, 11549, 11550, 11551, 11552, 11553, 11554, 11555, 11556, 11557, 11558, 11559, 11560, 11561, 11563, 11565, 11566, 11568, 11569, 11570, 11571, 11572, 11575, 11576, 11577, 11579, 11580, 11581, 11582, 11590, 11592, 11594, 11595, 11596, 11597, 11598, 11599, 11690, 11691, 11692, 11693, 11694, 11695, 11697, 11701, 11702, 11703, 11704, 11705, 11706, 11707, 11708, 11709, 11710, 11713, 11714, 11715, 11716, 11717, 11718, 11719, 11720, 11721, 11722, 11724, 11725, 11726, 11727, 11729, 11730, 11731, 11732, 11733, 11735, 11736, 11737, 11738, 11739, 11740, 11741, 11742, 11743, 11746, 11747, 11749, 11750, 11751, 11752, 11753, 11754, 11755, 11756, 11757, 11758, 11760, 11762, 11763, 11764, 11765, 11766, 11767, 11768, 11769, 11770, 11771, 11772, 11773, 11774, 11775, 11776, 11777, 11778, 11779, 11780, 11782, 11783, 11784, 11786, 11787, 11788, 11789, 11790, 11791, 11792, 11793, 11794, 11795, 11796, 11797, 11798, 11801, 11802, 11803, 11804, 11815, 11819, 11853, 11854, 11855, 11901, 11930, 11931, 11932, 11933, 11934, 11935, 11937, 11939, 11940, 11941, 11942, 11944, 11946, 11947, 11948, 11949, 11950, 11951, 11952, 11953, 11954, 11955, 11956, 11957, 11958, 11959, 11960, 11961, 11962, 11963, 11964, 11965, 11967, 11968, 11969, 11970, 11971, 11972, 11973, 11975, 11976, 11977, 11978, 11980, 12401, 12402, 12404, 12406, 12409, 12410, 12411, 12412, 12416, 12417, 12419, 12420, 12428, 12429, 12432, 12433, 12435, 12440, 12441, 12443, 12446, 12448, 12449, 12453, 12455, 12456, 12457, 12458, 12461, 12464, 12465, 12466, 12471, 12472, 12475, 12477, 12480, 12481, 12483, 12484, 12486, 12487, 12489, 12490, 12491, 12493, 12494, 12495, 12498, 12501, 12504, 12506, 12507, 12508, 12510, 12511, 12512, 12514, 12515, 12518, 12520, 12522, 12524, 12525, 12527, 12528, 12531, 12533, 12537, 12538, 12540, 12542, 12543, 12545, 12546, 12547, 12548, 12549, 12550, 12551, 12552, 12553, 12555, 12561, 12563, 12564, 12566, 12567, 12568, 12569, 12570, 12571, 12572, 12574, 12575, 12577, 12578, 12580, 12581, 12582, 12583, 12584, 12585, 12586, 12588, 12589, 12590, 12592, 12594, 12601, 12602, 12603, 12604, 12701, 12719, 12720, 12721, 12722, 12723, 12724, 12725, 12726, 12727, 12729, 12732, 12733, 12734, 12736, 12737, 12738, 12740, 12741, 12742, 12743, 12745, 12746, 12747, 12748, 12749, 12750, 12751, 12752, 12754, 12758, 12759, 12760, 12762, 12763, 12764, 12765, 12766, 12767, 12768, 12769, 12770, 12771, 12775, 12776, 12777, 12778, 12779, 12780, 12781, 12782, 12783, 12784, 12785, 12786, 12787, 12788, 12789, 12790, 12791, 12792, 18001, 18002, 18003, 18010, 18012, 18013, 18014, 18015, 18016, 18017, 18018, 18020, 18025, 18030, 18031, 18032, 18034, 18035, 18036, 18037, 18038, 18039, 18040, 18042, 18043, 18044, 18045, 18046, 18049, 18050, 18051, 18052, 18053, 18055, 18058, 18059, 18060, 18063, 18064, 18065, 18066, 18067, 18068, 18069, 18071, 18072, 18077, 18078, 18079, 18080, 18081, 18083, 18085, 18086, 18087, 18088, 18091, 18092, 18098, 18099, 18101, 18102, 18103, 18104, 18105, 18106, 18109, 18175, 18195, 18210, 18212, 18229, 18230, 18232, 18235, 18244, 18250, 18254, 18301, 18302, 18320, 18321, 18322, 18323, 18324, 18325, 18326, 18327, 18328, 18330, 18331, 18332, 18333, 18334, 18335, 18336, 18337, 18340, 18341, 18342, 18343, 18344, 18346, 18347, 18348, 18349, 18350, 18351, 18352, 18353, 18354, 18355, 18356, 18357, 18360, 18370, 18371, 18372, 18373, 18405, 18415, 18417, 18425, 18426, 18427, 18428, 18431, 18435, 18437, 18438, 18439, 18443, 18445, 18449, 18451, 18453, 18454, 18455, 18456, 18457, 18458, 18459, 18460, 18461, 18462, 18463, 18464, 18465, 18466, 18469, 18472, 18473, 18610, 18624, 18847, 18901, 18902, 18910, 18911, 18912, 18913, 18914, 18916, 18917, 18920, 18921, 18922, 18923, 18925, 18926, 18927, 18928, 18929, 18930, 18931, 18932, 18933, 18934, 18935, 18938, 18940, 18942, 18943, 18944, 18946, 18947, 18949, 18950, 18951, 18953, 18954, 18955, 18956, 18960, 18962, 18963, 18966, 18968, 18970, 18972, 18974, 18976, 18977, 18980, 18981, 18991, 19007, 19020, 19021, 19030, 19047, 19053, 19054, 19055, 19056, 19057, 19058, 19059, 19067)
        then la.amount end) as Unity,
sum(case when 
        l.decisioning_primary_fico_score >= 660 
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and (lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') and l.segment in ('PRIME_PLUS','PRIME')
             or (l.segment in ('PRIME_PLUS','PRIME','NEAR_PRIME') AND lap.auto_secured_type = 'AUTO_REFINANCE')) 
        and til.borrower_zip_code in (78330, 78339, 78343, 78347, 78351, 78373, 78380, 78401, 78402, 78403, 78404, 78405, 78406, 78407, 78408, 78409, 78410, 78411, 78412, 78413, 78414, 78415, 78416, 78417, 78418, 78419, 78426, 78427, 78460, 78463, 78465, 78466, 78467, 78468, 78469, 78472, 78480)
        then la.amount end) as STAR,       
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 720 
        and la.amount <= 25000
        and l.apr <= .36
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (60053, 60714, 60077, 60076, 60202, 60658, 60631, 60646, 60712, 60645, 60626, 60659, 60660, 60658, 60630, 60625, 60640, 60176, 60706, 60131, 60634, 60641, 60618, 60612, 60657, 
        60164, 60165, 60160, 60163, 60104, 60153, 60162, 60171, 60707, 60639, 60305, 60302, 60304, 60644, 60651, 60624, 60612, 60501, 60611, 60610, 60605, 60614, 60657, 60612, 60618, 60642, 60622, 60647, 60018, 60068, 60016, 60203, 60201, 60106, 60126, 60523, 60154, 60029, 60025, 60091, 60605)
        then la.amount end) as first_financial,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 22000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (17022, 17501, 17502, 17503, 17504, 17505, 17506, 17507, 17508, 17509, 17509, 17512, 17516, 17517, 17518, 17519, 17520, 17521, 17522, 17527, 17528, 
        17529, 17532, 17533, 17534, 17535, 17536, 17537, 17538, 17538, 17540, 17543, 17543, 17545, 17547, 17549, 17550, 17551, 17552, 17552, 17554, 17555, 17557, 17560, 17562, 17563, 17564, 
        17565, 17566, 17567, 17568, 17569, 17570, 17572, 17575, 17576, 17577, 17578, 17579, 17580, 17581, 17582, 17583, 17584, 17585, 17601, 17601, 17602, 17603, 17603, 17604, 17605, 17605, 
        17606, 17607, 17608, 19501, 17537, 17538, 17538, 17540, 17543, 17543, 17545, 17547, 17549, 17550, 17551, 17552, 17552, 17554, 17555, 17557, 17560, 17562, 17563, 17564, 17565, 17566, 
        17567, 17568, 17569, 19019, 19101, 19102, 19102, 19102, 19103, 19103, 19103, 19104, 19105, 19106, 19107, 19108, 19109, 19110, 19111, 19112, 19114, 19115, 19116, 19118, 19119, 19120, 
        19121, 19122, 19123, 19124, 19149, 19150, 19151, 19151, 19152, 19153, 19154, 19155, 19160, 19125, 19126, 19127, 19127, 19128, 19129, 19130, 19131, 19132, 19133, 19134, 19135, 19136, 
        19137, 19138, 19139, 19140, 19141, 19142, 19143, 19144, 19145, 19146, 19147, 19148, 08004, 08106, 08007, 08031, 08009, 08012, 08102, 08103, 08104, 08105, 08002, 08107, 08108, 08026, 
        08029, 08030, 08035, 08033, 08034, 08045, 08021, 08049, 08109, 08059, 08110, 08078, 08081, 08083, 08003, 08084, 08043, 08089, 08091, 08095, 19701, 19702, 19702, 19703, 19706, 19707, 19708, 19709, 19710, 19711, 19713, 19714, 19715, 19716, 19717, 19720, 19720, 19730, 19701, 19702, 19702, 19703, 19706, 19707, 19708, 19709, 19710, 19711, 19713, 19714, 19715, 19716, 19717, 19720, 19720, 19730, 19731, 19732, 19733, 19734, 19735, 19736, 19801, 19802, 19803, 19803, 19804, 19804, 19804, 19805, 19805, 19806, 19807, 19807, 19808, 19808, 19809, 19809, 19810, 19810, 19850, 19880, 19899)
        then la.amount end) as eagle_one,   
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 25000
        and l.apr <= .21
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (73014, 73022, 73036, 73064, 73078, 73085, 73090, 73099, 73019, 73026, 73051, 73068, 73069, 73070, 73071, 73072, 73153, 73160, 73165, 73170, 73189, 74857, 73027, 73028, 73044, 73050, 73056, 73058, 73063, 73073, 73010, 73031, 73065, 73080, 73093, 73095, 74831, 73003, 73007, 73008, 73013, 73020, 73034, 73045, 73049, 73054, 73066, 73083, 73084, 73097, 73101, 73102, 73103, 73104, 73105, 73106, 73107, 73108, 73109, 73110, 73111, 73112, 73113, 73114, 73115, 73116, 73117, 73118, 73119, 73120, 73121, 73122, 73123, 73124, 73125, 73126, 73127, 73128, 73129, 73130, 73131, 73132, 73134, 73135, 73136, 73137, 73139, 73140, 73141, 73142, 73143, 73144, 73145, 73146, 73147, 73148, 73149, 73150, 73151, 73152, 73154, 73155, 73156, 73157, 73159, 73162, 73163, 73164, 73167, 73169, 73172, 73173, 73178, 73179, 73184, 73185, 73190, 73193, 73194, 73195, 73196, 73197, 73198, 73199, 74801, 74802, 74804, 74826, 74840, 74851, 74852, 74854, 74866, 74873, 74878)
        then la.amount end) as oklahoma,   
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (33002, 33004, 33008, 33009, 33010, 33011, 33012, 33013, 33014, 33015, 33016, 33017, 33018, 33019, 33020, 33021, 33022, 33023, 33024, 33025, 33026, 33026, 33027, 33028, 33029, 33030, 33031, 33032, 33033, 33034, 33035, 33039, 33054, 33055, 33056, 33060, 33061, 33062, 33063, 33064, 33065, 33066, 33067, 33068, 33069, 33071, 33072, 33073, 33074, 33075, 33076, 33077, 33081, 33082, 33083, 33084, 33090, 33092, 33093, 33097, 33101, 33102, 33106, 33109, 33111, 33112, 33114, 33116, 33119, 33122, 33124, 33125, 33126, 33127, 33128, 33129, 33130, 33131, 33132, 33133, 33134, 33135, 33136, 33137, 33138, 33139, 33140, 33141, 33142, 33143, 33144, 33145, 33146, 33147, 33149, 33150, 33151, 33152, 33153, 33154, 33155, 33156, 33157, 33158, 33160, 33161, 33162, 33163, 33164, 33165, 33166, 33167, 33168, 33169, 33170, 33172, 33173, 33174, 33175, 33176, 33177, 33178, 33179, 33180, 33181, 33182, 33183, 33184, 33185, 33186, 33187, 33188, 33189, 33190, 33191, 33192, 33193, 33194, 33195, 33196, 33197, 33198, 33199, 33206, 33222, 33231, 33233, 33234, 33238, 33239, 33242, 33243, 33245, 33247, 33255, 33256, 33257, 33261, 33265, 33266, 33269, 33280, 33283, 33296, 33299, 33301, 33302, 33303, 33304, 33305, 33306, 33307, 33308, 33309, 33310, 33311, 33312, 33313, 33314, 33315, 33316, 33317, 33318, 33319, 33320, 33321, 33322, 33323, 33324, 33325, 33326, 33327, 33328, 33329, 33330, 33331, 33332, 33334, 33335, 33336, 33337, 33338, 33339, 33340, 33345, 33346, 33348, 33349, 33351, 33355, 33359, 33388, 33394, 33401, 33402, 33403, 33404, 33405, 33406, 33407, 33408, 33409, 33410, 33411, 33411, 33412, 33412, 33413, 33414, 33414, 33415, 33416, 33417, 33418, 33419, 33420, 33421, 33422, 33424, 33425, 33426, 33427, 33428, 33429, 33430, 33431, 33432, 33433, 33434, 33435, 33436, 33437, 33438, 33440, 33441, 33442, 33443, 33444, 33445, 33446, 33448, 33449, 33454, 33455, 33458, 33459, 33460, 33461, 33462, 33463, 33464, 33465, 33466, 33467, 33468, 33469, 33470, 33472, 33473, 33474, 33475, 33476, 33477, 33478, 33480, 33481, 33482, 33483, 33484, 33486, 33487, 33488, 33493, 33496, 33497, 33498, 33499, 33901, 33902, 33903, 33904, 33905, 33906, 33907, 33908, 33909, 33910, 33911, 33912, 33913, 33914, 33915, 33916, 33917, 33918, 33919, 33920, 33921, 33922, 33924, 33928, 33929, 33930, 33931, 33932, 33935, 33936, 33945, 33956, 33957, 33965, 33966, 33967, 33970, 33971, 33972, 33973, 33974, 33975, 33976, 33990, 33991, 33993, 33994, 34101, 34102, 34103, 34104, 34105, 34106, 34107, 34108, 34109, 34110, 34112, 34113, 34114, 34116, 34117, 34119, 34120, 34133, 34134, 34135, 34136, 34137, 34138, 34139, 34140, 34141, 34142, 34143, 34145, 34146, 34223, 34229, 34230, 34231, 34232, 34233, 34234, 34235, 34236, 34237, 34238, 34239, 34240, 34241, 34242, 34249, 34272, 34274, 34275, 34276, 34277, 34284, 34285, 34286, 34287, 34288, 34289, 34290, 34291, 34292, 34293, 34295, 34945, 34946, 34947, 34948, 34949, 34950, 34951, 34952, 34953, 34954, 34956, 34957, 34958, 34979, 34981, 34982, 34983, 34984, 34985, 34986, 34987, 34988, 34990, 34991, 34992, 34994, 34995, 34996, 34997)
        then la.amount end) as Tropical,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 30000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and secondary_details.loan_app_id is null
        and til.borrower_zip_code in (43107, 43003, 43015, 43021, 43032, 43035, 43061, 43065, 43066, 43074, 43082, 43240, 43046, 43102, 43105, 43112, 43130, 43136, 43147, 43148, 43150, 43154, 43155, 43157, 43002, 43004, 43016, 43017, 43026, 43054, 43068, 43069, 43081, 43085, 43086, 43109, 43110, 43119, 43123, 43125, 43126, 43137, 43194, 43195, 43199, 43201, 43202, 43203, 43204, 43205, 43206, 43207, 43209, 43210, 43211, 43212, 43213, 43214, 43215, 43216, 43217, 43218, 43219, 43220, 43221, 43222, 43223, 43224, 43226, 43227, 43228, 43229, 43230, 43231, 43232, 43234, 43235, 43236, 43251, 43260, 43266, 43268, 43270, 43271, 43272, 43279, 43287, 43291, 43001, 43008, 43013, 43018, 43023, 43025, 43027, 43030, 43031, 43033, 43055, 43056, 43058, 43062, 43071, 43073, 43080, 43093, 43721, 43740, 43064, 43140, 43143, 43151, 43153, 43162, 43315, 43317, 43320, 43321, 43325, 43334, 43338, 43349, 43350, 43103, 43113, 43116, 43117, 43145, 43146, 43156, 43164, 43007, 43029, 43036, 43040, 43041, 43045, 43067, 43077, 43344)
        then la.amount end) as CME,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and secondary_details.loan_app_id is null
        and mla.military_lending_account_search_status = 'noMatch'
        and til.borrower_zip_code in (83501, 83520, 83522, 83523, 83524, 83525, 83526, 83530, 83531, 83533, 83535, 83536, 83537, 83539, 83540, 83541, 83542, 83543, 83544, 83545, 83546, 83547, 83548, 83549, 83552, 83553, 83554, 83555, 83671, 83801, 83802, 83803, 83804, 83805, 83806, 83808, 83809, 83810, 83811, 83812, 83813, 83814, 83815, 83816, 83821, 83822, 83823, 83824, 83825, 83826, 83827, 83830, 83832, 83833, 83834, 83835, 83836, 83837, 83839, 83840, 83841, 83842, 83843, 83844, 83845, 83846, 83847, 83848, 83849, 83850, 83851, 83852, 83853, 83854, 83855, 83856, 83857, 83858, 83860, 83861, 83864, 83865, 83866, 83867, 83868, 83869, 83870, 83871, 83872, 83873, 83874, 83876, 83877, 97001, 97003, 97004, 97005, 97006, 97007, 97008, 97009, 97010, 97011, 97013, 97014, 97015, 97016, 97017, 97018, 97019, 97021, 97022, 97023, 97024, 97027, 97028, 97029, 97030, 97031, 97033, 97034, 97035, 97036, 97037, 97038, 97039, 97040, 97041, 97042, 97044, 97045, 97048, 97049, 97050, 97051, 97053, 97054, 97055, 97056, 97057, 97058, 97060, 97062, 97063, 97064, 97065, 97067, 97068, 97070, 97075, 97076, 97077, 97078, 97079, 97080, 97086, 97089, 97102, 97103, 97106, 97109, 97110, 97113, 97116, 97117, 97119, 97121, 97123, 97124, 97125, 97129, 97133, 97138, 97140, 97144, 97145, 97146, 97201, 97202, 97203, 97204, 97205, 97206, 97207, 97208, 97209, 97210, 97211, 97212, 97213, 97214, 97215, 97216, 97217, 97218, 97219, 97220, 97221, 97222, 97223, 97224, 97225, 97227, 97228, 97229, 97230, 97231, 97232, 97233, 97236, 97238, 97239, 97240, 97242, 97250, 97251, 97252, 97253, 97254, 97256, 97258, 97266, 97267, 97268, 97269, 97280, 97281, 97282, 97283, 97286, 97290, 97291, 97292, 97293, 97294, 97296, 97298, 97801, 97810, 97812, 97813, 97818, 97823, 97824, 97826, 97827, 97835, 97836, 97838, 97839, 97841, 97843, 97844, 97850, 97859, 97861, 97862, 97867, 98001, 98002, 98003, 98004, 98005, 98006, 98007, 98008, 98009, 98010, 98011, 98012, 98013, 98014, 98015, 98019, 98020, 98021, 98022, 98023, 98024, 98025, 98026, 98027, 98028, 98029, 98030, 98031, 98032, 98033, 98034, 98035, 98036, 98037, 98038, 98039, 98040, 98041, 98042, 98043, 98045, 98046, 98047, 98050, 98051, 98052, 98053, 98055, 98056, 98057, 98058, 98059, 98061, 98062, 98063, 98064, 98065, 98068, 98070, 98071, 98072, 98073, 98074, 98075, 98077, 98082, 98083, 98087, 98089, 98092, 98093, 98101, 98102, 98103, 98104, 98105, 98106, 98107, 98108, 98109, 98110, 98111, 98112, 98113, 98114, 98115, 98116, 98117, 98118, 98119, 98121, 98122, 98124, 98125, 98126, 98127, 98129, 98131, 98133, 98134, 98136, 98138, 98139, 98141, 98144, 98145, 98146, 98148, 98154, 98155, 98158, 98160, 98161, 98164, 98165, 98166, 98168, 98170, 98174, 98175, 98177, 98178, 98181, 98185, 98188, 98190, 98191, 98194, 98195, 98198, 98199, 98201, 98203, 98204, 98206, 98207, 98208, 98213, 98220, 98221, 98222, 98223, 98224, 98225, 98226, 98227, 98228, 98229, 98230, 98231, 98232, 98233, 98235, 98236, 98237, 98238, 98239, 98240, 98241, 98243, 98244, 98245, 98247, 98248, 98249, 98250, 98251, 98252, 98253, 98255, 98256, 98257, 98258, 98259, 98260, 98261, 98262, 98263, 98264, 98266, 98267, 98270, 98271, 98272, 98273, 98274, 98275, 98276, 98277, 98278, 98279, 98280, 98281, 98282, 98283, 98284, 98286, 98287, 98288, 98290, 98291, 98292, 98293, 98294, 98295, 98296, 98297, 98303, 98304, 98305, 98310, 98311, 98312, 98314, 98315, 98320, 98321, 98322, 98323, 98324, 98325, 98326, 98327, 98328, 98329, 98330, 98331, 98332, 98333, 98335, 98336, 98337, 98338, 98339, 98340, 98342, 98343, 98344, 98345, 98346, 98348, 98349, 98350, 98351, 98352, 98353, 98354, 98355, 98356, 98357, 98358, 98359, 98360, 98361, 98362, 98363, 98364, 98365, 98366, 98367, 98368, 98370, 98371, 98372, 98373, 98374, 98375, 98376, 98377, 98378, 98380, 98381, 98382, 98383, 98384, 98385, 98386, 98387, 98388, 98390, 98391, 98392, 98393, 98394, 98395, 98396, 98397, 98398, 98401, 98402, 98403, 98404, 98405, 98406, 98407, 98408, 98409, 98411, 98412, 98413, 98415, 98416, 98417, 98418, 98419, 98421, 98422, 98424, 98430, 98431, 98433, 98438, 98439, 98443, 98444, 98445, 98446, 98447, 98448, 98464, 98465, 98466, 98467, 98471, 98481, 98490, 98493, 98496, 98497, 98498, 98499, 98501, 98502, 98503, 98504, 98505, 98506, 98507, 98508, 98509, 98511, 98512, 98513, 98516, 98520, 98522, 98524, 98526, 98527, 98528, 98530, 98531, 98532, 98533, 98535, 98536, 98537, 98538, 98539, 98540, 98541, 98542, 98544, 98546, 98547, 98548, 98550, 98552, 98554, 98555, 98556, 98557, 98558, 98559, 98560, 98561, 98562, 98563, 98564, 98565, 98566, 98568, 98569, 98570, 98571, 98572, 98575, 98576, 98577, 98579, 98580, 98581, 98582, 98583, 98584, 98585, 98586, 98587, 98588, 98589, 98590, 98591, 98592, 98593, 98595, 98596, 98597, 98599, 98601, 98602, 98603, 98604, 98605, 98606, 98607, 98609, 98610, 98611, 98612, 98613, 98614, 98616, 98617, 98619, 98620, 98621, 98622, 98623, 98624, 98625, 98626, 98628, 98629, 98631, 98632, 98635, 98637, 98638, 98639, 98640, 98641, 98642, 98643, 98644, 98645, 98647, 98648, 98649, 98650, 98651, 98660, 98661, 98662, 98663, 98664, 98665, 98666, 98668, 98670, 98671, 98672, 98673, 98674, 98675, 98682, 98683, 98684, 98685, 98686, 98687, 98801, 98802, 98807, 98811, 98812, 98813, 98814, 98815, 98816, 98817, 98819, 98821, 98822, 98823, 98824, 98826, 98827, 98828, 98829, 98830, 98831, 98832, 98833, 98834, 98836, 98837, 98840, 98841, 98843, 98844, 98845, 98846, 98847, 98848, 98849, 98850, 98851, 98852, 98853, 98855, 98856, 98857, 98858, 98859, 98860, 98862, 98901, 98902, 98903, 98904, 98907, 98908, 98909, 98920, 98921, 98922, 98923, 98925, 98926, 98930, 98932, 98933, 98934, 98935, 98936, 98937, 98938, 98939, 98940, 98941, 98942, 98943, 98944, 98946, 98947, 98948, 98950, 98951, 98952, 98953, 99001, 99003, 99004, 99005, 99006, 99008, 99009, 99011, 99012, 99013, 99014, 99016, 99017, 99018, 99019, 99020, 99021, 99022, 99023, 99025, 99026, 99027, 99029, 99030, 99031, 99032, 99033, 99034, 99036, 99037, 99039, 99040, 99101, 99102, 99103, 99104, 99105, 99109, 99110, 99111, 99113, 99114, 99115, 99116, 99117, 99118, 99119, 99121, 99122, 99123, 99124, 99125, 99126, 99128, 99129, 99130, 99131, 99133, 99134, 99135, 99136, 99137, 99138, 99139, 99140, 99141, 99143, 99144, 99146, 99147, 99148, 99149, 99150, 99151, 99152, 99153, 99154, 99155, 99156, 99157, 99158, 99159, 99160, 99161, 99163, 99164, 99166, 99167, 99169, 99170, 99171, 99173, 99174, 99176, 99179, 99180, 99181, 99185, 99201, 99202, 99203, 99204, 99205, 99206, 99207, 99208, 99209, 99210, 99211, 99212, 99213, 99214, 99215, 99216, 99217, 99218, 99219, 99220, 99223, 99224, 99228, 99251, 99252, 99256, 99258, 99260, 99301, 99302, 99320, 99321, 99322, 99323, 99324, 99326, 99328, 99329, 99330, 99333, 99335, 99336, 99337, 99338, 99341, 99343, 99344, 99345, 99346, 99347, 99348, 99349, 99350, 99352, 99353, 99354, 99356, 99357, 99359, 99360, 99361, 99362, 99363, 99371, 99401, 99402, 99403)
        then la.amount end) as GESA,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 30000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and locc.post_loan_dti_stated <= .55 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (06457, 06450, 06451, 06416, 06480, 06409, 06412, 06413, 06417, 06419, 06422, 06423, 06424, 06426, 06438, 06441, 06442, 06455, 06469, 06475, 06481, 06498, 06405, 06410, 06512, 06437, 06443, 06471, 06473, 06492)
        then la.amount end) as seasons,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 16000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and locc.post_loan_dti_stated <= .50 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (19310, 19311, 19312, 19316, 19425, 19320, 19330, 19333, 19335, 19520, 19343, 19344, 19345, 19348, 19442, 19350, 19352, 19341, 19355, 19358, 19362, 19363, 19301, 19457, 19365, 19460, 19367, 19465, 19475, 19372, 19374, 19375, 19380, 19382, 19383, 19390)
        and (decisioning.s207a <0 or decisioning.s207a >=36 or decisioning.s207a is null) --mos since bk
        then la.amount end) as benchmark,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 30000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (07653, 07656, 10994, 10993, 10989, 10986, 10984, 10983, 10982, 10980, 10977, 10976, 10974, 10970, 10968, 10965, 10964, 10962, 10954, 10956, 10960, 10901, 10911, 10913, 10920, 10923, 10927, 10931, 10952, 07662, 07663, 07666, 07670, 07675, 07676, 07677, 07652, 07632, 07657, 07660, 07661, 07601, 07602, 07603, 07604, 07605, 07606, 07607, 07608, 07620, 07621, 07624, 07626, 07627, 07628, 07630, 07631, 07632, 07640, 07641, 07642, 07643, 07644, 07645, 07646, 07647, 07648, 07649, 07650)
        then la.amount end) as Palisades,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount >= 5000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and locc.post_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and secondary_details.loan_app_id is null
        and til.borrower_zip_code in (31337, 33004, 33008, 33009, 33010, 33012, 33013, 33014, 33015, 33016, 33018, 33019, 33020, 33021, 33022, 33023, 33024, 33025, 33026, 33027, 33028, 33029, 33030, 33031, 33032, 33033, 33034, 33035, 33039, 33054, 33055, 33056, 33060, 33061, 33062, 33063, 33064, 33065, 33066, 33067, 33068, 33069, 33071, 33072, 33073, 33074, 33075, 33076, 33077, 33081, 33082, 33083, 33084, 33093, 33097, 33109, 33122, 33125, 33126, 33127, 33128, 33129, 33130, 33131, 33132, 33133, 33134, 33135, 33136, 33138, 33139, 33140, 33141, 33142, 33143, 33144, 33145, 33146, 33147, 33149, 33150, 33154, 33155, 33156, 33158, 33160, 33161, 33162, 33165, 33166, 33167, 33168, 33169, 33170, 33172, 33173, 33174, 33175, 33176, 33177, 33178, 33178, 33179, 33181, 33182, 33183, 33184, 33185, 33186, 33187, 33188, 33189, 33192, 33193, 33194, 33196, 33301, 33302, 33303, 33304, 33306, 33307, 33308, 33309, 33310, 33311, 33311, 33312, 33313, 33314, 33315, 33316, 33317, 33318, 33319, 33320, 33321, 33322, 33323, 33324, 33325, 33326, 33327, 33328, 33329, 33329, 33330, 33331, 33332, 33334, 33335, 33338, 33340, 33345, 33346, 33348, 33349, 33351, 33355, 33359, 33388, 33394, 33401, 33403, 33404, 33405, 33406, 33407, 33408, 33409, 33410, 33411, 33412, 33413, 33414, 33415, 33417, 33418, 33426, 33428, 33431, 33432, 33433, 33434, 33435, 33436, 33437, 33441, 33442, 33443, 33444, 33445, 33446, 33449, 33458, 33460, 33461, 33462, 33463, 33467, 33469, 33472, 33473, 33477, 33478, 33480, 33480, 33483, 33484, 33486, 33487, 33496, 33498)
        then la.amount end) as Power,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 15000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (63005, 63013, 63014, 63015, 63037, 63039, 63041, 63055, 63056, 63060, 63061, 63068, 63069, 63072, 63073, 63077, 63079, 63080, 63084, 63089, 63090, 63091, 63010, 63012, 63015, 63016, 63019, 63020, 63023, 63025, 63026, 63028, 63030, 63041, 63047, 63048, 63049, 63050, 63051, 63052, 63053, 63057, 63061, 63065, 63066, 63069, 63070, 63072, 63087, 63627, 63301, 63302, 63303, 63304, 63332, 63338, 63341, 63346, 63348, 63357, 63365, 63366, 63367, 63368, 63373, 63376, 63385, 63386, 63104, 63147, 63150, 63101, 63103, 63102, 63106, 63116, 63115, 63113, 63139, 63120, 63118, 63109, 63108, 63107, 63112, 63111, 63110, 63178, 63179, 63177, 63169, 63171, 63197, 63199, 63195, 63180, 63188, 63158, 63160, 63157, 63155, 63156, 63164, 63166, 63163, 63134, 63132, 63138, 63137, 63135, 63133, 63136, 63167, 63145, 63151, 63146, 63141, 63140, 63144, 63143, 63131, 63033, 63034, 63031, 63032, 63038, 63043, 63044, 63040, 63042, 63011, 63017, 63005, 63006, 63021, 63025, 63026, 63022, 63024, 63124, 63125, 63122, 63123, 63126, 63129, 63130, 63127, 63128, 63088, 63099, 63045, 63074, 63105, 63119, 63121, 63114, 63117, 63104, 63147, 63150, 63101, 63103, 63102, 63106, 63116, 63115, 63113, 63139, 63120, 63118, 63109, 63108, 63107, 63112, 63111, 63110, 63178, 63179, 63177, 63169, 63171, 63197, 63199, 63195, 63180, 63188, 63158, 63160, 63157, 63155, 63156, 63164, 63166, 63163, 62063, 62031, 62037, 62030, 62022, 62028, 62052, 62060, 62058, 62002, 62234, 62095, 62097, 62061, 62001, 62040, 62046, 62294, 62249, 62281, 62048, 62090, 62035, 62025, 62062, 62067, 62034, 62026, 62024, 62084, 62087, 62010, 62018, 62021, 62074, 62240, 62243, 62232, 62239, 62258, 62260, 62264, 62254, 62255, 62257, 62208, 62220, 62207, 62205, 62206, 62225, 62226, 62223, 62221, 62222, 62269, 62071, 62202, 62059, 62201, 62203, 62285, 62282, 62204, 62289, 62279, 62298, 62248, 62244, 62295, 62236, 62256)
        then la.amount end) as electro,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (17109, 17070, 17302, 17309, 17311, 17312, 17313, 17314, 17315, 17317, 17318, 17319, 17321, 17322, 17323, 17327, 17329, 17331, 
        17332, 17333, 17334, 17335, 17339, 17342, 17345, 17347, 17349, 17352, 17355, 17356, 17358, 17360, 17361, 17362, 17363, 17364, 17365, 17366, 17368, 17370, 17371, 17401, 17402, 17403, 17404, 17405, 17406, 17407, 17408)
        then la.amount end) as heritage_valley,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 10000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .45
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (04915, 04921, 04922, 04438, 04941, 04848, 04949, 04849, 04951, 04952, 04354, 04973, 04974, 04981, 04986, 04987, 04988, 
        04496, 04401, 04410, 04411, 04412, 04417, 04419, 04422, 04928, 04427, 04930, 04932, 04430, 04933, 04428, 04434, 04435, 04939, 04418, 04444, 04429, 04448, 
        04449, 04450, 04451, 04453, 04455, 04456, 04457, 04459, 04460, 04461, 04462, 04953, 04489, 04468, 04469, 04473, 04474, 04475, 04765, 04969, 04487, 04777, 04488, 04493, 04495)
        then la.amount end) as changing_seasons, 
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (16845, 16851, 16852, 16853, 16854, 16856, 16859, 16860, 16864, 16865, 16866, 16868, 16870, 16872, 16874, 16875, 16877, 16882, 16666, 16677, 16801, 16802, 16803, 16820, 16823, 16826, 16827, 16828, 16829, 16832, 16835, 16841, 16844, 16611, 16621, 16622, 16623, 16634, 16638, 16647, 16652, 16654, 16657, 16660, 16669, 16674, 17213, 17215, 16683, 16685, 17229, 17239, 17243, 17249, 17253, 17255, 17260, 17264, 17052, 17060)
        then la.amount end) as spe, 
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 690
        and la.amount <= 30000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .35
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (59714, 59715, 59716, 59717, 59718, 59719, 59730, 59741, 59752, 59758, 59760, 59771, 59772, 59410, 59601, 59602, 59604, 
        59620, 59623, 59624, 59625, 59626, 59633, 59635, 59636, 59639, 59640, 59648, 59641, 59643, 59644, 59647, 59401, 59402, 59404, 59405, 59412, 59414, 59421, 
        59440, 59443, 59463, 59465, 59468, 59472, 59480, 59483, 59487, 59403, 59406, 59477, 59485, 59711, 59756, 59631, 59632, 59634, 59638, 59721, 59759, 59722, 
        59731, 59733, 59843, 59854, 59713, 59728, 59701, 59702, 59703, 59707, 59727, 59743, 59748, 59750, 59724, 59725, 59732, 59736, 59739, 59746, 59761, 59762, 
        59845, 59901, 59903, 59904, 59911, 59912, 59913, 59916, 59919, 59920, 59921, 59922, 59925, 59926, 59927, 59928, 59932, 59936, 59937, 59832, 59837, 59858, 59821, 59824, 59855, 59860, 59863, 59864, 59865, 59910, 59914, 59915, 59929, 59931, 59710, 59720, 59721, 59729, 59735, 59740, 59745, 59747, 59749, 59751, 59754, 59755, 59801, 59802, 59803, 59804, 59806, 59807, 59808, 59812, 59823, 59825, 59826, 59834, 59846, 59847, 59851, 59868, 59018, 59020, 59027, 59030, 59047, 59065, 59081, 59082, 59086, 59827, 59828, 59829, 59833, 59835, 59840, 59841, 59870, 59871, 59875, 59001, 59019, 59028, 59061, 59063, 59067, 59069, 59011, 59033, 59052, 59055, 59002, 59006, 59015, 59024, 59037, 59044, 59057, 59064, 59079, 59088, 59101, 59102, 59103, 59104, 59105, 59106, 59107, 59108, 59111, 59112, 59114, 59115, 59116)
        then la.amount end) as intrepid,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 740
        and la.amount <= 20000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (12223, 12235, 12225, 12226, 12237, 12238, 12236, 12224, 12231, 12230, 12233, 12232, 12228, 12227, 12229, 12234, 12239, 12255, 12257, 12249, 12250, 12288, 12469, 12260, 12261, 12248, 12242, 12243, 12240, 12241, 12246, 12247, 12244, 12245, 12222, 12085, 12107, 12084, 12067, 12077, 12143, 12147, 12128, 12110, 12120, 12041, 12045, 12023, 12007, 12009, 12055, 12059, 12054, 12046, 12047, 12158, 12208, 12209, 12207, 12205, 12206, 12214, 12220, 12212, 12210, 12211, 12186, 12189, 12183, 12159, 12161, 12203, 12204, 12202, 12193, 12201, 12094, 12090, 12089, 12123, 12133, 12153, 12154, 12144, 12138, 12140, 12082, 12057, 12052, 12040, 12062, 12061, 12057, 12033, 12121, 12022, 12018, 12028, 12024, 12063, 12185, 12182, 12196, 12198, 12156, 12180, 12169, 12181, 12168, 12854, 12873, 12865, 12832, 12838, 12837, 12834, 12861, 12848, 12809, 12849, 12828, 12827, 12887, 12816, 12839, 12819, 12841, 12821, 12028, 12823)
        then la.amount end) as school,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and (til.borrower_zip_code in (83824, 83830, 83851, 83861, 83866, 83870, 83804, 83809, 83811, 83813, 83821, 83822, 83825, 83836, 83840, 83841, 83848, 83852, 83856, 83860, 83864, 83865, 83801, 83803, 83810, 83814, 83815, 83816, 83833, 
        83835, 83842, 83854, 83858, 83869, 83876, 83877, 83535, 83537, 83806, 83823, 83832, 83834, 83843, 83844, 83855, 83857, 83871, 83872, 83523, 83543, 83548, 83536, 83555, 83501, 83524, 83540, 83545, 83555, 83802, 83808, 83812, 83837, 83839, 83846, 83849, 83850, 83867, 83868, 83873, 83874)
        or br.state in ('WASHINGTON','IDAHO','MONTANA','OREGON','ARIZONA','COLORADO','OHIO','TEXAS','NEW_YORK','NEW_JERSEY','ILLINOIS','PENNSYLVANIA','GEORGIA','VIRGINIA','MICHIGAN','MASSACHUSETTS','MARYLAND','NORTH_CAROLINA'))
        then la.amount end) as spokane,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 700
        and la.amount <= 25000
        and l.apr <= .229
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .50
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (94022, 94024, 94040, 94041, 94043, 94085, 94086, 94087, 94089, 94301, 94303, 94304, 94305, 94306, 95008, 95014, 95020, 95030, 95032, 95033, 95035, 95037, 95050, 95051, 95054, 95070, 95110, 95111, 95112, 95116, 95117, 95118, 95120, 95123, 95124, 95125, 95126, 95127, 95128, 95129, 95131, 95132, 95133, 95135, 95136, 95138, 95148, 94501, 94536, 94544, 94568, 94538, 94541, 94587, 94611, 94577, 94546, 94539, 94566, 94605, 94601, 94610, 94606, 94608, 94560, 94551, 94578, 94588, 94602, 94607, 94555, 94612, 94609, 94545, 94603, 94619, 94704, 94621, 94580, 95377, 94703, 94706, 94702, 94618, 94579, 94705, 95391, 94709, 94707, 94502, 94542, 94552, 94708, 94710, 94604, 94537, 94540, 94662, 94623, 94586, 94514, 94701, 94614, 94620, 94557, 94543, 94624, 94661, 94712, 94720, 94617, 94613, 94615, 94622, 94625, 94627, 94643, 94649, 94659, 94660, 94666, 95060, 95062, 95003, 95066, 95010, 95073, 95018, 95065, 95019, 95005, 95077, 95063, 95061, 95001, 95067, 95064, 95017, 95007, 95041, 95076, 93906, 93940, 93905, 93955, 93933, 93901, 93950, 93907, 93923, 93927, 93960, 93930, 93908, 93924, 95012, 93921, 93953, 93926, 93912, 93451, 95004, 93915, 93922, 93942, 93902, 93426, 95039, 93920, 93925, 93962, 93932, 93450, 93928, 93944, 93943, 93954)
        then la.amount end) as commonwealth,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 40000
        and l.apr <= .20
        and l.term in (24, 36, 48, 60)
        and locc.post_loan_dti_stated <= .50
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE','AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (60064, 60101, 60101, 60102, 60658, 60005, 60910, 61722, 60911, 46392, 60504, 60505, 46360, 47978, 60010, 60103, 60510, 46341, 46360, 60912, 60638, 60401, 60104, 60106, 60163, 60402, 46301, 60108, 60406, 60440, 60913, 46302, 60914, 60123, 60407, 60915, 60408, 60455, 60560, 60153, 47922, 47922, 60513, 60917, 60918, 60089, 60459, 60109, 60109, 46383, 60633, 46304, 60521, 47948, 60410, 60921, 60922, 46304, 60919, 60409, 60643, 60416, 60188, 47978, 60110, 60013, 60013, 46303, 60601, 60602, 60603, 60604, 60605, 60670, 60608, 60609, 60610, 60611, 60612, 60613, 60614, 60615, 60616, 60617, 60618, 60619, 60620, 60622, 60623, 60624, 60625, 60626, 60627, 60628, 60629, 60630, 60632, 60633, 60634, 60636, 60637, 60639, 60640, 60641, 60643, 60644, 60645, 60646, 60647, 60649, 60651, 60652, 60653, 60655, 60656, 60657, 60658, 60659, 60660, 60666, 60675, 60678, 60687, 60694, 60698, 60621, 60606, 60411, 61415, 60650, 60514, 47957, 60927, 60416, 46383, 47978, 46349, 60478, 60525, 60928, 60435, 60445, 60417, 46307, 60014, 60929, 60930, 60559, 46310, 60015, 46310, 60016, 60018, 60426, 60419, 60931, 60515, 60064, 60064, 60118, 46347, 60420, 46311, 46311, 46303, 46312, 60118, 60429, 60966, 60119, 60120, 60007, 60126, 60635, 60421, 60934, 47963, 60519, 60424, 60201, 60202, 60204, 60805, 60422, 60411, 47922, 46310, 60074, 60130, 60402, 61741, 47977, 60021, 47946, 60432, 60131, 60424, 46400, 46401, 46403, 46404, 46405, 46406, 46407, 46408, 46400, 46401, 46403, 46404, 46405, 46406, 46407, 46408, 60134, 47978, 60136, 60938, 60137, 60022, 60139, 60025, 60029, 47978, 60088, 46319, 46320, 46323, 46324, 46326, 46327, 60103, 60047, 46341, 46322, 60148, 60040, 60141, 46342, 60172, 60062, 60142, 60061, 60010, 60042, 60143, 60431, 60433, 60435, 60436, 60456, 60901, 60946, 60043, 47951, 60560, 46310, 60047, 46392, 46347, 46348, 46348, 60147, 60525, 60525, 60010, 60044, 46383, 60045, 60102, 60102, 46411, 46349, 60047, 46307, 60185, 60438, 46392, 60439, 46307, 47978, 60048, 60151, 60069, 60645, 60541, 60532, 60441, 60148, 60047, 46356, 60411, 60534, 60442, 60950, 60426, 60951, 60443, 60153, 60444, 60525, 47959, 60123, 46304, 47957, 60157, 60160, 60162, 60163, 60164, 60165, 46410, 60655, 60048, 46360, 60445, 46365, 47959, 60447, 60448, 60954, 60449, 47959, 60638, 47978, 47963, 60450, 60053, 60056, 60060, 46321, 60540, 46342, 47978, 60648, 60656, 60542, 60010, 46356, 47978, 60140, 60546, 60062, 60093, 60164, 60119, 60521, 60452, 60453, 60454, 60455, 60456, 60457, 60458, 60301, 60304, 60305, 60181, 46368, 60461, 60103, 60477, 60462, 60543, 46367, 60411, 60074, 60463, 60465, 60464, 60956, 60466, 60068, 47978, 47978, 60468, 47948, 60426, 60140, 60959, 60544, 60170, 60641, 47978, 46368, 46304, 60469, 60069, 60070, 60175, 60961, 47977, 47978, 47980, 60471, 60305, 60171, 60627, 46348, 60546, 60015, 60472, 60436, 60008, 60414, 46372, 60172, 60018, 46373, 46374, 60411, 61769, 60172, 46375, 60176, 46376, 47995, 47995, 46377, 60966, 60436, 60076, 60118, 60411, 60177, 60148, 60195, 60177, 46383, 60473, 47978, 60474, 60174, 60964, 60174, 60475, 60402, 60165, 46392, 60107, 46383, 46383, 60501, 47041, 47978, 60082, 46380, 60476, 60477, 60010, 46360, 60969, 60466, 60137, 46383, 60061, 60181, 46310, 46310, 46390, 60555, 60175, 46360, 60970, 60084, 60184, 60185, 60118, 46391, 46392, 60187, 46342, 60090, 46394, 60091, 46996, 60190, 60093, 47995, 60191, 60098, 47978)
        then la.amount end) as illiana,
sum(case when
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72)
        and primary_details.pre_loan_dti_stated <= .4
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE')
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (76008, 76108, 76020, 76126, 76036, 76123, 76132, 76116, 76028, 76140, 76133, 76109, 76134, 76122, 76115, 76129, 76107, 76110, 76102, 76119, 76104, 76105, 76103, 76135, 76127, 76114, 76071, 76179, 76164, 76106, 76131, 76111, 76117, 76137, 76052, 76244, 76177, 76063, 76001, 76060, 76016, 76112, 76017, 76015, 76013, 76120, 76012, 76002, 75054, 76018, 76014, 76019, 76010, 76011, 76005, 75052, 75051, 76118, 76180, 76148, 76182, 76053, 76022, 76054, 76021, 76034, 76248, 76262, 76092, 76006, 76040, 76039, 76155, 75050, 75038, 76051, 75022, 75067, 76078, 76234, 76247, 76259, 76249, 76226, 76207, 76205, 76201, 75028, 75077, 76210, 75065, 76209, 76208, 76266, 76272, 75104, 75137, 75115, 75249, 75236, 75116, 75237, 75211, 75233, 75154, 75134, 75146, 75232, 75224, 75208, 75241, 75216, 75203, 75215, 75061, 75060, 75062, 75039, 75212, 75247, 75220, 75229, 75063, 75019, 75006, 75234, 75010, 75007, 75390, 75207, 75202, 75242, 75270, 75201, 75219, 75235, 75209, 75205, 75226, 75246, 75204, 75206, 75210, 75223, 75214, 75275, 75225, 75231, 75244, 75001, 75254, 75287, 75230, 75251, 75240, 75243, 75248, 75252, 75080, 75075, 75172, 75125, 75141, 75217, 75253, 75180, 75159, 75181, 75227, 75228, 75218, 75238, 75149, 75150, 75041, 75081, 75042, 75044, 75040, 75082, 75094, 75182, 75043, 75088, 75089, 75048, 75098, 75057, 75056, 75034, 75068, 76227, 75093, 75024, 75023, 75025, 75035, 75033, 75078, 76258, 75009, 75074, 75013, 75002, 75070, 75071, 75407, 75069, 75454, 75409, 75495, 75087, 75166, 75189, 75121, 75173, 75442, 75164, 75424, 75452, 89019, 89004, 89161, 89018, 89166, 89149, 89138, 89070, 89124, 89039, 89046, 89029, 89026, 89054, 89002, 89179, 89178, 89148, 89135, 89147, 89117, 89113, 89145, 89146, 89044, 89141, 89139, 89183, 89123, 89052, 89074, 89118, 89158, 89119, 89103, 89107, 89102, 89109, 89120, 89169, 89155, 89101, 89121, 89104, 89012, 89014, 89110, 89122, 89142, 89011, 89015, 89144, 89134, 89129, 89128, 89108, 89130, 89131, 89143, 89106, 89032, 89031, 89084, 89030, 89086, 89081, 89085, 89087, 89115, 89156, 89165, 89191, 89005, 89040, 89025, 89021, 89008, 89007, 89027, 89034, 48178, 48111, 48164, 48170, 48168, 48167, 48188, 48187, 48184, 48186, 48185, 48375, 48150, 48154, 48335, 48152, 48380, 48357, 48430, 48439, 48165, 48381, 48393, 48374, 48382, 48356, 48383, 48377, 48390, 48331, 48322, 48324, 48323, 48386, 48327, 48346, 48329, 48442, 48350, 48348, 48462, 48174, 48134, 48173, 48183, 48193, 48195, 48138, 48242, 48135, 48141, 48180, 48125, 48124, 48128, 48336, 48240, 48127, 48239, 48223, 48033, 48219, 48101, 48146, 48122, 48126, 48120, 48192, 48229, 48217, 48218, 48209, 48228, 48227, 48075, 48235, 48237, 48204, 48238, 48210, 48206, 48221, 48220, 48203, 48216, 48226, 48243, 48208, 48202, 48201, 48211, 48030, 48212, 48234, 48207, 48214, 48213, 48205, 48215, 48230, 48224, 48021, 48225, 48236, 48080, 48334, 48034, 48025, 48301, 48302, 48304, 48320, 48328, 48326, 48341, 48342, 48340, 48359, 48076, 48072, 48070, 48009, 48084, 48069, 48067, 48073, 48071, 48017, 48083, 48098, 48309, 48085, 48307, 48306, 48360, 48362, 48371, 48370, 48363, 48366, 48367, 48091, 48397, 48092, 48310, 48015, 48093, 48089, 48088, 48312, 48314, 48317, 48316, 48313, 48315, 48066, 48026, 48035, 48081, 48082, 48043, 48038, 48036, 48044, 48042, 48094, 48095, 48065, 48096, 48005, 48045, 48051, 48047, 48048, 48050, 48062, 48041, 22639, 20184, 22620, 20135, 20118, 20117, 20105, 20175, 20141, 20132, 20158, 20129, 20197, 20180, 20111, 20124, 22039, 22015, 22079, 22153, 22152, 22060, 22150, 22315, 22309, 22310, 22306, 22303, 22308, 22307, 20120, 20152, 20166, 20148, 20147, 20121, 20151, 20171, 22035, 22030, 22033, 20192, 20170, 20191, 20190, 20194, 20164, 20165, 20176, 22032, 22124, 22185, 22181, 22031, 22151, 22003, 22180, 22027, 22182, 22066, 22102, 22312, 22044, 22041, 22042, 22046, 22043, 22213, 22304, 22311, 22302, 22206, 22207, 22101, 48418, 48429, 48449, 48460, 48457, 48417, 48451, 48436, 48473, 48554, 48430, 48553, 48507, 48551, 48439, 48529, 48442, 48519, 48411, 48462, 48438, 48433, 48532, 48503, 48504, 48502, 48505, 48458, 48420, 48415, 48509, 48506, 48437, 48423, 48463, 48421, 48464, 48746)
        then la.amount end) as intouch,
sum(case when
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 30000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72,84)
        and primary_details.pre_loan_dti_stated <= .4
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE')
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (60004, 60005, 60006, 60007, 60008, 60009, 60011, 60038, 60055, 60056, 60067, 60068, 60070, 60074, 60078, 60082, 60090, 60094, 60095, 60104, 60107, 60133, 60141, 60153, 60154, 60155, 60159, 60162, 60163, 60164, 60165, 60168, 60169, 60171, 60173, 60176, 60179, 60192, 60193, 60194, 60195, 60196, 60111, 60112, 60115, 60129, 60135, 60145, 60146, 60150, 60178, 60520, 60548, 60550, 60556, 60101, 60103, 60105, 60106, 60108, 60116, 60117, 60122, 60125, 60126, 60128, 60132, 60137, 60138, 60139, 60143, 60148, 60157, 60172, 60181, 60184, 60185, 60186, 60187, 60188, 60189, 60190, 60191, 60197, 60199, 60399, 60502, 60504, 60514, 60515, 60516, 60517, 60519, 60521, 60522, 60523, 60527, 60532, 60540, 60555, 60559, 60561, 60563, 60565, 60566, 60567, 60570, 60597, 60599, 60407, 60416, 60424, 60437, 60444, 60447, 60450, 60474, 60479, 60109, 60110, 60118, 60119, 60120, 60121, 60123, 60124, 60134, 60136, 60140, 60144, 60147, 60151, 60170, 60174, 60175, 60177, 60183, 60505, 60506, 60507, 60510, 60511, 60539, 60542, 60554, 60568, 60572, 60598, 60512, 60536, 60538, 60541, 60543, 60545, 60560, 60001, 60012, 60013, 60014, 60021, 60033, 60034, 60039, 60042, 60050, 60051, 60071, 60072, 60081, 60097, 60098, 60102, 60142, 60152, 60156, 60180, 60401, 60403, 60404, 60408, 60410, 60417, 60421, 60423, 60431, 60432, 60433, 60434, 60435, 60436, 60440, 60441, 60442, 60446, 60448, 60449, 60451, 60468, 60475, 60481, 60484, 60490, 60491, 60503, 60544, 60564, 60585, 60586)
        then la.amount end) as kct,
sum(case when
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72)
        and primary_details.pre_loan_dti_stated <= .4
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE')
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (32816, 32820, 32825, 32826, 32828, 32831, 32833, 32834, 32878, 32792, 32885, 32703, 32704, 32712, 32807, 32821, 32809, 32812, 32709, 32710, 32751, 32809, 32839, 32703, 32896, 32836, 34734, 32887, 32818, 32887, 34740, 32830, 32830, 32810, 32751, 32794, 34740, 34760, 34787, 34761, 32801, 32802, 32803, 32804, 32805, 32806, 32807, 32808, 32809, 32810, 32811, 32812, 32814, 32816, 32817, 32818, 32819, 32820, 32821, 32822, 32824, 32825, 32826, 32827, 32828, 32829, 32830, 32831, 32832, 32833, 32834, 32835, 32836, 32837, 32839, 32853, 32854, 32855, 32856, 32857, 32858, 32859, 32860, 32861, 32862, 32867, 32868, 32869, 32872, 32877, 32878, 32885, 32886, 32887, 32891, 32896, 32897, 32811, 32809, 32839, 32808, 32818, 32768, 32819, 32897, 32891, 32777, 32816, 32817, 32816, 32886, 34786, 34777, 34778, 34787, 32789, 32790, 32792, 32793, 32798, 34743, 34743, 34747, 34773, 33848, 33848, 34739, 34744, 34741, 34742, 34743, 34744, 34745, 34746, 34747, 34758, 34771, 34771, 34758, 34747, 34769, 34770, 34771, 34772, 34773, 32701, 32714, 32715, 32716, 32701, 32714, 32715, 32716, 32707, 32708, 32718, 32719, 32730, 32766, 32730, 32714, 32732, 32733, 32746, 32746, 32795, 32747, 32750, 32752, 32779, 32791, 32745, 32799, 32762, 32765, 32766, 32771, 32772, 32773, 32779, 32791, 32779, 32791, 32708, 32719, 32708, 32719, 32702, 34705, 32102, 34756, 34711, 34712, 34713, 34714, 34715, 32778, 32784, 32726, 32727, 32736, 34729, 34731, 34731, 32735, 34736, 34737, 34788, 34737, 34797, 34737, 34797, 32158, 32159, 34748, 34749, 34788, 34789, 34753, 34715, 34755, 34729, 32756, 32757, 32776, 32776, 34762, 32767, 32776, 32778, 32159, 32784, 34797)
        then la.amount end) as mccoy,    
sum(case when
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72,84)
        and primary_details.pre_loan_dti_stated <= .4
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE')
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (19701, 19713, 19703, 19706, 19707, 19709, 19710, 19720, 19711, 19716, 19717, 19702, 19730, 19731, 19732, 19733, 19734, 19735, 19736, 19801, 19802, 19803, 19804, 19805, 19806, 19807, 19808, 19809, 19810, 19901, 19902, 19904, 19934, 19936, 19938, 19943, 19946, 19952, 19953, 19954, 19955, 19962, 19964, 19977, 19979, 21901, 21902, 21903, 21904, 21911, 21912, 21913, 21914, 21915, 21916, 21917, 21918, 21919, 21920, 21921, 21930)
        then la.amount end) as dexsta,  
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and secondary_details.loan_app_id is null
        and til.borrower_zip_code in (18012, 18030, 18071, 18210, 18212, 18229, 18230, 18232, 18235, 18240, 18244, 18250, 18254, 18255, 18624, 07820, 07823, 07825, 07829, 07831, 07832, 07833, 07838, 07840, 07844, 07846, 07863, 07865, 07880, 07882, 08808, 08865, 08886, 18010, 18011, 18013, 18013, 18013, 18014, 18014, 18015, 18015, 18015, 18015, 18015, 18016, 18017, 18017, 18017, 18018, 18020, 18025, 18031, 18031, 18032, 18034, 18034, 18035, 18035, 18036, 18036, 18036, 18037, 18038, 18038, 18038, 18040, 18041, 18042, 18042, 18043, 18044, 18045, 18045, 18046, 18049, 18049, 18049, 18050, 18051, 18051, 18051, 18052, 18052, 18053, 18053, 18053, 18055, 18055, 18059, 18060, 18062, 18062, 18063, 18064, 18064, 18064, 18064, 18065, 18065, 18066, 18066, 18066, 18066, 18066, 18067, 18067, 18067, 18067, 18068, 18069, 18069, 18069, 18072, 18072, 18078, 18078, 18078, 18079, 18079, 18080, 18080, 18083, 18085, 18086, 18086, 18087, 18088, 18088, 18091, 18091, 18091, 18092, 18092, 18098, 18099, 18101, 18102, 18103, 18103, 18103, 18104, 18104, 18104, 18105, 18106, 18109, 18109, 18175, 18193, 18195, 18343, 18351, 19529, 19529)
        then la.amount end) as people_first,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 40000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and locc.post_loan_dti_stated <= .50
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (07002, 07029, 07030, 07032, 07047, 07086, 07087, 07093, 07094, 07302, 07303, 07304, 07305, 07306, 07307, 07308, 07310, 07311)
        then la.amount end) as liberty_savings,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (77001, 77002, 77003, 77004, 77005, 77006, 77007, 77008, 77009, 77010, 77011, 77012, 77013, 77014, 77015, 77016, 77017, 77018, 77019, 77020, 77021, 77022, 77023, 77024, 77025, 77026, 77027, 77028, 77029, 77030, 77031, 77032, 77033, 77034, 77035, 77036, 77037, 77038, 77039, 77040, 77041, 77042, 77043, 77044, 77045, 77046, 77047, 77048, 77049, 77050, 77051, 77052, 77053, 77054, 77055, 77056, 77057, 77058, 77059, 77060, 77061, 77062, 77063, 77064, 77065, 77066, 77067, 77068, 77069, 77070, 77071, 77072, 77073, 77074, 77075, 77076, 77077, 77078, 77079, 77080, 77081, 77082, 77083, 77084, 77085, 77086, 77087, 77088, 77089, 77090, 77091, 77092, 77093, 77094, 77095, 77096, 77097, 77098, 77099, 77201, 77202, 77203, 77204, 77205, 77206, 77207, 77208, 77209, 77210, 77212, 77213, 77215, 77216, 77217, 77218, 77219, 77220, 77221, 77222, 77223, 77224, 77225, 77226, 77227, 77228, 77229, 77230, 77231, 77233, 77234, 77235, 77236, 77237, 77238, 77240, 77241, 77242, 77243, 77244, 77245, 77246, 77247, 77248, 77249, 77250, 77251, 77252, 77253, 77254, 77255, 77256, 77257, 77258, 77259, 77260, 77261, 77262, 77263, 77265, 77266, 77267, 77268, 77269, 77270, 77271, 77272, 77273, 77274, 77275, 77276, 77277, 77278, 77279, 77280, 77282, 77284, 77285, 77286, 77287, 77288, 77289, 77290, 77291, 77292, 77293, 77294, 77296, 77297, 77298, 77299, 77301, 77302, 77303, 77304, 77305, 77306, 77315, 77316, 77318, 77325, 77333, 77336, 77338, 77339, 77345, 77346, 77347, 77353, 77354, 77355, 77356, 77357, 77362, 77365, 77372, 77373, 77377, 77378, 77379, 77380, 77381, 77382, 77383, 77384, 77385, 77386, 77387, 77388, 77389, 77393, 77396, 77401, 77402, 77406, 77407, 77410, 77411, 77413, 77417, 77423, 77429, 77433, 77441, 77444, 77447, 77449, 77450, 77451, 77459, 77461, 77464, 77469, 77471, 77476, 77477, 77478, 77479, 77481, 77484, 77485, 77487, 77489, 77491, 77492, 77493, 77494, 77496, 77497, 77498, 77501, 77502, 77503, 77504, 77505, 77506, 77507, 77508, 77510, 77511, 77512, 77517, 77518, 77520, 77521, 77523, 77530, 77532, 77535, 77536, 77539, 77545, 77546, 77547, 77549, 77562, 77563, 77565, 77568, 77571, 77572, 77573, 77574, 77578, 77581, 77583, 77584, 77586, 77587, 77588, 77590, 77591, 77598)
        then la.amount end) as texas_bay,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (11003, 11010, 11020, 11021, 11022, 11023, 11024, 11030, 11040, 11050, 11051, 11501, 11507, 11509, 11510, 11514, 11516, 11518, 11520, 11530, 11531, 11542, 11545, 11547, 11548, 11549, 11550, 11551, 11552, 11553, 11554, 11557, 11558, 11559, 11560, 11561, 11563, 11565, 11566, 11568, 11569, 11570, 11571, 11572, 11575, 11576, 11577, 11579, 11580, 11581, 11582, 11590, 11596, 11598, 11709, 11710, 11714, 11732, 11753, 11756, 11758, 11762, 11765, 11771, 11773, 11783, 11791, 11793, 11797, 11801, 11802, 11803, 11804, 11853, 11701, 11702, 11703, 11704, 11705, 11706, 11713, 11715, 11716, 11717, 11718, 11719, 11720, 11721, 11722, 11724, 11725, 11726, 11727, 11729, 11730, 11731, 11733, 11735, 11738, 11739, 11740, 11741, 11742, 11743, 11746, 11747, 11749, 11751, 11752, 11754, 11755, 11757, 11763, 11764, 11766, 11767, 11768, 11769, 11770, 11772, 11775, 11776, 11777, 11778, 11779, 11780, 11782, 11784, 11786, 11787, 11788, 11789, 11790, 11792, 11794, 11795, 11796, 11798, 11901, 11930, 11931, 11932, 11933, 11934, 11935, 11937, 11939, 11940, 11941, 11942, 11944, 11946, 11947, 11948, 11949, 11950, 11951, 11952, 11953, 11954, 11955, 11956, 11957, 11958, 11959, 11960, 11961, 11962, 11967, 11970, 11971, 11972, 11975, 11976, 11977, 11978, 11980, 00501, 00544)
        then la.amount end) as jovia,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (19102, 19103, 19104, 19106, 19107, 19109, 19111, 19112, 19114, 19115, 19116, 19118, 19119, 19120, 19121, 19122, 19123, 19124, 19125, 19126, 19127, 19128, 19129, 19130, 19131, 19132, 19133, 19134, 19135, 19136, 19137, 19138, 19139, 19140, 19141, 19142, 19143, 19144, 19145, 19146, 19147, 19148, 19149, 19150, 19151, 19152, 19153, 19154, 17814, 17815, 17820, 17846, 17858, 17859, 17878, 17888, 17920, 18603, 18631)
        then la.amount end) as Philadelphia,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 30000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (54115, 54126, 54155, 54162, 54173, 54180, 54208, 54229, 54301, 54302, 54303, 54304, 54311, 54313, 54344, 54106, 54113, 54130, 54136, 54140, 54165, 54170, 54911, 54913, 54914, 54915, 54919, 54922, 54942, 54944, 53014, 53061, 53062, 54110, 54123, 54129, 54169, 53015, 53042, 53063, 54220, 54227, 54228, 54230, 54241, 54245, 54247, 54956, 54952, 54956, 54901, 54902, 54904, 54947, 54963, 54964, 54986)
        then la.amount end) as Unison,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 700
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72)
        and primary_details.pre_loan_dti_stated <= .30
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and secondary_details.loan_app_id is null
        and til.borrower_zip_code in (32233, 32202, 32204, 32205, 32206, 32207, 32208, 32209, 32210, 32211, 32212, 32216, 32217, 32218, 32219, 32220, 32221, 32222, 32223, 32224, 32225, 32226, 32227, 32234, 32244, 32246, 32254, 32256, 32257, 32258, 32277, 32228, 32250, 32266, 32073, 32040, 32234, 32063, 32003, 32043, 32234, 32656, 32068, 32065, 32073, 32079, 32091, 32009, 32011, 32034, 32046, 32234, 32097, 32033, 32145, 32224, 32081, 32082, 32080, 32084, 32086, 32092, 32095, 32259)
        then la.amount end) as Alive,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (17101, 17335, 17334, 17415, 17354, 17332, 17333, 17358, 17312, 17355, 17311, 17323, 17342, 17371, 17317, 17318, 17405, 17352, 17309, 17407, 17321, 17329, 17365, 17302, 17364, 17301, 17366, 17322, 17314, 17370, 17360, 17347, 17361, 17339, 17327, 17345, 17349, 17316, 17363, 17319, 17313, 17362, 17401, 17070, 17019, 17356, 17408, 17406, 17315, 17402, 17404, 17403, 17331, 17071, 17069, 17037, 17006, 17021, 17024, 17047, 17040, 17045, 17062, 17068, 17090, 17053, 17074, 17039, 17041, 17085, 17083, 17077, 17016, 17088, 17064, 17038, 17003, 17046, 17042, 17107, 17120, 17121, 17177, 17140, 17130, 17129, 17127, 17126, 17125, 17124, 17123, 17122, 17128, 17105, 17080, 17005, 17108, 17978, 17097, 17030, 17106, 17098, 17034, 17023, 17980, 17028, 17048, 17018, 17101, 17061, 17043, 17032, 17020, 17102, 17113, 17103, 17033, 17104, 17057, 17078, 17036, 17109, 17110, 17111, 17112, 17008, 17375, 17012, 17089, 17325, 17350, 17340, 17320, 17372, 17344, 17353, 17304, 17303, 17306, 17310, 17343, 17337, 17326, 17055, 17050, 17013, 17011, 17257, 17015, 17025, 17241, 17007, 17307, 17065, 17324, 17240, 17266, 17072, 17093, 17001, 17081, 17027, 17091)
        then la.amount end) as new_cumberland,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 20000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (04003, 04009, 04011, 04013, 04015, 04017, 04019, 04021, 04024, 04029, 04039, 04040, 04053, 04055, 04057, 04062, 04066, 04069, 04070, 04071, 04074, 04075, 04077, 04078, 04079, 04082, 04091, 04092, 04096, 04097, 04101, 04102, 04105, 04106, 04107, 04108, 04109, 04110, 04112, 04260, 04270, 04259, 04265, 04284, 04330, 04343, 04344, 04347, 04349, 04350, 04352, 04355, 04358, 04359, 04360, 04361, 04363, 04364, 04901, 04910, 04917, 04918, 04926, 04927, 04935, 04959, 04962, 04963, 04989, 04008, 04067, 04086, 04287, 04357, 04530, 04546, 04548, 04562, 04565, 04567, 04579)
        then la.amount end) as trademark,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 20000
        and l.apr <= .36
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (85602, 85603, 85605, 85606, 85607, 85608, 85655, 85609, 85610, 85613, 85670, 85615, 85616, 85617, 85620, 85625, 85626, 85627, 85630, 85632, 85635, 85636, 85650, 85671, 85638, 85643, 85644, 86015, 86020, 86001, 86002, 86003, 86004, 86011, 85931, 86022, 86023, 86016, 86024, 86053, 86035, 86036, 86038, 86017, 86052, 86040, 86018, 86339, 86435, 86044, 86045, 86046, 85532, 85501, 85502, 85235, 85539, 85541, 85547, 85542, 85544, 85545, 85550, 85553, 85292, 85554, 85320, 85322, 85323, 85326, 85396, 85377, 85329, 85327, 85331, 85224, 85225, 85226, 85244, 85246, 85248, 85249, 85227, 85335, 85264, 85268, 85269, 85337, 85233, 85234, 85296, 85297, 85299, 85301, 85302, 85303, 85304, 85305, 85306, 85307, 85308, 85310, 85311, 85312, 85313, 85318, 85309, 85338, 85236, 85339, 85340, 85201, 85202, 85203, 85204, 85205, 85206, 85207, 85208, 85209, 85210, 85211, 85212, 85213, 85214, 85215, 85216, 85274, 85275, 85277, 85342, 85087, 85343, 85253, 85345, 85380, 85381, 85382, 85383, 85385, 85001, 85002, 85003, 85004, 85005, 85006, 85007, 85008, 85009, 85010, 85011, 85012, 85013, 85014, 85015, 85016, 85017, 85018, 85019, 85020, 85021, 85022, 85023, 85024, 85025, 85026, 85027, 85028, 85029, 85030, 85031, 85032, 85033, 85034, 85035, 85036, 85037, 85038, 85039, 85040, 85041, 85042, 85043, 85044, 85045, 85046, 85048, 85050, 85051, 85053, 85054, 85055, 85060, 85061, 85062, 85063, 85064, 85065, 85066, 85067, 85068, 85069, 85070, 85071, 85072, 85073, 85074, 85075, 85076, 85077, 85078, 85079, 85080, 85082, 85085, 85086, 85098, 85099, 85242, 85263, 85250, 85251, 85252, 85254, 85255, 85256, 85257, 85258, 85259, 85260, 85261, 85262, 85266, 85267, 85271, 85351, 85372, 85373, 85375, 85376, 85374, 85378, 85379, 85387, 85388, 85280, 85281, 85282, 85283, 85284, 85285, 85287, 85289, 85353, 85354, 85290, 85355, 85358, 85390, 85361, 85363, 86429, 86430, 86439, 86442, 86426, 86427, 86440, 86446, 86431, 86021, 86441, 86413, 86411, 86412, 86401, 86402, 86409, 86403, 86404, 86405, 86406, 86432, 86444, 86433, 86434, 86443, 86436, 86437, 85360, 86445, 86438, 85321, 85601, 85738, 85652, 85614, 85622, 85341, 85653, 85619, 85654, 85629, 85633, 85634, 85639, 85701, 85702, 85703, 85704, 85705, 85706, 85707, 85708, 85709, 85710, 85711, 85712, 85713, 85714, 85715, 85716, 85717, 85718, 85719, 85720, 85721, 85722, 85723, 85724, 85725, 85726, 85728, 85730, 85731, 85732, 85733, 85734, 85735, 85736, 85737, 85739, 85740, 85741, 85742, 85743, 85744, 85745, 85746, 85747, 85748, 85749, 85750, 85751, 85752, 85754, 85755, 85757, 85775, 85777, 85641, 85217, 85218, 85219, 85220, 85278, 85223, 85221, 85222, 85230, 85228, 85231, 85232, 85279, 85237, 85618, 85239, 85623, 85241, 85243, 85245, 85247, 85631, 85272, 85273, 85291, 85645, 85662, 86320, 86321, 85324, 86322, 86323, 86324, 85332, 86325, 86326, 86343, 86327, 86329, 86330, 86331, 86332, 86342, 86333, 86334, 86301, 86302, 86303, 86304, 86305, 86313, 86312, 86314, 86335, 86336, 86340, 86341, 86351, 86337, 86338, 85362)
        then la.amount end) as cu_west,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 640
        and la.amount <= 20000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (77520, 77521, 77401, 77530, 77532, 77429, 77433, 77536, 77546, 77547, 77562, 77447, 77002, 77003, 77004, 77005, 77006, 77007, 77008, 77009, 77010, 77011, 77012, 77013, 77014, 77015, 77016, 77017, 77018, 77019, 77020, 77021, 77022, 77023, 77024, 77025, 77026, 77027, 77028, 77029, 77030, 77031, 77032, 77033, 77034, 77035, 77036, 77037, 77038, 77039, 77040, 77041, 77042, 77043, 77044, 77045, 77046, 77047, 77048, 77049, 77050, 77051, 77053, 77054, 77055, 77056, 77057, 77058, 77059, 77060, 77061, 77062, 77063, 77064, 77065, 77066, 77067, 77068, 77069, 77070, 77071, 77072, 77073, 77074, 77075, 77076, 77077, 77078, 77079, 77080, 77081, 77082, 77083, 77084, 77085, 77086, 77087, 77088, 77089, 77090, 77091, 77092, 77093, 77094, 77095, 77096, 77098, 77099, 77201, 77336, 77338, 77346, 77396, 77449, 77450, 77493, 77494, 77339, 77345, 77571, 77489, 77357, 77502, 77503, 77504, 77505, 77506, 77507, 77581, 77365, 77586, 77587, 77373, 77379, 77388, 77389, 77477, 77375, 77377, 77484, 77598, 77833, 77835, 78932, 77426, 78946, 77868, 77880, 77836, 76567, 77878, 77879, 77853, 78621, 78942, 78946, 78947, 78948, 78650, 78659, 78932, 78938, 78940, 78941, 78942, 78945, 78946, 78949, 77418, 78931, 77833, 77835, 78933, 77426, 78940, 78944, 78950, 78954, 77473, 77474, 77485, 77423, 77445, 77447, 77493, 77494, 77355, 77868, 77466, 77363, 77446, 77484, 77801, 77802, 77803, 77807, 77808, 77840, 77845, 77859, 77868, 77514, 77521, 77523, 77535, 77560, 77575, 77580, 77661, 77597, 77665, 77417, 77423, 77430, 77435, 77545, 77441, 77444, 77053, 77083, 77085, 77099, 77450, 77493, 77494, 77451, 77459, 77489, 77461, 77464, 77584, 77406, 77407, 77469, 77471, 77583, 77476, 77477, 77478, 77479, 77498, 77481, 77485, 77830, 77831, 77861, 77356, 77868, 77363, 77873, 77876, 77484, 77327, 77328, 77533, 77535, 77538, 77560, 77561, 77564, 77575, 77368, 77369, 77371, 77372, 77414, 77419, 77415, 77428, 77440, 77456, 77457, 77458, 77465, 77468, 77480, 77482, 77483, 77328, 77301, 77302, 77303, 77304, 77306, 77384, 77385, 77447, 77339, 77354, 77355, 77316, 77356, 77357, 77358, 77362, 77365, 77873, 77372, 77380, 77381, 77382, 77386, 77318, 77378, 77420, 77432, 77434, 77435, 77436, 77437, 77443, 77448, 77453, 77454, 77455, 77467, 77485, 77488)
        then la.amount end) as acutx,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40    
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (60004, 60005, 60007, 60008, 60016, 60018, 60022, 60025, 60026, 60029, 60043, 60053, 60056, 60062, 60067, 60068, 60070, 60074, 60076, 60077, 60082, 60090, 60091, 60093, 60104, 60107, 60120, 60130, 60131, 60141, 60153, 60154, 60155, 60160, 60162, 60163, 60164, 60165, 60169, 60171, 60173, 60176, 60192, 60193, 60194, 60195, 60201, 60202, 60203, 60301, 60302, 60304, 60305, 60402, 60456, 60458, 60459, 60501, 60513, 60525, 60526, 60534, 60546, 60558, 60601, 60602, 60603, 60604, 60605, 60606, 60607, 60608, 60609, 60610, 60611, 60612, 60613, 60614, 60615, 60616, 60618, 60619, 60620, 60621, 60622, 60623, 60624, 60625, 60626, 60629, 60630, 60631, 60632, 60634, 60636, 60637, 60638, 60639, 60640, 60641, 60644, 60645, 60646, 60647, 60649, 60651, 60652, 60653, 60654, 60656, 60657, 60659, 60660, 60661, 60666, 60706, 60707, 60712, 60714, 60804, 60453, 60455, 60457, 60480, 60617, 60805, 60101, 60103, 60106, 60108, 60126, 60137, 60139, 60143, 60148, 60157, 60172, 60181, 60184, 60185, 60187, 60188, 60189, 60190, 60191, 60502, 60504, 60514, 60515, 60516, 60517, 60519, 60521, 60523, 60527, 60532, 60540, 60555, 60559, 60561, 60563, 60565, 60109, 60110, 60118, 60119, 60120, 60123, 60124, 60134, 60136, 60140, 60144, 60151, 60174, 60175, 60177, 60505, 60506, 60510, 60511, 60539, 60542, 60554, 53104, 53140, 53142, 53143, 53144, 53158, 53168, 53170, 53179, 53181, 53192, 60002, 60010, 60015, 60020, 60030, 60031, 60035, 60040, 60041, 60042, 60044, 60045, 60046, 60047, 60048, 60060, 60061, 60064, 60069, 60073, 60083, 60084, 60085, 60087, 60088, 60089, 60096, 60099, 60012, 60013, 60014, 60021, 60033, 60034, 60050, 60051, 60071, 60072, 60081, 60097, 60098, 60102, 60142, 60152, 60156, 60180)
        then la.amount end) as BCU,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40    
        and secondary_details.loan_app_id is null
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (11002, 11003, 11010, 11020, 11021, 11022, 11023, 11024, 11025, 11026, 11027, 11030, 11040, 11041, 11042, 11043, 11044, 11050, 11051, 11052, 11053, 11054, 11055, 11099, 11501, 11507, 11509, 11510, 11514, 11516, 11518, 11520, 11530, 11531, 11535, 11536, 11542, 11545, 11547, 11548, 11549, 11550, 11551, 11552, 11553, 11554, 11555, 11556, 11557, 11558, 11559, 11560, 11561, 11563, 11565, 11566, 11568, 11569, 11570, 11571, 11572, 11575, 11576, 11577, 11579, 11580, 11581, 11582, 11590, 11592, 11594, 11595, 11596, 11597, 11598, 11599, 11701, 11702, 11703, 11704, 11705, 11706, 11707, 11708, 11709, 11710, 11713, 11714, 11715, 11716, 11717, 11718, 11719, 11720, 11721, 11722, 11724, 11725, 11726, 11727, 11729, 11730, 11731, 11732, 11733, 11735, 11736, 11737, 11738, 11739, 11740, 11741, 11742, 11743, 11746, 11747, 11749, 11750, 11751, 11752, 11753, 11754, 11755, 11756, 11757, 11758, 11760, 11762, 11763, 11764, 11765, 11766, 11767, 11768, 11769, 11770, 11771, 11772, 11773, 11774, 11775, 11776, 11777, 11778, 11779, 11780, 11782, 11783, 11784, 11786, 11787, 11788, 11789, 11790, 11791, 11792, 11793, 11794, 11795, 11796, 11797, 11798, 11801, 11802, 11803, 11804, 11815, 11819, 11853, 11854, 11855, 11901, 11931, 11933, 11934, 11935, 11939, 11940, 11944, 11947, 11948, 11949, 11950, 11951, 11952, 11953, 11955, 11956, 11957, 11958, 11961, 11967, 11970, 11971, 11973, 11980)
        then la.amount end) as island,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 30000
        and l.apr <= .36
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40    
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (14001, 14004, 14005, 14011, 14013, 14020, 14021, 14036, 14040, 14054, 14056, 14058, 14103, 14105, 14125, 14143, 14416, 14422, 14428, 14482, 14525, 14557, 14591, 14414, 14423, 14435, 14437, 14454, 14462, 14466, 14472, 14480, 14481, 14482, 14485, 14486, 14487, 14488, 14510, 14517, 14525, 14530, 14533, 14536, 14539, 14545, 14556, 14558, 14560, 14572, 14592, 14822, 14836, 14846, 14410, 14414, 14416, 14420, 14428, 14430, 14445, 14450, 14464, 14467, 14468, 14472, 14476, 14482, 14502, 14506, 14508, 14511, 14514, 14515, 14526, 14534, 14543, 14546, 14559, 14564, 14580, 14586, 14602, 14603, 14604, 14605, 14606, 14607, 14608, 14609, 14610, 14611, 14612, 14613, 14614, 14615, 14616, 14617, 14618, 14619, 14620, 14621, 14622, 14623, 14624, 14625, 14626, 14627, 14638, 14639, 14642, 14643, 14644, 14645, 14646, 14647, 14649, 14650, 14651, 14652, 14653, 14664, 14673, 14683, 14692, 14694, 14058, 14098, 14103, 14105, 14125, 14411, 14416, 14420, 14422, 14429, 14452, 14470, 14476, 14477, 14479, 14571, 14568, 14519, 14502)
        then la.amount end) as family_first,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40    
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (50023, 50266, 50315, 50317, 50265, 50310, 50322, 50021, 50131, 50009, 50320, 50312, 50325, 50309, 50111, 50313, 50323, 50316, 50311, 50327, 50314, 50321, 50035, 50226, 50047, 50324, 50156, 50124, 50109, 50237, 50169, 50161, 50244, 50046, 50073, 50301, 50032, 50007, 50243, 50305, 50302, 50393, 50303, 50304, 50318, 50306, 50307, 50308, 50319, 50330, 50333, 50334, 50335, 50336, 50338, 50339, 50340, 50347, 50350, 50359, 50360, 50361, 50362, 50363, 50364, 50367, 50368, 50369, 50380, 50381, 50391, 50392, 50394, 50395, 50396, 50397, 50398, 50936, 50940, 50947, 50950, 50980, 50981, 50982, 50002, 50837, 50846, 50849, 50858, 50263, 50003, 50220, 50063, 50072, 50261, 50276, 50070, 50233, 50069, 50167, 50277, 50146, 50128, 50039, 50038, 50066, 50328, 50329, 50331, 50332, 50036, 50212, 50107, 50217, 50223, 50040, 50152, 50031, 50037, 50099, 50158, 50247, 50621, 50162, 50106, 50142, 50258, 50005, 50234, 50141, 50206, 50609, 50148, 50120, 50051, 50078, 50213, 50174, 50275, 50108, 50264, 50129, 51462, 50050, 50235, 50064, 50059, 50216, 50115, 50250, 50002, 50048, 50029, 50164, 50026, 50595, 50130, 50075, 50246, 50249, 50271, 50034, 50599, 50132, 50231, 50126, 50627, 50601, 50006, 50122, 50230, 50672, 50269, 50102, 50259, 50043, 50208, 50112, 50054, 50170, 50228, 50135, 50028, 50251, 50168, 50153, 50232, 50137, 50127, 50049, 50238, 50123, 50068, 50272, 50273, 50149, 50257, 50222, 50155, 50218, 52577, 50207, 50268, 52561, 50143, 52586, 52595, 52534, 50027, 52543, 50219, 50138, 50163, 50044, 50214, 50062, 50119, 50256, 50116, 50057, 50197, 50198, 52531, 50150, 52569, 50171, 52211, 52347, 52215, 50157, 52222, 50242, 52221, 52232, 50104, 50177, 50010, 50014, 50201, 50248, 50236, 50056, 50105, 50055, 50278, 50134, 50154, 50239, 50013, 50012, 50011, 50801, 50851, 50830, 50074, 50254, 50861, 50842, 50831, 50125, 50211, 50225, 50240, 50061, 50210, 50166, 50139, 50229, 50118, 50151, 50001, 50160, 50252, 50241, 50033, 50145)
        then la.amount end) as community_choice,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40    
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (29102, 29111, 29162, 29001, 29143, 29041, 29148, 29051, 29501, 29502, 29503, 29505, 29541, 29506, 29114, 29161, 29504, 29555, 29560, 29583, 29591, 29530, 29009, 29175, 29020, 29032, 29074, 29021, 29045, 29078, 29010, 29046, 29080, 29104, 29151, 29150, 29153, 29152, 29154, 29168, 29125, 29062, 29128, 29080, 29040, 29051, 29054, 29053, 29070, 29073, 29123, 29160, 29170, 29169, 29172, 29006, 29033, 29036, 29171, 29212, 29228, 29072, 29071, 29002, 29016, 29044, 29052, 29061, 29063, 29147, 29177, 29201, 29203, 29203, 29204, 29205, 29206, 29207, 29208, 29210, 29211, 29214, 29215, 29216, 29217, 29218, 29219, 29220, 29221, 29222, 29223, 29224, 29225, 29226, 29227, 29229, 29230, 29240, 29250, 29260, 29290, 29292)
        then la.amount end) as SAFE,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40    
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (94002, 94005, 94010, 94011, 94014, 94015, 94016, 94017, 94018, 94019, 94020, 94021, 94025, 94026, 94027, 94028, 94030, 94037, 94038, 94044, 94060, 94061, 94062, 94063, 94064, 94065, 94066, 94070, 94074, 94080, 94083, 94128, 94401, 94402, 94403, 94404, 94497, 94102, 94103, 94104, 94105, 94107, 94108, 94109, 94110, 94111, 94112, 94114, 94115, 94116, 94117, 94118, 94119, 94120, 94121, 94122, 94123, 94124, 94125, 94126, 94127, 94129, 94130, 94131, 94132, 94133, 94134, 94137, 94139, 94140, 94141, 94142, 94143, 94144, 94145, 94146, 94147, 94151, 94158, 94159, 94160, 94161, 94163, 94164, 94172, 94177, 94188, 94901, 94903, 94904, 94912, 94913, 94914, 94915, 94920, 94924, 94925, 94929, 94930, 94933, 94937, 94938, 94939, 94940, 94941, 94942, 94945, 94946, 94947, 94948, 94949, 94950, 94956, 94957, 94960, 94963, 94964, 94965, 94966, 94970, 94971, 94973, 94974, 94976, 94977, 94978, 94979, 94998)
        then la.amount end) as SF_Fire_CU,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 35000
        and l.apr <= .18
        and l.term in (36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40   
        and locc.post_loan_dti_stated <= .45
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and (br.state = 'NEW_JERSEY' or til.borrower_zip_code in (12701, 12721, 12754, 12790, 12758, 12747, 12788, 12776, 12783, 12723, 12789, 12764, 12729, 12775, 12779, 12748, 12737, 12740, 12734, 12726, 12763, 12768, 12733, 12719, 12732, 12777, 12759, 12765, 12760, 12762, 12725, 12778, 12786, 12751, 12766, 12742, 12743, 12750, 12741, 12720, 12770, 12738, 12745, 12736, 12749, 12752, 12767, 12769, 12781, 12784, 12787, 12791, 12792, 12483, 12722, 12727, 12724, 12550, 10950, 10940, 12553, 10990, 12589, 10941, 12549, 12771, 10924, 10918, 10930, 12566, 12586, 10992, 12721, 12518, 10963, 10916, 10928, 10921, 10998, 10925, 10958, 12575, 10987, 12577, 10926, 12520, 12780, 10996, 10917, 10973, 12746, 12729, 12543, 10969, 10922, 10919, 10975, 10914, 10953, 12785, 10933, 10911, 10988, 10979, 10943, 10949, 10959, 10981, 10985, 10997, 12551, 12552, 12555, 12584, 10910, 10912, 10915, 10932, 12401, 12477, 12561, 12589, 12528, 12566, 12428, 12542, 12446, 12758, 12498, 12487, 12443, 12525, 12404, 12449, 12547, 12466, 12458, 12484, 12789, 12455, 12440, 12461, 12548, 12491, 12740, 12486, 12409, 12494, 12515, 12472, 12481, 12406, 12464, 12480, 12456, 12433, 12457, 12410, 12725, 12495, 12411, 12419, 12435, 12416, 12432, 12448, 12490, 12412, 12493, 12465, 12453, 12475, 12441, 12568, 12588, 12782, 12402, 12417, 12429, 12471, 12483, 12489, 12420, 12603, 12601, 12590, 12533, 12508, 12524, 12538, 12571, 12569, 12572, 12540, 12564, 12582, 12570, 12545, 12522, 12531, 12594, 12580, 12501, 12546, 12581, 12583, 12514, 12567, 12578, 12592, 12585, 12507, 12604, 12504, 12506, 12510, 12511, 12512, 12527, 12537, 12574, 12602, 10541, 10512, 10509, 10579, 12563, 10516, 12531, 10928, 10524, 10537, 10588, 10542, 10701, 10801, 10583, 10705, 10573, 10550, 10562, 10704, 10598, 10710, 10591, 10566, 10703, 10708, 10567, 10552, 10605, 10543, 10549, 10606, 10603, 10805, 10580, 10520, 10538, 10804, 10528, 10604, 10803, 10570, 10530, 10514, 10553, 10536, 10522, 10601, 10595, 10707, 10510, 10589, 10523, 10547, 10709, 10706, 10504, 10533, 10507, 10607, 10577, 10590, 10502, 10506, 10560, 10532, 10576, 10594, 10596, 10548, 10537, 10588, 10511, 10526, 10597, 10518, 10546, 10501, 10527, 10505, 10578, 10517, 10535, 10519, 10503, 10521, 10540, 10545, 10551, 10557, 10558, 10571, 10572, 10587, 10602, 10610, 10702, 10802, 10977, 10952, 10956, 10901, 10954, 10965, 10960, 10520, 10927, 10980, 10970, 10989, 10994, 10920, 10923, 10962, 10983, 10913, 10993, 10974, 10596, 10984, 10986, 10917, 10964, 10968, 10931, 10976, 10911, 10982, 18405, 18415, 18417, 18421, 18424, 18427, 18428, 18431, 18436, 18437, 18438, 18439, 18443, 18444, 18445, 18453, 18454, 18455, 18456, 18459, 18460, 18461, 18462, 18463, 18847, 18465, 18469, 18470, 18472, 18473, 18405, 18324, 18325, 18328, 18302, 18425, 18426, 18428, 18435, 18336, 18337, 18340, 18445, 18451, 18457, 18458, 18460, 18464, 18371, 18210, 18321, 18610, 18322, 18323, 18324, 18325, 18326, 18327, 18301, 18302, 18330, 18331, 18424, 18332, 18333, 18058, 18334, 18335, 18344, 18342, 18071, 18347, 18349, 18350, 18346, 18352, 18353, 18354, 18355, 18356, 18357, 18360, 18370, 18372, 18466, 19020, 19007, 18912, 18913, 18914, 18036, 19021, 18901, 18902, 18917, 18041, 18920, 19030, 19053, 18923, 18925, 18054, 19040, 19440, 18055, 19006, 18929, 18930, 19047, 19054, 19055, 19056, 19057, 18932, 18935, 19067, 18938, 18940, 18942, 18073, 18944, 18947, 18950, 18951, 18954, 18955, 18077, 18960, 18962, 18964, 18966, 18081, 18969, 18970, 18972, 18974, 18976, 18977, 18980, 19001, 19002, 19003, 19004, 19504, 19505, 19422, 19512, 19405, 19009, 19010, 19012, 19426, 18915, 19428, 19025, 18041, 19027, 19031, 19034, 19435, 19525, 19035, 19038, 18054, 19436, 19437, 19438, 19040, 19440, 19041, 19083, 19044, 19006, 19046, 19406, 19444, 19446, 19066, 19453, 18936, 19072, 19401, 19403, 19454, 19456, 19075, 18070, 18073, 18074, 19118, 19150, 19460, 19462, 19464, 18076, 19468, 19472, 19473, 19474, 18964, 19477, 18969, 19085, 19087, 19090, 19095, 19096, 19492, 19003, 19014, 19312, 19015, 19008, 19010, 19317, 19013, 19017, 19319, 19018, 19022, 19023, 19026, 19029, 19032, 19033, 19060, 19342, 19036, 19041, 19083, 19043, 19050, 19061, 19063, 19070, 19073, 19074, 19113, 19076, 19078, 19079, 19064, 19081, 19373, 19082, 19085, 19086, 19087, 19382, 19094, 19096, 19310, 19311, 19312, 19316, 19425, 19320, 19330, 19333, 19335, 19520, 19343, 19344, 19345, 19348, 19442, 19350, 19352, 19341, 19355, 19358, 19362, 19363, 19301, 19457, 19365, 19460, 19367, 19465, 19475, 19372, 19374, 19375, 19380, 19382, 19383, 19390, 19120, 19124, 19111, 19143, 19134, 19149, 19148, 19104, 19140, 19145, 19139, 19131, 19144, 19146, 19147, 19128, 19135, 19115, 19141, 19136, 19154, 19152, 19151, 19116, 19121, 19132, 19114, 19138, 19142, 19119, 19125, 19133, 19130, 19150, 19103, 19122, 19126, 19123, 19107, 19153, 19106, 19129, 19118, 19137, 19102, 19127, 19019, 19093, 19092, 19101, 19099, 19105, 19109, 19108, 19110, 19112, 19160, 19155, 19162, 19161, 19171, 19170, 19173, 19172, 19176, 19175, 19178, 19177, 19181, 19179, 19183, 19182, 19185, 19184, 19188, 19187, 19192, 19191, 19194, 19193, 19196, 19195, 19244, 19197, 19255, 19190))
        then la.amount end) as Pinnacle,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 35000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40    
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        And secondary_details.loan_app_id is null
        and til.borrower_zip_code in (10501, 10502, 10503, 10504, 10505, 10506, 10507, 10509, 10510, 10511, 10512, 10514, 10516, 10517, 10518, 10519, 10520, 10522, 10523, 10524, 10526, 10527, 10528, 10530, 10532, 10533, 
        10535, 10536, 10537, 10538, 10541, 10542, 10543, 10545, 10546, 10547, 10548, 10549, 10550, 10552, 10553, 10560, 10562, 10566, 10567, 10570, 10573, 10576, 10577, 10578, 10579, 10580, 10583, 10588, 10589, 10590, 10591, 
        10594, 10595, 10596, 10597, 10598, 10601, 10603, 10604, 10605, 10606, 10607, 10701, 10702, 10703, 10704, 10705, 10706, 10707, 10708, 10709, 10710, 10801, 10803, 10804, 10805, 10901, 10913, 10920, 10923, 10927, 10931, 
        10952, 10954, 10956, 10960, 10962, 10964, 10965, 10968, 10970, 10974, 10976, 10977, 10980, 10983, 10984, 10986, 10989, 10993, 10994, 12563, 12701, 12719, 12720, 12721, 12722, 12723, 12724, 12726, 12732, 12733, 12734, 
        12736, 12737, 12738, 12740, 12741, 12742, 12743, 12745, 12747, 12748, 12749, 12750, 12751, 12752, 12754, 12758, 12759, 12762, 12763, 12764, 12765, 12766, 12767, 12768, 12769, 12770, 12775, 12776, 12777, 12778, 12779, 
        12781, 12783, 12784, 12785, 12786, 12787, 12788, 12789, 12790, 12791, 12792, 12501, 12504, 12507, 12512, 12514, 12522, 12524, 12527, 12531, 12538, 12540, 12545, 12546, 12564, 12567, 12569, 12570, 12571, 12572, 12574, 
        12578, 12580, 12581, 12583, 12585, 12592, 12594, 12601, 12602, 12603, 12604, 10910, 10911, 10914, 10915, 10916, 10917, 10918, 10919, 10921, 10922, 10924, 10925, 10926, 10928, 10930, 10932, 10933, 10940, 10941, 10950, 10953, 10958, 10963, 10969, 10973, 10975, 10979, 10985, 10987, 10988, 10990, 10992, 10996, 10998, 12508, 12518, 12520, 12533, 12543, 12549, 12550, 12553, 12575, 12577, 12582, 12586, 12590, 12729, 12746, 12771, 12780, 12401, 12402, 12404, 12409, 12410, 12411, 12412, 12416, 12417, 12419, 12420, 12428, 12429, 12432, 12433, 12435, 12440, 12441, 12443, 12446, 12448, 12449, 12453, 12456, 12457, 12458, 12461, 12464, 12465, 12466, 12471, 12472, 12475, 12477, 12480, 12481, 12483, 12484, 12486, 12487, 12489, 12490, 12491, 12493, 12494, 12495, 12498, 12515, 12525, 12528, 12542, 12547, 12548, 12561, 12566, 12589, 12725)
        then la.amount end) as Mid_hudson,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 35000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40    
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (19020, 19007, 18912, 18913, 18914, 19021, 18901, 18902, 18917, 18920, 19030, 19053, 18923, 18925, 18929, 18930, 19047, 19054, 19055, 19056, 19057, 18932, 18935, 19067, 18938, 18940, 18942, 18944, 18947, 18950, 18951, 18954, 18955, 18077, 18960, 18962, 18966, 18081, 18970, 18972, 18974, 18976, 18977, 18980)
        then la.amount end) as Spirit,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40    
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and  br.state in ('ALABAMA','TENNESSEE')
        then la.amount end) as Listerhill,
sum(case when 
        l.segment in ('PRIME_PLUS')
        and (l.decisioning_primary_fico_score >= 640 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        or lap.auto_secured_type in ( 'AUTO_REFINANCE') 
        and l.decisioning_primary_fico_score >= 620)
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and til.borrower_zip_code in ( 00601, 00602, 00603, 00606, 00610, 00611, 00612, 00616, 00617, 00622, 00623, 00624, 00627, 00631, 00636, 00637, 00638, 00641, 00646, 00647, 00650, 00652, 00653, 00656, 00659, 00660, 00662, 00664, 00667, 00669, 00670, 00674, 00676, 00677, 00678, 00680, 00682, 00683, 00685, 00687, 00688, 00690, 00692, 00693, 00694, 00698, 00703, 00704, 00705, 00707, 00714, 00715, 00716, 00717, 00718, 00719, 00720, 00723, 00725, 00727, 00728, 00729, 00730, 00731, 00735, 00736, 00738, 00739, 00740, 00741, 00745, 00751, 00754, 00757, 00765, 00766, 00767, 00769, 00771, 00772, 00773, 00775, 00777, 00778, 00780, 00782, 00783, 00784, 00786, 00791, 00794, 00795, 00901, 00906, 00907, 00909, 00911, 00912, 00913, 00915, 00917, 00918, 00920, 00921, 00923, 00924, 00925, 00926, 00927, 00934, 00949, 00950, 00951, 00952, 00953, 00956, 00957, 00959, 00960, 00961, 00962, 00965, 00966, 00968, 00969, 00971, 00976, 00979, 00982, 00983, 00985, 00987, 01003, 01009, 01063, 01074, 01079, 01094, 01097, 01103, 01104, 01105, 01107, 01108, 01109, 01119, 01144, 01151, 01229, 01244, 01256, 01262, 01264, 01267, 01343, 01603, 01605, 01607, 01608, 01610, 01840, 01841, 01843, 01850, 01851, 01854, 01901, 01902, 01905, 01969, 01984, 02108, 02109, 02110, 02111, 02113, 02114, 02115, 02116, 02118, 02119, 02120, 02121, 02122, 02124, 02125, 02126, 02127, 02128, 02129, 02130, 02131, 02132, 02133, 02134, 02135, 02136, 02149, 02150, 02151, 02152, 02163, 02199, 02203, 02205, 02210, 02215, 02302, 02325, 02330, 02357, 02366, 02457, 02462, 02538, 02542, 02554, 02558, 02564, 02571, 02584, 02601, 02639, 02641, 02646, 02647, 02650, 02652, 02663, 02666, 02667, 02673, 02723, 02724, 02740, 02840, 02841, 02863, 02903, 02905, 02907, 02908, 02909, 02912, 02918, 03215, 03217, 03223, 03233, 03238, 03251, 03262, 03264, 03279, 03293, 03440, 03441, 03451, 03461, 03570, 03575, 03576, 03581, 03582, 03583, 03584, 03588, 03590, 03592, 03593, 03595, 03597, 03598, 03603, 03813, 03814, 03820, 03823, 03824, 03825, 03826, 03835, 03836, 03839, 03845, 03847, 03851, 03852, 03855, 03861, 03864, 03867, 03868, 03869, 03878, 03884, 03887, 03890, 04001, 04002, 04006, 04009, 04020, 04037, 04041, 04047, 04049, 04057, 04068, 04073, 04237, 04254, 04257, 04263, 04275, 04276, 04285, 04286, 04357, 04406, 04411, 04413, 04414, 04415, 04417, 04418, 04421, 04422, 04424, 04426, 04427, 04430, 04434, 04435, 04441, 04442, 04443, 04448, 04451, 04453, 04454, 04455, 04457, 04459, 04460, 04461, 04462, 04463, 04464, 04468, 04469, 04471, 04475, 04476, 04478, 04479, 04481, 04485, 04487, 04488, 04489, 04490, 04491, 04492, 04493, 04495, 04497, 04538, 04570, 04575, 04576, 04654, 04655, 04668, 04686, 04732, 04733, 04737, 04739, 04746, 04747, 04750, 04762, 04765, 04768, 04769, 04774, 04776, 04777, 04779, 04781, 04783, 04785, 04912, 04920, 04921, 04922, 04925, 04932, 04936, 04939, 04942, 04943, 04945, 04947, 04951, 04953, 04958, 04961, 04966, 04967, 04969, 04982, 04983, 04985, 04987, 04988, 05039, 05076, 05086, 05149, 05344, 05358, 05405, 05439, 05459, 05471, 05476, 05488, 05649, 05656, 05664, 05675, 05735, 05739, 05761, 05775, 05822, 05824, 05825, 05837, 05839, 05840, 05841, 05846, 05850, 05858, 05860, 05875, 05901, 05902, 05903, 05904, 05905, 05906, 05907, 06018, 06024, 06051, 06053, 06080, 06106, 06108, 06112, 06114, 06120, 06226, 06250, 06263, 06268, 06269, 06279, 06320, 06380, 06390, 06401, 06519, 06604, 06605, 06606, 06607, 06608, 06610, 06615, 06702, 06704, 06705, 06706, 06710, 06854, 07011, 07017, 07018, 07022, 07026, 07047, 07050, 07055, 07060, 07062, 07074, 07087, 07088, 07093, 07102, 07103, 07104, 07105, 07106, 07107, 07108, 07111, 07112, 07202, 07203, 07206, 07208, 07304, 07501, 07502, 07503, 07504, 07505, 07513, 07514, 07522, 07524, 07606, 07608, 07644, 07657, 07740, 07823, 07846, 07961, 08011, 08030, 08031, 08049, 08063, 08065, 08072, 08102, 08103, 08104, 08105, 08232, 08240, 08320, 08321, 08329, 08345, 08349, 08401, 08544, 08608, 08609, 08611, 08618, 08629, 08641, 08701, 08733, 08740, 08757, 08861, 08901, 10002, 10027, 10031, 10032, 10035, 10039, 10115, 10451, 10452, 10453, 10454, 10455, 10456, 10457, 10458, 10459, 10460, 10461, 10462, 10463, 10464, 10465, 10466, 10467, 10468, 10469, 10470, 10471, 10472, 10473, 10474, 10475, 10577, 10927, 10928, 10931, 10993, 10996, 11096, 11201, 11203, 11204, 11205, 11206, 11207, 11208, 11209, 11210, 11211, 11212, 11213, 11214, 11215, 11216, 11217, 11218, 11219, 11220, 11221, 11222, 11223, 11224, 11225, 11226, 11228, 11229, 11230, 11231, 11232, 11233, 11234, 11235, 11236, 11237, 11238, 11239, 11249, 11354, 11355, 11356, 11369, 11372, 11373, 11416, 11419, 11433, 11439, 11549, 11553, 11556, 11794, 11939, 11957, 11962, 11973, 12031, 12035, 12036, 12043, 12057, 12071, 12076, 12090, 12092, 12093, 12122, 12131, 12149, 12157, 12160, 12167, 12175, 12183, 12187, 12194, 12202, 12206, 12210, 12222, 12307, 12416, 12439, 12454, 12464, 12501, 12504, 12507, 12592, 12604, 12742, 12746, 12747, 12751, 12759, 12764, 12780, 12809, 12810, 12811, 12822, 12828, 12839, 12843, 12856, 12862, 12878, 12884, 12885, 12886, 12914, 12927, 12937, 12939, 12946, 12960, 12961, 12976, 12977, 12989, 12998, 13024, 13026, 13060, 13062, 13068, 13069, 13072, 13073, 13083, 13102, 13144, 13145, 13156, 13203, 13205, 13206, 13207, 13208, 13210, 13211, 13302, 13313, 13318, 13325, 13334, 13357, 13439, 13459, 13471, 13473, 13484, 13489, 13601, 13602, 13603, 13605, 13606, 13607, 13608, 13611, 13612, 13614, 13615, 13616, 13618, 13622, 13624, 13628, 13630, 13632, 13633, 13634, 13636, 13637, 13638, 13639, 13640, 13641, 13643, 13650, 13651, 13654, 13656, 13659, 13661, 13664, 13666, 13670, 13673, 13674, 13675, 13678, 13679, 13681, 13682, 13685, 13690, 13691, 13692, 13693, 13695, 13699, 13775, 13786, 13794, 13795, 13797, 13826, 13846, 13865, 13902, 14012, 14027, 14029, 14061, 14081, 14098, 14103, 14109, 14166, 14173, 14201, 14203, 14204, 14206, 14207, 14208, 14209, 14211, 14212, 14213, 14215, 14218, 14260, 14261, 14301, 14302, 14303, 14305, 14411, 14418, 14433, 14441, 14470, 14476, 14477, 14478, 14479, 14486, 14507, 14512, 14533, 14539, 14544, 14556, 14571, 14592, 14605, 14608, 14611, 14613, 14616, 14619, 14621, 14627, 14642, 14707, 14716, 14721, 14722, 14744, 14769, 14778, 14802, 14817, 14825, 14842, 14850, 14853, 14854, 14859, 14861, 14867, 14873, 14881, 14882, 14892, 14901, 14904, 15014, 15020, 15028, 15033, 15034, 15045, 15054, 15056, 15059, 15072, 15083, 15087, 15088, 15104, 15110, 15112, 15140, 15145, 15204, 15210, 15213, 15225, 15260, 15282, 15290, 15324, 15331, 15345, 15348, 15368, 15401, 15410, 15413, 15416, 15419, 15420, 15421, 15422, 15425, 15428, 15430, 15431, 15433, 15434, 15435, 15436, 15437, 15438, 15440, 15442, 15443, 15444, 15445, 15446, 15447, 15448, 15449, 15450, 15451, 15454, 15455, 15456, 15458, 15459, 15460, 15461, 15462, 15463, 15464, 15465, 15466, 15467, 15468, 15469, 15470, 15472, 15473, 15474, 15475, 15476, 15478, 15479, 15480, 15482, 15484, 15486, 15488, 15489, 15490, 15492, 15510, 15533, 15627, 15629, 15631, 15638, 15660, 15661, 15680, 15693, 15695, 15696, 15698, 15705, 15713, 15721, 15722, 15731, 15737, 15738, 15753, 15754, 15760, 15762, 15773, 15775, 15779, 15832, 15834, 15861, 15901, 15902, 15904, 15906, 15909, 15921, 15922, 15923, 15925, 15927, 15930, 15931, 15934, 15938, 15940, 15942, 15943, 15945, 15948, 15951, 15952, 15955, 15956, 15958, 15960, 15962, 16029, 16035, 16114, 16121, 16125, 16130, 16146, 16151, 16161, 16172, 16217, 16222, 16223, 16239, 16244, 16245, 16250, 16253, 16259, 16263, 16311, 16321, 16322, 16347, 16353, 16370, 16407, 16427, 16434, 16444, 16475, 16501, 16502, 16503, 16504, 16507, 16546, 16550, 16563, 16619, 16624, 16630, 16633, 16635, 16636, 16639, 16640, 16641, 16646, 16654, 16668, 16672, 16675, 16677, 16679, 16682, 16692, 16693, 16699, 16725, 16732, 16801, 16802, 16803, 16820, 16823, 16826, 16827, 16828, 16829, 16832, 16835, 16841, 16844, 16851, 16852, 16853, 16854, 16856, 16859, 16864, 16865, 16866, 16868, 16870, 16871, 16872, 16874, 16875, 16882, 16928, 17005, 17030, 17034, 17048, 17080, 17097, 17098, 17101, 17103, 17104, 17113, 17120, 17210, 17217, 17219, 17220, 17221, 17237, 17247, 17262, 17266, 17271, 17311, 17344, 17401, 17529, 17534, 17576, 17744, 17760, 17763, 17764, 17778, 17829, 17835, 17837, 17844, 17845, 17855, 17856, 17880, 17885, 17886, 17887, 17948, 17954, 18056, 18063, 18086, 18101, 18102, 18109, 18216, 18230, 18232, 18240, 18244, 18246, 18250, 18254, 18255, 18324, 18328, 18334, 18336, 18337, 18340, 18371, 18425, 18426, 18428, 18435, 18451, 18457, 18458, 18464, 18503, 18508, 18509, 18510, 18517, 18610, 18636, 18701, 18709, 19009, 19013, 19022, 19023, 19032, 19079, 19082, 19102, 19103, 19104, 19106, 19107, 19108, 19109, 19111, 19112, 19114, 19115, 19116, 19118, 19119, 19120, 19121, 19122, 19123, 19124, 19125, 19126, 19127, 19128, 19129, 19130, 19131, 19132, 19133, 19134, 19135, 19136, 19137, 19138, 19139, 19140, 19141, 19142, 19143, 19144, 19145, 19146, 19147, 19148, 19149, 19150, 19151, 19152, 19153, 19154, 19344, 19345, 19358, 19362, 19383, 19544, 19601, 19611, 19716, 19717, 19801, 19802, 19804, 19901, 19902, 19931, 19936, 19941, 19946, 20006, 20019, 20020, 20032, 20052, 20057, 20059, 20064, 20110, 20164, 20240, 20317, 20373, 20390, 20415, 20427, 20431, 20625, 20628, 20645, 20661, 20662, 20664, 20680, 20684, 20686, 20687, 20706, 20710, 20711, 20722, 20724, 20737, 20740, 20742, 20743, 20745, 20746, 20747, 20748, 20755, 20762, 20771, 20782, 20783, 20784, 20785, 20838, 20899, 20903, 21017, 21201, 21202, 21205, 21206, 21207, 21210, 21211, 21213, 21214, 21215, 21216, 21217, 21218, 21222, 21223, 21224, 21229, 21230, 21231, 21233, 21239, 21250, 21251, 21252, 21285, 21287, 21502, 21524, 21529, 21530, 21540, 21542, 21543, 21545, 21555, 21557, 21560, 21607, 21628, 21640, 21644, 21649, 21668, 21705, 21727, 21746, 21750, 21766, 21778, 21780, 21787, 21817, 21821, 21824, 21838, 21849, 21850, 21853, 21866, 21867, 21871, 21874, 21890, 22060, 22125, 22134, 22311, 22401, 22407, 22408, 22454, 22504, 22534, 22551, 22553, 22610, 22620, 22623, 22627, 22630, 22640, 22646, 22650, 22663, 22701, 22709, 22711, 22714, 22715, 22718, 22719, 22722, 22723, 22724, 22725, 22726, 22727, 22729, 22730, 22731, 22732, 22734, 22735, 22736, 22737, 22738, 22741, 22742, 22743, 22746, 22807, 22811, 22820, 22830, 22832, 22904, 22908, 22922, 22948, 22949, 22964, 22967, 22968, 22971, 22973, 22976, 22989, 23022, 23027, 23055, 23075, 23084, 23091, 23108, 23110, 23156, 23160, 23173, 23181, 23219, 23220, 23221, 23224, 23225, 23234, 23284, 23298, 23301, 23302, 23303, 23416, 23418, 23423, 23459, 23460, 23461, 23480, 23502, 23503, 23504, 23505, 23507, 23508, 23509, 23510, 23511, 23513, 23517, 23518, 23523, 23551, 23604, 23605, 23607, 23661, 23663, 23665, 23667, 23668, 23681, 23691, 23701, 23702, 23703, 23704, 23707, 23708, 23709, 23801, 23821, 23843, 23845, 23847, 23856, 23857, 23867, 23868, 23870, 23876, 23879, 23882, 23884, 23887, 23889, 23890, 23891, 23893, 23897, 23909, 23920, 23923, 23934, 23943, 23958, 23960, 23963, 23966, 24011, 24013, 24015, 24016, 24017, 24020, 24022, 24058, 24060, 24061, 24067, 24073, 24078, 24084, 24085, 24086, 24087, 24088, 24089, 24092, 24093, 24102, 24124, 24128, 24129, 24132, 24134, 24136, 24137, 24141, 24142, 24147, 24150, 24151, 24162, 24167, 24168, 24176, 24201, 24202, 24210, 24211, 24216, 24217, 24220, 24221, 24224, 24225, 24226, 24228, 24230, 24236, 24237, 24239, 24243, 24244, 24245, 24248, 24250, 24251, 24256, 24258, 24260, 24263, 24265, 24269, 24270, 24271, 24272, 24277, 24281, 24282, 24290, 24301, 24324, 24327, 24340, 24347, 24350, 24351, 24361, 24411, 24430, 24432, 24440, 24459, 24464, 24476, 24485, 24501, 24502, 24504, 24515, 24517, 24550, 24554, 24570, 24581, 24588, 24597, 24603, 24606, 24607, 24613, 24614, 24620, 24631, 24634, 24635, 24639, 24646, 24649, 24656, 24657, 24712, 24714, 24715, 24716, 24719, 24724, 24726, 24729, 24731, 24733, 24736, 24737, 24738, 24740, 24747, 24801, 24808, 24811, 24813, 24815, 24816, 24817, 24818, 24822, 24823, 24826, 24827, 24828, 24830, 24831, 24834, 24836, 24839, 24843, 24844, 24845, 24846, 24847, 24848, 24849, 24850, 24851, 24853, 24854, 24855, 24857, 24860, 24861, 24862, 24866, 24867, 24868, 24869, 24870, 24871, 24872, 24873, 24874, 24878, 24879, 24880, 24881, 24882, 24884, 24887, 24888, 24892, 24894, 24895, 24898, 24925, 24934, 24935, 24941, 24944, 24954, 24962, 24966, 24970, 24974, 24976, 24981, 24984, 24986, 24991, 25002, 25003, 25005, 25007, 25008, 25009, 25015, 25019, 25021, 25022, 25024, 25025, 25028, 25030, 25031, 25033, 25035, 25036, 25039, 25040, 25043, 25044, 25045, 25047, 25048, 25049, 25051, 25053, 25054, 25057, 25059, 25060, 25061, 25062, 25063, 25064, 25067, 25070, 25071, 25075, 25076, 25081, 25083, 25085, 25086, 25088, 25090, 25093, 25102, 25103, 25107, 25108, 25110, 25111, 25112, 25113, 25114, 25115, 25118, 25119, 25121, 25125, 25126, 25130, 25132, 25133, 25134, 25136, 25139, 25140, 25141, 25142, 25143, 25148, 25149, 25152, 25154, 25156, 25160, 25161, 25162, 25164, 25165, 25169, 25173, 25174, 25177, 25180, 25181, 25183, 25185, 25186, 25193, 25201, 25202, 25203, 25204, 25205, 25206, 25208, 25209, 25211, 25214, 25234, 25235, 25239, 25243, 25244, 25251, 25259, 25260, 25261, 25262, 25266, 25267, 25268, 25270, 25276, 25285, 25286, 25287, 25301, 25302, 25303, 25304, 25305, 25306, 25309, 25311, 25312, 25313, 25314, 25315, 25320, 25387, 25401, 25411, 25414, 25422, 25425, 25430, 25431, 25432, 25434, 25437, 25438, 25442, 25443, 25444, 25446, 25501, 25504, 25505, 25506, 25507, 25508, 25510, 25511, 25512, 25514, 25515, 25517, 25521, 25523, 25524, 25529, 25530, 25534, 25535, 25537, 25540, 25541, 25544, 25545, 25547, 25555, 25557, 25559, 25564, 25565, 25567, 25570, 25571, 25573, 25601, 25606, 25607, 25608, 25611, 25612, 25617, 25621, 25624, 25625, 25628, 25630, 25632, 25634, 25635, 25637, 25638, 25639, 25644, 25646, 25647, 25649, 25650, 25651, 25652, 25653, 25654, 25661, 25666, 25667, 25669, 25670, 25671, 25672, 25674, 25676, 25678, 25685, 25688, 25690, 25692, 25696, 25699, 25701, 25702, 25703, 25704, 25705, 25755, 25801, 25810, 25811, 25812, 25813, 25817, 25818, 25820, 25823, 25825, 25826, 25827, 25831, 25832, 25836, 25837, 25839, 25840, 25841, 25843, 25844, 25845, 25846, 25848, 25849, 25851, 25853, 25854, 25855, 25857, 25862, 25864, 25865, 25866, 25868, 25870, 25871, 25873, 25875, 25876, 25878, 25879, 25880, 25882, 25901, 25902, 25904, 25907, 25908, 25909, 25911, 25913, 25915, 25916, 25917, 25918, 25920, 25921, 25922, 25928, 25932, 25936, 25938, 25942, 25943, 25958, 25962, 25966, 25971, 25972, 25976, 25977, 25981, 25984, 25985, 25986, 25989, 26003, 26030, 26031, 26032, 26033, 26034, 26035, 26036, 26037, 26038, 26039, 26040, 26041, 26047, 26050, 26055, 26056, 26058, 26059, 26060, 26062, 26070, 26074, 26075, 26101, 26104, 26105, 26133, 26136, 26137, 26138, 26141, 26142, 26143, 26147, 26148, 26150, 26151, 26152, 26160, 26161, 26169, 26178, 26180, 26181, 26184, 26187, 26202, 26203, 26206, 26208, 26215, 26217, 26222, 26237, 26261, 26266, 26268, 26273, 26275, 26280, 26282, 26288, 26291, 26294, 26298, 26320, 26335, 26337, 26342, 26351, 26366, 26372, 26374, 26376, 26384, 26410, 26412, 26425, 26430, 26440, 26443, 26444, 26447, 26501, 26505, 26506, 26508, 26519, 26520, 26521, 26524, 26525, 26534, 26537, 26541, 26542, 26543, 26544, 26546, 26547, 26570, 26575, 26581, 26590, 26601, 26611, 26615, 26619, 26621, 26623, 26624, 26627, 26629, 26631, 26636, 26638, 26656, 26662, 26667, 26671, 26676, 26680, 26681, 26704, 26705, 26710, 26711, 26714, 26716, 26717, 26719, 26722, 26726, 26750, 26753, 26755, 26757, 26761, 26763, 26764, 26767, 26801, 26802, 26804, 26808, 26810, 26812, 26814, 26815, 26817, 26818, 26823, 26836, 26838, 26845, 26851, 26852, 26865, 26884, 26886, 27011, 27013, 27016, 27018, 27020, 27021, 27022, 27025, 27027, 27028, 27042, 27046, 27048, 27052, 27053, 27054, 27055, 27105, 27109, 27110, 27201, 27202, 27203, 27205, 27207, 27208, 27213, 27215, 27217, 27229, 27231, 27239, 27248, 27252, 27253, 27256, 27258, 27260, 27263, 27268, 27288, 27292, 27295, 27298, 27299, 27316, 27317, 27320, 27340, 27349, 27350, 27351, 27355, 27360, 27370, 27374, 27401, 27403, 27405, 27411, 27412, 27503, 27504, 27506, 27507, 27508, 27509, 27520, 27521, 27522, 27524, 27525, 27527, 27530, 27531, 27533, 27534, 27542, 27544, 27549, 27551, 27555, 27557, 27563, 27565, 27568, 27569, 27570, 27573, 27576, 27577, 27581, 27582, 27584, 27589, 27593, 27594, 27596, 27597, 27599, 27601, 27610, 27695, 27697, 27704, 27708, 27801, 27803, 27804, 27806, 27807, 27809, 27810, 27812, 27815, 27816, 27818, 27819, 27820, 27823, 27824, 27825, 27826, 27827, 27829, 27830, 27831, 27832, 27834, 27837, 27839, 27840, 27841, 27842, 27843, 27844, 27845, 27846, 27847, 27849, 27850, 27852, 27853, 27855, 27856, 27857, 27858, 27861, 27862, 27863, 27864, 27866, 27869, 27870, 27871, 27872, 27874, 27875, 27876, 27877, 27878, 27879, 27881, 27882, 27884, 27885, 27886, 27888, 27890, 27891, 27892, 27897, 27915, 27920, 27924, 27926, 27935, 27936, 27937, 27938, 27943, 27946, 27957, 27960, 27962, 27964, 27967, 27968, 27969, 27970, 27972, 27974, 27979, 27982, 27983, 28007, 28012, 28016, 28019, 28020, 28023, 28032, 28033, 28034, 28039, 28041, 28052, 28054, 28056, 28072, 28077, 28088, 28089, 28091, 28092, 28098, 28101, 28102, 28119, 28120, 28125, 28133, 28134, 28135, 28138, 28144, 28146, 28147, 28159, 28160, 28170, 28174, 28206, 28208, 28212, 28215, 28223, 28301, 28303, 28304, 28305, 28306, 28307, 28308, 28310, 28311, 28312, 28314, 28320, 28323, 28325, 28328, 28330, 28331, 28332, 28333, 28337, 28339, 28340, 28341, 28342, 28343, 28345, 28348, 28351, 28352, 28355, 28356, 28357, 28358, 28359, 28360, 28362, 28363, 28364, 28368, 28369, 28371, 28372, 28375, 28376, 28377, 28378, 28383, 28384, 28386, 28390, 28391, 28392, 28393, 28395, 28396, 28398, 28399, 28401, 28420, 28421, 28423, 28424, 28425, 28430, 28431, 28432, 28433, 28434, 28435, 28436, 28438, 28439, 28442, 28445, 28448, 28450, 28452, 28453, 28454, 28455, 28456, 28460, 28462, 28463, 28467, 28470, 28472, 28478, 28509, 28510, 28511, 28513, 28515, 28519, 28523, 28526, 28527, 28529, 28530, 28532, 28533, 28537, 28539, 28540, 28542, 28543, 28544, 28546, 28547, 28552, 28555, 28556, 28560, 28562, 28571, 28573, 28574, 28585, 28586, 28587, 28590, 28601, 28602, 28605, 28607, 28609, 28610, 28611, 28612, 28613, 28615, 28617, 28618, 28619, 28622, 28623, 28625, 28627, 28628, 28630, 28631, 28634, 28636, 28637, 28638, 28641, 28642, 28643, 28645, 28650, 28652, 28655, 28658, 28660, 28663, 28664, 28665, 28666, 28667, 28668, 28671, 28673, 28675, 28678, 28679, 28681, 28682, 28683, 28689, 28690, 28692, 28698, 28707, 28708, 28709, 28712, 28715, 28716, 28717, 28721, 28723, 28725, 28726, 28736, 28743, 28745, 28747, 28751, 28753, 28754, 28758, 28772, 28778, 28779, 28781, 28783, 28785, 28786, 28788, 28789, 28901, 29001, 29006, 29009, 29010, 29014, 29015, 29018, 29020, 29030, 29031, 29032, 29033, 29038, 29039, 29040, 29044, 29046, 29047, 29048, 29051, 29052, 29055, 29056, 29058, 29059, 29061, 29062, 29065, 29069, 29074, 29078, 29079, 29080, 29081, 29082, 29102, 29104, 29105, 29107, 29111, 29112, 29113, 29114, 29115, 29117, 29118, 29125, 29128, 29129, 29130, 29133, 29135, 29137, 29138, 29142, 29146, 29148, 29150, 29152, 29153, 29154, 29161, 29162, 29163, 29164, 29166, 29168, 29172, 29175, 29180, 29201, 29203, 29204, 29207, 29208, 29209, 29210, 29225, 29301, 29302, 29303, 29306, 29307, 29316, 29320, 29322, 29323, 29324, 29325, 29329, 29331, 29332, 29333, 29334, 29335, 29338, 29346, 29349, 29351, 29360, 29365, 29368, 29369, 29370, 29373, 29374, 29375, 29376, 29377, 29378, 29384, 29385, 29388, 29403, 29404, 29405, 29406, 29409, 29418, 29424, 29426, 29431, 29434, 29435, 29436, 29437, 29438, 29440, 29446, 29448, 29449, 29450, 29452, 29453, 29468, 29471, 29474, 29475, 29477, 29479, 29481, 29488, 29493, 29501, 29505, 29506, 29511, 29512, 29516, 29518, 29519, 29525, 29526, 29527, 29530, 29532, 29536, 29540, 29541, 29543, 29544, 29545, 29546, 29547, 29550, 29554, 29555, 29556, 29560, 29563, 29564, 29565, 29566, 29567, 29568, 29569, 29570, 29571, 29572, 29574, 29575, 29577, 29579, 29580, 29581, 29582, 29583, 29588, 29589, 29590, 29591, 29592, 29594, 29596, 29605, 29611, 29613, 29614, 29617, 29621, 29624, 29625, 29626, 29627, 29630, 29631, 29634, 29635, 29639, 29640, 29642, 29644, 29645, 29657, 29661, 29665, 29667, 29669, 29670, 29671, 29673, 29682, 29683, 29684, 29685, 29689, 29692, 29697, 29706, 29712, 29714, 29724, 29726, 29728, 29729, 29733, 29801, 29803, 29805, 29809, 29810, 29816, 29817, 29819, 29826, 29827, 29828, 29829, 29831, 29832, 29834, 29836, 29841, 29842, 29847, 29849, 29851, 29853, 29856, 29902, 29904, 29905, 29906, 29911, 29912, 29916, 29918, 29921, 29922, 29923, 29924, 29927, 29929, 29932, 29934, 29935, 29936, 29939, 29940, 29941, 29943, 29944, 29945, 30014, 30016, 30021, 30032, 30035, 30054, 30055, 30060, 30070, 30072, 30079, 30083, 30090, 30093, 30105, 30106, 30110, 30111, 30113, 30118, 30124, 30147, 30148, 30149, 30161, 30165, 30168, 30173, 30176, 30182, 30185, 30204, 30216, 30217, 30218, 30222, 30223, 30224, 30233, 30234, 30236, 30238, 30250, 30251, 30257, 30260, 30268, 30272, 30273, 30274, 30284, 30291, 30293, 30296, 30297, 30310, 30311, 30314, 30315, 30322, 30332, 30340, 30344, 30354, 30360, 30401, 30411, 30413, 30415, 30423, 30425, 30426, 30428, 30434, 30439, 30441, 30442, 30448, 30450, 30451, 30452, 30453, 30454, 30456, 30458, 30460, 30461, 30464, 30471, 30477, 30531, 30537, 30541, 30546, 30555, 30559, 30562, 30566, 30568, 30597, 30598, 30601, 30602, 30605, 30606, 30609, 30619, 30624, 30627, 30628, 30629, 30630, 30631, 30633, 30634, 30635, 30639, 30646, 30648, 30663, 30664, 30665, 30667, 30683, 30705, 30707, 30708, 30710, 30711, 30720, 30721, 30724, 30725, 30728, 30730, 30731, 30734, 30735, 30738, 30739, 30740, 30741, 30742, 30747, 30750, 30751, 30752, 30753, 30755, 30756, 30757, 30802, 30803, 30805, 30807, 30808, 30812, 30815, 30816, 30817, 30818, 30821, 30822, 30823, 30824, 30828, 30830, 30833, 30901, 30904, 30905, 30906, 30909, 30912, 31001, 31003, 31006, 31007, 31008, 31009, 31012, 31014, 31015, 31018, 31019, 31020, 31021, 31022, 31027, 31030, 31033, 31034, 31035, 31037, 31038, 31039, 31041, 31044, 31045, 31050, 31051, 31052, 31055, 31057, 31058, 31060, 31063, 31064, 31065, 31066, 31067, 31068, 31075, 31076, 31078, 31081, 31082, 31083, 31085, 31087, 31089, 31090, 31094, 31098, 31201, 31204, 31206, 31207, 31210, 31213, 31216, 31217, 31301, 31305, 31309, 31313, 31314, 31315, 31316, 31320, 31323, 31327, 31331, 31333, 31401, 31404, 31405, 31409, 31415, 31421, 31501, 31503, 31510, 31513, 31520, 31525, 31532, 31537, 31539, 31542, 31544, 31547, 31549, 31550, 31552, 31553, 31562, 31563, 31564, 31566, 31567, 31601, 31602, 31605, 31606, 31620, 31623, 31624, 31625, 31627, 31629, 31630, 31631, 31632, 31634, 31635, 31636, 31638, 31641, 31642, 31643, 31647, 31648, 31649, 31698, 31699, 31701, 31704, 31705, 31707, 31712, 31714, 31716, 31719, 31720, 31721, 31722, 31730, 31744, 31747, 31750, 31753, 31756, 31765, 31768, 31771, 31772, 31774, 31780, 31781, 31783, 31784, 31788, 31789, 31790, 31791, 31795, 31796, 31801, 31803, 31805, 31810, 31812, 31814, 31815, 31816, 31821, 31824, 31825, 31827, 31829, 31830, 31832, 31836, 31901, 31903, 31904, 31905, 31906, 31907, 31909, 32008, 32013, 32043, 32052, 32053, 32059, 32066, 32079, 32102, 32110, 32112, 32113, 32114, 32117, 32118, 32119, 32124, 32127, 32128, 32129, 32130, 32131, 32132, 32133, 32134, 32136, 32137, 32139, 32140, 32141, 32145, 32147, 32148, 32157, 32162, 32163, 32164, 32168, 32169, 32174, 32176, 32177, 32179, 32180, 32181, 32182, 32187, 32189, 32190, 32192, 32193, 32195, 32206, 32208, 32209, 32210, 32211, 32212, 32214, 32227, 32228, 32233, 32254, 32277, 32301, 32303, 32304, 32305, 32306, 32307, 32308, 32309, 32310, 32311, 32312, 32313, 32317, 32324, 32328, 32330, 32331, 32332, 32333, 32336, 32337, 32340, 32343, 32344, 32350, 32351, 32352, 32356, 32359, 32361, 32399, 32401, 32403, 32421, 32425, 32426, 32427, 32428, 32430, 32432, 32435, 32437, 32438, 32442, 32443, 32449, 32455, 32460, 32462, 32463, 32464, 32466, 32501, 32502, 32503, 32504, 32505, 32506, 32507, 32508, 32509, 32511, 32512, 32514, 32526, 32533, 32534, 32535, 32542, 32544, 32547, 32568, 32569, 32570, 32577, 32580, 32583, 32601, 32603, 32605, 32606, 32607, 32608, 32609, 32610, 32612, 32615, 32616, 32617, 32618, 32619, 32621, 32625, 32626, 32628, 32631, 32634, 32639, 32640, 32641, 32643, 32648, 32653, 32656, 32658, 32664, 32666, 32667, 32668, 32669, 32680, 32681, 32683, 32686, 32692, 32693, 32694, 32696, 32701, 32702, 32713, 32723, 32724, 32725, 32738, 32744, 32759, 32763, 32764, 32767, 32778, 32805, 32807, 32808, 32809, 32810, 32811, 32816, 32817, 32818, 32822, 32826, 32833, 32839, 32901, 32905, 32907, 32908, 32922, 32925, 32935, 32948, 32958, 32959, 32960, 32962, 32963, 32966, 32967, 32968, 32970, 33009, 33010, 33012, 33013, 33014, 33015, 33016, 33018, 33020, 33022, 33030, 33031, 33032, 33033, 33035, 33039, 33054, 33055, 33056, 33060, 33064, 33065, 33068, 33069, 33101, 33109, 33122, 33125, 33126, 33127, 33128, 33129, 33130, 33131, 33132, 33133, 33134, 33135, 33136, 33137, 33138, 33139, 33140, 33141, 33142, 33143, 33144, 33145, 33146, 33147, 33149, 33150, 33154, 33155, 33156, 33157, 33158, 33160, 33161, 33162, 33165, 33166, 33167, 33168, 33169, 33170, 33172, 33173, 33174, 33175, 33176, 33177, 33178, 33179, 33180, 33181, 33182, 33183, 33184, 33185, 33186, 33187, 33189, 33190, 33193, 33194, 33196, 33309, 33311, 33312, 33313, 33403, 33404, 33407, 33415, 33417, 33426, 33438, 33440, 33460, 33461, 33471, 33476, 33503, 33513, 33514, 33521, 33523, 33525, 33538, 33540, 33541, 33542, 33543, 33544, 33545, 33550, 33563, 33567, 33570, 33574, 33576, 33585, 33597, 33604, 33605, 33610, 33612, 33614, 33619, 33620, 33621, 33709, 33711, 33714, 33744, 33755, 33771, 33801, 33803, 33805, 33809, 33810, 33811, 33812, 33813, 33815, 33823, 33825, 33827, 33830, 33834, 33835, 33837, 33838, 33839, 33840, 33841, 33843, 33844, 33847, 33848, 33849, 33850, 33851, 33852, 33853, 33854, 33855, 33856, 33857, 33858, 33859, 33860, 33865, 33867, 33868, 33870, 33872, 33873, 33875, 33876, 33877, 33880, 33881, 33884, 33890, 33896, 33897, 33898, 33903, 33909, 33913, 33916, 33921, 33930, 33935, 33936, 33944, 33946, 33947, 33948, 33950, 33952, 33953, 33954, 33955, 33960, 33965, 33971, 33972, 33973, 33974, 33976, 33980, 33981, 33982, 33983, 34142, 34205, 34207, 34210, 34215, 34224, 34234, 34266, 34267, 34268, 34269, 34287, 34288, 34420, 34428, 34429, 34431, 34432, 34433, 34434, 34436, 34442, 34445, 34446, 34448, 34449, 34450, 34452, 34453, 34461, 34465, 34470, 34471, 34472, 34473, 34474, 34475, 34476, 34479, 34480, 34481, 34482, 34484, 34487, 34488, 34491, 34498, 34601, 34602, 34604, 34606, 34607, 34608, 34609, 34610, 34613, 34614, 34637, 34638, 34639, 34652, 34653, 34654, 34655, 34661, 34667, 34668, 34669, 34679, 34690, 34691, 34705, 34731, 34734, 34739, 34741, 34743, 34744, 34746, 34747, 34748, 34753, 34758, 34759, 34762, 34769, 34771, 34772, 34773, 34785, 34788, 34945, 34946, 34947, 34949, 34950, 34951, 34952, 34953, 34956, 34974, 34981, 34982, 34983, 34984, 34986, 34987, 35013, 35020, 35031, 35032, 35034, 35035, 35042, 35045, 35046, 35049, 35052, 35054, 35061, 35064, 35070, 35072, 35073, 35074, 35079, 35082, 35085, 35089, 35097, 35115, 35121, 35131, 35133, 35135, 35136, 35139, 35171, 35172, 35176, 35178, 35183, 35184, 35188, 35203, 35204, 35205, 35206, 35208, 35212, 35215, 35217, 35218, 35221, 35228, 35229, 35233, 35234, 35235, 35249, 35254, 35401, 35404, 35441, 35442, 35443, 35444, 35447, 35456, 35459, 35460, 35461, 35462, 35464, 35466, 35469, 35470, 35474, 35477, 35481, 35487, 35491, 35540, 35543, 35544, 35548, 35549, 35554, 35564, 35565, 35571, 35572, 35573, 35575, 35577, 35581, 35582, 35585, 35586, 35601, 35603, 35616, 35618, 35619, 35621, 35622, 35632, 35640, 35643, 35646, 35650, 35651, 35653, 35654, 35660, 35661, 35670, 35671, 35672, 35673, 35674, 35677, 35744, 35746, 35750, 35752, 35754, 35755, 35772, 35775, 35805, 35810, 35816, 35896, 35901, 35903, 35904, 35905, 35906, 35907, 35952, 35953, 35954, 35956, 35961, 35971, 35972, 35973, 35974, 35975, 35980, 35984, 35987, 35989, 35990, 36003, 36006, 36008, 36013, 36016, 36017, 36020, 36025, 36026, 36027, 36031, 36032, 36036, 36039, 36040, 36041, 36043, 36046, 36047, 36048, 36052, 36054, 36057, 36064, 36069, 36071, 36075, 36082, 36083, 36088, 36091, 36101, 36104, 36105, 36106, 36107, 36108, 36109, 36110, 36111, 36112, 36113, 36114, 36115, 36116, 36117, 36130, 36201, 36205, 36206, 36207, 36250, 36265, 36267, 36271, 36276, 36277, 36279, 36301, 36303, 36305, 36310, 36312, 36313, 36314, 36317, 36319, 36320, 36321, 36340, 36343, 36344, 36345, 36353, 36370, 36373, 36375, 36376, 36401, 36426, 36432, 36435, 36439, 36441, 36444, 36446, 36453, 36454, 36471, 36473, 36475, 36477, 36481, 36502, 36503, 36505, 36509, 36512, 36513, 36518, 36521, 36522, 36523, 36525, 36528, 36529, 36538, 36539, 36541, 36542, 36543, 36544, 36548, 36550, 36551, 36553, 36556, 36558, 36560, 36562, 36568, 36569, 36571, 36572, 36575, 36576, 36578, 36579, 36580, 36581, 36582, 36583, 36584, 36585, 36587, 36602, 36603, 36604, 36605, 36606, 36607, 36608, 36609, 36610, 36611, 36612, 36613, 36615, 36617, 36618, 36619, 36652, 36663, 36688, 36693, 36695, 36701, 36703, 36720, 36722, 36723, 36726, 36728, 36738, 36740, 36741, 36744, 36749, 36750, 36751, 36752, 36753, 36756, 36759, 36761, 36765, 36766, 36767, 36768, 36769, 36773, 36775, 36776, 36783, 36785, 36786, 36790, 36792, 36793, 36801, 36804, 36830, 36832, 36849, 36851, 36855, 36856, 36858, 36860, 36865, 36866, 36867, 36869, 36870, 36871, 36874, 36875, 36877, 36879, 36901, 36907, 36910, 36912, 36916, 36922, 36925, 37022, 37023, 37026, 37028, 37030, 37036, 37051, 37055, 37057, 37058, 37074, 37078, 37079, 37083, 37097, 37098, 37115, 37132, 37145, 37150, 37151, 37165, 37175, 37178, 37185, 37186, 37190, 37210, 37213, 37232, 37240, 37301, 37302, 37305, 37307, 37310, 37311, 37312, 37313, 37315, 37316, 37317, 37323, 37325, 37326, 37327, 37333, 37339, 37340, 37347, 37353, 37356, 37361, 37362, 37365, 37366, 37369, 37373, 37374, 37375, 37376, 37380, 37383, 37385, 37387, 37391, 37396, 37397, 37403, 37404, 37405, 37406, 37407, 37410, 37601, 37604, 37614, 37615, 37617, 37618, 37620, 37640, 37642, 37643, 37645, 37650, 37656, 37657, 37658, 37659, 37660, 37663, 37664, 37665, 37680, 37682, 37683, 37686, 37687, 37688, 37690, 37691, 37692, 37694, 37705, 37708, 37709, 37710, 37711, 37713, 37714, 37715, 37716, 37719, 37721, 37722, 37724, 37725, 37726, 37727, 37729, 37730, 37731, 37732, 37733, 37752, 37753, 37754, 37755, 37756, 37757, 37760, 37762, 37765, 37766, 37769, 37770, 37771, 37779, 37806, 37807, 37811, 37813, 37814, 37819, 37820, 37821, 37828, 37829, 37840, 37841, 37843, 37845, 37847, 37848, 37851, 37852, 37857, 37860, 37861, 37866, 37869, 37870, 37872, 37873, 37876, 37877, 37881, 37886, 37887, 37888, 37890, 37891, 37892, 37909, 37912, 37915, 37916, 37917, 37921, 38001, 38008, 38015, 38021, 38023, 38034, 38036, 38040, 38041, 38042, 38044, 38049, 38050, 38052, 38063, 38067, 38070, 38077, 38079, 38105, 38106, 38107, 38108, 38111, 38114, 38115, 38116, 38118, 38122, 38126, 38127, 38128, 38131, 38132, 38134, 38141, 38152, 38230, 38233, 38236, 38301, 38305, 38310, 38313, 38316, 38327, 38330, 38332, 38337, 38338, 38340, 38343, 38347, 38355, 38356, 38358, 38359, 38361, 38362, 38366, 38369, 38370, 38379, 38381, 38382, 38387, 38389, 38391, 38392, 38451, 38456, 38457, 38482, 38487, 38503, 38504, 38505, 38541, 38543, 38547, 38550, 38551, 38552, 38553, 38556, 38558, 38560, 38562, 38563, 38564, 38565, 38567, 38570, 38572, 38575, 38578, 38588, 38589, 38601, 38603, 38606, 38610, 38611, 38614, 38617, 38618, 38619, 38620, 38621, 38622, 38623, 38626, 38629, 38631, 38633, 38635, 38639, 38641, 38642, 38643, 38644, 38645, 38646, 38647, 38655, 38658, 38659, 38661, 38663, 38664, 38665, 38666, 38668, 38670, 38673, 38674, 38676, 38677, 38683, 38685, 38701, 38703, 38720, 38721, 38722, 38723, 38725, 38726, 38730, 38731, 38732, 38733, 38736, 38737, 38738, 38740, 38746, 38748, 38751, 38753, 38754, 38756, 38759, 38760, 38761, 38762, 38764, 38765, 38767, 38768, 38769, 38771, 38772, 38773, 38774, 38776, 38778, 38781, 38838, 38839, 38846, 38851, 38860, 38873, 38914, 38916, 38920, 38921, 38922, 38923, 38924, 38925, 38927, 38928, 38941, 38944, 38946, 38949, 38950, 38952, 38954, 38957, 38962, 38963, 38964, 38966, 38967, 39038, 39039, 39040, 39041, 39044, 39045, 39051, 39054, 39056, 39058, 39059, 39061, 39062, 39063, 39066, 39067, 39069, 39078, 39079, 39082, 39083, 39086, 39088, 39090, 39092, 39095, 39096, 39097, 39108, 39111, 39114, 39115, 39119, 39120, 39144, 39146, 39148, 39149, 39150, 39154, 39160, 39162, 39166, 39169, 39170, 39173, 39174, 39175, 39176, 39179, 39189, 39192, 39193, 39194, 39201, 39202, 39203, 39204, 39206, 39208, 39209, 39210, 39211, 39212, 39213, 39216, 39217, 39218, 39269, 39272, 39326, 39328, 39338, 39339, 39341, 39346, 39348, 39350, 39352, 39354, 39356, 39358, 39359, 39361, 39365, 39366, 39401, 39406, 39421, 39422, 39423, 39425, 39427, 39428, 39429, 39439, 39451, 39456, 39462, 39465, 39474, 39477, 39478, 39479, 39481, 39483, 39501, 39503, 39507, 39520, 39530, 39531, 39532, 39534, 39540, 39560, 39561, 39567, 39571, 39572, 39574, 39577, 39595, 39630, 39631, 39633, 39635, 39638, 39643, 39645, 39647, 39648, 39652, 39653, 39656, 39657, 39661, 39664, 39665, 39666, 39667, 39668, 39669, 39739, 39741, 39743, 39747, 39755, 39756, 39759, 39762, 39769, 39773, 39776, 39813, 39815, 39817, 39819, 39823, 39824, 39825, 39826, 39832, 39834, 39836, 39840, 39841, 39842, 39845, 39846, 39851, 39859, 39861, 39862, 39866, 39870, 39877, 39885, 39886, 40007, 40011, 40019, 40036, 40050, 40057, 40058, 40070, 40075, 40146, 40150, 40170, 40171, 40202, 40203, 40208, 40210, 40211, 40212, 40215, 40216, 40218, 40231, 40280, 40313, 40334, 40336, 40337, 40348, 40351, 40357, 40358, 40360, 40361, 40371, 40374, 40390, 40402, 40404, 40419, 40434, 40437, 40445, 40447, 40448, 40460, 40472, 40481, 40486, 40489, 40504, 40505, 40506, 40507, 40508, 40510, 40517, 40526, 40536, 40701, 40729, 40734, 40759, 40763, 40769, 40771, 40801, 40803, 40806, 40807, 40808, 40810, 40813, 40815, 40816, 40818, 40819, 40820, 40823, 40824, 40826, 40827, 40828, 40829, 40830, 40831, 40840, 40843, 40844, 40845, 40847, 40849, 40854, 40855, 40856, 40858, 40862, 40863, 40865, 40868, 40870, 40873, 40874, 40902, 40903, 40906, 40913, 40914, 40915, 40921, 40923, 40927, 40935, 40939, 40940, 40941, 40943, 40946, 40949, 40953, 40958, 40962, 40964, 40965, 40972, 40977, 40979, 40981, 40982, 40983, 40988, 40995, 40997, 41008, 41014, 41033, 41035, 41040, 41043, 41045, 41074, 41083, 41095, 41097, 41099, 41101, 41102, 41121, 41124, 41129, 41132, 41135, 41139, 41141, 41142, 41143, 41144, 41146, 41149, 41159, 41164, 41166, 41168, 41169, 41171, 41174, 41175, 41179, 41180, 41181, 41183, 41189, 41201, 41203, 41204, 41214, 41216, 41219, 41222, 41224, 41226, 41230, 41231, 41232, 41234, 41238, 41240, 41250, 41254, 41255, 41256, 41257, 41260, 41262, 41263, 41264, 41265, 41267, 41268, 41271, 41274, 41301, 41310, 41311, 41314, 41317, 41332, 41339, 41348, 41351, 41352, 41360, 41364, 41365, 41366, 41367, 41385, 41386, 41390, 41397, 41408, 41421, 41425, 41464, 41465, 41472, 41501, 41503, 41512, 41513, 41514, 41517, 41519, 41522, 41524, 41526, 41527, 41528, 41531, 41534, 41535, 41537, 41538, 41539, 41540, 41543, 41544, 41547, 41548, 41553, 41554, 41555, 41557, 41558, 41559, 41560, 41562, 41563, 41564, 41566, 41567, 41568, 41571, 41572, 41601, 41602, 41603, 41604, 41605, 41606, 41607, 41612, 41615, 41616, 41619, 41621, 41622, 41630, 41631, 41632, 41635, 41636, 41640, 41642, 41643, 41645, 41647, 41649, 41650, 41651, 41653, 41655, 41659, 41660, 41663, 41666, 41667, 41669, 41701, 41712, 41713, 41714, 41719, 41721, 41722, 41723, 41725, 41727, 41729, 41731, 41735, 41739, 41740, 41745, 41746, 41749, 41751, 41754, 41759, 41760, 41762, 41763, 41764, 41766, 41772, 41773, 41774, 41775, 41776, 41777, 41778, 41804, 41810, 41812, 41815, 41817, 41819, 41821, 41822, 41824, 41825, 41826, 41828, 41831, 41832, 41833, 41834, 41835, 41836, 41837, 41838, 41839, 41840, 41843, 41844, 41845, 41847, 41848, 41849, 41855, 41858, 41859, 41861, 41862, 42020, 42028, 42036, 42047, 42049, 42050, 42054, 42060, 42071, 42076, 42078, 42087, 42101, 42103, 42104, 42120, 42122, 42123, 42124, 42127, 42129, 42130, 42131, 42140, 42141, 42151, 42153, 42154, 42156, 42159, 42160, 42163, 42164, 42166, 42171, 42204, 42207, 42210, 42211, 42214, 42215, 42217, 42223, 42232, 42236, 42240, 42252, 42254, 42259, 42261, 42262, 42266, 42273, 42274, 42275, 42285, 42320, 42321, 42322, 42323, 42326, 42327, 42328, 42332, 42333, 42337, 42338, 42343, 42344, 42347, 42348, 42349, 42351, 42352, 42354, 42355, 42361, 42367, 42368, 42369, 42370, 42406, 42410, 42420, 42440, 42451, 42452, 42458, 42516, 42519, 42528, 42533, 42539, 42541, 42544, 42553, 42565, 42566, 42602, 42631, 42634, 42635, 42638, 42647, 42649, 42653, 42712, 42713, 42715, 42716, 42721, 42722, 42726, 42728, 42729, 42732, 42741, 42742, 42743, 42746, 42748, 42749, 42753, 42754, 42757, 42759, 42762, 42764, 42765, 42776, 42782, 42784, 42788, 43003, 43007, 43008, 43010, 43109, 43111, 43127, 43135, 43138, 43144, 43149, 43152, 43158, 43201, 43203, 43210, 43211, 43217, 43218, 43222, 43224, 43227, 43229, 43232, 43315, 43317, 43321, 43403, 43434, 43436, 43439, 43446, 43451, 43456, 43465, 43466, 43467, 43504, 43521, 43528, 43537, 43542, 43547, 43560, 43566, 43571, 43604, 43605, 43606, 43607, 43608, 43609, 43610, 43611, 43612, 43613, 43614, 43615, 43616, 43617, 43620, 43623, 43711, 43713, 43717, 43718, 43719, 43721, 43724, 43728, 43730, 43731, 43733, 43748, 43756, 43758, 43759, 43761, 43764, 43766, 43772, 43779, 43782, 43783, 43787, 43788, 43791, 43805, 43811, 43836, 43843, 43844, 43901, 43902, 43903, 43905, 43906, 43908, 43909, 43910, 43912, 43913, 43914, 43917, 43925, 43926, 43928, 43930, 43932, 43933, 43934, 43935, 43938, 43939, 43940, 43942, 43943, 43944, 43947, 43948, 43950, 43951, 43952, 43953, 43961, 43963, 43964, 43967, 43971, 43972, 43976, 43977, 43983, 43985, 43986, 44032, 44045, 44052, 44055, 44080, 44102, 44103, 44104, 44105, 44106, 44108, 44109, 44110, 44112, 44117, 44119, 44123, 44127, 44128, 44132, 44137, 44144, 44243, 44250, 44255, 44288, 44301, 44304, 44305, 44306, 44307, 44308, 44310, 44311, 44314, 44325, 44401, 44402, 44403, 44404, 44405, 44406, 44410, 44411, 44415, 44417, 44418, 44420, 44424, 44425, 44428, 44429, 44430, 44436, 44437, 44438, 44439, 44440, 44442, 44443, 44444, 44446, 44449, 44450, 44451, 44452, 44454, 44470, 44471, 44473, 44481, 44483, 44484, 44485, 44491, 44502, 44503, 44504, 44505, 44506, 44507, 44509, 44510, 44511, 44512, 44514, 44515, 44555, 44607, 44615, 44619, 44620, 44639, 44644, 44651, 44653, 44656, 44671, 44672, 44675, 44678, 44702, 44703, 44704, 44709, 44710, 44813, 44843, 44875, 44878, 44901, 44902, 44903, 44905, 44906, 44907, 45015, 45033, 45101, 45112, 45115, 45119, 45120, 45121, 45130, 45131, 45144, 45160, 45167, 45203, 45205, 45211, 45214, 45216, 45219, 45223, 45224, 45225, 45229, 45232, 45239, 45267, 45307, 45314, 45319, 45323, 45341, 45344, 45349, 45368, 45369, 45372, 45384, 45402, 45403, 45404, 45405, 45406, 45410, 45417, 45426, 45428, 45433, 45435, 45439, 45469, 45501, 45502, 45503, 45504, 45505, 45506, 45616, 45619, 45621, 45622, 45624, 45638, 45642, 45645, 45646, 45650, 45652, 45654, 45658, 45659, 45660, 45669, 45674, 45678, 45680, 45688, 45696, 45699, 45701, 45711, 45715, 45716, 45719, 45721, 45723, 45724, 45727, 45732, 45735, 45739, 45740, 45742, 45744, 45746, 45761, 45764, 45766, 45770, 45771, 45778, 45780, 45782, 45801, 45804, 45805, 45806, 45807, 45808, 45809, 45820, 45850, 45854, 46001, 46011, 46012, 46013, 46016, 46017, 46036, 46044, 46048, 46051, 46056, 46063, 46064, 46070, 46107, 46183, 46201, 46202, 46203, 46204, 46205, 46206, 46208, 46214, 46216, 46217, 46218, 46219, 46220, 46221, 46222, 46224, 46225, 46226, 46227, 46228, 46229, 46235, 46236, 46237, 46239, 46240, 46241, 46250, 46254, 46256, 46260, 46268, 46278, 46303, 46307, 46310, 46311, 46312, 46319, 46320, 46321, 46322, 46323, 46324, 46327, 46342, 46345, 46346, 46349, 46356, 46373, 46375, 46376, 46377, 46379, 46381, 46392, 46394, 46402, 46403, 46404, 46405, 46406, 46407, 46408, 46409, 46410, 46556, 46601, 46613, 46615, 46616, 46624, 46740, 46802, 46803, 46805, 46806, 46807, 46809, 46815, 46819, 46913, 46915, 46917, 46920, 46923, 46929, 46930, 46931, 46957, 46989, 47024, 47108, 47120, 47129, 47137, 47165, 47167, 47174, 47280, 47302, 47303, 47304, 47305, 47306, 47320, 47334, 47335, 47338, 47342, 47367, 47370, 47383, 47396, 47401, 47403, 47404, 47405, 47406, 47408, 47427, 47429, 47431, 47433, 47434, 47435, 47455, 47458, 47460, 47464, 47467, 47468, 47708, 47710, 47711, 47712, 47713, 47714, 47715, 47720, 47725, 47802, 47803, 47804, 47805, 47807, 47809, 47831, 47832, 47836, 47837, 47838, 47842, 47847, 47848, 47849, 47850, 47851, 47853, 47854, 47855, 47857, 47859, 47860, 47861, 47862, 47863, 47865, 47866, 47868, 47869, 47870, 47871, 47872, 47874, 47875, 47876, 47879, 47880, 47882, 47884, 47885, 47901, 47904, 47905, 47906, 47907, 47909, 47920, 47922, 47924, 47928, 47930, 47941, 47942, 47943, 47944, 47948, 47951, 47959, 47963, 47964, 47966, 47971, 47974, 47977, 47978, 47981, 47983, 47986, 47992, 47997, 48015, 48021, 48030, 48062, 48089, 48091, 48097, 48101, 48111, 48120, 48122, 48124, 48125, 48126, 48127, 48128, 48133, 48134, 48135, 48138, 48141, 48146, 48150, 48152, 48154, 48157, 48164, 48173, 48174, 48180, 48183, 48184, 48185, 48186, 48187, 48188, 48192, 48193, 48195, 48201, 48202, 48203, 48204, 48205, 48206, 48207, 48208, 48209, 48210, 48211, 48212, 48213, 48214, 48215, 48216, 48217, 48218, 48219, 48221, 48223, 48224, 48225, 48226, 48227, 48228, 48229, 48230, 48233, 48234, 48235, 48236, 48238, 48239, 48240, 48242, 48243, 48340, 48341, 48342, 48411, 48415, 48417, 48420, 48421, 48423, 48433, 48436, 48437, 48438, 48439, 48451, 48457, 48458, 48463, 48464, 48473, 48476, 48502, 48503, 48504, 48505, 48506, 48507, 48509, 48519, 48529, 48532, 48601, 48602, 48603, 48604, 48607, 48609, 48611, 48614, 48616, 48617, 48618, 48622, 48623, 48625, 48626, 48629, 48630, 48631, 48632, 48633, 48634, 48636, 48638, 48649, 48650, 48651, 48655, 48656, 48705, 48706, 48708, 48710, 48722, 48724, 48728, 48732, 48734, 48737, 48747, 48750, 48761, 48762, 48766, 48818, 48819, 48824, 48825, 48829, 48834, 48838, 48842, 48846, 48850, 48852, 48854, 48858, 48859, 48864, 48870, 48878, 48884, 48885, 48886, 48888, 48891, 48892, 48893, 48895, 48896, 48910, 48911, 48912, 48915, 48933, 49006, 49007, 49011, 49014, 49015, 49017, 49022, 49027, 49029, 49033, 49037, 49043, 49047, 49051, 49063, 49068, 49074, 49092, 49098, 49104, 49107, 49113, 49119, 49126, 49202, 49237, 49245, 49251, 49252, 49261, 49264, 49267, 49283, 49285, 49303, 49304, 49305, 49307, 49310, 49318, 49320, 49322, 49326, 49329, 49330, 49332, 49336, 49339, 49340, 49342, 49346, 49347, 49415, 49440, 49441, 49442, 49443, 49444, 49445, 49451, 49457, 49461, 49548, 49616, 49619, 49621, 49623, 49625, 49628, 49635, 49638, 49642, 49644, 49645, 49656, 49663, 49664, 49683, 49701, 49705, 49709, 49718, 49719, 49728, 49745, 49746, 49748, 49755, 49756, 49757, 49760, 49762, 49768, 49769, 49775, 49781, 49782, 49784, 49788, 49799, 49802, 49806, 49816, 49820, 49822, 49825, 49826, 49827, 49835, 49838, 49839, 49848, 49862, 49864, 49891, 49905, 49910, 49912, 49913, 49916, 49917, 49921, 49922, 49925, 49929, 49930, 49931, 49934, 49942, 49947, 49948, 49952, 49953, 49955, 49960, 49961, 49963, 49965, 49967, 49969, 49971, 50010, 50012, 50013, 50028, 50029, 50042, 50046, 50054, 50055, 50056, 50057, 50062, 50064, 50065, 50067, 50103, 50105, 50107, 50108, 50124, 50127, 50134, 50135, 50136, 50137, 50144, 50153, 50154, 50163, 50168, 50201, 50208, 50217, 50228, 50232, 50235, 50236, 50251, 50255, 50262, 50268, 50278, 50313, 50314, 50315, 50316, 50538, 50552, 50578, 50586, 50606, 50707, 51101, 51105, 51111, 51453, 51501, 51545, 51564, 52142, 52157, 52158, 52169, 52235, 52242, 52355, 52401, 52544, 52549, 52555, 52556, 52557, 52567, 52571, 52572, 52574, 52580, 52581, 52593, 52635, 52801, 53110, 53129, 53130, 53132, 53140, 53154, 53156, 53172, 53202, 53203, 53204, 53205, 53206, 53207, 53208, 53209, 53210, 53211, 53212, 53213, 53214, 53215, 53216, 53217, 53218, 53219, 53220, 53221, 53222, 53223, 53224, 53225, 53226, 53227, 53228, 53233, 53235, 53295, 53506, 53522, 53526, 53543, 53550, 53553, 53580, 53706, 53726, 53792, 53910, 53934, 53936, 53969, 54003, 54011, 54013, 54014, 54021, 54027, 54028, 54102, 54103, 54104, 54119, 54124, 54125, 54135, 54138, 54149, 54150, 54161, 54174, 54175, 54211, 54212, 54303, 54307, 54405, 54465, 54485, 54491, 54511, 54520, 54525, 54538, 54541, 54542, 54566, 54603, 54613, 54723, 54732, 54750, 54761, 54767, 54814, 54821, 54850, 54858, 54862, 54867, 55029, 55055, 55106, 55107, 55130, 55155, 55321, 55404, 55411, 55412, 55414, 55420, 55421, 55425, 55428, 55429, 55430, 55432, 55433, 55454, 55455, 55702, 55704, 55705, 55706, 55711, 55720, 55735, 55753, 55805, 55806, 55808, 55814, 55922, 55924, 55939, 55954, 56001, 56010, 56024, 56034, 56037, 56055, 56065, 56080, 56090, 56145, 56313, 56321, 56353, 56359, 56363, 56386, 56387, 56435, 56440, 56446, 56474, 56481, 56484, 56516, 56521, 56557, 56562, 56563, 56566, 56569, 56575, 56589, 56591, 56626, 56628, 56633, 56641, 56651, 56655, 56657, 56662, 56666, 56670, 56672, 57007, 57021, 57036, 57069, 57070, 57073, 57197, 57239, 57257, 57273, 57339, 57341, 57356, 57361, 57365, 57367, 57521, 57531, 57543, 57544, 57547, 57548, 57551, 57552, 57553, 57555, 57559, 57560, 57562, 57563, 57566, 57567, 57568, 57569, 57570, 57572, 57574, 57576, 57577, 57579, 57585, 57601, 57621, 57622, 57623, 57625, 57630, 57633, 57634, 57636, 57639, 57641, 57642, 57645, 57652, 57656, 57657, 57658, 57659, 57660, 57661, 57706, 57714, 57716, 57719, 57725, 57732, 57735, 57737, 57747, 57748, 57750, 57752, 57754, 57756, 57759, 57761, 57763, 57764, 57766, 57767, 57770, 57772, 57775, 57780, 57782, 57783, 57787, 57790, 57791, 57792, 57794, 57799, 58076, 58102, 58105, 58202, 58204, 58205, 58310, 58316, 58329, 58332, 58335, 58343, 58346, 58348, 58351, 58353, 58357, 58366, 58369, 58370, 58379, 58385, 58405, 58428, 58475, 58478, 58482, 58487, 58488, 58528, 58538, 58568, 58704, 58705, 59016, 59022, 59025, 59031, 59036, 59038, 59043, 59046, 59053, 59059, 59068, 59070, 59071, 59072, 59074, 59076, 59078, 59085, 59212, 59226, 59240, 59241, 59250, 59255, 59261, 59273, 59311, 59319, 59324, 59332, 59401, 59410, 59411, 59414, 59417, 59421, 59427, 59432, 59434, 59435, 59444, 59446, 59448, 59450, 59453, 59454, 59456, 59460, 59461, 59466, 59474, 59482, 59484, 59486, 59520, 59522, 59523, 59524, 59526, 59527, 59529, 59531, 59535, 59537, 59538, 59542, 59544, 59545, 59546, 59547, 59623, 59625, 59639, 59642, 59645, 59711, 59713, 59722, 59728, 59731, 59733, 59756, 59801, 59802, 59803, 59804, 59808, 59812, 59820, 59821, 59823, 59825, 59826, 59828, 59830, 59831, 59832, 59834, 59837, 59842, 59843, 59844, 59846, 59847, 59848, 59851, 59853, 59854, 59855, 59856, 59858, 59859, 59864, 59866, 59867, 59868, 59872, 59873, 59874, 59913, 59916, 59917, 59918, 59919, 59923, 59926, 59927, 59928, 59930, 59933, 59934, 59935, 59936, 60034, 60040, 60064, 60085, 60087, 60088, 60104, 60111, 60112, 60115, 60135, 60144, 60145, 60146, 60150, 60153, 60160, 60163, 60165, 60178, 60208, 60403, 60406, 60409, 60411, 60415, 60419, 60426, 60428, 60429, 60433, 60455, 60456, 60469, 60472, 60475, 60482, 60501, 60505, 60520, 60550, 60552, 60556, 60608, 60612, 60617, 60619, 60620, 60621, 60623, 60624, 60628, 60629, 60632, 60633, 60636, 60637, 60639, 60644, 60649, 60651, 60653, 60804, 60827, 60915, 60932, 60949, 60958, 60963, 61104, 61236, 61239, 61260, 61272, 61282, 61323, 61411, 61416, 61420, 61422, 61424, 61431, 61438, 61440, 61442, 61451, 61455, 61470, 61475, 61476, 61501, 61524, 61539, 61543, 61559, 61563, 61564, 61602, 61603, 61604, 61606, 61610, 61616, 61625, 61730, 61737, 61770, 61801, 61802, 61810, 61811, 61812, 61813, 61814, 61815, 61816, 61817, 61820, 61821, 61822, 61831, 61832, 61833, 61834, 61840, 61841, 61843, 61844, 61845, 61846, 61847, 61848, 61849, 61850, 61851, 61852, 61853, 61857, 61858, 61859, 61862, 61863, 61864, 61865, 61866, 61870, 61871, 61872, 61873, 61874, 61875, 61876, 61877, 61878, 61880, 61883, 62009, 62023, 62026, 62030, 62033, 62040, 62048, 62059, 62060, 62069, 62084, 62085, 62086, 62087, 62090, 62093, 62098, 62201, 62203, 62204, 62205, 62206, 62207, 62239, 62240, 62246, 62250, 62253, 62273, 62275, 62284, 62326, 62523, 62649, 62667, 62672, 62674, 62701, 62703, 62706, 62822, 62835, 62862, 62885, 62901, 62902, 62903, 62907, 62914, 62915, 62917, 62921, 62922, 62923, 62924, 62927, 62928, 62930, 62932, 62935, 62938, 62939, 62940, 62941, 62942, 62943, 62946, 62949, 62950, 62954, 62957, 62962, 62963, 62964, 62965, 62966, 62967, 62969, 62970, 62972, 62975, 62976, 62977, 62983, 62984, 62985, 62987, 62988, 62990, 62992, 62994, 62995, 62996, 62999, 63023, 63030, 63041, 63042, 63044, 63045, 63047, 63053, 63060, 63061, 63074, 63079, 63101, 63102, 63103, 63104, 63106, 63107, 63108, 63109, 63110, 63111, 63112, 63113, 63114, 63115, 63116, 63118, 63120, 63121, 63125, 63133, 63134, 63135, 63136, 63137, 63138, 63139, 63140, 63147, 63155, 63343, 63380, 63388, 63437, 63446, 63451, 63458, 63460, 63501, 63533, 63537, 63540, 63541, 63547, 63559, 63561, 63622, 63623, 63624, 63631, 63648, 63653, 63660, 63662, 63675, 63701, 63703, 63739, 63743, 63744, 63745, 63747, 63750, 63751, 63755, 63760, 63763, 63764, 63766, 63769, 63781, 63782, 63785, 63787, 63820, 63821, 63823, 63826, 63827, 63828, 63829, 63830, 63833, 63834, 63837, 63839, 63840, 63845, 63847, 63848, 63849, 63851, 63852, 63853, 63855, 63857, 63860, 63862, 63863, 63866, 63867, 63868, 63869, 63870, 63873, 63874, 63876, 63877, 63878, 63879, 63880, 63882, 63933, 63934, 63935, 63939, 63941, 63942, 63944, 63945, 63950, 63951, 63952, 63953, 63954, 63955, 63956, 63957, 63964, 63965, 63966, 64022, 64030, 64035, 64036, 64050, 64052, 64053, 64054, 64055, 64065, 64074, 64084, 64085, 64096, 64097, 64109, 64116, 64117, 64120, 64123, 64124, 64125, 64126, 64127, 64128, 64129, 64130, 64132, 64146, 64147, 64163, 64164, 64401, 64423, 64428, 64431, 64432, 64433, 64434, 64440, 64443, 64445, 64448, 64455, 64457, 64459, 64461, 64468, 64476, 64479, 64480, 64483, 64487, 64501, 64503, 64504, 64506, 64507, 64637, 64644, 64650, 64651, 64671, 64720, 64722, 64723, 64730, 64738, 64744, 64745, 64756, 64776, 64779, 64780, 64781, 64801, 64804, 64830, 64831, 64833, 64834, 64835, 64836, 64840, 64841, 64842, 64843, 64844, 64847, 64849, 64850, 64854, 64855, 64856, 64857, 64858, 64859, 64861, 64862, 64863, 64865, 64866, 64867, 64868, 64870, 65037, 65051, 65059, 65065, 65067, 65068, 65072, 65077, 65215, 65216, 65230, 65233, 65237, 65248, 65250, 65255, 65274, 65276, 65322, 65326, 65348, 65355, 65409, 65438, 65439, 65441, 65444, 65446, 65449, 65453, 65456, 65464, 65466, 65468, 65479, 65483, 65484, 65535, 65542, 65548, 65552, 65555, 65557, 65564, 65565, 65570, 65571, 65586, 65588, 65589, 65590, 65606, 65609, 65611, 65612, 65613, 65614, 65617, 65618, 65619, 65620, 65622, 65626, 65634, 65637, 65640, 65644, 65648, 65649, 65650, 65652, 65655, 65660, 65662, 65663, 65666, 65667, 65668, 65674, 65676, 65680, 65685, 65688, 65689, 65690, 65692, 65704, 65706, 65710, 65711, 65713, 65715, 65724, 65725, 65726, 65727, 65729, 65730, 65732, 65733, 65735, 65738, 65740, 65741, 65742, 65744, 65746, 65753, 65757, 65759, 65760, 65761, 65762, 65764, 65766, 65767, 65770, 65773, 65774, 65775, 65777, 65778, 65779, 65781, 65783, 65784, 65785, 65786, 65788, 65789, 65790, 65791, 65793, 65801, 65802, 65803, 65804, 65806, 65807, 65809, 65810, 65897, 66002, 66006, 66008, 66010, 66014, 66016, 66017, 66023, 66024, 66027, 66031, 66035, 66040, 66041, 66045, 66046, 66047, 66049, 66050, 66056, 66058, 66072, 66075, 66087, 66090, 66101, 66102, 66103, 66104, 66105, 66106, 66109, 66111, 66112, 66115, 66118, 66160, 66441, 66442, 66449, 66502, 66503, 66506, 66514, 66517, 66531, 66554, 66603, 66607, 66608, 66612, 66616, 66621, 66758, 66761, 66767, 66783, 66936, 66941, 66942, 66949, 66956, 66963, 66970, 67003, 67009, 67018, 67022, 67073, 67117, 67123, 67150, 67203, 67211, 67213, 67214, 67216, 67218, 67221, 67260, 67334, 67345, 67346, 67349, 67352, 67353, 67355, 67360, 67361, 67512, 67573, 67622, 67645, 67654, 68010, 68056, 68062, 68071, 68105, 68107, 68108, 68111, 68113, 68131, 68178, 68305, 68320, 68321, 68337, 68348, 68355, 68376, 68378, 68414, 68421, 68431, 68433, 68442, 68457, 68503, 68504, 68508, 68588, 68710, 68723, 68728, 68733, 68740, 68787, 68790, 68821, 68833, 68849, 68929, 68939, 68952, 68960, 68970, 68972, 69147, 69148, 69154, 69157, 69167, 69337, 69339, 69346, 69354, 69358, 69367, 70031, 70032, 70038, 70040, 70041, 70043, 70049, 70050, 70051, 70052, 70067, 70068, 70071, 70075, 70076, 70082, 70084, 70085, 70086, 70087, 70090, 70091, 70092, 70094, 70112, 70113, 70114, 70115, 70116, 70117, 70118, 70119, 70122, 70124, 70125, 70126, 70127, 70128, 70129, 70130, 70131, 70139, 70148, 70163, 70310, 70339, 70340, 70341, 70344, 70346, 70352, 70353, 70354, 70355, 70356, 70357, 70359, 70360, 70363, 70372, 70375, 70390, 70391, 70393, 70394, 70395, 70397, 70401, 70402, 70403, 70422, 70426, 70427, 70436, 70438, 70441, 70442, 70444, 70446, 70450, 70451, 70453, 70454, 70455, 70456, 70462, 70463, 70464, 70465, 70466, 70506, 70510, 70512, 70513, 70515, 70516, 70517, 70519, 70524, 70525, 70526, 70528, 70531, 70533, 70534, 70535, 70537, 70541, 70542, 70543, 70548, 70550, 70551, 70552, 70554, 70555, 70556, 70559, 70560, 70563, 70570, 70575, 70576, 70577, 70578, 70580, 70582, 70584, 70585, 70586, 70589, 70601, 70605, 70607, 70609, 70611, 70615, 70629, 70630, 70631, 70632, 70643, 70645, 70646, 70660, 70663, 70665, 70668, 70669, 70715, 70721, 70723, 70732, 70736, 70740, 70743, 70747, 70748, 70749, 70750, 70752, 70753, 70755, 70756, 70757, 70759, 70760, 70762, 70763, 70764, 70772, 70773, 70776, 70780, 70782, 70783, 70786, 70787, 70788, 70801, 70802, 70803, 70805, 70807, 70811, 70812, 70813, 70819, 70825, 71001, 71002, 71003, 71004, 71007, 71008, 71009, 71016, 71021, 71023, 71024, 71027, 71028, 71029, 71030, 71031, 71032, 71033, 71038, 71039, 71040, 71043, 71044, 71045, 71046, 71047, 71048, 71049, 71052, 71055, 71060, 71061, 71063, 71066, 71067, 71068, 71069, 71070, 71071, 71072, 71073, 71078, 71079, 71082, 71101, 71103, 71104, 71105, 71106, 71107, 71108, 71109, 71110, 71118, 71119, 71129, 71201, 71202, 71203, 71209, 71212, 71218, 71219, 71220, 71222, 71223, 71225, 71226, 71229, 71230, 71232, 71233, 71234, 71235, 71237, 71238, 71241, 71243, 71245, 71250, 71253, 71254, 71256, 71259, 71260, 71261, 71264, 71266, 71269, 71272, 71275, 71276, 71277, 71279, 71280, 71282, 71286, 71291, 71292, 71295, 71301, 71302, 71303, 71316, 71320, 71322, 71323, 71325, 71327, 71328, 71330, 71331, 71333, 71334, 71336, 71339, 71341, 71345, 71346, 71350, 71351, 71353, 71354, 71355, 71356, 71357, 71358, 71359, 71360, 71362, 71366, 71367, 71369, 71373, 71375, 71378, 71404, 71405, 71407, 71409, 71410, 71411, 71414, 71415, 71416, 71417, 71418, 71422, 71423, 71424, 71427, 71428, 71430, 71432, 71433, 71434, 71435, 71447, 71450, 71452, 71454, 71455, 71456, 71457, 71459, 71466, 71467, 71468, 71469, 71472, 71473, 71480, 71483, 71485, 71497, 71601, 71602, 71603, 71630, 71639, 71640, 71643, 71644, 71652, 71653, 71654, 71658, 71659, 71660, 71662, 71665, 71666, 71667, 71670, 71674, 71678, 71701, 71721, 71722, 71725, 71726, 71728, 71740, 71743, 71748, 71751, 71752, 71753, 71758, 71764, 71770, 71772, 71823, 71826, 71827, 71831, 71833, 71834, 71835, 71837, 71838, 71839, 71845, 71851, 71854, 71857, 71858, 71859, 71860, 71861, 71862, 71864, 71901, 71909, 71913, 71923, 71933, 71935, 71937, 71944, 71945, 71949, 71953, 71956, 71957, 71960, 71961, 71962, 71964, 71965, 71968, 71969, 71970, 71971, 71972, 71973, 71998, 71999, 72001, 72004, 72005, 72006, 72013, 72014, 72016, 72017, 72024, 72025, 72028, 72031, 72035, 72040, 72046, 72051, 72053, 72059, 72060, 72066, 72070, 72072, 72075, 72082, 72083, 72084, 72088, 72099, 72103, 72106, 72111, 72112, 72114, 72118, 72119, 72125, 72126, 72128, 72129, 72133, 72141, 72152, 72153, 72165, 72168, 72169, 72175, 72178, 72179, 72180, 72182, 72183, 72199, 72202, 72204, 72206, 72209, 72301, 72311, 72313, 72320, 72322, 72325, 72326, 72327, 72328, 72330, 72331, 72332, 72333, 72335, 72338, 72339, 72340, 72341, 72342, 72346, 72347, 72348, 72350, 72352, 72353, 72354, 72355, 72359, 72360, 72364, 72365, 72366, 72367, 72368, 72369, 72372, 72373, 72374, 72376, 72377, 72379, 72383, 72384, 72386, 72389, 72390, 72391, 72392, 72394, 72401, 72404, 72405, 72410, 72411, 72414, 72417, 72419, 72421, 72422, 72424, 72427, 72428, 72429, 72430, 72431, 72432, 72433, 72435, 72437, 72441, 72445, 72447, 72453, 72454, 72456, 72457, 72460, 72461, 72464, 72467, 72470, 72471, 72472, 72473, 72476, 72479, 72482, 72512, 72513, 72515, 72517, 72520, 72523, 72529, 72531, 72532, 72533, 72534, 72536, 72538, 72539, 72542, 72554, 72555, 72560, 72564, 72565, 72567, 72568, 72569, 72571, 72576, 72578, 72583, 72584, 72585, 72587, 72619, 72623, 72626, 72628, 72629, 72634, 72635, 72636, 72639, 72645, 72650, 72655, 72661, 72663, 72666, 72668, 72669, 72672, 72675, 72677, 72679, 72680, 72682, 72683, 72686, 72687, 72701, 72703, 72704, 72717, 72721, 72727, 72729, 72730, 72738, 72740, 72742, 72744, 72747, 72749, 72751, 72752, 72753, 72760, 72762, 72764, 72768, 72769, 72773, 72774, 72776, 72821, 72830, 72832, 72837, 72839, 72840, 72841, 72843, 72845, 72846, 72852, 72854, 72856, 72901, 72903, 72904, 72905, 72908, 72916, 72921, 72923, 72926, 72928, 72930, 72932, 72933, 72934, 72935, 72936, 72937, 72938, 72940, 72941, 72945, 72946, 72947, 72948, 72949, 72950, 72952, 72955, 72956, 72959, 73002, 73011, 73015, 73019, 73050, 73058, 73066, 73067, 73082, 73084, 73105, 73106, 73107, 73108, 73109, 73111, 73112, 73114, 73115, 73117, 73119, 73122, 73129, 73139, 73141, 73149, 73439, 73450, 73456, 73501, 73503, 73505, 73507, 73520, 73527, 73528, 73530, 73531, 73538, 73540, 73541, 73542, 73543, 73546, 73548, 73551, 73552, 73553, 73555, 73557, 73562, 73565, 73567, 73568, 73569, 73570, 73572, 73573, 73651, 73701, 73703, 73705, 73720, 73727, 73730, 73733, 73735, 73736, 73738, 73739, 73741, 73743, 73753, 73773, 74001, 74002, 74003, 74010, 74020, 74023, 74026, 74027, 74028, 74030, 74032, 74034, 74035, 74038, 74039, 74041, 74042, 74044, 74045, 74046, 74047, 74050, 74052, 74054, 74056, 74058, 74059, 74060, 74062, 74066, 74068, 74070, 74071, 74074, 74075, 74077, 74078, 74079, 74081, 74084, 74085, 74106, 74108, 74110, 74112, 74115, 74116, 74126, 74127, 74128, 74129, 74130, 74131, 74171, 74301, 74333, 74339, 74342, 74343, 74349, 74354, 74358, 74360, 74363, 74369, 74370, 74421, 74426, 74427, 74431, 74432, 74435, 74437, 74438, 74445, 74447, 74454, 74456, 74458, 74459, 74460, 74477, 74521, 74523, 74531, 74536, 74543, 74557, 74558, 74562, 74563, 74567, 74574, 74577, 74578, 74633, 74637, 74640, 74650, 74652, 74722, 74724, 74727, 74728, 74734, 74736, 74737, 74740, 74745, 74750, 74754, 74759, 74764, 74766, 74824, 74827, 74829, 74830, 74831, 74832, 74833, 74834, 74837, 74839, 74845, 74848, 74849, 74850, 74855, 74859, 74860, 74867, 74868, 74869, 74875, 74880, 74881, 74883, 74884, 74931, 74936, 74937, 74939, 74940, 74945, 74946, 74948, 74949, 74954, 74955, 74960, 74962, 74963, 74964, 74965, 75021, 75041, 75042, 75051, 75060, 75061, 75101, 75116, 75134, 75141, 75143, 75149, 75161, 75172, 75180, 75203, 75210, 75211, 75212, 75215, 75216, 75217, 75224, 75227, 75228, 75232, 75236, 75237, 75241, 75249, 75253, 75390, 75428, 75429, 75471, 75478, 75493, 75559, 75560, 75561, 75562, 75564, 75566, 75568, 75569, 75573, 75574, 75601, 75602, 75603, 75604, 75605, 75630, 75640, 75641, 75642, 75644, 75647, 75650, 75651, 75652, 75654, 75656, 75657, 75658, 75659, 75661, 75662, 75667, 75670, 75671, 75672, 75680, 75681, 75682, 75683, 75684, 75687, 75689, 75691, 75692, 75693, 75694, 75701, 75702, 75704, 75708, 75711, 75755, 75760, 75779, 75784, 75785, 75788, 75792, 75801, 75835, 75838, 75844, 75847, 75849, 75851, 75856, 75858, 75860, 75884, 75886, 75903, 75925, 75928, 75929, 75930, 75932, 75933, 75937, 75942, 75943, 75944, 75946, 75948, 75949, 75954, 75959, 75961, 75962, 75964, 75965, 75966, 75968, 75972, 75977, 75980, 76010, 76014, 76023, 76058, 76059, 76071, 76086, 76102, 76103, 76104, 76105, 76106, 76111, 76112, 76114, 76115, 76117, 76119, 76127, 76129, 76134, 76155, 76164, 76201, 76203, 76225, 76241, 76245, 76264, 76267, 76301, 76302, 76306, 76308, 76309, 76311, 76354, 76366, 76367, 76370, 76380, 76402, 76431, 76435, 76443, 76445, 76454, 76469, 76501, 76502, 76504, 76513, 76519, 76522, 76524, 76528, 76530, 76534, 76541, 76542, 76543, 76544, 76548, 76549, 76554, 76557, 76559, 76561, 76569, 76570, 76571, 76573, 76579, 76596, 76597, 76598, 76599, 76624, 76629, 76630, 76632, 76633, 76638, 76640, 76643, 76651, 76654, 76655, 76656, 76657, 76661, 76680, 76682, 76685, 76691, 76701, 76704, 76705, 76706, 76707, 76708, 76710, 76711, 76712, 76798, 76849, 76852, 76854, 76872, 76903, 76908, 76909, 76951, 77011, 77012, 77013, 77015, 77016, 77020, 77021, 77022, 77023, 77026, 77028, 77029, 77033, 77036, 77037, 77038, 77039, 77045, 77049, 77050, 77051, 77060, 77067, 77072, 77073, 77074, 77076, 77078, 77080, 77081, 77082, 77083, 77085, 77086, 77087, 77088, 77090, 77091, 77092, 77093, 77099, 77204, 77302, 77306, 77327, 77342, 77368, 77369, 77374, 77376, 77412, 77415, 77417, 77422, 77442, 77445, 77446, 77451, 77457, 77460, 77464, 77467, 77468, 77470, 77473, 77477, 77482, 77483, 77485, 77504, 77507, 77514, 77519, 77530, 77531, 77533, 77535, 77538, 77547, 77550, 77555, 77561, 77564, 77575, 77582, 77585, 77587, 77590, 77591, 77613, 77614, 77616, 77617, 77619, 77622, 77623, 77624, 77627, 77629, 77640, 77642, 77650, 77651, 77655, 77656, 77660, 77661, 77663, 77665, 77701, 77702, 77703, 77705, 77706, 77707, 77708, 77713, 77801, 77802, 77803, 77807, 77808, 77837, 77840, 77843, 77845, 77856, 77859, 77866, 77867, 77882, 77901, 77950, 77951, 77957, 77982, 78001, 78003, 78005, 78008, 78011, 78012, 78014, 78017, 78019, 78024, 78026, 78039, 78040, 78041, 78043, 78044, 78045, 78046, 78050, 78052, 78055, 78057, 78059, 78061, 78062, 78063, 78064, 78065, 78067, 78069, 78073, 78076, 78112, 78143, 78151, 78160, 78201, 78203, 78204, 78205, 78207, 78208, 78210, 78211, 78214, 78217, 78218, 78220, 78221, 78224, 78225, 78226, 78227, 78228, 78229, 78234, 78235, 78236, 78237, 78238, 78239, 78242, 78243, 78264, 78336, 78338, 78339, 78341, 78342, 78343, 78344, 78349, 78351, 78352, 78353, 78355, 78358, 78359, 78360, 78361, 78362, 78368, 78369, 78370, 78371, 78374, 78375, 78376, 78382, 78384, 78385, 78387, 78390, 78401, 78405, 78407, 78408, 78411, 78416, 78417, 78419, 78501, 78503, 78504, 78516, 78520, 78521, 78526, 78535, 78536, 78537, 78538, 78539, 78540, 78541, 78542, 78543, 78545, 78547, 78548, 78549, 78550, 78552, 78557, 78558, 78559, 78560, 78561, 78562, 78563, 78564, 78565, 78566, 78567, 78569, 78570, 78572, 78573, 78574, 78575, 78576, 78577, 78578, 78579, 78580, 78582, 78583, 78584, 78585, 78586, 78588, 78589, 78590, 78591, 78592, 78593, 78594, 78595, 78596, 78597, 78598, 78599, 78616, 78617, 78622, 78644, 78648, 78656, 78661, 78674, 78705, 78712, 78721, 78724, 78725, 78741, 78742, 78751, 78752, 78801, 78802, 78827, 78828, 78829, 78830, 78833, 78834, 78836, 78838, 78839, 78850, 78852, 78860, 78870, 78872, 78873, 78877, 78879, 78880, 78881, 78883, 78884, 78885, 78886, 79010, 79016, 79043, 79052, 79063, 79079, 79088, 79095, 79101, 79102, 79103, 79104, 79106, 79107, 79108, 79111, 79124, 79223, 79233, 79236, 79239, 79248, 79251, 79259, 79261, 79316, 79322, 79329, 79343, 79345, 79350, 79357, 79363, 79364, 79366, 79369, 79373, 79378, 79381, 79382, 79383, 79401, 79402, 79403, 79404, 79406, 79410, 79411, 79412, 79413, 79414, 79415, 79416, 79423, 79424, 79501, 79503, 79504, 79508, 79510, 79525, 79536, 79541, 79562, 79563, 79601, 79602, 79603, 79605, 79606, 79607, 79699, 79701, 79718, 79721, 79739, 79741, 79754, 79759, 79763, 79769, 79770, 79772, 79776, 79780, 79783, 79785, 79821, 79835, 79836, 79837, 79838, 79839, 79843, 79845, 79846, 79847, 79849, 79851, 79853, 79855, 79901, 79902, 79903, 79904, 79905, 79906, 79907, 79908, 79911, 79912, 79915, 79916, 79918, 79920, 79922, 79924, 79925, 79927, 79928, 79930, 79932, 79934, 79935, 79936, 79938, 80010, 80011, 80012, 80017, 80024, 80030, 80101, 80214, 80216, 80219, 80221, 80223, 80229, 80236, 80247, 80260, 80310, 80419, 80420, 80430, 80434, 80435, 80449, 80473, 80474, 80480, 80721, 80727, 80735, 80755, 80758, 80759, 80813, 80816, 80820, 80822, 80824, 80830, 80832, 80835, 80840, 80860, 80903, 80910, 80915, 81001, 81003, 81004, 81005, 81006, 81007, 81008, 81019, 81020, 81022, 81023, 81024, 81025, 81027, 81029, 81033, 81036, 81039, 81040, 81041, 81043, 81044, 81046, 81047, 81049, 81052, 81054, 81055, 81057, 81058, 81059, 81062, 81064, 81067, 81069, 81071, 81073, 81076, 81081, 81082, 81084, 81087, 81089, 81090, 81091, 81092, 81101, 81120, 81121, 81123, 81124, 81125, 81126, 81128, 81129, 81130, 81131, 81133, 81136, 81138, 81140, 81141, 81143, 81146, 81147, 81148, 81149, 81151, 81152, 81155, 81211, 81221, 81226, 81228, 81232, 81235, 81244, 81330, 81411, 81413, 81422, 81424, 81429, 81501, 82005, 82051, 82052, 82055, 82058, 82070, 82072, 82073, 82084, 82222, 82225, 82227, 82242, 82324, 82327, 82335, 82410, 82411, 82422, 82426, 82428, 82430, 82432, 82434, 82441, 82443, 82450, 82510, 82512, 82514, 82516, 82523, 82644, 82701, 82723, 82730, 82929, 82934, 83101, 83111, 83114, 83119, 83120, 83122, 83123, 83124, 83126, 83201, 83202, 83203, 83204, 83209, 83212, 83213, 83214, 83217, 83226, 83227, 83228, 83232, 83233, 83234, 83235, 83237, 83238, 83241, 83244, 83245, 83246, 83250, 83251, 83253, 83254, 83255, 83263, 83271, 83276, 83278, 83281, 83283, 83285, 83286, 83301, 83302, 83316, 83321, 83325, 83328, 83332, 83334, 83335, 83337, 83338, 83341, 83401, 83402, 83404, 83406, 83425, 83427, 83428, 83429, 83431, 83433, 83434, 83435, 83436, 83440, 83442, 83443, 83444, 83445, 83448, 83449, 83450, 83454, 83460, 83462, 83463, 83464, 83465, 83466, 83467, 83468, 83469, 83520, 83522, 83524, 83540, 83541, 83542, 83545, 83547, 83548, 83549, 83602, 83604, 83605, 83607, 83615, 83617, 83622, 83623, 83624, 83626, 83627, 83628, 83629, 83631, 83633, 83634, 83636, 83637, 83639, 83641, 83644, 83648, 83650, 83651, 83656, 83657, 83660, 83666, 83670, 83676, 83677, 83686, 83687, 83725, 83803, 83804, 83806, 83810, 83811, 83822, 83823, 83825, 83830, 83834, 83836, 83837, 83840, 83841, 83842, 83843, 83844, 83847, 83852, 83854, 83855, 83857, 83858, 83864, 83866, 83868, 83871, 83872, 83876, 84003, 84004, 84005, 84013, 84022, 84029, 84034, 84042, 84043, 84045, 84056, 84057, 84058, 84059, 84062, 84083, 84097, 84102, 84112, 84113, 84114, 84115, 84119, 84180, 84304, 84305, 84308, 84318, 84319, 84320, 84321, 84322, 84325, 84326, 84327, 84328, 84332, 84333, 84335, 84338, 84339, 84341, 84511, 84512, 84516, 84522, 84523, 84525, 84530, 84531, 84533, 84534, 84535, 84536, 84601, 84602, 84604, 84606, 84621, 84622, 84623, 84626, 84627, 84629, 84630, 84632, 84633, 84634, 84642, 84643, 84646, 84647, 84651, 84653, 84655, 84660, 84662, 84663, 84664, 84665, 84667, 84710, 84712, 84714, 84716, 84718, 84719, 84720, 84721, 84722, 84723, 84725, 84726, 84729, 84732, 84733, 84735, 84736, 84737, 84738, 84740, 84741, 84742, 84743, 84745, 84746, 84750, 84753, 84755, 84756, 84757, 84758, 84759, 84760, 84761, 84762, 84763, 84764, 84765, 84767, 84770, 84772, 84774, 84776, 84779, 84780, 84781, 84782, 84783, 84784, 84790, 85006, 85007, 85008, 85009, 85015, 85017, 85019, 85026, 85029, 85031, 85033, 85034, 85035, 85040, 85051, 85119, 85120, 85121, 85122, 85128, 85132, 85135, 85137, 85138, 85139, 85140, 85147, 85172, 85173, 85191, 85192, 85193, 85201, 85210, 85226, 85256, 85281, 85301, 85303, 85309, 85320, 85321, 85322, 85324, 85325, 85326, 85328, 85329, 85332, 85333, 85334, 85335, 85336, 85337, 85339, 85341, 85344, 85346, 85347, 85348, 85349, 85350, 85351, 85352, 85354, 85356, 85357, 85360, 85361, 85362, 85363, 85364, 85365, 85367, 85371, 85378, 85390, 85530, 85532, 85539, 85542, 85550, 85553, 85554, 85601, 85603, 85605, 85606, 85607, 85608, 85609, 85610, 85613, 85615, 85616, 85617, 85618, 85620, 85621, 85623, 85624, 85625, 85626, 85627, 85630, 85631, 85632, 85633, 85634, 85635, 85638, 85639, 85640, 85643, 85646, 85648, 85650, 85653, 85701, 85705, 85706, 85709, 85711, 85712, 85719, 85721, 85723, 85724, 85726, 85734, 85735, 85736, 85739, 85746, 85757, 85901, 85902, 85911, 85912, 85920, 85923, 85924, 85925, 85926, 85927, 85928, 85929, 85930, 85931, 85932, 85933, 85934, 85935, 85936, 85937, 85938, 85939, 85940, 85941, 85942, 86001, 86003, 86004, 86005, 86011, 86015, 86016, 86017, 86018, 86020, 86021, 86022, 86023, 86024, 86025, 86028, 86029, 86030, 86031, 86032, 86033, 86034, 86035, 86036, 86038, 86039, 86040, 86042, 86043, 86044, 86045, 86046, 86047, 86052, 86053, 86054, 86301, 86303, 86305, 86313, 86314, 86315, 86320, 86321, 86322, 86323, 86324, 86325, 86326, 86327, 86329, 86331, 86332, 86333, 86334, 86335, 86336, 86337, 86338, 86343, 86351, 86401, 86403, 86404, 86406, 86409, 86411, 86413, 86426, 86429, 86431, 86432, 86433, 86434, 86435, 86436, 86437, 86438, 86440, 86441, 86442, 86443, 86444, 86445, 86502, 86503, 86504, 86505, 86506, 86507, 86508, 86510, 86511, 86512, 86514, 86515, 86520, 86535, 86538, 86540, 86544, 86545, 86547, 86556, 87001, 87002, 87004, 87006, 87007, 87010, 87011, 87012, 87013, 87016, 87018, 87022, 87023, 87026, 87027, 87028, 87031, 87032, 87034, 87035, 87036, 87037, 87038, 87040, 87041, 87042, 87043, 87045, 87052, 87056, 87060, 87061, 87062, 87063, 87068, 87070, 87072, 87083, 87101, 87102, 87105, 87106, 87108, 87116, 87117, 87121, 87124, 87151, 87301, 87305, 87310, 87311, 87312, 87313, 87316, 87317, 87319, 87320, 87322, 87323, 87325, 87326, 87327, 87328, 87347, 87364, 87365, 87375, 87401, 87402, 87410, 87413, 87415, 87416, 87417, 87418, 87420, 87421, 87455, 87461, 87499, 87505, 87511, 87516, 87522, 87527, 87535, 87537, 87538, 87540, 87543, 87552, 87553, 87557, 87560, 87562, 87565, 87566, 87567, 87569, 87573, 87579, 87582, 87583, 87701, 87710, 87711, 87712, 87713, 87714, 87715, 87718, 87722, 87723, 87724, 87728, 87729, 87730, 87731, 87732, 87733, 87734, 87735, 87736, 87740, 87742, 87743, 87745, 87746, 87747, 87749, 87750, 87752, 87753, 87801, 87820, 87821, 87823, 87824, 87825, 87827, 87828, 87829, 87830, 87831, 87832, 87901, 87930, 87931, 87933, 87935, 87936, 87937, 87939, 87940, 87941, 87942, 87943, 88001, 88002, 88003, 88004, 88005, 88007, 88008, 88011, 88012, 88021, 88022, 88023, 88024, 88025, 88026, 88027, 88028, 88029, 88030, 88034, 88038, 88039, 88041, 88042, 88043, 88044, 88046, 88047, 88048, 88049, 88051, 88052, 88053, 88055, 88061, 88063, 88065, 88072, 88081, 88103, 88113, 88115, 88118, 88120, 88121, 88125, 88126, 88130, 88132, 88301, 88310, 88311, 88312, 88314, 88316, 88317, 88318, 88321, 88323, 88324, 88325, 88330, 88336, 88337, 88338, 88340, 88341, 88342, 88343, 88345, 88346, 88347, 88348, 88349, 88350, 88351, 88352, 88353, 88354, 88355, 88401, 88410, 88411, 88414, 88415, 88416, 88417, 88418, 88419, 88421, 88422, 88424, 88426, 88427, 88430, 88431, 88434, 88435, 88436, 88439, 89001, 89003, 89007, 89008, 89010, 89013, 89017, 89018, 89020, 89022, 89025, 89026, 89029, 89030, 89034, 89039, 89045, 89046, 89047, 89048, 89049, 89060, 89061, 89070, 89101, 89102, 89103, 89104, 89106, 89108, 89115, 89119, 89121, 89122, 89169, 89191, 89301, 89311, 89314, 89318, 89404, 89409, 89414, 89415, 89420, 89421, 89422, 89424, 89425, 89426, 89427, 89430, 89438, 89440, 89442, 89444, 89446, 89447, 89512, 89557, 89823, 89833, 90001, 90002, 90003, 90006, 90007, 90011, 90012, 90015, 90016, 90018, 90022, 90023, 90028, 90029, 90032, 90033, 90037, 90038, 90044, 90052, 90057, 90058, 90059, 90062, 90063, 90073, 90089, 90095, 90201, 90221, 90222, 90255, 90263, 90270, 90280, 90302, 90303, 90304, 90602, 90639, 90704, 90716, 90723, 90805, 90813, 90822, 90840, 91204, 91205, 91210, 91330, 91402, 91405, 91731, 91732, 91766, 91768, 91770, 91905, 91931, 91934, 91950, 92036, 92055, 92058, 92059, 92060, 92061, 92066, 92070, 92086, 92092, 92093, 92105, 92113, 92115, 92134, 92135, 92136, 92140, 92145, 92155, 92161, 92173, 92179, 92182, 92220, 92222, 92225, 92227, 92230, 92231, 92233, 92236, 92239, 92240, 92241, 92242, 92243, 92249, 92250, 92251, 92252, 92254, 92256, 92257, 92258, 92259, 92266, 92267, 92268, 92273, 92274, 92275, 92276, 92277, 92278, 92280, 92281, 92282, 92283, 92284, 92285, 92301, 92304, 92309, 92310, 92314, 92327, 92332, 92335, 92338, 92345, 92350, 92356, 92358, 92363, 92364, 92365, 92368, 92369, 92371, 92386, 92395, 92401, 92405, 92410, 92411, 92415, 92518, 92521, 92539, 92545, 92548, 92549, 92553, 92583, 92586, 92617, 92655, 92672, 92697, 92701, 92703, 92844, 93015, 93023, 93033, 93040, 93041, 93043, 93106, 93201, 93202, 93203, 93204, 93205, 93206, 93207, 93208, 93210, 93212, 93215, 93218, 93219, 93220, 93221, 93222, 93223, 93224, 93225, 93226, 93227, 93230, 93234, 93235, 93237, 93238, 93239, 93240, 93241, 93242, 93244, 93245, 93246, 93247, 93249, 93250, 93251, 93252, 93254, 93255, 93256, 93257, 93258, 93260, 93261, 93262, 93263, 93265, 93266, 93267, 93268, 93270, 93271, 93272, 93274, 93276, 93277, 93280, 93283, 93285, 93286, 93287, 93291, 93292, 93301, 93304, 93305, 93306, 93307, 93308, 93309, 93311, 93312, 93313, 93314, 93402, 93407, 93409, 93410, 93426, 93428, 93429, 93430, 93434, 93442, 93450, 93451, 93452, 93501, 93505, 93518, 93519, 93523, 93524, 93527, 93528, 93531, 93535, 93552, 93554, 93555, 93558, 93560, 93561, 93562, 93581, 93591, 93602, 93603, 93604, 93605, 93606, 93608, 93609, 93610, 93611, 93612, 93614, 93615, 93616, 93618, 93619, 93620, 93621, 93622, 93624, 93625, 93626, 93627, 93628, 93630, 93631, 93633, 93634, 93635, 93636, 93637, 93638, 93640, 93641, 93643, 93644, 93645, 93646, 93647, 93648, 93650, 93651, 93652, 93654, 93656, 93657, 93660, 93662, 93664, 93665, 93666, 93667, 93668, 93669, 93670, 93673, 93675, 93701, 93702, 93703, 93704, 93705, 93706, 93710, 93711, 93720, 93721, 93722, 93723, 93725, 93726, 93727, 93728, 93730, 93737, 93740, 93741, 93905, 93920, 93927, 93928, 93930, 93932, 93944, 93954, 93960, 94063, 94089, 94130, 94132, 94134, 94401, 94508, 94509, 94511, 94512, 94520, 94525, 94548, 94561, 94567, 94569, 94575, 94576, 94601, 94603, 94606, 94612, 94613, 94621, 94704, 94720, 94806, 94924, 94937, 94938, 94950, 94956, 94964, 94965, 94970, 95002, 95013, 95039, 95043, 95045, 95053, 95064, 95075, 95111, 95112, 95116, 95122, 95133, 95135, 95140, 95202, 95203, 95205, 95206, 95211, 95219, 95231, 95232, 95245, 95248, 95255, 95257, 95301, 95303, 95306, 95307, 95312, 95313, 95315, 95317, 95318, 95319, 95322, 95324, 95325, 95328, 95333, 95334, 95336, 95338, 95340, 95341, 95345, 95348, 95351, 95354, 95357, 95360, 95365, 95369, 95374, 95380, 95388, 95410, 95415, 95417, 95422, 95427, 95428, 95429, 95430, 95432, 95435, 95454, 95456, 95458, 95462, 95463, 95466, 95471, 95486, 95488, 95497, 95511, 95514, 95527, 95537, 95542, 95548, 95551, 95552, 95554, 95559, 95562, 95563, 95565, 95568, 95569, 95571, 95585, 95587, 95589, 95595, 95605, 95615, 95619, 95639, 95641, 95652, 95653, 95660, 95671, 95676, 95680, 95683, 95686, 95694, 95701, 95714, 95715, 95757, 95811, 95815, 95821, 95823, 95824, 95825, 95827, 95832, 95838, 95842, 95903, 95914, 95915, 95916, 95917, 95919, 95922, 95925, 95926, 95928, 95929, 95930, 95934, 95938, 95941, 95942, 95947, 95948, 95954, 95957, 95958, 95965, 95966, 95968, 95969, 95972, 95974, 95978, 95983, 96008, 96010, 96011, 96013, 96016, 96017, 96019, 96021, 96023, 96024, 96025, 96028, 96029, 96035, 96039, 96040, 96041, 96044, 96046, 96048, 96050, 96051, 96052, 96054, 96057, 96058, 96064, 96065, 96067, 96071, 96074, 96076, 96078, 96084, 96085, 96086, 96091, 96093, 96094, 96128, 96134, 96142, 96148, 96720, 96727, 96729, 96737, 96748, 96757, 96759, 96762, 96770, 96772, 96776, 96777, 96778, 96786, 96792, 96826, 96848, 96853, 96857, 96858, 96860, 96863, 97016, 97048, 97064, 97114, 97118, 97127, 97216, 97218, 97220, 97233, 97236, 97266, 97301, 97310, 97324, 97330, 97331, 97333, 97335, 97342, 97346, 97348, 97358, 97360, 97365, 97367, 97368, 97369, 97370, 97374, 97384, 97388, 97390, 97396, 97401, 97402, 97403, 97404, 97405, 97406, 97408, 97410, 97411, 97412, 97413, 97414, 97417, 97419, 97424, 97426, 97429, 97430, 97431, 97432, 97434, 97437, 97438, 97439, 97442, 97443, 97447, 97448, 97450, 97451, 97452, 97453, 97454, 97455, 97456, 97461, 97463, 97465, 97466, 97469, 97476, 97477, 97478, 97480, 97484, 97487, 97488, 97489, 97490, 97492, 97493, 97497, 97498, 97522, 97523, 97526, 97527, 97531, 97532, 97534, 97535, 97536, 97538, 97543, 97544, 97604, 97620, 97621, 97622, 97623, 97624, 97636, 97637, 97638, 97640, 97641, 97709, 97731, 97733, 97735, 97737, 97739, 97834, 97840, 97870, 97901, 97902, 97903, 97905, 97906, 97907, 97908, 97909, 97910, 97911, 97913, 97914, 97917, 97918, 97920, 98002, 98003, 98023, 98030, 98032, 98047, 98057, 98070, 98146, 98158, 98168, 98188, 98195, 98204, 98207, 98220, 98224, 98237, 98241, 98244, 98266, 98267, 98278, 98283, 98288, 98303, 98314, 98315, 98320, 98328, 98329, 98330, 98331, 98336, 98337, 98349, 98351, 98361, 98377, 98387, 98388, 98390, 98394, 98402, 98404, 98408, 98409, 98416, 98418, 98424, 98430, 98433, 98438, 98439, 98444, 98447, 98499, 98505, 98527, 98530, 98547, 98558, 98580, 98590, 98610, 98616, 98640, 98641, 98649, 98660, 98665, 98812, 98813, 98814, 98817, 98819, 98826, 98827, 98829, 98830, 98831, 98833, 98834, 98836, 98840, 98841, 98843, 98844, 98846, 98849, 98855, 98856, 98859, 98862, 98901, 98902, 98903, 98908, 98921, 98923, 98930, 98932, 98933, 98935, 98936, 98937, 98938, 98939, 98942, 98943, 98947, 98948, 98951, 98952, 98953, 99001, 99003, 99011, 99013, 99017, 99033, 99034, 99040, 99101, 99102, 99109, 99111, 99113, 99116, 99124, 99125, 99126, 99128, 99129, 99130, 99131, 99133, 99136, 99137, 99143, 99149, 99151, 99155, 99157, 99158, 99161, 99163, 99166, 99167, 99171, 99173, 99174, 99176, 99179, 99181, 99201, 99202, 99204, 99207, 99251, 99258, 99326, 99333, 99335, 99343, 99344, 99363, 99501, 99503, 99504, 99505, 99506, 99513, 99548, 99549, 99550, 99551, 99552, 99554, 99555, 99557, 99558, 99559, 99561, 99563, 99564, 99565, 99569, 99575, 99576, 99578, 99579, 99580, 99581, 99585, 99589, 99590, 99602, 99604, 99606, 99607, 99608, 99609, 99613, 99614, 99615, 99620, 99621, 99622, 99624, 99625, 99626, 99627, 99628, 99630, 99632, 99634, 99635, 99636, 99637, 99640, 99641, 99643, 99644, 99647, 99648, 99649, 99650, 99651, 99653, 99655, 99656, 99657, 99658, 99659, 99662, 99665, 99666, 99667, 99668, 99671, 99674, 99675, 99676, 99678, 99679, 99680, 99681, 99682, 99683, 99684, 99688, 99689, 99690, 99691, 99694, 99695, 99701, 99703, 99704, 99714, 99720, 99721, 99722, 99724, 99726, 99727, 99729, 99730, 99732, 99733, 99736, 99738, 99739, 99740, 99741, 99742, 99743, 99744, 99745, 99746, 99747, 99748, 99749, 99750, 99751, 99752, 99753, 99754, 99755, 99756, 99757, 99758, 99759, 99760, 99761, 99762, 99763, 99764, 99765, 99766, 99767, 99768, 99769, 99770, 99771, 99772, 99773, 99774, 99775, 99776, 99777, 99778, 99780, 99781, 99782, 99783, 99784, 99785, 99786, 99788, 99789, 99790, 99791, 99830, 99836, 99903, 99918, 99919, 99921, 99922, 99923, 99925, 99926, 99927, 99929)
        then la.amount end) as Green_state_LID,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 690
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and locc.post_loan_dti_stated <= .45  
        And (decisioning.s207a>=36 or decisioning.s207a <0 or decisioning.s207a  is null)
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 17022, 17501, 17502, 17503, 17504, 17505, 17506, 17507, 17508, 17509, 17512, 17516, 17517, 17518, 17519, 17520, 17521, 17522, 17527, 17528, 17529, 17532, 17533, 17534, 17535, 17536, 17537, 17538, 17540, 17543, 17545, 17547, 17550, 17551, 17552, 17554, 17555, 17557, 17560, 17562, 17563, 17564, 17565, 17566, 17567, 17568, 17569, 17570, 17572, 17575, 17576, 17578, 17579, 17580, 17581, 17582, 17584, 17585, 17601, 17602, 17603, 17604, 17605, 17608, 17699, 18039, 18041, 18054, 18070, 18073, 18074, 18076, 18077, 18081, 18084, 18901, 18902, 18910, 18911, 18912, 18913, 18914, 18915, 18916, 18917, 18918, 18920, 18921, 18922, 18923, 18925, 18927, 18928, 18929, 18930, 18931, 18932, 18933, 18934, 18935, 18936, 18938, 18940, 18942, 18943, 18944, 18946, 18947, 18949, 18950, 18951, 18953, 18954, 18955, 18956, 18957, 18958, 18960, 18962, 18963, 18964, 18966, 18968, 18969, 18970, 18971, 18972, 18974, 18976, 18977, 18979, 18980, 18981, 19001, 19002, 19003, 19004, 19006, 19007, 19008, 19009, 19010, 19012, 19013, 19014, 19015, 19016, 19017, 19018, 19020, 19021, 19022, 19023, 19025, 19026, 19027, 19028, 19029, 19030, 19031, 19032, 19033, 19034, 19035, 19036, 19038, 19039, 19040, 19041, 19043, 19044, 19046, 19047, 19050, 19052, 19053, 19054, 19055, 19056, 19057, 19058, 19060, 19061, 19063, 19064, 19066, 19067, 19070, 19072, 19073, 19074, 19075, 19076, 19078, 19079, 19081, 19082, 19083, 19085, 19086, 19087, 19090, 19091, 19094, 19095, 19096, 19101, 19102, 19103, 19104, 19105, 19106, 19107, 19108, 19109, 19110, 19111, 19112, 19113, 19114, 19115, 19116, 19118, 19119, 19120, 19121, 19122, 19123, 19124, 19125, 19126, 19127, 19128, 19129, 19130, 19131, 19132, 19133, 19134, 19135, 19136, 19137, 19138, 19139, 19140, 19141, 19142, 19143, 19144, 19145, 19146, 19147, 19148, 19149, 19150, 19151, 19152, 19153, 19154, 19160, 19172, 19176, 19181, 19190, 19192, 19301, 19310, 19311, 19312, 19316, 19317, 19318, 19319, 19320, 19330, 19331, 19333, 19335, 19339, 19341, 19342, 19343, 19344, 19345, 19346, 19347, 19348, 19350, 19351, 19352, 19354, 19355, 19357, 19358, 19360, 19362, 19363, 19365, 19366, 19367, 19369, 19371, 19372, 19373, 19374, 19375, 19376, 19380, 19381, 19382, 19383, 19390, 19395, 19399, 19401, 19403, 19404, 19405, 19406, 19407, 19408, 19409, 19421, 19422, 19423, 19425, 19426, 19428, 19430, 19432, 19435, 19436, 19437, 19438, 19440, 19442, 19443, 19444, 19446, 19450, 19451, 19453, 19454, 19456, 19457, 19460, 19462, 19464, 19465, 19468, 19470, 19472, 19473, 19474, 19475, 19477, 19480, 19481, 19482, 19484, 19486, 19490, 19492, 19501, 19520, 19525)
        then la.amount end) as Citadel,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 50000
        and l.apr <= .36
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40  
        and locc.post_loan_dti_stated <= .55 
        and (decisioning.s207a >= 13 or decisioning.s207a <0 or decisioning.s207a  is null)
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 28401, 28402, 28403, 28404, 28405, 28406, 28407, 28408, 28409, 28410, 28411, 28412, 28420, 28421, 28422, 28425, 28428, 28429, 28435, 28443, 28449, 28451, 28452, 28454, 28457, 28459, 28461, 28462, 28465, 28467, 28468, 28469, 28470, 28478, 28479, 28480, 93426, 93450, 93901, 93902, 93905, 93906, 93907, 93908, 93912, 93915, 93920, 93921, 93922, 93923, 93924, 93925, 93926, 93927, 93928, 93930, 93932, 93933, 93940, 93942, 93943, 93944, 93950, 93953, 93954, 93955, 93960, 93962, 94002, 94005, 94010, 94011, 94014, 94015, 94016, 94017, 94018, 94019, 94020, 94021, 94022, 94023, 94024, 94025, 94026, 94027, 94028, 94030, 94035, 94037, 94038, 94039, 94040, 94041, 94042, 94043, 94044, 94060, 94061, 94062, 94063, 94064, 94065, 94066, 94070, 94074, 94080, 94083, 94085, 94086, 94087, 94088, 94089, 94102, 94103, 94104, 94105, 94107, 94108, 94109, 94110, 94111, 94112, 94114, 94115, 94116, 94117, 94118, 94119, 94120, 94121, 94122, 94123, 94124, 94125, 94126, 94127, 94128, 94129, 94130, 94131, 94132, 94133, 94134, 94137, 94139, 94140, 94141, 94142, 94143, 94144, 94145, 94146, 94147, 94151, 94158, 94159, 94160, 94161, 94163, 94164, 94172, 94177, 94188, 94301, 94302, 94303, 94304, 94305, 94306, 94309, 94401, 94402, 94403, 94404, 94497, 94501, 94502, 94536, 94537, 94538, 94539, 94540, 94541, 94542, 94543, 94544, 94545, 94546, 94550, 94551, 94552, 94555, 94557, 94560, 94566, 94568, 94577, 94578, 94579, 94580, 94586, 94587, 94588, 94601, 94602, 94603, 94604, 94605, 94606, 94607, 94608, 94609, 94610, 94611, 94612, 94613, 94614, 94615, 94617, 94618, 94619, 94620, 94621, 94622, 94623, 94624, 94649, 94659, 94660, 94661, 94662, 94666, 94701, 94702, 94703, 94704, 94705, 94706, 94707, 94708, 94709, 94710, 94712, 94720, 95001, 95002, 95003, 95004, 95005, 95006, 95007, 95008, 95009, 95010, 95011, 95012, 95013, 95014, 95015, 95017, 95018, 95019, 95020, 95021, 95026, 95030, 95031, 95032, 95033, 95035, 95036, 95037, 95038, 95039, 95041, 95042, 95044, 95046, 95050, 95051, 95052, 95053, 95054, 95055, 95056, 95060, 95061, 95062, 95063, 95064, 95065, 95066, 95067, 95070, 95071, 95073, 95076, 95077, 95101, 95103, 95106, 95108, 95109, 95110, 95111, 95112, 95113, 95115, 95116, 95117, 95118, 95119, 95120, 95121, 95122, 95123, 95124, 95125, 95126, 95127, 95128, 95129, 95130, 95131, 95132, 95133, 95134, 95135, 95136, 95138, 95139, 95140, 95141, 95148, 95150, 95151, 95152, 95153, 95154, 95155, 95156, 95157, 95158, 95159, 95160, 95161, 95164, 95170, 95172, 95173, 95190, 95191, 95192, 95193, 95194, 95196)
        then la.amount end) as Excite,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 20000
        and l.apr <= .25
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40  
        and locc.post_loan_dti_stated <= .50
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 44035, 44039, 44052, 44012, 44011, 44053, 44001, 44055, 44089, 44054, 44044, 44090, 44074, 44028, 44889, 44050, 44851, 44253, 44036, 44049, 44870, 44089, 44839, 44811, 44889, 44824, 44847, 44846, 44814, 43464, 44871, 43438, 44816, 44857, 44811, 44890, 44889, 44851, 44837, 44847, 44865, 44807, 44826, 44855, 44850, 44888, 44107, 44130, 44124, 44102, 44111, 44118, 44134, 44122, 44109, 44120, 44145, 44146, 44121, 44070, 44133, 44105, 44106, 44128, 44129, 44125, 44135, 44136, 44143, 44113, 44116, 44144, 44137, 44138, 44112, 44139, 44131, 44108, 44104, 44110, 44123, 44147, 44149, 44017, 44126, 44142, 44022, 44132, 44103, 44140, 44141, 44119, 44117, 44114, 44115, 44127, 44040, 44101, 44181, 44199, 44178, 44185, 44189, 44188, 44191, 44190, 44193, 44192, 44195, 44194, 44198, 44197)
        then la.amount end) as Community_star,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 35000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (55720, 55733, 55707, 55767, 55718, 55783, 55797, 55726, 55757, 55798, 55749, 55756, 55780, 55007, 55030, 55036, 55037, 55063, 55067, 55072, 55704, 55712, 55735, 55756, 55783, 55795, 55811, 55746, 55803, 55720, 55804, 55792, 55805, 56649, 55807, 55806, 55810, 55812, 55731, 55616, 55734, 55719, 55808, 55779, 55705, 55741, 55802, 55723, 55768, 55790, 55706, 55750, 55771, 55732, 55736, 55751, 55710, 55708, 55724, 55781, 55816, 55765, 55703, 55763, 55798, 55738, 56669, 55702, 55711, 55782, 55602, 55717, 55713, 55758, 55725, 55796, 55815, 55801, 55766, 55772, 55791, 55777, 55701, 55747, 55814)
        then la.amount end) as Northwoods,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .33  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 85321, 85341, 85601, 85614, 85619, 85622, 85629, 85633, 85634, 85639, 85641, 85652, 85653, 85654, 85658, 85701, 85702, 85703, 85704, 85705, 85706, 85707, 85708, 85709, 85710, 85711, 85712, 85713, 85714, 85715, 85716, 85717, 85718, 85719, 85720, 85721, 85722, 85723, 85724, 85725, 85726, 85728, 85730, 85731, 85732, 85733, 85734, 85735, 85736, 85737, 85738, 85739, 85740, 85741, 85742, 85743, 85744, 85745, 85746, 85747, 85748, 85749, 85750, 85751, 85752, 85754, 85755, 85756, 85757, 85775, 85777, 94002, 94005, 94010, 94011, 94013, 94014, 94015, 94016, 94017, 94018, 94019, 94020, 94021, 94022, 94023, 94024, 94025, 94026, 94027, 94028, 94030, 94035, 94037, 94038, 94039, 94040, 94041, 94042, 94043, 94044, 94060, 94061, 94062, 94063, 94064, 94065, 94066, 94070, 94074, 94080, 94083, 94085, 94086, 94087, 94088, 94089, 94096, 94098, 94099, 94101, 94102, 94103, 94104, 94105, 94106, 94107, 94108, 94109, 94110, 94111, 94112, 94114, 94115, 94116, 94117, 94118, 94119, 94120, 94121, 94122, 94123, 94124, 94125, 94126, 94127, 94128, 94129, 94130, 94131, 94132, 94133, 94134, 94135, 94136, 94137, 94138, 94139, 94140, 94141, 94142, 94143, 94144, 94145, 94146, 94147, 94150, 94151, 94152, 94153, 94154, 94155, 94156, 94157, 94158, 94159, 94160, 94161, 94162, 94163, 94164, 94165, 94166, 94167, 94168, 94169, 94170, 94171, 94172, 94175, 94177, 94188, 94199, 94301, 94302, 94303, 94304, 94305, 94306, 94309, 94401, 94402, 94403, 94404, 94497, 94501, 94502, 94505, 94506, 94507, 94509, 94511, 94513, 94514, 94516, 94517, 94518, 94519, 94520, 94521, 94522, 94523, 94524, 94525, 94526, 94527, 94528, 94529, 94530, 94531, 94536, 94537, 94538, 94539, 94540, 94541, 94542, 94543, 94544, 94545, 94546, 94547, 94548, 94549, 94550, 94551, 94552, 94553, 94555, 94556, 94557, 94560, 94561, 94563, 94564, 94565, 94566, 94568, 94569, 94570, 94572, 94575, 94577, 94578, 94579, 94580, 94582, 94583, 94586, 94587, 94588, 94595, 94596, 94597, 94598, 94601, 94602, 94603, 94604, 94605, 94606, 94607, 94608, 94609, 94610, 94611, 94612, 94613, 94614, 94615, 94617, 94618, 94619, 94620, 94621, 94622, 94623, 94624, 94625, 94627, 94643, 94649, 94659, 94660, 94661, 94662, 94666, 94701, 94702, 94703, 94704, 94705, 94706, 94707, 94708, 94709, 94710, 94712, 94720, 94801, 94802, 94803, 94804, 94805, 94806, 94807, 94808, 94820, 94850, 94875, 95002, 95008, 95009, 95011, 95013, 95014, 95015, 95020, 95021, 95026, 95030, 95031, 95032, 95033, 95035, 95036, 95037, 95038, 95042, 95044, 95046, 95050, 95051, 95052, 95053, 95054, 95055, 95056, 95070, 95071, 95101, 95102, 95103, 95106, 95108, 95109, 95110, 95111, 95112, 95113, 95114, 95115, 95116, 95117, 95118, 95119, 95120, 95121, 95122, 95123, 95124, 95125, 95126, 95127, 95128, 95129, 95130, 95131, 95132, 95133, 95134, 95135, 95136, 95137, 95138, 95139, 95140, 95141, 95142, 95148, 95150, 95151, 95152, 95153, 95154, 95155, 95156, 95157, 95158, 95159, 95160, 95161, 95164, 95170, 95171, 95172, 95173, 95190, 95191, 95192, 95193, 95194, 95196)
        then la.amount end) as Meriwest,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'
        then la.amount end) as US_alliance,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 50000
        and l.apr <= .25
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 91320, 91360, 91361, 91362, 91377, 93001, 93003, 93004, 93006, 93007, 93010, 93012, 93013, 93014, 93021, 93022, 93023, 93024, 93030, 93033, 93035, 93036, 93041, 93044, 93060, 93063, 93065, 93066, 93067, 93101, 93102, 93103, 93105, 93106, 93107, 93108, 93109, 93110, 93111, 93116, 93117, 93118, 93120, 93121, 93130, 93140, 93150, 93160, 93190, 93254, 93427, 93434, 93436, 93437, 93438, 93440, 93441, 93454, 93455, 93456, 93457, 93458, 93460, 93463, 93464, 94002, 94005, 94010, 94011, 94013, 94014, 94015, 94018, 94019, 94020, 94022, 94023, 94024, 94025, 94026, 94027, 94028, 94030, 94037, 94038, 94039, 94040, 94041, 94042, 94043, 94044, 94060, 94061, 94062, 94063, 94064, 94065, 94066, 94070, 94074, 94080, 94085, 94086, 94087, 94088, 94089, 94301, 94302, 94303, 94303, 94304, 94305, 94306, 94309, 94401, 94402, 94403, 94404, 94501, 94502, 94505, 94505, 94506, 94507, 94509, 94511, 94513, 94514, 94517, 94518, 94519, 94520, 94521, 94522, 94523, 94524, 94525, 94526, 94528, 94529, 94530, 94531, 94536, 94537, 94538, 94539, 94540, 94541, 94542, 94543, 94544, 94545, 94546, 94547, 94549, 94550, 94551, 94552, 94553, 94555, 94556, 94556, 94557, 94560, 94561, 94563, 94564, 94565, 94566, 94568, 94572, 94577, 94578, 94579, 94580, 94582, 94583, 94584, 94586, 94587, 94588, 94595, 94596, 94597, 94598, 94601, 94602, 94603, 94605, 94606, 94607, 94608, 94609, 94610, 94611, 94612, 94618, 94619, 94620, 94621, 94623, 94702, 94703, 94704, 94705, 94706, 94707, 94707, 94708, 94709, 94710, 94801, 94803, 94804, 94805, 94806, 94820, 95002, 95008, 95009, 95011, 95014, 95015, 95020, 95021, 95030, 95031, 95032, 95033, 95035, 95035, 95036, 95037, 95038, 95044, 95046, 95050, 95051, 95052, 95054, 95055, 95056, 95070, 95071, 95101, 95103, 95108, 95109, 95110, 95111, 95112, 95113, 95116, 95117, 95118, 95119, 95120, 95121, 95122, 95123, 95124, 95125, 95126, 95127, 95128, 95129, 95130, 95131, 95132, 95133, 95134, 95135, 95136, 95138, 95139, 95140, 95148, 95150, 95151, 95152, 95153, 95154, 95155, 95156, 95157, 95158, 95159, 95160, 95161, 95164, 95173, 95303, 95602, 95603, 95608, 95610, 95613, 95614, 95619, 95621, 95623, 95624, 95628, 95630, 95631, 95632, 95633, 95634, 95636, 95638, 95641, 95648, 95650, 95651, 95658, 95660, 95661, 95662, 95663, 95664, 95667, 95670, 95672, 95673, 95677, 95678, 95682, 95683, 95684, 95693, 95703, 95709, 95713, 95722, 95726, 95742, 95746, 95747, 95757, 95758, 95762, 95763, 95765, 95811, 95812, 95813, 95814, 95815, 95816, 95817, 95818, 95819, 95820, 95821, 95822, 95823, 95824, 95825, 95826, 95827, 95828, 95829, 95831, 95832, 95833, 95834, 95835, 95838, 95841, 95842, 95843, 95864, 96140, 96145, 96146, 96150, 96151, 96158)
        then la.amount end) as Keypoint,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 44870, 44846, 44814, 44839, 43464, 44811, 44871, 44889, 43438, 44824, 44816, 44847, 44857, 44865, 44890, 44826, 44855, 44851, 44850, 44837, 44888, 44820, 44854, 44833, 44887, 44827, 44881, 44825, 44860, 44818, 44856, 44849, 44836)
        then la.amount end) as Firelands,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 20000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .35  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (19020, 19007, 18912, 18913, 18914, 19021, 18901, 18902, 18917, 18920, 19030, 19053, 18923, 18925, 18929, 18930, 19047, 19054, 19055, 19056, 19057, 18932, 18935, 19067, 18938, 18940, 18942, 18944, 18947, 18950, 18951, 18954, 18955, 18077, 18960, 18962, 18966, 18081, 18970, 18972, 18974, 18976, 18977, 18980)
        then la.amount end) as Inspire,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (70114, 70130, 70131, 70515, 70524, 70535, 70554, 70576, 70580, 70585, 70586, 70589, 71325, 71367, 71463, 70053, 70054, 70056, 70058, 70059, 70072, 70073, 70030, 70301, 70302, 70310, 70343, 70345, 70354, 70355, 70357, 70364, 70371, 70373, 70374, 70375, 70377, 70394, 70112, 70113, 70114, 70115, 70116, 70117, 70118, 70119, 70122, 70124, 70125, 70126, 70127, 70128, 70129, 70130, 70131, 70139, 70140, 70143, 70145, 70146, 70148, 70149, 70150, 70151, 70152, 70153, 70154, 70156, 70157, 70158, 70159, 70160, 70161, 70162, 70163, 70164, 70165, 70166, 70167, 70170, 70172, 70174, 70175, 70176, 70177, 70178, 70179, 70182, 70184, 70185, 70186, 70187, 70189, 70190, 70195, 70030, 70031, 70039, 70047, 70057, 70070, 70079, 70080, 70087, 70374, 70420, 70427, 70431, 70433, 70434, 70435, 70437, 70438, 70445, 70447, 70448, 70452, 70458, 70459, 70460, 70461, 70464, 70470, 70471, 70062, 70094, 70096)
        then la.amount end) as OnPath,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 30000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (  98110, 98310, 98311, 98312, 98315, 98337, 98340, 98342, 98346, 98359, 98366, 98367, 98370, 98380, 98383, 98392, 98061, 98322, 98345, 98353, 98364, 98378, 98384, 98386, 98393, 98314)
        then la.amount end) as Connection_PL,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 640
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .36 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 84790, 84770, 84780, 84737, 84738, 84765, 84784, 84745, 84725, 84771, 84774, 84757, 84791, 84746, 84767, 84783, 84782, 84722, 84781, 84779, 84763, 84733, 84721, 84720, 84761, 84759, 84762, 84714, 84760, 84742, 84756, 84719, 84772, 84753, 84750, 84723, 84740, 84743, 84732, 84627, 84647, 84642, 84634, 84646, 84523, 84662, 84537, 84622, 84632, 84652, 84643, 84667, 84623, 84621, 84630, 84665, 84532, 84511, 84535, 81324, 84534, 84536, 84512, 84530, 84510, 84533, 84531, 84321, 84341, 84335, 84319, 84332, 84339, 84318, 84333, 84320, 84325, 84326, 84328, 84028, 84323, 84324, 84327, 84305, 84338, 84308, 84304, 84322, 84003, 84004, 84005, 84013, 84042, 84043, 84045, 84057, 84058, 84059, 84062, 84097, 84601, 84602, 84604, 84606, 84651, 84653, 84655, 84660, 84663, 84664, 83612, 83632, 83643, 83654, 83201, 83202, 83204, 83205, 83206, 83209, 83214, 83234, 83245, 83246, 83250, 83281, 83213, 83244, 83255, 83605, 83606, 83607, 83626, 83630, 83641, 83644, 83651, 83652, 83653, 83656, 83660, 83676, 83686, 83687, 83423, 83446, 83228, 83232, 83237, 83263, 83283, 83286, 83617, 83636, 83657, 83670, 83522, 83525, 83526, 83530, 83531, 83533, 83539, 83542, 83547, 83549, 83552, 83554, 83671, 83325, 83335, 83338, 83535, 83537, 83806, 83823, 83832, 83834, 83843, 83844, 83855, 83857, 83871, 83872, 83229, 83253, 83462, 83463, 83464, 83465, 83466, 83467, 83468, 83469, 83440, 83441, 83448, 83460, 83604, 83624, 83628, 83629, 83650, 83211, 83212, 83271, 83301, 83302, 83303, 83316, 83321, 83328, 83334, 83341, 83344, 83610, 83645, 83672, 82051, 82052, 82055, 82058, 82063, 82070, 82071, 82072, 82073, 82083, 82084, 82212, 82217, 82218, 82219, 82221, 82223, 82240, 82243, 82244, 82222, 82225, 82227, 82242, 82201, 82210, 82213, 82214, 82215, 89010, 89013, 89047, 89415, 89420, 89422, 89427, 89048, 89060, 89041, 89049, 89045, 89020, 89003, 89310, 89022, 89409, 89023, 89420, 89314, 59725, 59762, 59739, 59761, 59746, 59732, 83463, 59736, 59724, 59034, 59022, 59043, 59050, 59038, 59016, 59066, 59089, 59031, 59035, 59075, 59012, 59010, 59062, 59025, 59523, 59526, 59527, 59524, 59542, 59529, 59547, 59535, 59324, 59311, 59332, 59319, 59442, 59520, 59446, 59450, 59460, 59420, 59756, 59337, 59318, 59322, 59058, 59077, 59417, 59427, 59486, 59411, 59434, 59448, 59046, 59074, 59858, 59837, 59821, 59824, 59855, 59860, 59863, 59864, 59865, 59910, 59914, 59915, 59929, 59931, 59923, 59917, 59935, 59930, 59844, 59918, 59645, 59053, 59642, 59830, 59842, 59801, 59808, 59802, 59803, 59804, 59847, 59833, 59806, 59868, 59834, 59825, 59821, 59823, 59807, 59820, 59846, 59826, 59851, 59812, 59072, 59059, 59073, 59087, 59317, 59314, 59343, 59316, 59722, 59832, 59854, 59843, 59731, 59713, 59733, 59326, 59341, 59349, 59201, 59263, 59212, 59226, 59258, 59873, 59859, 59874, 59866, 59853, 59831, 59856, 59848, 59076, 59036, 59078, 95914, 95901, 95916, 95917, 95925, 95926, 95928, 95930, 95938, 95941, 95942, 95948, 95954, 95965, 95966, 95968, 95969, 95973, 95927, 95940, 95958, 95967, 95974, 95978, 95929, 95976, 93210, 93242, 93245, 93602, 93608, 93609, 93611, 93612, 93616, 93618, 93619, 93620, 93621, 93622, 93625, 93626, 93628, 93630, 93631, 09360, 93641, 93646, 93648, 93650, 93651, 93652, 93654, 93656, 93657, 93660, 93662, 93664, 93667, 93668, 93675, 93701, 93702, 93703, 93704, 93705, 93706, 93710, 93711, 93720, 93721, 93722, 93723, 93725, 93726, 93727, 93728, 93730, 93737, 93234, 93605, 93606, 93607, 93613, 93624, 93627, 93634, 93642, 93707, 93708, 93709, 93712, 93714, 93715, 93716, 93649, 93717, 93718, 93729, 93744, 93745, 93747, 93755, 93771, 93772, 93773, 93774, 93775, 93776, 93777, 93778, 93779, 93790, 93791, 93792, 93793, 93794, 93724, 93740, 93741, 93750, 93760, 93761, 93764, 93765, 93786, 93844, 93888, 92004, 92225, 92227, 92231, 92233, 92243, 92249, 92250, 92251, 92257, 92274, 92283, 92222, 92232, 92244, 92259, 92266, 92273, 92275, 92281, 93203, 93205, 93206, 93215, 93224, 93225, 93226, 93238, 93240, 93241, 93243, 93249, 93250, 93251, 93252, 93255, 93263, 93268, 93280, 93283, 93285, 93287, 93301, 93304, 93305, 93306, 93307, 93308, 93309, 93311, 93312, 93314, 93501, 93505, 93306, 93313, 93307, 93308, 93309, 93311, 93312, 93313, 93314, 93501, 93505, 93516, 93518, 93523, 93527, 93531, 93536, 93555, 93560, 93561, 93216, 93220, 93222, 93276, 93302, 93303, 93380, 93383, 93384, 93385, 93386, 93387, 93388, 93389, 93390, 93502, 93504, 93519, 93528, 93554, 93556, 93558, 93581, 93596, 93524, 93202, 93204, 93212, 93230, 93239, 09324, 93245, 93266, 93631, 93656, 93232, 93246, 93601, 93602, 93604, 93610, 93614, 93620, 93622, 93623, 93626, 93636, 93637, 93638, 93643, 93644, 93645, 93653, 93669, 93720, 93639, 93610, 93620, 93622, 93635, 95301, 95303, 95315, 95316, 95317, 95322, 95324, 95333, 95334, 95340, 95341, 95343, 95348, 95360, 95365, 95369, 95374, 95380, 95388, 93661, 93665, 95312, 95344, 93210, 93930, 95004, 95023, 95043, 95045, 95075, 95024, 95526, 95527, 95552, 95595, 96010, 96024, 96041, 96048, 96052, 96076, 96091, 95563, 96046, 96093, 93207, 93212, 93215, 93219, 93221, 93223, 93235, 93238, 93244, 93247, 93256, 93257, 93260, 93262, 93265, 93267, 93270, 93271, 93272, 93274, 93277, 93286, 93291, 93292, 93527, 93603, 93615, 93618, 93631, 93641, 93646, 93647, 93654, 93201, 93208, 93218, 93227, 93237, 93258, 93261, 93275, 93278, 93279, 93282, 93290, 93633, 93666, 93670, 93673, 75135, 75401, 75402, 75403, 75404, 75422, 75423, 75428, 75429, 75453, 75458, 75474, 75496, 75501, 75503, 75504, 75505, 75507, 75559, 75561, 75564, 75567, 75569, 75570, 75573, 75574, 75599, 75601, 75602, 75603, 75604, 75605, 75606, 75607, 75608, 75615, 75630, 75640, 75641, 75644, 75645, 75647, 75652, 75653, 75654, 75657, 75658, 75660, 75662, 75663, 75666, 75667, 75680, 75681, 75682, 75683, 75684, 75687, 75689, 75691, 75693, 75755, 75760, 75788, 75797, 75835, 75844, 75847, 75849, 75851, 75858, 75929, 75930, 75934, 75935, 75937, 75939, 75943, 75944, 75946, 75948, 75954, 75958, 75959, 75960, 75961, 75962, 75963, 75964, 75965, 75968, 75972, 75973, 75974, 75975, 75978, 76301, 76302, 76305, 76306, 76307, 76308, 76309, 76310, 76311, 76354, 76360, 76367, 76369, 76435, 76437, 76443, 76445, 76448, 76454, 76466, 76469, 76470, 76471, 76501, 76502, 76503, 76504, 76505, 76508, 76513, 76519, 76522, 76524, 76525, 76526, 76528, 76533, 76534, 76538, 76540, 76541, 76542, 76543, 76544, 76545, 76546, 76547, 76548, 76549, 76554, 76557, 76558, 76559, 76561, 76564, 76566, 76569, 76570, 76571, 76579, 76596, 76597, 76598, 76599, 76624, 76629, 76630, 76632, 76633, 76638, 76640, 76643, 76654, 76655, 76656, 76657, 76661, 76664, 76680, 76682, 76684, 76685, 76691, 76701, 76702, 76703, 76704, 76705, 76706, 76707, 76708, 76710, 76711, 76712, 76714, 76715, 76716, 76795, 76797, 76798, 76799, 76825, 76828, 76834, 76836, 76837, 76841, 76845, 76848, 76849, 76852, 76854, 76855, 76858, 76859, 76862, 76866, 76872, 76873, 76874, 76878, 76882, 76883, 76884, 76887, 76888, 77326, 77327, 77332, 77335, 77350, 77351, 77360, 77368, 77369, 77399, 77423, 77445, 77446, 77466, 77484, 77491, 77492, 77533, 77535, 77538, 77561, 77564, 77575, 77582, 77613, 77619, 77622, 77627, 77629, 77640, 77641, 77642, 77643, 77651, 77655, 77701, 77702, 77703, 77704, 77705, 77706, 77707, 77708, 77709, 77710, 77713, 77720, 77725, 77726, 77801, 77802, 77803, 77805, 77806, 77807, 77808, 77837, 77840, 77841, 77842, 77843, 77844, 77845, 77856, 77859, 77862, 77866, 77867, 77870, 77881, 77882, 77950, 77990, 78001, 78003, 78005, 78007, 78008, 78011, 78012, 78014, 78017, 78019, 78021, 78022, 78026, 78040, 78041, 78042, 78043, 78044, 78045, 78046, 78049, 78050, 78052, 78055, 78057, 78060, 78061, 78062, 78063, 78064, 78065, 78067, 78069, 78071, 78072, 78075, 78076, 78336, 78338, 78340, 78341, 78344, 78349, 78350, 78352, 78353, 78355, 78357, 78358, 78359, 78360, 78361, 78362, 78363, 78364, 78368, 78369, 78370, 78371, 78374, 78376, 78377, 78379, 78381, 78382, 78384, 78385, 78387, 78390, 78393, 78501, 78502, 78503, 78504, 78505, 78516, 78520, 78521, 78522, 78523, 78526, 78535, 78536, 78537, 78538, 78539, 78540, 78541, 78542, 78543, 78545, 78547, 78548, 78549, 78550, 78551, 78552, 78553, 78557, 78558, 78559, 78560, 78561, 78562, 78563, 78564, 78565, 78566, 78567, 78568, 78569, 78570, 78572, 78573, 78574, 78575, 78576, 78577, 78578, 78579, 78580, 78582, 78583, 78584, 78585, 78586, 78588, 78589, 78590, 78591, 78592, 78593, 78594, 78595, 78596, 78597, 78598, 78599, 78610, 78616, 78619, 78620, 78622, 78640, 78644, 78648, 78655, 78656, 78661, 78666, 78667, 78676, 78737, 78801, 78802, 78827, 78828, 78829, 78830, 78832, 78833, 78834, 78836, 78837, 78838, 78839, 78840, 78841, 78842, 78843, 78847, 78852, 78853, 78860, 78870, 78871, 78872, 78873, 78877, 78879, 78880, 78881, 78883, 78884, 78885, 79012, 79027, 79031, 79040, 79042, 79043, 79052, 79058, 79062, 79063, 79064, 79077, 79081, 79082, 79085, 79088, 79095, 79101, 79102, 79103, 79104, 79106, 79107, 79108, 79111, 79114, 79116, 79117, 79120, 79124, 79159, 79166, 79168, 79172, 79174, 79178, 79185, 79187, 79189, 79220, 79223, 79225, 79227, 79229, 79230, 79233, 79239, 79243, 79245, 79248, 79251, 79252, 79261, 79312, 79316, 79322, 79326, 79329, 79339, 79343, 79345, 79350, 79351, 79357, 79363, 79364, 79366, 79369, 79370, 79371, 79373, 79378, 79381, 79382, 79383, 79401, 79402, 79403, 79404, 79405, 79406, 79407, 79408, 79409, 79410, 79411, 79412, 79413, 79414, 79415, 79416, 79423, 79424, 79430, 79452, 79453, 79457, 79464, 79490, 79491, 79493, 79499, 79501, 79503, 79504, 79508, 79510, 79519, 79520, 79525, 79530, 79533, 79536, 79538, 79541, 79553, 79561, 79562, 79563, 79566, 79601, 79602, 79603, 79604, 79605, 79606, 79607, 79608, 79697, 79698, 79699, 79718, 79770, 79772, 79780, 79785, 79786, 79821, 79835, 79836, 79837, 79838, 79839, 79843, 79845, 79846, 79847, 79849, 79851, 79853, 79855, 79901, 79902, 79903, 79904, 79905, 79906, 79907, 79908, 79910, 79911, 79912, 79913, 79914, 79915, 79916, 79917, 79918, 79920, 79922, 79923, 79924, 79925, 79926, 79927, 79928, 79929, 79930, 79931, 79932, 79934, 79935, 79936, 79937, 79938, 79940, 79941, 79943, 79944, 79945, 79946, 79947, 79948, 79949, 79950, 79951, 79952, 79953, 79954, 79955, 79958, 79960, 79961, 79968, 79976, 79978, 79980, 79990, 79995, 79996, 79997, 79998, 79999, 57002, 57006, 57007, 57010, 57026, 57061, 57069, 57071, 57073, 57220, 57276, 57329, 57339, 57341, 57342, 57356, 57361, 57367, 57369, 57380, 57521, 57531, 57543, 57547, 57551, 57552, 57553, 57555, 57559, 57560, 57562, 57563, 57566, 57567, 57570, 57572, 57574, 57577, 57579, 57585, 57621, 57622, 57623, 57625, 57630, 57633, 57634, 57636, 57639, 57641, 57642, 57652, 57656, 57657, 57658, 57659, 57661, 57714, 57716, 57735, 57747, 57750, 57752, 57756, 57763, 57764, 57766, 57770, 57772, 57782, 57794, 58310, 58313, 58316, 58329, 58332, 58335, 58343, 58346, 58348, 58351, 58353, 58357, 58366, 58367, 58368, 58369, 58370, 58379, 58385, 58386, 58413, 58428, 58430, 58444, 58460, 58463, 58475, 58478, 58482, 58487, 58488, 58495, 58524, 58528, 58538, 58542, 58544, 58549, 58552, 58568, 58573, 58581, 58758, 99510, 99519, 99545, 99548, 99549, 99551, 99552, 99553, 99554, 99555, 99557, 99558, 99559, 99561, 99563, 99564, 99565, 99569, 99571, 99575, 99576, 99578, 99579, 99580, 99581, 99583, 99585, 99589, 99590, 99602, 99604, 99606, 99607, 99609, 99612, 99614, 99620, 99621, 99622, 99625, 99626, 99627, 99628, 99630, 99632, 99634, 99636, 99637, 99640, 99641, 99647, 99648, 99649, 99650, 99651, 99653, 99655, 99656, 99657, 99658, 99659, 99661, 99662, 99665, 99666, 99668, 99671, 99675, 99678, 99679, 99680, 99681, 99684, 99690, 99691, 99704, 99720, 99721, 99722, 99723, 99724, 99726, 99727, 99730, 99733, 99734, 99736, 99739, 99740, 99741, 99742, 99743, 99744, 99745, 99746, 99747, 99748, 99749, 99750, 99751, 99752, 99753, 99754, 99755, 99756, 99757, 99758, 99759, 99760, 99761, 99762, 99763, 99765, 99766, 99767, 99768, 99769, 99770, 99771, 99772, 99773, 99774, 99777, 99778, 99781, 99782, 99783, 99784, 99785, 99786, 99788, 99789, 99790, 99791, 99820, 99825, 99826, 99829, 99832, 99841, 99903, 99918, 99919, 99921, 99922, 99923, 99925, 99927, 99929, 24801, 24808, 24811, 24813, 24815, 24816, 24817, 24826, 24828, 24829, 24830, 24831, 24836, 24842, 24843, 24844, 24846, 24848, 24850, 24851, 24853, 24855, 24861, 24862, 24866, 24868, 24871, 24872, 24873, 24878, 24879, 24881, 24884, 24887, 24888, 24892, 24894, 24895, 24935, 24962, 24981, 25002, 25003, 25005, 25007, 25008, 25009, 25015, 25019, 25021, 25022, 25024, 25025, 25026, 25028, 25030, 25031, 25035, 25036, 25039, 25040, 25043, 25044, 25045, 25047, 25048, 25049, 25051, 25053, 25054, 25057, 25059, 25060, 25061, 25062, 25063, 25064, 25067, 25071, 25075, 25076, 25079, 25081, 25083, 25085, 25086, 25088, 25090, 25093, 25102, 25103, 25107, 25108, 25110, 25111, 25112, 25113, 25114, 25115, 25118, 25119, 25121, 25125, 25126, 25130, 25132, 25133, 25134, 25136, 25139, 25140, 25141, 25142, 25143, 25148, 25149, 25152, 25154, 25156, 25160, 25161, 25162, 25164, 25165, 25169, 25173, 25174, 25177, 25180, 25181, 25183, 25185, 25186, 25193, 25201, 25202, 25203, 25204, 25205, 25206, 25208, 25209, 25211, 25214, 25231, 25234, 25235, 25239, 25241, 25243, 25244, 25245, 25248, 25251, 25252, 25259, 25261, 25262, 25264, 25266, 25267, 25268, 25270, 25271, 25275, 25276, 25285, 25286, 25301, 25302, 25303, 25304, 25305, 25306, 25309, 25311, 25312, 25313, 25314, 25315, 25317, 25320, 25321, 25322, 25323, 25324, 25325, 25326, 25327, 25328, 25329, 25330, 25331, 25332, 25333, 25334, 25335, 25336, 25337, 25338, 25339, 25350, 25356, 25357, 25358, 25360, 25361, 25362, 25364, 25365, 25375, 25387, 25389, 25392, 25396, 25411, 25414, 25422, 25423, 25425, 25430, 25431, 25432, 25434, 25437, 25438, 25441, 25442, 25443, 25444, 25446, 25501, 25504, 25505, 25506, 25507, 25508, 25510, 25511, 25512, 25514, 25517, 25521, 25523, 25524, 25529, 25530, 25534, 25535, 25537, 25540, 25541, 25544, 25545, 25547, 25555, 25557, 25559, 25562, 25564, 25565, 25567, 25570, 25571, 25572, 25573, 25601, 25606, 25607, 25608, 25611, 25612, 25614, 25617, 25621, 25624, 25625, 25628, 25630, 25632, 25634, 25635, 25637, 25638, 25639, 25644, 25646, 25647, 25649, 25650, 25651, 25652, 25653, 25654, 25661, 25665, 25666, 25667, 25669, 25670, 25671, 25672, 25674, 25676, 25678, 25686, 25688, 25690, 25691, 25692, 25696, 25699, 25701, 25702, 25703, 25704, 25705, 25706, 25707, 25708, 25709, 25710, 25711, 25712, 25713, 25714, 25715, 25716, 25717, 25718, 25719, 25720, 25721, 25722, 25723, 25724, 25725, 25726, 25727, 25728, 25729, 25755, 25770, 25771, 25772, 25773, 25774, 25775, 25776, 25777, 25778, 25779, 25801, 25802, 25812, 25813, 25817, 25818, 25823, 25825, 25827, 25831, 25832, 25833, 25836, 25837, 25839, 25840, 25843, 25844, 25846, 25849, 25851, 25853, 25854, 25855, 25857, 25860, 25862, 25864, 25865, 25866, 25868, 25871, 25873, 25878, 25879, 25880, 25901, 25902, 25904, 25906, 25907, 25908, 25909, 25911, 25915, 25917, 25918, 25919, 25920, 25921, 25926, 25927, 25932, 25936, 25938, 25942, 25951, 25965, 25966, 25969, 25976, 25977, 25978, 25979, 25985, 25986, 25989, 26031, 26033, 26034, 26036, 26038, 26039, 26040, 26041, 26047, 26050, 26055, 26056, 26062, 26101, 26102, 26103, 26104, 26105, 26106, 26120, 26121, 26133, 26136, 26137, 26138, 26141, 26142, 26143, 26147, 26148, 26150, 26151, 26152, 26160, 26161, 26164, 26169, 26178, 26180, 26181, 26184, 26187, 26202, 26203, 26205, 26206, 26208, 26215, 26217, 26222, 26238, 26250, 26261, 26266, 26275, 26288, 26298, 26325, 26327, 26335, 26337, 26339, 26342, 26346, 26349, 26351, 26362, 26374, 26384, 26405, 26410, 26411, 26415, 26416, 26421, 26425, 26430, 26436, 26443, 26444, 26456, 26501, 26502, 26504, 26505, 26506, 26507, 26508, 26519, 26520, 26521, 26524, 26525, 26527, 26531, 26534, 26537, 26541, 26542, 26543, 26544, 26546, 26547, 26570, 26590, 26601, 26610, 26611, 26615, 26617, 26619, 26621, 26623, 26624, 26627, 26629, 26631, 26636, 26638, 26651, 26656, 26660, 26662, 26667, 26671, 26675, 26676, 26678, 26679, 26680, 26681, 26684, 26690, 26691, 26704, 26705, 26710, 26711, 26714, 26716, 26717, 26719, 26722, 26726, 26743, 26750, 26753, 26755, 26757, 26761, 26763, 26764, 26767, 26802, 26804, 26807, 26808, 26814, 26815, 26817, 26823, 26852, 26865, 26866, 26884, 26886, 68047, 68719, 68722, 68723, 68740, 68746, 68753, 68755, 68777, 68778, 68787, 68790, 68821, 68823, 68833, 68943, 68957, 68961, 68964, 68974, 68978, 69021, 69024, 69030, 69037, 69040, 69041, 69043, 69044, 69147, 69148, 69154, 69157, 69163, 69190, 69335, 69337, 69339, 69340, 69343, 69347, 69351, 69354, 69360, 69365, 69367, 87002, 87006, 87009, 87011, 87016, 87023, 87026, 87028, 87031, 87032, 87035, 87036, 87037, 87042, 87045, 87060, 87061, 87062, 87063, 87068, 87070, 87301, 87302, 87305, 87310, 87311, 87312, 87313, 87316, 87317, 87319, 87320, 87321, 87322, 87323, 87325, 87326, 87328, 87347, 87364, 87365, 87375, 87401, 87402, 87410, 87412, 87413, 87415, 87416, 87417, 87418, 87419, 87420, 87421, 87455, 87461, 87499, 87538, 87552, 87560, 87562, 87565, 87569, 87573, 87583, 87701, 87710, 87711, 87712, 87713, 87714, 87715, 87718, 87722, 87723, 87724, 87728, 87729, 87730, 87731, 87732, 87733, 87734, 87735, 87736, 87740, 87742, 87743, 87745, 87746, 87747, 87749, 87750, 87752, 87753, 87801, 87823, 87825, 87828, 87831, 87832, 87901, 87930, 87931, 87933, 87935, 87936, 87937, 87939, 87940, 87941, 87942, 87943, 88001, 88002, 88003, 88004, 88005, 88006, 88007, 88008, 88009, 88011, 88012, 88013, 88020, 88021, 88024, 88027, 88029, 88030, 88031, 88032, 88033, 88042, 88044, 88045, 88046, 88047, 88048, 88052, 88054, 88056, 88058, 88063, 88072, 88081, 88113, 88115, 88116, 88118, 88119, 88121, 88122, 88123, 88125, 88126, 88130, 88132, 88134, 88136, 88301, 88310, 88311, 88312, 88314, 88316, 88317, 88318, 88321, 88323, 88324, 88325, 88330, 88336, 88337, 88338, 88339, 88340, 88341, 88342, 88343, 88344, 88345, 88346, 88347, 88348, 88349, 88350, 88351, 88352, 88353, 88354, 88355, 88401, 88410, 88411, 88414, 88415, 88416, 88417, 88418, 88419, 88421, 88422, 88424, 88426, 88427, 88430, 88431, 88433, 88434, 88435, 88436, 88439, 66002, 66006, 66008, 66010, 66012, 66014, 66016, 66017, 66023, 66024, 66025, 66035, 66040, 66041, 66044, 66045, 66046, 66047, 66049, 66050, 66056, 66058, 66072, 66075, 66077, 66087, 66090, 66094, 66101, 66102, 66103, 66104, 66105, 66106, 66109, 66110, 66111, 66112, 66113, 66115, 66117, 66118, 66119, 66160, 66439, 66441, 66442, 66449, 66502, 66503, 66505, 66506, 66514, 66517, 66531, 66554, 66758, 66759, 66761, 66767, 66777, 66783, 66901, 66938, 66948, 67054, 67059, 67109, 67345, 67346, 67349, 67352, 67353, 67417, 67445, 67466, 67635, 67643, 67653, 67749, 67836, 67857, 67859, 67878, 67901, 67905, 71601, 71602, 71603, 71611, 71612, 71613, 71630, 71631, 71638, 71639, 71640, 71643, 71644, 71647, 71651, 71652, 71653, 71654, 71659, 71660, 71662, 71665, 71666, 71667, 71670, 71671, 71674, 71678, 71701, 71711, 71720, 71721, 71722, 71725, 71726, 71728, 71740, 71742, 71743, 71744, 71745, 71748, 71751, 71752, 71753, 71754, 71763, 71764, 71766, 71770, 71772, 71820, 71822, 71823, 71826, 71827, 71828, 71832, 71833, 71834, 71835, 71836, 71837, 71839, 71840, 71841, 71842, 71844, 71845, 71846, 71851, 71852, 71853, 71854, 71857, 71858, 71860, 71861, 71864, 71865, 71866, 71901, 71902, 71903, 71909, 71913, 71914, 71920, 71921, 71922, 71923, 71932, 71933, 71935, 71937, 71940, 71943, 71944, 71945, 71949, 71950, 71951, 71952, 71953, 71956, 71957, 71958, 71959, 71960, 71961, 71962, 71964, 71965, 71966, 71968, 71969, 71970, 71971, 71972, 71973, 71998, 71999, 72001, 72004, 72005, 72006, 72013, 72014, 72016, 72021, 72025, 72028, 72029, 72031, 72036, 72043, 72051, 72059, 72069, 72070, 72074, 72075, 72079, 72088, 72101, 72108, 72112, 72123, 72125, 72126, 72132, 72133, 72134, 72141, 72152, 72153, 72168, 72169, 72175, 72182, 72189, 72301, 72303, 72310, 72311, 72312, 72313, 72315, 72316, 72319, 72320, 72321, 72322, 72325, 72326, 72327, 72328, 72329, 72330, 72331, 72332, 72333, 72335, 72336, 72338, 72339, 72340, 72341, 72342, 72346, 72348, 72350, 72351, 72352, 72353, 72354, 72355, 72358, 72359, 72360, 72364, 72365, 72366, 72367, 72368, 72369, 72370, 72372, 72374, 72376, 72377, 72379, 72383, 72384, 72386, 72389, 72390, 72391, 72392, 72394, 72395, 72401, 72402, 72403, 72404, 72405, 72410, 72411, 72413, 72414, 72415, 72416, 72417, 72419, 72421, 72422, 72424, 72426, 72427, 72428, 72429, 72430, 72431, 72432, 72433, 72434, 72435, 72437, 72438, 72440, 72441, 72442, 72444, 72445, 72447, 72449, 72453, 72454, 72455, 72456, 72457, 72458, 72459, 72460, 72461, 72462, 72464, 72465, 72466, 72467, 72469, 72470, 72471, 72472, 72473, 72475, 72476, 72478, 72479, 72482, 72512, 72513, 72515, 72517, 72519, 72520, 72521, 72525, 72528, 72529, 72531, 72532, 72533, 72536, 72538, 72539, 72540, 72542, 72554, 72555, 72556, 72560, 72561, 72565, 72566, 72567, 72569, 72572, 72573, 72576, 72577, 72578, 72583, 72584, 72585, 72587, 72619, 72624, 72628, 72629, 72634, 72636, 72639, 72640, 72641, 72645, 72648, 72650, 72655, 72657, 72661, 72663, 72666, 72668, 72669, 72670, 72672, 72675, 72677, 72680, 72682, 72683, 72685, 72686, 72687, 72701, 72702, 72703, 72704, 72717, 72721, 72727, 72729, 72730, 72735, 72737, 72738, 72740, 72741, 72742, 72744, 72749, 72752, 72753, 72760, 72762, 72764, 72765, 72766, 72769, 72770, 72773, 72774, 72776, 72820, 72821, 72824, 72826, 72827, 72828, 72829, 72830, 72832, 72833, 72834, 72835, 72838, 72839, 72840, 72841, 72842, 72845, 72846, 72851, 72852, 72853, 72854, 72855, 72856, 72857, 72860, 72863, 72865, 72901, 72902, 72903, 72904, 72905, 72906, 72908, 72913, 72914, 72916, 72917, 72918, 72919, 72921, 72923, 72926, 72927, 72928, 72930, 72932, 72933, 72934, 72935, 72936, 72937, 72938, 72940, 72941, 72943, 72944, 72945, 72946, 72947, 72948, 72949, 72950, 72951, 72952, 72955, 72956, 72957, 72958, 72959, 50008, 50010, 50011, 50012, 50013, 50014, 50046, 50052, 50055, 50056, 50060, 50065, 50067, 50103, 50105, 50108, 50123, 50124, 50134, 50140, 50144, 50147, 50154, 50161, 50165, 50201, 50236, 50243, 50244, 50248, 50262, 50264, 50278, 52544, 52549, 52555, 52571, 52572, 52574, 52581, 52583, 52590, 52593, 52594, 73027, 73432, 73447, 73450, 73455, 73460, 73461, 73501, 73502, 73503, 73505, 73506, 73507, 73527, 73528, 73530, 73531, 73538, 73540, 73541, 73542, 73543, 73544, 73546, 73547, 73550, 73551, 73552, 73553, 73554, 73555, 73557, 73558, 73562, 73567, 73568, 73570, 73571, 73572, 73673, 73933, 73937, 73946, 73947, 74001, 74002, 74003, 74010, 74020, 74023, 74026, 74028, 74030, 74032, 74034, 74035, 74038, 74039, 74041, 74044, 74045, 74046, 74050, 74052, 74054, 74056, 74058, 74059, 74060, 74062, 74066, 74067, 74068, 74070, 74071, 74074, 74075, 74076, 74077, 74078, 74079, 74081, 74084, 74085, 74131, 74335, 74339, 74343, 74354, 74355, 74358, 74360, 74363, 74370, 74421, 74426, 74428, 74431, 74432, 74435, 74437, 74438, 74445, 74447, 74456, 74457, 74459, 74460, 74461, 74521, 74523, 74525, 74530, 74533, 74536, 74540, 74542, 74543, 74549, 74555, 74557, 74558, 74562, 74567, 74569, 74574, 74576, 74633, 74637, 74650, 74652, 74722, 74724, 74727, 74728, 74734, 74735, 74736, 74737, 74738, 74740, 74743, 74745, 74750, 74752, 74754, 74755, 74756, 74759, 74760, 74761, 74764, 74766, 74824, 74829, 74832, 74833, 74834, 74836, 74845, 74855, 74856, 74859, 74860, 74864, 74869, 74875, 74880, 74881, 74931, 74936, 74945, 74946, 74948, 74954, 74955, 74957, 74960, 74962, 74963, 74964, 74965, 97324, 97326, 97330, 97331, 97333, 97339, 97370, 97401, 97402, 97403, 97404, 97405, 97408, 97409, 97412, 97413, 97419, 97424, 97426, 97427, 97430, 97431, 97434, 97437, 97438, 97439, 97440, 97448, 97451, 97452, 97453, 97454, 97455, 97456, 97461, 97463, 97472, 97477, 97478, 97480, 97482, 97487, 97488, 97489, 97490, 97492, 97493, 97497, 97523, 97526, 97527, 97528, 97531, 97532, 97533, 97534, 97538, 97543, 97544, 97750, 97814, 97819, 97830, 97833, 97834, 97837, 97840, 97870, 97874, 97877, 97884, 97905, 97907, 40007, 40011, 40019, 40036, 40050, 40055, 40057, 40058, 40068, 40070, 40075, 40119, 40311, 40312, 40313, 40317, 40319, 40336, 40348, 40350, 40351, 40357, 40358, 40360, 40361, 40362, 40366, 40371, 40374, 40376, 40380, 40402, 40405, 40409, 40434, 40445, 40447, 40456, 40460, 40472, 40473, 40481, 40486, 40488, 40492, 40495, 40701, 40702, 40730, 40734, 40754, 40759, 40763, 40769, 40771, 40801, 40803, 40806, 40807, 40808, 40810, 40813, 40815, 40816, 40818, 40819, 40820, 40823, 40824, 40826, 40827, 40828, 40829, 40830, 40831, 40840, 40843, 40844, 40845, 40847, 40849, 40854, 40855, 40856, 40858, 40862, 40863, 40865, 40868, 40870, 40873, 40874, 40902, 40903, 40906, 40913, 40914, 40915, 40921, 40923, 40927, 40930, 40931, 40932, 40935, 40939, 40940, 40941, 40943, 40944, 40946, 40949, 40951, 40953, 40955, 40958, 40962, 40964, 40965, 40972, 40977, 40979, 40981, 40982, 40983, 40988, 40995, 40997, 40999, 41010, 41030, 41035, 41046, 41052, 41054, 41086, 41095, 41097, 41101, 41102, 41105, 41114, 41121, 41124, 41128, 41129, 41132, 41135, 41139, 41141, 41142, 41143, 41144, 41146, 41149, 41159, 41160, 41164, 41166, 41168, 41169, 41171, 41173, 41174, 41175, 41179, 41180, 41181, 41183, 41189, 41201, 41203, 41204, 41214, 41216, 41219, 41222, 41224, 41226, 41230, 41231, 41232, 41234, 41238, 41240, 41250, 41254, 41255, 41256, 41257, 41260, 41262, 41263, 41264, 41265, 41267, 41268, 41271, 41274, 41301, 41307, 41310, 41311, 41313, 41314, 41317, 41332, 41333, 41338, 41339, 41347, 41348, 41351, 41352, 41360, 41362, 41364, 41365, 41366, 41367, 41368, 41385, 41386, 41390, 41397, 41408, 41413, 41421, 41425, 41426, 41433, 41451, 41459, 41464, 41465, 41472, 41477, 41501, 41502, 41503, 41512, 41513, 41514, 41517, 41519, 41520, 41522, 41524, 41526, 41527, 41528, 41531, 41534, 41535, 41537, 41538, 41539, 41540, 41542, 41543, 41544, 41547, 41548, 41549, 41553, 41554, 41555, 41557, 41558, 41559, 41560, 41561, 41562, 41563, 41564, 41566, 41567, 41568, 41571, 41572, 41601, 41602, 41603, 41604, 41605, 41606, 41607, 41612, 41615, 41616, 41619, 41621, 41622, 41630, 41631, 41632, 41635, 41636, 41640, 41642, 41643, 41645, 41647, 41649, 41650, 41651, 41653, 41655, 41659, 41660, 41663, 41666, 41667, 41669, 41701, 41702, 41712, 41713, 41714, 41719, 41721, 41722, 41723, 41725, 41727, 41729, 41731, 41735, 41736, 41739, 41740, 41743, 41745, 41746, 41747, 41749, 41751, 41754, 41759, 41760, 41762, 41763, 41764, 41766, 41772, 41773, 41774, 41775, 41776, 41777, 41778, 41804, 41810, 41812, 41815, 41817, 41819, 41821, 41822, 41824, 41825, 41826, 41828, 41831, 41832, 41833, 41834, 41835, 41836, 41837, 41838, 41839, 41840, 41843, 41844, 41845, 41847, 41848, 41849, 41855, 41858, 41859, 41861, 41862, 42020, 42036, 42038, 42041, 42049, 42050, 42054, 42055, 42071, 42076, 42101, 42102, 42103, 42104, 42120, 42122, 42123, 42124, 42127, 42128, 42129, 42130, 42131, 42133, 42140, 42141, 42142, 42151, 42152, 42153, 42154, 42156, 42157, 42159, 42160, 42163, 42164, 42166, 42167, 42170, 42171, 42201, 42207, 42210, 42211, 42214, 42215, 42217, 42219, 42223, 42232, 42236, 42240, 42241, 42252, 42254, 42259, 42261, 42262, 42266, 42273, 42274, 42275, 42285, 42287, 42288, 42322, 42327, 42334, 42350, 42352, 42371, 42372, 42402, 42406, 42419, 42420, 42451, 42452, 42457, 42458, 42516, 42528, 42539, 42541, 42565, 42566, 42602, 42603, 42629, 42631, 42633, 42634, 42635, 42638, 42642, 42647, 42649, 42653, 42712, 42713, 42715, 42716, 42717, 42720, 42721, 42722, 42726, 42728, 42729, 42731, 42741, 42742, 42743, 42746, 42748, 42749, 42753, 42754, 42755, 42757, 42759, 42762, 42764, 42765, 42782, 70032, 70043, 70049, 70051, 70068, 70069, 70075, 70076, 70084, 70085, 70092, 70112, 70113, 70114, 70115, 70116, 70117, 70118, 70119, 70122, 70124, 70125, 70126, 70127, 70128, 70129, 70130, 70131, 70139, 70140, 70141, 70142, 70143, 70145, 70146, 70148, 70149, 70150, 70151, 70152, 70153, 70154, 70156, 70157, 70158, 70159, 70160, 70161, 70162, 70163, 70164, 70165, 70166, 70167, 70170, 70172, 70174, 70175, 70176, 70177, 70178, 70179, 70181, 70182, 70183, 70184, 70185, 70186, 70187, 70189, 70190, 70195, 70339, 70341, 70343, 70344, 70352, 70353, 70356, 70359, 70360, 70361, 70363, 70364, 70372, 70377, 70390, 70391, 70393, 70395, 70397, 70401, 70402, 70403, 70404, 70421, 70422, 70426, 70427, 70429, 70436, 70438, 70441, 70442, 70443, 70444, 70446, 70450, 70451, 70453, 70454, 70455, 70456, 70465, 70466, 70467, 70510, 70511, 70512, 70513, 70515, 70516, 70517, 70519, 70524, 70525, 70526, 70527, 70528, 70531, 70533, 70534, 70535, 70537, 70541, 70542, 70543, 70544, 70548, 70550, 70552, 70554, 70555, 70556, 70559, 70560, 70562, 70563, 70569, 70570, 70571, 70575, 70576, 70577, 70578, 70580, 70582, 70584, 70585, 70586, 70589, 70631, 70632, 70643, 70645, 70715, 70721, 70722, 70730, 70732, 70736, 70740, 70747, 70748, 70749, 70750, 70752, 70753, 70755, 70756, 70757, 70759, 70760, 70761, 70762, 70764, 70765, 70772, 70773, 70776, 70777, 70780, 70783, 70788, 70789, 71001, 71002, 71003, 71004, 71007, 71008, 71009, 71016, 71018, 71019, 71021, 71023, 71024, 71027, 71028, 71029, 71030, 71031, 71032, 71033, 71034, 71038, 71039, 71040, 71043, 71044, 71045, 71046, 71047, 71048, 71049, 71050, 71052, 71055, 71058, 71060, 71061, 71063, 71066, 71068, 71069, 71070, 71071, 71072, 71073, 71075, 71078, 71079, 71080, 71082, 71101, 71102, 71103, 71104, 71105, 71106, 71107, 71108, 71109, 71115, 71118, 71119, 71120, 71129, 71130, 71133, 71134, 71135, 71136, 71137, 71138, 71148, 71149, 71150, 71151, 71152, 71153, 71154, 71156, 71161, 71162, 71163, 71164, 71165, 71166, 71201, 71202, 71203, 71207, 71208, 71209, 71210, 71211, 71212, 71213, 71217, 71218, 71219, 71220, 71221, 71222, 71223, 71225, 71227, 71229, 71230, 71232, 71233, 71234, 71235, 71238, 71240, 71241, 71243, 71245, 71249, 71250, 71254, 71256, 71259, 71260, 71261, 71264, 71269, 71270, 71272, 71273, 71275, 71276, 71277, 71279, 71280, 71281, 71282, 71284, 71286, 71291, 71292, 71294, 71295, 71301, 71302, 71303, 71306, 71307, 71309, 71315, 71316, 71320, 71322, 71323, 71324, 71325, 71326, 71327, 71328, 71329, 71330, 71331, 71333, 71334, 71336, 71339, 71341, 71345, 71346, 71348, 71350, 71351, 71353, 71354, 71355, 71356, 71357, 71358, 71359, 71360, 71361, 71362, 71365, 71366, 71367, 71369, 71373, 71375, 71377, 71378, 71404, 71405, 71407, 71409, 71410, 71411, 71414, 71415, 71416, 71417, 71418, 71422, 71423, 71424, 71427, 71428, 71430, 71431, 71432, 71433, 71434, 71435, 71438, 71440, 71441, 71447, 71448, 71450, 71452, 71454, 71455, 71456, 71457, 71458, 71466, 71467, 71468, 71469, 71471, 71472, 71473, 71477, 71483, 71485, 71497, 35013, 35031, 35034, 35035, 35042, 35045, 35046, 35049, 35072, 35074, 35079, 35085, 35089, 35097, 35111, 35121, 35133, 35136, 35171, 35172, 35183, 35184, 35188, 35401, 35402, 35403, 35404, 35405, 35406, 35407, 35440, 35441, 35442, 35443, 35444, 35446, 35447, 35448, 35449, 35452, 35453, 35456, 35457, 35458, 35459, 35460, 35461, 35462, 35463, 35464, 35466, 35468, 35469, 35470, 35471, 35473, 35474, 35475, 35476, 35477, 35478, 35480, 35481, 35482, 35485, 35486, 35487, 35490, 35491, 35540, 35541, 35543, 35548, 35551, 35553, 35563, 35564, 35565, 35570, 35572, 35575, 35577, 35594, 35601, 35602, 35603, 35609, 35616, 35618, 35619, 35621, 35622, 35640, 35643, 35646, 35650, 35651, 35660, 35661, 35662, 35670, 35672, 35673, 35674, 35699, 35754, 35775, 35901, 35902, 35903, 35904, 35905, 35906, 35907, 35952, 35954, 35956, 35961, 35962, 35963, 35967, 35968, 35971, 35972, 35974, 35975, 35978, 35979, 35981, 35984, 35986, 35988, 35989, 35990, 36005, 36010, 36013, 36015, 36016, 36017, 36026, 36027, 36029, 36030, 36031, 36032, 36033, 36034, 36035, 36036, 36037, 36039, 36040, 36043, 36047, 36048, 36052, 36053, 36057, 36061, 36064, 36065, 36069, 36072, 36075, 36079, 36081, 36082, 36083, 36087, 36088, 36089, 36091, 36101, 36102, 36103, 36104, 36105, 36106, 36107, 36108, 36109, 36110, 36111, 36112, 36113, 36114, 36115, 36116, 36117, 36118, 36119, 36120, 36121, 36123, 36124, 36125, 36130, 36131, 36132, 36133, 36134, 36135, 36140, 36141, 36142, 36177, 36191, 36201, 36202, 36203, 36204, 36205, 36206, 36207, 36210, 36250, 36253, 36254, 36257, 36260, 36265, 36271, 36272, 36277, 36279, 36301, 36302, 36303, 36304, 36305, 36310, 36312, 36313, 36314, 36316, 36317, 36318, 36319, 36320, 36321, 36340, 36343, 36344, 36345, 36349, 36352, 36353, 36370, 36373, 36375, 36376, 36401, 36425, 36426, 36427, 36429, 36432, 36435, 36439, 36441, 36444, 36445, 36449, 36454, 36456, 36457, 36458, 36460, 36461, 36462, 36470, 36471, 36473, 36475, 36477, 36480, 36481, 36502, 36503, 36504, 36505, 36509, 36512, 36513, 36518, 36521, 36522, 36523, 36525, 36528, 36529, 36538, 36539, 36541, 36543, 36544, 36548, 36553, 36556, 36558, 36560, 36568, 36569, 36571, 36572, 36575, 36581, 36582, 36583, 36584, 36585, 36587, 36590, 36601, 36602, 36603, 36604, 36605, 36606, 36607, 36608, 36609, 36610, 36611, 36612, 36613, 36615, 36616, 36617, 36618, 36619, 36621, 36622, 36625, 36628, 36630, 36633, 36640, 36641, 36644, 36652, 36660, 36663, 36670, 36671, 36675, 36685, 36688, 36689, 36690, 36691, 36693, 36695, 36701, 36702, 36703, 36720, 36721, 36722, 36723, 36726, 36728, 36740, 36741, 36744, 36750, 36751, 36752, 36753, 36756, 36758, 36759, 36761, 36765, 36766, 36767, 36768, 36769, 36773, 36775, 36776, 36785, 36786, 36790, 36792, 36793, 36801, 36802, 36803, 36804, 36830, 36831, 36832, 36849, 36851, 36852, 36854, 36855, 36856, 36858, 36859, 36860, 36862, 36863, 36865, 36866, 36867, 36868, 36869, 36870, 36871, 36872, 36874, 36875, 36877, 36879, 36901, 36904, 36907, 36908, 36910, 36912, 36913, 36915, 36916, 36919, 36921, 36922, 36925, 29001, 29009, 29010, 29014, 29015, 29018, 29020, 29021, 29031, 29032, 29038, 29039, 29040, 29041, 29045, 29046, 29047, 29048, 29051, 29055, 29056, 29059, 29062, 29065, 29069, 29074, 29078, 29079, 29080, 29082, 29102, 29104, 29105, 29107, 29111, 29112, 29113, 29114, 29115, 29116, 29117, 29118, 29125, 29128, 29129, 29130, 29132, 29133, 29137, 29138, 29142, 29143, 29146, 29148, 29150, 29151, 29152, 29153, 29154, 29161, 29162, 29163, 29164, 29166, 29168, 29175, 29180, 29301, 29302, 29303, 29304, 29305, 29306, 29307, 29316, 29318, 29319, 29320, 29321, 29322, 29323, 29324, 29325, 29329, 29330, 29331, 29332, 29333, 29334, 29335, 29336, 29338, 29346, 29348, 29349, 29351, 29353, 29355, 29356, 29360, 29364, 29365, 29368, 29369, 29370, 29372, 29373, 29374, 29375, 29376, 29377, 29378, 29379, 29384, 29385, 29386, 29388, 29390, 29391, 29395, 29432, 29433, 29435, 29446, 29452, 29474, 29475, 29481, 29488, 29493, 29501, 29502, 29503, 29504, 29505, 29506, 29511, 29512, 29516, 29518, 29519, 29525, 29526, 29527, 29528, 29530, 29532, 29536, 29540, 29541, 29543, 29544, 29545, 29546, 29547, 29550, 29551, 29554, 29555, 29556, 29560, 29563, 29564, 29565, 29566, 29567, 29568, 29569, 29570, 29571, 29572, 29573, 29574, 29575, 29576, 29577, 29578, 29579, 29580, 29581, 29582, 29583, 29587, 29588, 29589, 29590, 29591, 29592, 29593, 29594, 29596, 29597, 29598, 29630, 29631, 29632, 29633, 29634, 29640, 29641, 29642, 29645, 29652, 29657, 29667, 29671, 29682, 29685, 29692, 29706, 29712, 29714, 29724, 29729, 29801, 29802, 29803, 29804, 29805, 29808, 29809, 29810, 29816, 29822, 29824, 29827, 29828, 29829, 29831, 29832, 29834, 29836, 29838, 29839, 29841, 29842, 29846, 29847, 29849, 29850, 29851, 29856, 29860, 29861, 29911, 29912, 29913, 29916, 29918, 29921, 29922, 29923, 29924, 29927, 29929, 29932, 29933, 29934, 29936, 29939, 29943, 29944, 29945, 55371, 56001, 56002, 56006, 56010, 56024, 56034, 56037, 56055, 56063, 56065, 56078, 56080, 56090, 56207, 56221, 56235, 56244, 56267, 56313, 56330, 56342, 56353, 56359, 56363, 56386, 56464, 56477, 56478, 56481, 56482, 56566, 53110, 53129, 53130, 53132, 53154, 53172, 53201, 53202, 53203, 53204, 53205, 53206, 53207, 53208, 53209, 53210, 53211, 53212, 53213, 53214, 53215, 53216, 53217, 53218, 53219, 53220, 53221, 53222, 53223, 53224, 53225, 53226, 53227, 53228, 53233, 53234, 53235, 53237, 53244, 53259, 53263, 53267, 53268, 53274, 53278, 53288, 53290, 53293, 53295, 53910, 53927, 53934, 53936, 53952, 54003, 54010, 54011, 54014, 54021, 54022, 54103, 54120, 54121, 54135, 54150, 54511, 54514, 54517, 54520, 54525, 54527, 54534, 54536, 54541, 54542, 54546, 54547, 54550, 54559, 54565, 54566, 54613, 54723, 54740, 54750, 54761, 54767, 54806, 54846, 54850, 54855, 54861, 80429, 80430, 80434, 80461, 80473, 80480, 80727, 80735, 80755, 80758, 80759, 80822, 80824, 81001, 81002, 81003, 81004, 81005, 81006, 81007, 81008, 81009, 81010, 81011, 81012, 81019, 81020, 81021, 81022, 81023, 81024, 81025, 81027, 81029, 81030, 81033, 81034, 81036, 81038, 81039, 81040, 81041, 81043, 81044, 81045, 81046, 81047, 81049, 81050, 81052, 81054, 81055, 81057, 81058, 81059, 81062, 81063, 81064, 81067, 81069, 81071, 81073, 81076, 81077, 81081, 81082, 81084, 81087, 81089, 81090, 81091, 81092, 81101, 81102, 81120, 81121, 81123, 81124, 81125, 81126, 81127, 81128, 81129, 81130, 81131, 81132, 81133, 81134, 81135, 81136, 81138, 81140, 81141, 81143, 81144, 81146, 81147, 81148, 81149, 81151, 81152, 81153, 81154, 81155, 81157, 81201, 81211, 81212, 81215, 81221, 81222, 81223, 81226, 81227, 81228, 81232, 81233, 81236, 81240, 81242, 81244, 81248, 81251, 81290, 81320, 81324, 81332, 20607, 20608, 20613, 20623, 20697, 20703, 20704, 20705, 20706, 20707, 20708, 20709, 20710, 20712, 20715, 20716, 20717, 20718, 20719, 20720, 20721, 20722, 20725, 20726, 20731, 20735, 20737, 20738, 20740, 20741, 20742, 20743, 20744, 20745, 20746, 20747, 20748, 20749, 20750, 20752, 20753, 20757, 20762, 20768, 20769, 20770, 20771, 20772, 20773, 20774, 20775, 20781, 20782, 20783, 20784, 20785, 20787, 20788, 20790, 20791, 20792, 20797, 20799, 21201, 21202, 21203, 21205, 21206, 21210, 21211, 21212, 21213, 21214, 21215, 21216, 21217, 21218, 21223, 21224, 21225, 21229, 21230, 21231, 21233, 21235, 21239, 21241, 21251, 21260, 21261, 21263, 21264, 21265, 21268, 21270, 21273, 21274, 21275, 21278, 21279, 21280, 21281, 21282, 21283, 21284, 21285, 21287, 21288, 21289, 21290, 21297, 21298, 21501, 21502, 21503, 21504, 21505, 21520, 21521, 21522, 21523, 21524, 21528, 21529, 21530, 21531, 21532, 21536, 21538, 21539, 21540, 21541, 21542, 21543, 21545, 21550, 21555, 21556, 21557, 21561, 21562, 21610, 21613, 21620, 21622, 21626, 21627, 21631, 21634, 21635, 21643, 21645, 21648, 21650, 21651, 21659, 21661, 21664, 21667, 21669, 21672, 21675, 21677, 21678, 21690, 21766, 21817, 21821, 21822, 21824, 21835, 21836, 21838, 21853, 21857, 21866, 21867, 21869, 21871, 21890, 63101, 63102, 63103, 63104, 63106, 63107, 63108, 63109, 63110, 63111, 63112, 63113, 63115, 63116, 63118, 63120, 63139, 63147, 63150, 63151, 63155, 63156, 63157, 63158, 63160, 63163, 63164, 63166, 63167, 63169, 63171, 63177, 63178, 63179, 63180, 63182, 63188, 63190, 63195, 63196, 63197, 63198, 63199, 63446, 63458, 63460, 63464, 63501, 63531, 63533, 63537, 63540, 63544, 63545, 63546, 63547, 63556, 63559, 63560, 63566, 63620, 63621, 63623, 63625, 63629, 63632, 63633, 63636, 63638, 63645, 63650, 63654, 63655, 63656, 63662, 63663, 63665, 63666, 63675, 63701, 63702, 63703, 63739, 63743, 63744, 63745, 63747, 63750, 63751, 63752, 63755, 63760, 63763, 63764, 63766, 63769, 63770, 63779, 63781, 63782, 63785, 63787, 63820, 63821, 63823, 63826, 63827, 63828, 63829, 63830, 63833, 63834, 63837, 63839, 63840, 63845, 63847, 63848, 63849, 63851, 63852, 63853, 63855, 63857, 63860, 63862, 63863, 63866, 63867, 63868, 63869, 63870, 63873, 63874, 63875, 63876, 63877, 63878, 63879, 63880, 63881, 63882, 63901, 63902, 63931, 63932, 63933, 63934, 63935, 63937, 63938, 63939, 63940, 63941, 63942, 63943, 63944, 63945, 63950, 63951, 63952, 63953, 63954, 63955, 63956, 63957, 63961, 63962, 63963, 63964, 63965, 63966, 63967, 64401, 64423, 64428, 64431, 64432, 64433, 64434, 64440, 64443, 64445, 64448, 64455, 64457, 64461, 64468, 64475, 64476, 64479, 64484, 64487, 64501, 64502, 64503, 64504, 64505, 64506, 64507, 64508, 64624, 64625, 64637, 64644, 64645, 64646, 64649, 64650, 64667, 64671, 64720, 64722, 64723, 64728, 64730, 64741, 64744, 64745, 64750, 64752, 64755, 64756, 64765, 64767, 64771, 64772, 64778, 64779, 64780, 64783, 64784, 64790, 64801, 64802, 64803, 64804, 64830, 64831, 64832, 64833, 64834, 64835, 64836, 64840, 64841, 64842, 64843, 64844, 64847, 64849, 64850, 64853, 64854, 64855, 64856, 64857, 64858, 64859, 64861, 64862, 64863, 64864, 64865, 64866, 64867, 64868, 64869, 64870, 65230, 65248, 65250, 65254, 65274, 65401, 65402, 65409, 65436, 65438, 65439, 65444, 65461, 65462, 65464, 65466, 65468, 65479, 65483, 65484, 65529, 65542, 65546, 65548, 65550, 65552, 65555, 65557, 65559, 65564, 65566, 65570, 65571, 65588, 65589, 65590, 65601, 65603, 65604, 65606, 65607, 65608, 65609, 65611, 65612, 65613, 65614, 65615, 65616, 65617, 65618, 65619, 65622, 65624, 65626, 65627, 65633, 65634, 65635, 65636, 65637, 65638, 65640, 65644, 65645, 65646, 65648, 65649, 65650, 65652, 65653, 65655, 65656, 65660, 65661, 65662, 65663, 65666, 65667, 65668, 65672, 65673, 65674, 65675, 65676, 65679, 65680, 65681, 65682, 65685, 65686, 65688, 65689, 65690, 65692, 65701, 65702, 65704, 65706, 65710, 65711, 65713, 65715, 65717, 65724, 65725, 65726, 65727, 65728, 65729, 65730, 65731, 65732, 65733, 65735, 65737, 65738, 65739, 65740, 65741, 65742, 65744, 65746, 65752, 65755, 65757, 65759, 65760, 65761, 65762, 65764, 65765, 65766, 65767, 65768, 65770, 65771, 65773, 65774, 65775, 65776, 65777, 65778, 65779, 65781, 65783, 65784, 65785, 65788, 65789, 65790, 65791, 65793, 65801, 65802, 65803, 65804, 65805, 65806, 65807, 65808, 65809, 65810, 65814, 65817, 65890, 65897, 65898, 65899, 72643, 46001, 46011, 46012, 46013, 46014, 46015, 46016, 46017, 46018, 46036, 46044, 46048, 46051, 46056, 46063, 46064, 46070, 46107, 46113, 46183, 46201, 46202, 46203, 46204, 46205, 46206, 46207, 46208, 46209, 46211, 46214, 46216, 46217, 46218, 46219, 46220, 46221, 46222, 46223, 46224, 46225, 46226, 46227, 46228, 46229, 46230, 46231, 46234, 46235, 46236, 46237, 46239, 46240, 46241, 46242, 46244, 46247, 46249, 46250, 46251, 46253, 46254, 46255, 46256, 46259, 46260, 46262, 46266, 46268, 46274, 46275, 46277, 46278, 46282, 46283, 46285, 46291, 46295, 46296, 46298, 46303, 46307, 46308, 46311, 46312, 46319, 46320, 46321, 46322, 46323, 46324, 46325, 46327, 46342, 46349, 46355, 46356, 46372, 46373, 46375, 46376, 46377, 46379, 46381, 46394, 46401, 46402, 46403, 46404, 46405, 46406, 46407, 46408, 46409, 46410, 46411, 46901, 46902, 46903, 46904, 46936, 46937, 46965, 46979, 46995, 47003, 47108, 47120, 47125, 47139, 47165, 47167, 47302, 47303, 47304, 47305, 47306, 47307, 47308, 47320, 47325, 47334, 47338, 47342, 47353, 47367, 47383, 47396, 47401, 47402, 47403, 47404, 47405, 47406, 47407, 47408, 47426, 47427, 47429, 47431, 47433, 47434, 47455, 47456, 47458, 47460, 47463, 47464, 47468, 47490, 47801, 47802, 47803, 47804, 47805, 47807, 47808, 47809, 47811, 47812, 47830, 47831, 47832, 47833, 47836, 47838, 47842, 47847, 47848, 47849, 47850, 47851, 47852, 47854, 47855, 47856, 47859, 47860, 47861, 47862, 47863, 47864, 47865, 47866, 47868, 47869, 47870, 47871, 47872, 47874, 47875, 47876, 47878, 47879, 47880, 47882, 47884, 47885, 47901, 47902, 47903, 47904, 47905, 47906, 47907, 47909, 47917, 47920, 47921, 47922, 47924, 47928, 47930, 47941, 47942, 47944, 47948, 47951, 47962, 47963, 47964, 47966, 47970, 47971, 47974, 47981, 47983, 47984, 47986, 47992, 47996, 37023, 37028, 37029, 37030, 37036, 37050, 37051, 37055, 37056, 37057, 37058, 37074, 37079, 37083, 37096, 37097, 37145, 37150, 37151, 37165, 37181, 37187, 37301, 37305, 37307, 37310, 37311, 37312, 37313, 37316, 37317, 37320, 37322, 37323, 37325, 37326, 37327, 37333, 37336, 37339, 37340, 37347, 37353, 37356, 37361, 37362, 37364, 37365, 37366, 37367, 37369, 37374, 37380, 37387, 37391, 37396, 37397, 37601, 37602, 37604, 37605, 37614, 37615, 37617, 37618, 37620, 37621, 37625, 37640, 37642, 37643, 37644, 37645, 37650, 37656, 37657, 37658, 37659, 37660, 37662, 37663, 37664, 37665, 37669, 37680, 37681, 37682, 37683, 37684, 37686, 37687, 37688, 37690, 37691, 37692, 37694, 37699, 37705, 37707, 37708, 37709, 37710, 37711, 37713, 37714, 37715, 37716, 37717, 37719, 37722, 37724, 37725, 37726, 37727, 37729, 37730, 37731, 37732, 37733, 37752, 37753, 37754, 37755, 37756, 37757, 37760, 37762, 37765, 37766, 37769, 37770, 37773, 37778, 37779, 37807, 37811, 37813, 37814, 37815, 37816, 37819, 37820, 37821, 37822, 37824, 37825, 37828, 37829, 37830, 37831, 37841, 37843, 37845, 37847, 37848, 37851, 37852, 37857, 37860, 37861, 37866, 37867, 37869, 37870, 37871, 37872, 37873, 37877, 37879, 37880, 37881, 37887, 37888, 37890, 37891, 37892, 38001, 38006, 38008, 38012, 38021, 38034, 38037, 38039, 38040, 38041, 38042, 38044, 38050, 38052, 38061, 38063, 38067, 38069, 38075, 38077, 38079, 38080, 38225, 38226, 38229, 38230, 38233, 38237, 38238, 38241, 38255, 38301, 38302, 38303, 38305, 38308, 38313, 38314, 38316, 38326, 38327, 38330, 38331, 38332, 38336, 38337, 38338, 38340, 38343, 38346, 38347, 38352, 38355, 38356, 38358, 38361, 38362, 38365, 38366, 38369, 38370, 38372, 38376, 38377, 38378, 38381, 38382, 38389, 38391, 38392, 38475, 38504, 38545, 38547, 38549, 38551, 38552, 38553, 38556, 38559, 38560, 38562, 38563, 38564, 38565, 38567, 38569, 38575, 38577, 38579, 38583, 38585, 38587, 38588, 85324, 85325, 85328, 85332, 85333, 85334, 85336, 85344, 85346, 85347, 85348, 85349, 85350, 85352, 85356, 85357, 85359, 85360, 85362, 85364, 85365, 85366, 85367, 85369, 85371, 85602, 85603, 85605, 85606, 85607, 85608, 85609, 85610, 85611, 85613, 85615, 85616, 85617, 85620, 85621, 85624, 85625, 85626, 85627, 85628, 85630, 85632, 85635, 85636, 85637, 85638, 85640, 85643, 85644, 85646, 85648, 85650, 85655, 85662, 85670, 85671, 85901, 85902, 85911, 85912, 85920, 85923, 85924, 85925, 85926, 85927, 85928, 85929, 85930, 85931, 85932, 85933, 85934, 85935, 85936, 85937, 85938, 85939, 85940, 85941, 85942, 86001, 86002, 86003, 86004, 86005, 86011, 86015, 86016, 86017, 86018, 86020, 86021, 86022, 86023, 86024, 86025, 86028, 86029, 86030, 86031, 86032, 86033, 86034, 86035, 86036, 86038, 86039, 86040, 86042, 86043, 86045, 86046, 86047, 86052, 86053, 86054, 86301, 86302, 86303, 86304, 86305, 86312, 86313, 86314, 86315, 86320, 86321, 86322, 86323, 86324, 86325, 86326, 86327, 86329, 86330, 86331, 86332, 86333, 86334, 86335, 86336, 86337, 86338, 86339, 86340, 86341, 86342, 86343, 86351, 86401, 86402, 86403, 86404, 86405, 86406, 86409, 86411, 86412, 86413, 86426, 86427, 86429, 86430, 86431, 86432, 86433, 86434, 86435, 86436, 86437, 86438, 86439, 86440, 86441, 86442, 86443, 86444, 86445, 86446, 86502, 86503, 86504, 86505, 86506, 86507, 86508, 86510, 86511, 86512, 86514, 86520, 86535, 86538, 86540, 86544, 86545, 86547, 86555, 86556, 98068, 98901, 98902, 98903, 98904, 98907, 98908, 98909, 98920, 98921, 98922, 98923, 98925, 98926, 98929, 98930, 98932, 98933, 98934, 98935, 98936, 98937, 98938, 98939, 98940, 98941, 98942, 98943, 98944, 98946, 98947, 98948, 98950, 98951, 98952, 98953, 99013, 99017, 99026, 99033, 99034, 99040, 99101, 99102, 99104, 99105, 99107, 99109, 99110, 99111, 99113, 99114, 99118, 99121, 99125, 99126, 99128, 99129, 99130, 99131, 99136, 99137, 99138, 99140, 99141, 99143, 99146, 99148, 99149, 99150, 99151, 99157, 99158, 99160, 99161, 99163, 99164, 99165, 99166, 99167, 99169, 99170, 99171, 99173, 99174, 99176, 99179, 99181, 99333, 99341, 99344, 99371, 20106, 20108, 20110, 20113, 20130, 20135, 22401, 22402, 22403, 22404, 22412, 22601, 22604, 22610, 22611, 22620, 22623, 22627, 22630, 22640, 22642, 22646, 22701, 22709, 22711, 22713, 22714, 22715, 22716, 22718, 22719, 22721, 22722, 22723, 22724, 22725, 22726, 22727, 22729, 22730, 22731, 22732, 22733, 22735, 22736, 22737, 22738, 22740, 22741, 22743, 22746, 22747, 22748, 22749, 22801, 22802, 22803, 22807, 22948, 22980, 22989, 23173, 23186, 23187, 23218, 23219, 23220, 23221, 23222, 23224, 23225, 23226, 23232, 23240, 23241, 23249, 23260, 23261, 23269, 23274, 23276, 23278, 23279, 23282, 23284, 23285, 23286, 23289, 23290, 23291, 23292, 23293, 23295, 23297, 23298, 23501, 23502, 23503, 23504, 23505, 23506, 23507, 23508, 23509, 23510, 23511, 23512, 23513, 23514, 23515, 23517, 23518, 23519, 23520, 23523, 23529, 23541, 23551, 23701, 23702, 23703, 23704, 23705, 23707, 23708, 23709, 23803, 23804, 23805, 23851, 23860, 23870, 23882, 23884, 23888, 23890, 23891, 23897, 23901, 23909, 23942, 23943, 23954, 23960, 23966, 24001, 24002, 24003, 24004, 24005, 24006, 24007, 24008, 24009, 24010, 24011, 24012, 24013, 24014, 24015, 24016, 24017, 24022, 24023, 24024, 24025, 24026, 24027, 24028, 24029, 24030, 24031, 24032, 24033, 24034, 24035, 24036, 24037, 24038, 24040, 24042, 24043, 24044, 24045, 24048, 24050, 24058, 24060, 24061, 24062, 24063, 24068, 24073, 24084, 24086, 24087, 24093, 24111, 24113, 24114, 24115, 24124, 24126, 24128, 24129, 24132, 24134, 24136, 24138, 24141, 24142, 24143, 24147, 24149, 24150, 24155, 24157, 24162, 24167, 24201, 24202, 24203, 24205, 24209, 24210, 24211, 24212, 24217, 24218, 24220, 24221, 24224, 24225, 24226, 24228, 24236, 24237, 24239, 24243, 24244, 24245, 24248, 24250, 24251, 24256, 24258, 24260, 24263, 24265, 24266, 24269, 24270, 24271, 24272, 24273, 24277, 24280, 24281, 24282, 24290, 24292, 24301, 24324, 24326, 24327, 24330, 24333, 24340, 24347, 24348, 24361, 24363, 24378, 24416, 24501, 24502, 24503, 24504, 24505, 24506, 24512, 24513, 24514, 24515, 24517, 24528, 24538, 24540, 24541, 24543, 24544, 24550, 24554, 24571, 24576, 24588, 24603, 24607, 24614, 24620, 24622, 24624, 24627, 24628, 24631, 24634, 24646, 24647, 24649, 24656, 24657, 24658, 48101, 48111, 48112, 48120, 48121, 48122, 48123, 48124, 48125, 48126, 48127, 48128, 48134, 48135, 48136, 48138, 48141, 48146, 48150, 48151, 48152, 48153, 48154, 48164, 48168, 48170, 48173, 48174, 48180, 48183, 48184, 48185, 48186, 48187, 48188, 48192, 48193, 48195, 48201, 48202, 48203, 48204, 48205, 48206, 48207, 48208, 48209, 48210, 48211, 48212, 48213, 48214, 48215, 48216, 48217, 48218, 48219, 48221, 48222, 48223, 48224, 48225, 48226, 48227, 48228, 48229, 48230, 48231, 48232, 48233, 48234, 48235, 48236, 48238, 48239, 48240, 48242, 48243, 48244, 48255, 48260, 48264, 48265, 48266, 48267, 48268, 48269, 48272, 48275, 48277, 48278, 48279, 48288, 48411, 48415, 48417, 48420, 48423, 48430, 48433, 48436, 48437, 48438, 48439, 48451, 48457, 48458, 48463, 48473, 48480, 48501, 48502, 48503, 48504, 48505, 48506, 48507, 48509, 48519, 48529, 48531, 48532, 48550, 48551, 48552, 48553, 48554, 48555, 48556, 48557, 48559, 48601, 48602, 48603, 48604, 48605, 48606, 48607, 48608, 48609, 48611, 48613, 48614, 48616, 48617, 48619, 48621, 48622, 48623, 48625, 48626, 48627, 48629, 48630, 48631, 48632, 48633, 48634, 48635, 48636, 48637, 48638, 48647, 48649, 48650, 48651, 48653, 48654, 48655, 48656, 48661, 48663, 48705, 48706, 48707, 48708, 48710, 48721, 48722, 48724, 48728, 48730, 48732, 48734, 48737, 48738, 48739, 48740, 48742, 48743, 48745, 48747, 48748, 48750, 48756, 48761, 48762, 48763, 48764, 48770, 48787, 48804, 48805, 48811, 48812, 48818, 48819, 48823, 48824, 48825, 48826, 48829, 48834, 48838, 48840, 48842, 48850, 48852, 48854, 48858, 48859, 48864, 48878, 48883, 48884, 48885, 48886, 48888, 48891, 48892, 48893, 48895, 48896, 48901, 48906, 48908, 48909, 48910, 48911, 48912, 48913, 48915, 48916, 48918, 48919, 48921, 48922, 48924, 48929, 48930, 48933, 48937, 48950, 48951, 48956, 48980, 49011, 49014, 49015, 49016, 49017, 49018, 49020, 49022, 49023, 49029, 49033, 49037, 49038, 49039, 49051, 49068, 49069, 49084, 49085, 49092, 49098, 49101, 49102, 49103, 49104, 49106, 49107, 49111, 49113, 49115, 49116, 49117, 49119, 49120, 49121, 49125, 49126, 49127, 49128, 49129, 49224, 49245, 49251, 49264, 49285, 49303, 49304, 49305, 49307, 49310, 49318, 49320, 49322, 49329, 49332, 49336, 49338, 49339, 49340, 49342, 49346, 49347, 49415, 49425, 49437, 49440, 49441, 49442, 49443, 49444, 49445, 49451, 49457, 49461, 49463, 49623, 49642, 49644, 49656, 49709, 49710, 49715, 49724, 49725, 49726, 49728, 49736, 49746, 49748, 49752, 49756, 49768, 49774, 49780, 49783, 49784, 49785, 49786, 49788, 49790, 49793, 49806, 49816, 49817, 49822, 49825, 49826, 49836, 49839, 49840, 49854, 49862, 49883, 49884, 49891, 49895, 49905, 49911, 49913, 49916, 49917, 49921, 49922, 49930, 49931, 49934, 49938, 49942, 49945, 49947, 49952, 49955, 49958, 49959, 49961, 49963, 49965, 49968, 49969, 27011, 27013, 27016, 27018, 27019, 27020, 27021, 27022, 27025, 27027, 27042, 27043, 27046, 27048, 27052, 27053, 27054, 27055, 27203, 27204, 27205, 27230, 27233, 27239, 27248, 27263, 27288, 27289, 27292, 27293, 27294, 27295, 27298, 27299, 27316, 27317, 27320, 27321, 27322, 27323, 27326, 27341, 27343, 27350, 27351, 27355, 27357, 27360, 27361, 27370, 27373, 27374, 27375, 27501, 27504, 27505, 27506, 27508, 27520, 27521, 27524, 27525, 27527, 27528, 27530, 27531, 27532, 27533, 27534, 27536, 27537, 27541, 27542, 27543, 27544, 27546, 27549, 27551, 27552, 27553, 27555, 27556, 27557, 27563, 27568, 27569, 27570, 27572, 27573, 27574, 27576, 27577, 27583, 27584, 27586, 27589, 27593, 27594, 27596, 27801, 27802, 27803, 27804, 27805, 27807, 27809, 27811, 27812, 27815, 27816, 27818, 27819, 27820, 27823, 27824, 27825, 27826, 27827, 27828, 27829, 27830, 27831, 27832, 27833, 27834, 27835, 27836, 27837, 27839, 27840, 27841, 27842, 27843, 27844, 27845, 27846, 27847, 27849, 27850, 27852, 27853, 27854, 27855, 27856, 27857, 27858, 27861, 27862, 27863, 27864, 27866, 27867, 27868, 27869, 27870, 27871, 27872, 27874, 27875, 27876, 27877, 27878, 27879, 27881, 27882, 27884, 27885, 27886, 27887, 27890, 27891, 27892, 27897, 27910, 27922, 27924, 27925, 27926, 27928, 27935, 27937, 27938, 27942, 27946, 27957, 27960, 27962, 27967, 27969, 27970, 27979, 27983, 27986, 28007, 28023, 28039, 28041, 28071, 28072, 28088, 28091, 28102, 28119, 28125, 28133, 28135, 28138, 28144, 28145, 28146, 28147, 28159, 28170, 28301, 28302, 28303, 28304, 28305, 28306, 28307, 28308, 28309, 28310, 28311, 28312, 28314, 28319, 28320, 28323, 28325, 28326, 28330, 28331, 28332, 28333, 28335, 28337, 28338, 28339, 28340, 28341, 28342, 28343, 28345, 28347, 28348, 28349, 28351, 28352, 28353, 28356, 28357, 28358, 28359, 28360, 28362, 28363, 28364, 28365, 28367, 28368, 28369, 28371, 28372, 28375, 28376, 28377, 28378, 28379, 28380, 28383, 28384, 28386, 28390, 28391, 28392, 28395, 28396, 28398, 28399, 28423, 28424, 28430, 28431, 28432, 28433, 28434, 28436, 28438, 28439, 28442, 28445, 28448, 28450, 28453, 28454, 28455, 28456, 28458, 28460, 28463, 28464, 28466, 28472, 28508, 28509, 28510, 28513, 28515, 28518, 28519, 28521, 28522, 28523, 28526, 28527, 28529, 28530, 28532, 28533, 28537, 28539, 28540, 28541, 28542, 28543, 28544, 28545, 28546, 28547, 28552, 28555, 28556, 28560, 28561, 28562, 28563, 28564, 28571, 28572, 28573, 28574, 28578, 28582, 28583, 28585, 28586, 28587, 28590, 28601, 28602, 28603, 28604, 28605, 28607, 28608, 28609, 28610, 28611, 28612, 28613, 28616, 28618, 28619, 28622, 28623, 28627, 28628, 28630, 28633, 28636, 28637, 28638, 28641, 28642, 28644, 28645, 28646, 28647, 28650, 28652, 28653, 28655, 28657, 28658, 28661, 28662, 28663, 28664, 28666, 28667, 28668, 28671, 28673, 28675, 28678, 28679, 28680, 28681, 28682, 28690, 28691, 28692, 28698, 28699, 28702, 28707, 28717, 28719, 28723, 28725, 28733, 28736, 28743, 28753, 28754, 28771, 28779, 28783, 28788, 28789, 28902, 28904, 28909, 30014, 30015, 30016, 30054, 30055, 30056, 30070, 30105, 30108, 30109, 30110, 30112, 30113, 30116, 30117, 30118, 30119, 30124, 30129, 30140, 30147, 30149, 30150, 30161, 30162, 30163, 30164, 30165, 30170, 30172, 30173, 30176, 30179, 30180, 30182, 30185, 30204, 30212, 30216, 30217, 30218, 30219, 30222, 30223, 30224, 30233, 30234, 30236, 30237, 30238, 30250, 30251, 30257, 30260, 30266, 30273, 30274, 30284, 30287, 30288, 30293, 30296, 30297, 30298, 30320, 30401, 30413, 30415, 30425, 30426, 30434, 30439, 30441, 30442, 30447, 30448, 30450, 30451, 30452, 30454, 30456, 30458, 30459, 30460, 30461, 30464, 30471, 30477, 30546, 30582, 30601, 30602, 30603, 30604, 30605, 30606, 30607, 30608, 30609, 30612, 30619, 30624, 30627, 30628, 30629, 30630, 30631, 30633, 30634, 30635, 30646, 30647, 30648, 30664, 30667, 30671, 30683, 30705, 30707, 30708, 30711, 30724, 30725, 30728, 30730, 30731, 30738, 30739, 30741, 30747, 30750, 30751, 30752, 30753, 30757, 30803, 30805, 30806, 30807, 30808, 30811, 30812, 30815, 30816, 30817, 30818, 30819, 30821, 30822, 30823, 30824, 30828, 30830, 30833, 30901, 30904, 30905, 30906, 30909, 30911, 30912, 30913, 30914, 30916, 30917, 30919, 30999, 31002, 31006, 31007, 31008, 31009, 31010, 31011, 31012, 31015, 31017, 31019, 31020, 31021, 31022, 31023, 31027, 31030, 31032, 31033, 31037, 31038, 31039, 31040, 31041, 31044, 31045, 31049, 31050, 31051, 31052, 31055, 31057, 31058, 31060, 31063, 31064, 31065, 31066, 31068, 31070, 31075, 31076, 31077, 31078, 31081, 31083, 31085, 31087, 31091, 31092, 31096, 31201, 31202, 31203, 31204, 31205, 31206, 31207, 31208, 31209, 31210, 31211, 31212, 31213, 31216, 31217, 31220, 31221, 31294, 31295, 31296, 31297, 31301, 31304, 31305, 31309, 31310, 31313, 31314, 31315, 31316, 31319, 31320, 31323, 31327, 31331, 31333, 31501, 31502, 31503, 31510, 31512, 31519, 31532, 31533, 31534, 31535, 31537, 31539, 31542, 31543, 31544, 31549, 31550, 31552, 31553, 31554, 31562, 31564, 31566, 31567, 31601, 31602, 31603, 31604, 31605, 31606, 31620, 31623, 31624, 31625, 31627, 31629, 31630, 31631, 31632, 31634, 31635, 31636, 31637, 31638, 31641, 31642, 31643, 31647, 31648, 31649, 31650, 31698, 31699, 31701, 31702, 31703, 31704, 31705, 31706, 31707, 31708, 31712, 31714, 31716, 31721, 31722, 31730, 31739, 31744, 31747, 31750, 31753, 31756, 31760, 31768, 31769, 31771, 15401, 15410, 15413, 15415, 15416, 15417, 15420, 15421, 15422, 15425, 15428, 15430, 15431, 15433, 15435, 15436, 15437, 15438, 15440, 15442, 15443, 15444, 15445, 15446, 15447, 15449, 15450, 15451, 15454, 15455, 15456, 15458, 15459, 15460, 15461, 15462, 15463, 15464, 15465, 15466, 15467, 15468, 15469, 15470, 15472, 15473, 15474, 15475, 15476, 15478, 15480, 15482, 15484, 15486, 15488, 15489, 15490, 15492, 15622, 15631, 15673, 15681, 15682, 15686, 15701, 15705, 15710, 15712, 15713, 15714, 15716, 15717, 15720, 15722, 15723, 15724, 15725, 15727, 15728, 15729, 15731, 15732, 15734, 15736, 15737, 15738, 15739, 15741, 15742, 15745, 15746, 15747, 15748, 15750, 15752, 15754, 15756, 15758, 15759, 15760, 15761, 15762, 15763, 15765, 15771, 15772, 15773, 15774, 15775, 15777, 15783, 15901, 15902, 15904, 15905, 15906, 15907, 15909, 15915, 15920, 15921, 15922, 15925, 15927, 15929, 15930, 15931, 15934, 15938, 15940, 15942, 15943, 15945, 15946, 15948, 15949, 15951, 15952, 15954, 15955, 15956, 15957, 15958, 15960, 15961, 15962, 16201, 16210, 16211, 16212, 16215, 16217, 16218, 16222, 16223, 16226, 16228, 16229, 16236, 16238, 16239, 16244, 16245, 16246, 16249, 16250, 16253, 16256, 16259, 16261, 16262, 16263, 16321, 16322, 16353, 16370, 16601, 16602, 16603, 16613, 16617, 16619, 16624, 16625, 16629, 16630, 16631, 16635, 16636, 16637, 16639, 16640, 16641, 16644, 16646, 16648, 16662, 16665, 16668, 16673, 16675, 16677, 16682, 16684, 16686, 16693, 16699, 16801, 16802, 16803, 16804, 16805, 16820, 16823, 16826, 16827, 16828, 16829, 16832, 16835, 16841, 16844, 16851, 16852, 16853, 16854, 16856, 16859, 16864, 16865, 16866, 16868, 16870, 16872, 16874, 16875, 16882, 18324, 18328, 18336, 18337, 18340, 18371, 18373, 18425, 18426, 18428, 18435, 18451, 18457, 18458, 18464, 19019, 19092, 19093, 19099, 19101, 19102, 19103, 19104, 19105, 19106, 19107, 19108, 19109, 19110, 19111, 19112, 19114, 19115, 19116, 19118, 19119, 19120, 19121, 19122, 19123, 19124, 19125, 19126, 19127, 19128, 19129, 19130, 19131, 19132, 19133, 19134, 19135, 19136, 19137, 19138, 19139, 19140, 19141, 19142, 19143, 19144, 19145, 19146, 19147, 19148, 19149, 19150, 19151, 19152, 19153, 19154, 19155, 19160, 19161, 19162, 19170, 19171, 19172, 19173, 19175, 19176, 19177, 19178, 19179, 19181, 19182, 19183, 19184, 19185, 19187, 19188, 19190, 19191, 19192, 19193, 19194, 19195, 19196, 19197, 19244, 19255, 43010, 43076, 43711, 43713, 43717, 43718, 43719, 43724, 43728, 43730, 43731, 43739, 43748, 43756, 43758, 43759, 43760, 43761, 43764, 43766, 43779, 43782, 43783, 43787, 43788, 43901, 43902, 43903, 43905, 43906, 43908, 43909, 43910, 43912, 43913, 43916, 43917, 43925, 43926, 43927, 43928, 43930, 43932, 43933, 43934, 43935, 43937, 43938, 43939, 43940, 43941, 43942, 43943, 43944, 43947, 43948, 43950, 43951, 43952, 43953, 43961, 43963, 43964, 43967, 43970, 43971, 43972, 43977, 43983, 43985, 44201, 44202, 44211, 44231, 44234, 44240, 44241, 44242, 44243, 44255, 44260, 44265, 44266, 44272, 44285, 44288, 44401, 44402, 44403, 44404, 44405, 44406, 44410, 44411, 44412, 44416, 44417, 44418, 44420, 44422, 44424, 44425, 44428, 44429, 44430, 44436, 44437, 44438, 44439, 44440, 44442, 44443, 44444, 44446, 44449, 44450, 44451, 44452, 44453, 44454, 44470, 44471, 44473, 44481, 44482, 44483, 44484, 44485, 44486, 44488, 44491, 44501, 44502, 44503, 44504, 44505, 44506, 44507, 44509, 44510, 44511, 44512, 44513, 44514, 44515, 44555, 44609, 44672, 44813, 44822, 44843, 44862, 44875, 44878, 44901, 44902, 44903, 44904, 44905, 44906, 44907, 44999, 45101, 45105, 45115, 45118, 45119, 45121, 45130, 45131, 45144, 45154, 45167, 45168, 45171, 45319, 45323, 45341, 45344, 45349, 45368, 45369, 45372, 45501, 45502, 45503, 45504, 45505, 45506, 45616, 45618, 45619, 45622, 45634, 45638, 45645, 45650, 45651, 45654, 45659, 45660, 45669, 45675, 45678, 45679, 45680, 45688, 45693, 45695, 45696, 45697, 45698, 45701, 45710, 45711, 45716, 45717, 45719, 45723, 45727, 45732, 45735, 45739, 45740, 45761, 45764, 45766, 45777, 45778, 45780, 45782, 45801, 45802, 45804, 45805, 45806, 45807, 45808, 45809, 45817, 45820, 45833, 45850, 45854, 45887, 60111, 60112, 60115, 60129, 60135, 60145, 60146, 60150, 60178, 60520, 60548, 60550, 60556, 60932, 60942, 60949, 60960, 60963, 61411, 61415, 61416, 61420, 61422, 61427, 61431, 61432, 61433, 61438, 61440, 61441, 61455, 61459, 61470, 61475, 61477, 61482, 61484, 61501, 61519, 61520, 61524, 61531, 61542, 61543, 61544, 61553, 61563, 61801, 61802, 61803, 61810, 61811, 61812, 61814, 61815, 61816, 61817, 61820, 61821, 61822, 61824, 61825, 61826, 61831, 61832, 61833, 61834, 61840, 61841, 61843, 61844, 61845, 61846, 61847, 61848, 61849, 61850, 61851, 61852, 61853, 61857, 61858, 61859, 61862, 61863, 61864, 61865, 61866, 61870, 61871, 61872, 61873, 61874, 61875, 61876, 61877, 61878, 61880, 61883, 61912, 61920, 61931, 61938, 61943, 62086, 62246, 62253, 62262, 62273, 62275, 62284, 62326, 62374, 62435, 62440, 62805, 62812, 62819, 62822, 62825, 62836, 62840, 62856, 62860, 62865, 62874, 62884, 62890, 62891, 62896, 62897, 62901, 62902, 62903, 62907, 62909, 62912, 62914, 62916, 62919, 62923, 62924, 62927, 62931, 62932, 62939, 62940, 62941, 62942, 62943, 62947, 62950, 62955, 62956, 62957, 62958, 62962, 62963, 62964, 62966, 62967, 62969, 62970, 62971, 62972, 62973, 62975, 62976, 62982, 62983, 62985, 62988, 62990, 62992, 62993, 62994, 62995, 62996, 62999, 13470, 10451, 10452, 10453, 10454, 10455, 10456, 10457, 10458, 10459, 10460, 10461, 10462, 10463, 10464, 10465, 10466, 10467, 10468, 10469, 10470, 10471, 10472, 10473, 10474, 10475, 10499, 11201, 11202, 11203, 11204, 11205, 11206, 11207, 11208, 11209, 11210, 11211, 11212, 11213, 11214, 11215, 11216, 11217, 11218, 11219, 11220, 11221, 11222, 11223, 11224, 11225, 11226, 11228, 11229, 11230, 11231, 11232, 11233, 11234, 11235, 11236, 11237, 11238, 11239, 11240, 11241, 11242, 11243, 11244, 11245, 11247, 11248, 11249, 11251, 11252, 11254, 11255, 11256, 11425, 12031, 12035, 12036, 12043, 12066, 12071, 12073, 12076, 12092, 12093, 12122, 12131, 12149, 12157, 12160, 12175, 12187, 12194, 13053, 13062, 13068, 13073, 13102, 13459, 13601, 13602, 13603, 13605, 13606, 13607, 13608, 13611, 13612, 13615, 13616, 13618, 13619, 13622, 13624, 13628, 13632, 13634, 13636, 13637, 13638, 13640, 13641, 13643, 13650, 13651, 13656, 13657, 13659, 13661, 13665, 13671, 13673, 13674, 13675, 13679, 13682, 13685, 13691, 13692, 13693, 14098, 14103, 14411, 14415, 14418, 14429, 14441, 14452, 14470, 14476, 14477, 14478, 14479, 14507, 14508, 14527, 14544, 14571, 14817, 14837, 14842, 14850, 14851, 14852, 14853, 14854, 14857, 14867, 14881, 14882, 14886, 32601, 32602, 32603, 32604, 32605, 32606, 32607, 32608, 32609, 32610, 32611, 32612, 32613, 32614, 32615, 32616, 32617, 32618, 32619, 32621, 32625, 32626, 32627, 32628, 32631, 32633, 32634, 32635, 32639, 32640, 32641, 32643, 32644, 32648, 32653, 32654, 32655, 32658, 32662, 32663, 32664, 32666, 32667, 32668, 32669, 32680, 32681, 32683, 32686, 32692, 32693, 32694, 32696, 32706, 32713, 32720, 32721, 32722, 32723, 32724, 32725, 32728, 32738, 32739, 32744, 32753, 32759, 32763, 32764, 32774, 32948, 32957, 32958, 32960, 32961, 32962, 32963, 32964, 32965, 32966, 32967, 32968, 32969, 32970, 32971, 32978, 33002, 33010, 33011, 33012, 33013, 33014, 33015, 33016, 33017, 33018, 33030, 33031, 33032, 33033, 33034, 33035, 33039, 33054, 33055, 33056, 33090, 33092, 33101, 33102, 33107, 33109, 33110, 33111, 33112, 33114, 33116, 33119, 33121, 33122, 33124, 33125, 33126, 33127, 33128, 33129, 33130, 33131, 33132, 33133, 33134, 33135, 33136, 33137, 33138, 33139, 33140, 33141, 33142, 33143, 33144, 33145, 33146, 33147, 33148, 33149, 33150, 33151, 33152, 33153, 33154, 33155, 33156, 33157, 33158, 33159, 33160, 33161, 33162, 33163, 33164, 33165, 33166, 33167, 33168, 33169, 33170, 33172, 33173, 33174, 33175, 33176, 33177, 33178, 33179, 33180, 33181, 33182, 33183, 33184, 33185, 33186, 33187, 33188, 33189, 33190, 33193, 33194, 33195, 33196, 33197, 33199, 33222, 33231, 33233, 33234, 33238, 33239, 33242, 33243, 33245, 33247, 33255, 33256, 33257, 33261, 33265, 33266, 33269, 33280, 33283, 33296, 33299, 33440, 33471, 33513, 33514, 33521, 33538, 33585, 33597, 33801, 33802, 33803, 33804, 33805, 33806, 33807, 33809, 33810, 33811, 33812, 33813, 33815, 33820, 33823, 33825, 33826, 33827, 33830, 33831, 33834, 33835, 33836, 33837, 33838, 33839, 33840, 33841, 33843, 33844, 33845, 33846, 33847, 33848, 33849, 33850, 33851, 33852, 33853, 33854, 33855, 33856, 33857, 33858, 33859, 33860, 33862, 33863, 33865, 33867, 33868, 33870, 33871, 33872, 33873, 33875, 33876, 33877, 33880, 33881, 33882, 33883, 33884, 33885, 33888, 33890, 33896, 33897, 33898, 33927, 33930, 33935, 33938, 33944, 33946, 33947, 33948, 33949, 33950, 33951, 33952, 33953, 33954, 33955, 33960, 33975, 33980, 33981, 33982, 33983, 34224, 34265, 34266, 34267, 34268, 34269, 34420, 34421, 34423, 34428, 34429, 34430, 34431, 34432, 34433, 34434, 34436, 34442, 34445, 34446, 34447, 34448, 34449, 34450, 34451, 34452, 34453, 34460, 34461, 34464, 34465, 34470, 34471, 34472, 34473, 34474, 34475, 34476, 34477, 34478, 34479, 34480, 34481, 34482, 34483, 34484, 34487, 34488, 34489, 34491, 34492, 34498, 34601, 34602, 34603, 34604, 34605, 34606, 34607, 34608, 34609, 34611, 34613, 34614, 34636, 34661, 34739, 34741, 34742, 34743, 34744, 34745, 34746, 34747, 34758, 34759, 34769, 34770, 34771, 34772, 34773, 34785, 34945, 34946, 34947, 34948, 34949, 34950, 34951, 34952, 34953, 34954, 34972, 34973, 34974, 34979, 34981, 34982, 34983, 34984, 34985, 34986, 34987, 34988, 05820, 05822, 05823, 05824, 05825, 05826, 05827, 05829, 05830, 05833, 05837, 05839, 05840, 05841, 05842, 05845, 05846, 05847, 05853, 05855, 05857, 05858, 05859, 05860, 05868, 05872, 05874, 05875, 05901, 05902, 05903, 05904, 05905, 05906, 05907, 01001, 01002, 01003, 01004, 01007, 01008, 01009, 01010, 01011, 01012, 01013, 01014, 01020, 01021, 01022, 01026, 01027, 01028, 01029, 01030, 01032, 01033, 01034, 01035, 01036, 01038, 01039, 01040, 01041, 01050, 01053, 01054, 01056, 01057, 01059, 01060, 01061, 01062, 01063, 01066, 01069, 01070, 01071, 01072, 01073, 01075, 01077, 01079, 01080, 01081, 01082, 01084, 01085, 01086, 01088, 01089, 01090, 01093, 01095, 01096, 01097, 01098, 01101, 01102, 01103, 01104, 01105, 01106, 01107, 01108, 01109, 01111, 01115, 01116, 01118, 01119, 01128, 01129, 01133, 01138, 01139, 01144, 01151, 01152, 01195, 01199, 01201, 01202, 01203, 01220, 01222, 01223, 01224, 01225, 01226, 01227, 01229, 01230, 01235, 01236, 01237, 01238, 01240, 01242, 01243, 01244, 01245, 01247, 01252, 01253, 01254, 01255, 01256, 01257, 01258, 01259, 01260, 01262, 01263, 01264, 01266, 01267, 01270, 01301, 01302, 01330, 01337, 01338, 01339, 01340, 01341, 01342, 01343, 01344, 01346, 01347, 01349, 01350, 01351, 01354, 01355, 01360, 01364, 01367, 01370, 01373, 01375, 01376, 01378, 01379, 01380, 01521, 02108, 02109, 02110, 02111, 02112, 02113, 02114, 02115, 02116, 02117, 02118, 02119, 02120, 02121, 02122, 02123, 02124, 02125, 02126, 02127, 02128, 02129, 02130, 02131, 02132, 02133, 02134, 02135, 02136, 02137, 02150, 02151, 02152, 02163, 02196, 02199, 02201, 02203, 02204, 02205, 02206, 02207, 02210, 02211, 02212, 02215, 02216, 02217, 02222, 02228, 02241, 02266, 02283, 02284, 02293, 02295, 02297, 02298, 03570, 03575, 03576, 03579, 03581, 03582, 03583, 03584, 03588, 03589, 03590, 03592, 03593, 03595, 03597, 03598, 03815, 03820, 03821, 03822, 03823, 03824, 03825, 03835, 03839, 03851, 03852, 03855, 03861, 03866, 03867, 03868, 03869, 03878, 03884, 03887, 07002, 07029, 07030, 07032, 07047, 07086, 07087, 07093, 07094, 07096, 07097, 07099, 07302, 07303, 07304, 07305, 07306, 07307, 07308, 07309, 07310, 07311, 07395, 07399, 08302, 08311, 08313, 08314, 08315, 08316, 08320, 08321, 08323, 08324, 08327, 08329, 08332, 08345, 08348, 08349, 08352, 08353, 08360, 08361, 08362, 01001, 01002, 01003, 01004, 01007, 01008, 01009, 01010, 01011, 01012, 01013, 01014, 01020, 01021, 01022, 01026, 01027, 01028, 01029, 01030, 01032, 01033, 01034, 01035, 01036, 01038, 01039, 01040, 01041, 01050, 01053, 01054, 01056, 01057, 01059, 01060, 01061, 01062, 01063, 01066, 01069, 01070, 01071, 01072, 01073, 01075, 01077, 01079, 01080, 01081, 01082, 01084, 01085, 01086, 01088, 01089, 01090, 01093, 01095, 01096, 01097, 01098, 01101, 01102, 01103, 01104, 01105, 01106, 01107, 01108, 01109, 01111, 01115, 01116, 01118, 01119, 01128, 01129, 01133, 01138, 01139, 01144, 01151, 01152, 01195, 01199, 01201, 01202, 01203, 01220, 01222, 01223, 01224, 01225, 01226, 01227, 01229, 01230, 01235, 01236, 01237, 01238, 01240, 01242, 01243, 01244, 01245, 01247, 01252, 01253, 01254, 01255, 01256, 01257, 01258, 01259, 01260, 01262, 01263, 01264, 01266, 01267, 01270, 01301, 01302, 01330, 01337, 01338, 01339, 01340, 01341, 01342, 01343, 01344, 01346, 01347, 01349, 01350, 01351, 01354, 01355, 01360, 01364, 01367, 01370, 01373, 01375, 01376, 01378, 01379, 01380, 01521, 02108, 02109, 02110, 02111, 02112, 02113, 02114, 02115, 02116, 02117, 02118, 02119, 02120, 02121, 02122, 02123, 02124, 02125, 02126, 02127, 02128, 02129, 02130, 02131, 02132, 02133, 02134, 02135, 02136, 02137, 02150, 02151, 02152, 02163, 02196, 02199, 02201, 02203, 02204, 02205, 02206, 02207, 02210, 02211, 02212, 02215, 02216, 02217, 02222, 02228, 02241, 02266, 02283, 02284, 02293, 02295, 02297, 02298)
        then la.amount end) as Utah_first_PL,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (22201, 22202, 22203, 22204, 22205, 22206, 22207, 22209, 22211, 22213, 22046, 22042, 22044, 22040, 22301, 22302, 22304, 22305, 22311, 22314, 20120, 20121, 20122, 20124, 20151, 20153, 20170, 20171, 20172, 20190, 20191, 20192, 20194, 20195, 20196, 22003, 22009, 22015, 22027, 22031, 22032, 22033, 22034, 22035, 22036, 22037, 22039, 22041, 22042, 22043, 22044, 22060, 22066, 22067, 22079, 22081, 22082, 22095, 22096, 22101, 22012, 22103, 22106, 22107, 22108, 22109, 22116, 22118, 22119, 22121, 22122, 22124, 22150, 22151, 22152, 22153, 22156, 22158, 22159, 22160, 22161, 22180, 22181, 22182, 22183, 22185, 22199, 22303, 22306, 22307, 22308, 22309, 22310, 22312, 22315)
        then la.amount end) as Arlington_CU,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 30000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'
        then la.amount end) as Nasa_federal,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .1799
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 70449, 70462, 70706, 70711, 70726, 70727, 70733, 70744, 70754, 70785, 70786, 70710, 70719, 70729, 70767, 70704, 70714, 70739, 70770, 70791, 70801, 70802, 70803, 70804, 70805, 70806, 70807, 70808, 70809, 70810, 70811, 70812, 70813, 70814, 70815, 70816, 70817, 70818, 70819, 70820, 70821, 70822, 70823, 70825, 70826, 70827, 70831, 70833, 70835, 70836, 70837, 70873, 70874, 70879, 70879, 70884, 70891, 70892, 70893, 70894, 70895, 70896, 70898, 70722, 70730, 70748, 70761, 70777, 70789, 70721, 70740, 70757, 70764, 70765, 70772, 70776, 70780, 70788, 70715, 70732, 70736, 70747, 70749, 70752, 70753, 70755, 70756, 70759, 70760, 70762, 70773, 70783, 70712, 70775, 70782, 70784, 70787, 70441, 70453, 70346, 70707, 70718, 70725, 70728, 70734, 70737, 70738, 70769, 70774, 70778)
        then la.amount end) as Essential_federal,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 35000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'
        then la.amount end) as Fedchoice,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 15000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state not in ('ALASKA','HAWAII', 'MAINE')
        then la.amount end) as Greenwood_CU,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 700
        and la.amount <= 35000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and br.state not in ('CALIFORNIA', 'MAINE')
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        then la.amount end) as CU_of_Denver,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and br.state <> 'MAINE'
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        then la.amount end) as Superior_choice,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .21
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .35  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state not in ('CALIFORNIA', 'MAINE', 'COLORADO')
       then la.amount end) as Ent,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40  
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 01092, 01518, 01506, 01082, 01366, 01083, 01585, 01031, 01531, 01037, 01094, 01074, 01005, 01550, 01566, 01515, 01507, 01571, 01570, 01537, 01542, 01540, 01501, 01535, 01562, 01068, 01543, 01524, 01612, 01611, 01603, 01602, 01522, 01520, 01541, 01331, 01368, 01468, 01438, 01452, 01440, 01436, 01475, 01473, 01430, 01516, 01527, 01590, 01569, 01529, 01588, 01525, 01560, 01519, 01534, 01568, 01610, 01608, 01607, 01604, 01609, 01606, 01605, 01655, 01545, 01583, 01564, 01505, 01536, 01532, 01581, 01503, 01510, 01561, 01740, 01504, 01756, 01747, 01757, 01746, 01748, 01772, 01745, 01721, 01702, 01701, 01752, 01749, 01775, 01754, 01770, 01760, 01776, 01778, 01742, 01773, 01453, 01420, 01462, 01431, 01474, 01523, 01464, 01467, 01451, 01434, 01432, 01469, 01463, 01719, 01720, 01460, 01886, 01450, 01827, 01718, 01741, 01824, 01863, 01879, 01851, 01854, 02462, 02468, 02464, 02461, 02459, 02493, 02466, 02451, 02453, 01731, 02421, 02465, 02460, 02452, 02458, 02472, 02478, 02420, 02476, 02136, 02132, 02131, 02130, 02126, 02120, 02121, 02119, 02124, 02122, 02125, 02135, 02134, 02163, 02138, 02140, 02144, 02474, 01890, 02153, 02155, 02115, 02215, 02139, 02199, 02116, 02142, 02143, 02141, 02145, 02118, 02217, 02111, 02114, 02108, 02133, 02203, 02222, 02210, 02110, 02109, 02113, 02129, 02148, 02149, 02176, 02127, 02150, 02128, 02152, 02151, 01905, 01901, 01908, 01730, 01862, 01821, 01803, 01852, 01850, 01826, 01876, 01801, 01887, 02180, 01880, 01867, 01864, 01810, 01843, 01841, 01840, 01845, 01844, 01832, 01835, 01830, 01906, 01940, 01937, 01904, 01902, 01960, 01923, 01949, 01921, 01833, 01983, 01907, 01970, 01945, 01915, 01984, 01982, 01969, 01938, 01834, 01860, 01985, 01922, 01913, 01951, 01950, 01952, 01944, 01929, 01930, 01966)
        then la.amount end) as Webster_first,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 70801, 70802, 70803, 70804, 70805, 70806, 70807, 70808, 70809, 70810, 70811, 70812, 70813, 70814, 70815, 70816, 70817, 70818, 70819, 70820, 70821, 70822, 
        70823, 70825, 70826, 70827, 70831, 70833, 70835, 70836, 70837, 70873, 70874, 70879, 70880, 70881, 70882, 70883, 70884, 70896, 70897, 70898, 70116, 70117, 70118, 70119, 70122, 70124, 70125, 
        70126, 70127, 70128, 70129, 70130, 70131, 70139, 70142, 70143, 70145, 70146, 70148, 70150, 70151, 70152, 70153, 70154, 70155, 70156, 70157, 70158, 70159, 70160, 70161, 70162, 70163, 70164, 
        70165, 70166, 70167, 70170, 70172, 70174, 70175, 70176, 70177, 70178, 70179, 70184, 70185, 70186, 70187, 70189, 70190, 70195, 71004, 71007, 71009, 71029, 71033, 71043, 71044, 71047, 71060, 
        71061, 71069, 71082, 71101, 71102, 71103, 71104, 71105, 71106, 71107, 71108, 71109, 71115, 71118, 71119, 71120, 71129, 71130, 71133, 71134, 71135, 71136, 71137, 71138, 71148, 71149, 71150, 
        71151, 71152, 71153, 71154, 71156, 71161, 71162, 71163, 71164, 71165, 71166, 71006, 71018, 71023, 71037, 71051, 71064, 71067, 71071, 71075, 71104, 71105, 71107, 71110, 71111, 71112, 71113, 
        71171, 71172, 71018, 71021, 71023, 71024, 71038, 71039, 71055, 71058, 71067, 71071, 71072, 71073, 71075)
        then la.amount end) as campus_federal,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and (br.state='VERMONT' or til.borrower_zip_code in (03431, 03435, 03441, 03443, 03444, 03445, 03446, 03447, 03448, 03450, 03451, 03452, 03455, 03456, 03457, 03461, 03462, 03464, 03465, 03466, 
        03467, 03469, 03470, 03602, 03604, 03608, 03609, 03570, 03575, 03576, 03579, 03581, 03582, 03582, 03583, 03584, 03588, 03589, 03590, 03592, 03593, 03595, 03597, 03598, 03215, 03217, 03222, 03223, 
        03238, 03240, 03241, 03245, 03251, 03262, 03264, 03266, 03274, 03279, 03282, 03293, 03561, 03574, 03580, 03585, 03586, 03740, 03741, 03748, 03749, 03750, 03755, 03756, 03765, 03766, 03768, 03769, 
        03771, 03774, 03777, 03779, 03780, 03784, 03785, 03280, 03284, 03601, 03603, 03605, 03607, 03743, 03745, 03746, 03751, 03752, 03753, 03754, 03770, 03773, 03781, 03782))
        then la.amount end) as one_cu,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 700
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and locc.post_loan_dti_stated <= .60
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'
        then la.amount end) as san_francisco,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 50000
        and l.apr <= .36
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and br.state not in ('CALIFORNIA','CONNECTICUT','DISTRICT_OF_COLUMBIA','FLORIDA','GEORGIA','DELAWARE','MAINE','MASSACHUSETTS','MARYLAND','NEW_HAMPSHIRE','NEW_JERSEY','NEW_YORK','NORTH_CAROLINA','OREGON','RHODE_ISLAND','SOUTH_CAROLINA','VIRGINIA','WASHINGTON')
        then la.amount end) as raymore,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and locc.post_loan_dti_stated <= .50
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'
        then la.amount end) as affinity_plus,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60,66,72,84)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in ( 78008, 78011, 78012, 78026, 78050, 78052, 78062, 78064, 78065, 78003, 78055, 78063, 78883, 78885, 78002, 78023, 78054, 78069, 78073, 78101, 78109, 78112, 78148, 78150, 78152, 78201, 78202, 78203, 78204, 78205, 78206, 78207, 78208, 78209, 78210, 78211, 78212, 78213, 78214, 78215, 78216, 78217, 78218, 78219, 78220, 78221, 78222, 78223, 78224, 78225, 78226, 78227, 78228, 78229, 78230, 78231, 78232, 78233, 78234, 78235, 78236, 78237, 78238, 78239, 78240, 78241, 78242, 78243, 78244, 78245, 78246, 78247, 78248, 78249, 78250, 78251, 78252, 78253, 78254, 78255, 78256, 78257, 78258, 78259, 78260, 78261, 78263, 78264, 78265, 78268, 78269, 78270, 78278, 78279, 78280, 78283, 78284, 78285, 78288, 78289, 78291, 78292, 78293, 78294, 78295, 78296, 78297, 78298, 78299, 78070, 78130, 78131, 78132, 78133, 78135, 78163, 78266, 78623, 78108, 78115, 78123, 78124, 78154, 78155, 78156, 78638, 78670, 78004, 78006, 78013, 78015, 78027, 78074, 78009, 78016, 78039, 78056, 78059, 78066, 78850, 78861, 78886, 78114, 78121, 78143, 78147, 78160, 78161)
        then la.amount end) as generations_community,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 640
        and la.amount <= 20000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40  
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'WASHINGTON'
        then la.amount end) as snocope,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        And locc.post_loan_dti_stated <= .50
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and secondary_details.loan_app_id is null
        and til.borrower_zip_code in (54103, 54401, 54402, 54403, 54408, 54409, 54411, 54417, 54418, 54424, 54426, 54427, 54428, 54429, 54430, 54433, 54435, 54440, 54442, 54447, 54448, 54451, 54452, 54455, 54459, 54462, 54463, 54464, 54465, 54470, 54471, 54474, 54476, 54479, 54480, 54484, 54485, 54487, 54488, 54490, 54491, 54501, 54511, 54512, 54513, 54515, 54519, 54520, 54521, 54524, 54525, 54526, 54529, 54530, 54531, 54532, 54534, 54536, 54537, 54538, 54539, 54540, 54541, 54543, 54545, 54547, 54548, 54550, 54552, 54554, 54555, 54556, 54557, 54558, 54559, 54560, 54561, 54562, 54563, 54564, 54565, 54566, 54568, 54731, 54766, 54819, 54848, 548959)
        then la.amount end) as park_city,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (35034, 35040, 35042, 35045, 35046, 35085, 35115, 35171, 36003, 36006, 36006, 36008, 36032, 36040, 36043, 36047, 36051, 36051, 36066, 36067, 36068, 36073, 36091, 36435, 36701, 36701, 36702, 36720, 36721, 36722, 36723, 36726, 36728, 36741, 36749, 36749, 36750, 36751, 36752, 36753, 36756, 36758, 36758, 36759, 36759, 36761, 36761, 36765, 36766, 36767, 36768, 36769, 36773, 36773, 36775, 36775, 36779, 36785, 36785, 36786, 36790, 36792, 36793, 36793, 70001, 70002, 70003, 70004, 70005, 70006, 70009, 70010, 70011, 70033, 70036, 70037, 70053, 70054, 70055, 70056, 70058, 70059, 70060, 70062, 70063, 70064, 70065, 70067, 70072, 70073, 70094, 70096, 70097, 70112, 70113, 70114, 70115, 70116, 70117, 70118, 70119, 70121, 70122, 70123, 70124, 70125, 70126, 70127, 70128, 70129, 70130, 70131, 70139, 70140, 70141, 70145, 70146, 70148, 70149, 70150, 70151, 70152, 70153, 70154, 70156, 70157, 70158, 70159, 70160, 70161, 70162, 70163, 70164, 70165, 70166, 70167, 70170, 70172, 70174, 70175, 70176, 70177, 70178, 70179, 70181, 70182, 70183, 70184, 70185, 70186, 70187, 70189, 70190, 70195, 70358, 70403, 70420, 70427, 70431, 70433, 70434, 70435, 70437, 70443, 70445, 70447, 70448, 70449, 70452, 70457, 70458, 70459, 70460, 70461, 70462, 70464, 70469, 70470, 70471, 70542, 70548, 70549, 70601, 70602, 70605, 70606, 70607, 70607, 70609, 70611, 70612, 70615, 70616, 70629, 70630, 70630, 70631, 70632, 70633, 70643, 70644, 70645, 70646, 70647, 70661, 70663, 70665, 70665, 70668, 70668, 70669, 70706, 70711, 70726, 70727, 70733, 70744, 70754, 70774, 70785, 70786)
        then la.amount end) as jefferson,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'GEORGIA'
        and secondary_details.loan_app_id is null
        then la.amount end) as georgias_own,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 700
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (15001, 15003, 15004, 15005, 15006, 15007, 15009, 15010, 15012, 15014, 15015, 15017, 15018, 15019, 15020, 15021, 15022, 15024, 15025, 15026, 15027, 15028, 15030, 15031, 15033, 15034, 15035, 15037, 15038, 15042, 15043, 15044, 15045, 15046, 15047, 15049, 15050, 15051, 15052, 15053, 15054, 15055, 15056, 15057, 15059, 15060, 15061, 15062, 15063, 15064, 15065, 15066, 15067, 15068, 15071, 15072, 15074, 15075, 15076, 15077, 15078, 15081, 15082, 15083, 15084, 15085, 15086, 15087, 15088, 15089, 15090, 15101, 15102, 15104, 15106, 15108, 15110, 15112, 15116, 15120, 15122, 15123, 15126, 15129, 15131, 15132, 15133, 15135, 15136, 15137, 15139, 15140, 15142, 15143, 15144, 15145, 15146, 15147, 15148, 15201, 15202, 15203, 15204, 15205, 15206, 15207, 15208, 15209, 15210, 15211, 15212, 15213, 15214, 15215, 15216, 15217, 15218, 15219, 15220, 15221, 15222, 15223, 15224, 15225, 15226, 15227, 15228, 15229, 15232, 15233, 15234, 15235, 15236, 15237, 15238, 15239, 15241, 15243, 15260, 15275, 15282, 15290, 15301, 15310, 15311, 15312, 15313, 15314, 15315, 15316, 15317, 15320, 15321, 15322, 15323, 15324, 15325, 15327, 15329, 15330, 15331, 15332, 15333, 15334, 15337, 15338, 15340, 15341, 15342, 15344, 15345, 15346, 15347, 15348, 15349, 15350, 15351, 15352, 15353, 15357, 15358, 15359, 15360, 15361, 15362, 15363, 15364, 15365, 15366, 15367, 15368, 15370, 15376, 15377, 15378, 15379, 15380, 15412, 15401, 15410, 15412, 15413, 15416, 15417, 15419, 15420, 15421, 15422, 15423, 15425, 15427, 15428, 15429, 15430, 15431, 15432, 15433, 15434, 15435, 15436, 15437, 15438, 15440, 15442, 15443, 15444, 15445, 15446, 15447, 15448, 15449, 15450, 15451, 15454, 15455, 15456, 15458, 15459, 15460, 15461, 15462, 15463, 15464, 15465, 15466, 15467, 15468, 15469, 15470, 15472, 15473, 15474, 15475, 15476, 15477, 15478, 15479, 15480, 15482, 15483, 15484, 15486, 15488, 15489, 15490, 15492, 15601, 15610, 15611, 15612, 15613, 15615, 15616, 15617, 15618, 15619, 15620, 15622, 15623, 15624, 15625, 15626, 15627, 15628, 15629, 15631, 15632, 15633, 15634, 15635, 15636, 15637, 15638, 15639, 15640, 15641, 15642, 15644, 15646, 15647, 15650, 15655, 15656, 15658, 15660, 15661, 15662, 15663, 15665, 15666, 15668, 15670, 15671, 15672, 15673, 15674, 15675, 15676, 15677, 15678, 15679, 15680, 15681, 15682, 15683, 15684, 15686, 15687, 15688, 15689, 15690, 15691, 15692, 15693, 15695, 15696, 15697, 15698, 15701, 15705, 15710, 15712, 15713, 15716, 15717, 15720, 15723, 15724, 15725, 15727, 15728, 15729, 15731, 15732, 15734, 15736, 15739, 15741, 15745, 15746, 15747, 15748, 15750, 15752, 15754, 15756, 15759, 15761, 15763, 15765, 15771, 15772, 15774, 15777, 15779, 15783, 15920, 15923, 15929, 15944, 15949, 15954, 15957, 15961, 16001, 16002, 16020, 16022, 16023, 16024, 16025, 16027, 16028, 16029, 16030, 16033, 16034, 16035, 16037, 16038, 16040, 16041, 16045, 16046, 16048, 16050, 16051, 16052, 16053, 16055, 16056, 16057, 16059, 16061, 16063, 16066, 16101, 16102, 16105, 16112, 16115, 16116, 16117, 16120, 16123, 16132, 16136, 16140, 16141, 16143, 16155, 16156, 16157, 16160, 16172, 16201, 16210, 16211, 16212, 16218, 16222, 16223, 16226, 16228, 16229, 16236, 16238, 16244, 16245, 16249, 16250, 16253, 16256, 16259, 16262, 16263)
        then la.amount end) as clearview,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'ARKANSAS'
        then la.amount end) as arkansas,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 640
        and la.amount <= 35000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'
        and secondary_details.loan_app_id is null        
        then la.amount end) as capital_educators,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score between 675 and 750
        and la.amount <= 30000
        and l.apr <= .22
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .30
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'WASHINGTON'     
        then la.amount end) as industrial,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 30000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'       
        then la.amount end) as INSIGHT,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'       
        then la.amount end) as chartway,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .30
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'HAWAII'     
        then la.amount end) as univeristy_of_hawaii,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 30000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (36507, 36511, 36526, 36527, 36530, 36532, 36533, 36535, 36536, 36542, 36547, 36549, 36550, 36551, 36555, 36559, 36561, 36562, 36564, 
        36567, 36574, 36575, 36576, 36577, 36578, 36579, 36580, 36505, 36509, 36512, 36521, 36522, 36523, 36525, 36528, 36541, 36544, 36560, 36568, 36571, 36572, 36575, 36582, 
        36587, 36590, 36601, 36602, 36603, 36604, 36605, 36606, 36607, 36608, 36609, 36610, 36611, 36612, 36613, 36615, 36616, 36617, 36618, 36619, 36633, 36640, 36641, 36652, 36660, 36663, 36670, 36671, 36685, 36689, 36691, 36693, 36695)
        then la.amount end) as navigator,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 40000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and locc.post_loan_dti_stated <= .65
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'
        then la.amount end) as teachers,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 720
        and la.amount <= 50000
        and l.apr <= .36
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'
        then la.amount end) as bellco,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (60004, 60005, 60006, 60007, 60008, 60009, 60016, 60017, 60018, 60019, 60022, 60025, 60026, 60029, 60038, 60043, 60053, 60055, 60056, 60062, 60065, 60067, 60068, 60070, 60074, 60076, 60077, 60078, 60082, 60090, 60091, 60093, 60094, 60095, 60104, 60107, 60130, 60131, 60133, 60141, 60153, 60154, 60155, 60159, 60160, 60161, 60162, 60163, 60164, 60165, 60168, 60169, 60171, 60173, 60176, 60179, 60192, 60193, 60194, 60195, 60196, 60201, 60202, 60203, 60204, 60208, 60301, 60302, 60303, 60304, 60305, 60402, 60406, 60409, 60411, 60412, 60415, 60418, 60419, 60422, 60425, 60426, 60428, 60429, 60430, 60438, 60439, 60443, 60445, 60452, 60453, 60454, 60455, 60456, 60457, 60458, 60459, 60461, 60462, 60463, 60464, 60465, 60466, 60467, 60469, 60471, 60472, 60473, 60475, 60476, 60477, 60478, 60480, 60482, 60487, 60499, 60501, 60513, 60525, 60526, 60534, 60546, 60558, 60601, 60602, 60603, 60604, 60605, 60606, 60607, 60608, 60609, 60610, 60611, 60612, 60613, 60614, 60615, 60616, 60617, 60618, 60619, 60620, 60621, 60622, 60623, 60624, 60625, 60626, 60628, 60629, 60630, 60631, 60632, 60633, 60634, 60636, 60637, 60638, 60639, 60640, 60641, 60642, 60643, 60644, 60645, 60646, 60647, 60649, 60651, 60652, 60653, 60654, 60655, 60656, 60657, 60659, 60660, 60661, 60664, 60666, 60668, 60669, 60670, 60673, 60674, 60675, 60677, 60678, 60680, 60681, 60682, 60684, 60685, 60686, 60687, 60688, 60689, 60690, 60691, 60693, 60694, 60695, 60696, 60697, 60699, 60701, 60706, 60707, 60712, 60714, 60803, 60804, 60805, 60827)
        then la.amount end) as united,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72, 84)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'VIRGINIA'
        then la.amount end) as kemba,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 25000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and secondary_details.loan_app_id is null
        and til.borrower_zip_code in (15062, 15012, 15033, 15089, 15087, 15479, 15072, 15666, 15683, 15083, 15660, 15678, 15679, 15448, 15695, 15698, 15612, 15639, 15688)
        then la.amount end) as valley_1st,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and secondary_details.loan_app_id is null
        and br.state <> 'MAINE'
        then la.amount end) as DOC,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 30000
        and l.apr <= .18
        and l.term in (24, 36, 48, 60, 66, 72)
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE'
        then la.amount end) as Garden_savings,
sum(case when 
        l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and l.term in (24,36,48,60,66,72,84)
        and l.segment in ('PRIME_PLUS','PRIME')
        and (br.state not in ('CALIFORNIA','CONNECTICUT','DISTRICT_OF_COLUMBIA','MAINE','HAWAII','MAINE','NEW_JERSEY','NORTH_CAROLINA','PENNSYLVANIA','VERMONT','WASHINGTON') or 
        til.borrower_zip_code in (15001, 15003, 15004, 15005, 15006, 15007, 15009, 15010, 15012, 15014, 15015, 15017, 15018, 15019, 15020, 15021, 15022, 15024, 15025, 15026, 15027, 15028, 15030, 15031, 
        15032, 15033, 15034, 15035, 15037, 15038, 15042, 15043, 15044, 15045, 15046, 15047, 15049, 15050, 15051, 15052, 15053, 15054, 15055, 15056, 15057, 15059, 15060, 15061, 15062, 15063, 15064, 15065, 
        15066, 15067, 15068, 15069, 15071, 15072, 15074, 15075, 15076, 15077, 15078, 15081, 15082, 15083, 15084, 15085, 15086, 15087, 15088, 15089, 15090, 15091, 15095, 15096, 15101, 15102, 15104, 15106, 
        15108, 15110, 15112, 15116, 15120, 15122, 15123, 15126, 15127, 15129, 15131, 15132, 15133, 15134, 15135, 15136, 15137, 15139, 15140, 15142, 15143, 15144, 15145, 15146, 15147, 15148, 15201, 15202, 
        15203, 15204, 15205, 15206, 15207, 15208, 15209, 15210, 15211, 15212, 15213, 15214, 15215, 15216, 15217, 15218, 15219, 15220, 15221, 15222, 15223, 15224, 15225, 15226, 15227, 15228, 15229, 15230, 
        15231, 15232, 15233, 15234, 15235, 15236, 15237, 15238, 15239, 15240, 15241, 15242, 15243, 15244, 15250, 15251, 15252, 15253, 15254, 15255, 15257, 15258, 15259, 15260, 15261, 15262, 15264, 15265, 
        15267, 15268, 15270, 15272, 15274, 15275, 15276, 15277, 15278, 15279, 15281, 15282, 15283, 15286, 15289, 15290, 15295, 15301, 15310, 15311, 15312, 15313, 15314, 15315, 15316, 15317, 15320, 15321, 
        15322, 15323, 15324, 15325, 15327, 15329, 15330, 15331, 15332, 15333, 15334, 15336, 15337, 15338, 15339, 15340, 15341, 15342, 15344, 15345, 15346, 15347, 15348, 15349, 15350, 15351, 15352, 15353, 
        15357, 15358, 15359, 15360, 15361, 15362, 15363, 15364, 15365, 15366, 15367, 15368, 15370, 15376, 15377, 15378, 15379, 15380, 15401, 15410, 15411, 15412, 15413, 15415, 15416, 15417, 15419, 15420, 
        15421, 15422, 15423, 15424, 15425, 15427, 15428, 15429, 15430, 15431, 15432, 15433, 15434, 15435, 15436, 15437, 15438, 15439, 15440, 15442, 15443, 15444, 15445, 15446, 15447, 15448, 15449, 15450, 
        15451, 15454, 15455, 15456, 15458, 15459, 15460, 15461, 15462, 15463, 15464, 15465, 15466, 15467, 15468, 15469, 15470, 15472, 15473, 15474, 15475, 15476, 15477, 15478, 15479, 15480, 15482, 15483, 
        15484, 15485, 15486, 15488, 15489, 15490, 15492, 15501, 15502, 15510, 15520, 15521, 15522, 15530, 15531, 15532, 15533, 15534, 15535, 15536, 15537, 15538, 15539, 15540, 15541, 15542, 15544, 15545, 
        15546, 15547, 15548, 15549, 15550, 15551, 15552, 15553, 15554, 15555, 15557, 15558, 15559, 15560, 15561, 15562, 15563, 15564, 15565, 15601, 15605, 15606, 15610, 15611, 15612, 15613, 15615, 15616, 
        15617, 15618, 15619, 15620, 15621, 15622, 15623, 15624, 15625, 15626, 15627, 15628, 15629, 15631, 15632, 15633, 15634, 15635, 15636, 15637, 15638, 15639, 15640, 15641, 15642, 15644, 15646, 15647, 
        15650, 15655, 15656, 15658, 15660, 15661, 15662, 15663, 15664, 15665, 15666, 15668, 15670, 15671, 15672, 15673, 15674, 15675, 15676, 15677, 15678, 15679, 15680, 15681, 15682, 15683, 15684, 15685, 
        15686, 15687, 15688, 15689, 15690, 15691, 15692, 15693, 15695, 15696, 15697, 15698, 15701, 15705, 15710, 15711, 15712, 15713, 15714, 15715, 15716, 15717, 15720, 15721, 15722, 15723, 15724, 15725, 
        15727, 15728, 15729, 15730, 15731, 15732, 15733, 15734, 15736, 15737, 15738, 15739, 15741, 15742, 15744, 15745, 15746, 15747, 15748, 15750, 15752, 15753, 15754, 15756, 15757, 15758, 15759, 15760, 
        15761, 15762, 15763, 15764, 15765, 15767, 15770, 15771, 15772, 15773, 15774, 15775, 15776, 15777, 15778, 15779, 15780, 15781, 15783, 15784, 15801, 15821, 15822, 15823, 15824, 15825, 15827, 15828, 
        15829, 15831, 15832, 15834, 15840, 15841, 15845, 15846, 15847, 15848, 15849, 15851, 15853, 15856, 15857, 15860, 15861, 15863, 15864, 15865, 15866, 15868, 15870, 15901, 15902, 15904, 15905, 15906, 15907, 15909, 15915, 15920, 15921, 15922, 15923, 15924, 15925, 15926, 15927, 15928, 15929, 15930, 15931, 15934, 15935, 15936, 15937, 15938, 15940, 15942, 15943, 15944, 15945, 15946, 15948, 15949, 15951, 15952, 15953, 15954, 15955, 15956, 15957, 15958, 15959, 15960, 15961, 15962, 15963, 16001, 16002, 16003, 16016, 16017, 16018, 16020, 16021, 16022, 16023, 16024, 16025, 16027, 16028, 16029, 16030, 16033, 16034, 16035, 16036, 16037, 16038, 16039, 16040, 16041, 16045, 16046, 16048, 16049, 16050, 16051, 16052, 16053, 16054, 16055, 16056, 16057, 16058, 16059, 16061, 16063, 16066, 16101, 16102, 16103, 16105, 16107, 16108, 16110, 16111, 16112, 16113, 16114, 16115, 16116, 16117, 16120, 16121, 16123, 16124, 16125, 16127, 16130, 16131, 16132, 16133, 16134, 16136, 16137, 16140, 16141, 16142, 16143, 16145, 16146, 16148, 16150, 16151, 16153, 16154, 16155, 16156, 16157, 16159, 16160, 16161, 16172, 16201, 16210, 16211, 16212, 16213, 16214, 16217, 16218, 16220, 16221, 16222, 16223, 16224, 16225, 16226, 16228, 16229, 16230, 16232, 16233, 16234, 16235, 16236, 16238, 16239, 16240, 16242, 16244, 16245, 16246, 16248, 16249, 16250, 16253, 16254, 16255, 16256, 16257, 16258, 16259, 16260, 16261, 16262, 16263, 16301, 16311, 16312, 16313, 16314, 16316, 16317, 16319, 16321, 16322, 16323, 16326, 16327, 16328, 16329, 16331, 16332, 16333, 16334, 16335, 16340, 16341, 16342, 16343, 16344, 16345, 16346, 16347, 16350, 16351, 16352, 16353, 16354, 16360, 16361, 16362, 16364, 16365, 16366, 16367, 16368, 16369, 16370, 16371, 16372, 16373, 16374, 16375, 16388, 16401, 16402, 16403, 16404, 16405, 16406, 16407, 16410, 16411, 16412, 16413, 16415, 16416, 16417, 16420, 16421, 16422, 16423, 16424, 16426, 16427, 16428, 16430, 16432, 16433, 16434, 16435, 16436, 16438, 16440, 16441, 16442, 16443, 16444, 16475, 16501, 16502, 16503, 16504, 16505, 16506, 16507, 16508, 16509, 16510, 16511, 16512, 16514, 16515, 16522, 16530, 16531, 16534, 16538, 16541, 16544, 16546, 16550, 16553, 16563, 16565, 16601, 16602, 16603, 16611, 16613, 16616, 16617, 16619, 16620, 16621, 16622, 16623, 16624, 16625, 16627, 16629, 16630, 16631, 16633, 16634, 16635, 16636, 16637, 16638, 16639, 16640, 16641, 16644, 16645, 16646, 16647, 16648, 16650, 16651, 16652, 16654, 16655, 16656, 16657, 16659, 16660, 16661, 16662, 16663, 16664, 16665, 16666, 16667, 16668, 16669, 16670, 16671, 16672, 16673, 16674, 16675, 16677, 16678, 16679, 16680, 16681, 16682, 16683, 16684, 16685, 16686, 16689, 16691, 16692, 16693, 16694, 16695, 16698, 16699, 16701, 16720, 16724, 16725, 16726, 16727, 16728, 16729, 16730, 16731, 16732, 16733, 16734, 16735, 16738, 16740, 16743, 16744, 16745, 16746, 16748, 16749, 16750, 16801, 16802, 16803, 16804, 16805, 16820, 16821, 16822, 16823, 16825, 16826, 16827, 16828, 16829, 16830, 16832, 16833, 16834, 16835, 16836, 16837, 16838, 16839, 16840, 16841, 16843, 16844, 16845, 16847, 16848, 16849, 16850, 16851, 16852, 16853, 16854, 16855, 16856, 16858, 16859, 16860, 16861, 16863, 16864, 16865, 16866, 16868, 16870, 16871, 16872, 16873, 16874, 16875, 16876, 16877, 16878, 16879, 16881, 16882, 16901, 16910, 16911, 16912, 16914, 16915, 16917, 16920, 16921, 16922, 16923, 16925, 16926, 16927, 16928, 16929, 16930, 16932, 16933, 16935, 16936, 16937, 16938, 16939, 16940, 16941, 16942, 16943, 16945, 16946, 16947, 16948, 16950, 17002, 17004, 17009, 17014, 17017, 17021, 17029, 17035, 17044, 17049, 17051, 17052, 17054, 17056, 17058, 17059, 17060, 17063, 17066, 17075, 17076, 17082, 17084, 17086, 17094, 17099, 17211, 17212, 17213, 17215, 17223, 17228, 17229, 17233, 17238, 17239, 17243, 17249, 17253, 17255, 17260, 17264, 17267, 17701, 17702, 17703, 17705, 17720, 17721, 17723, 17724, 17726, 17727, 17728, 17729, 17730, 17731, 17735, 17737, 17739, 17740, 17742, 17744, 17745, 17747, 17748, 17749, 17750, 17751, 17752, 17754, 17756, 17758, 17760, 17762, 17763, 17764, 17765, 17768, 17769, 17771, 17772, 17774, 17776, 17777, 17778, 17779, 17801, 17810, 17812, 17813, 17814, 17815, 17820, 17821, 17822, 17823, 17824, 17827, 17829, 17830, 17831, 17832, 17833, 17834, 17835, 17836, 17837, 17840, 17841, 17842, 17843, 17844, 17845, 17846, 17847, 17850, 17851, 17853, 17855, 17856, 17857, 17858, 17859, 17860, 17861, 17862, 17864, 17865, 17866, 17867, 17868, 17870, 17872, 17876, 17877, 17878, 17880, 17881, 17882, 17884, 17885, 17886, 17887, 17888, 17889, 17901, 17920, 17921, 17922, 17923, 17925, 17929, 17930, 17931, 17932, 17933, 17934, 17935, 17936, 17938, 17941, 17943, 17944, 17945, 17946, 17948, 17949, 17951, 17952, 17953, 17954, 17957, 17959, 17960, 17961, 17963, 17964, 17965, 17966, 17967, 17968, 17970, 17972, 17974, 17976, 17979, 17980, 17981, 17982, 17983, 17985, 18012, 18030, 18039, 18041, 18054, 18058, 18070, 18071, 18073, 18074, 18076, 18077, 18081, 18084, 18201, 18202, 18210, 18211, 18212, 18214, 18216, 18218, 18219, 18220, 18221, 18222, 18223, 18224, 18225, 18229, 18230, 18231, 18232, 18234, 18235, 18237, 18239, 18240, 18241, 18242, 18244, 18245, 18246, 18247, 18248, 18249, 18250, 18251, 18252, 18254, 18255, 18256, 18301, 18302, 18320, 18321, 18322, 18323, 18324, 18325, 18326, 18327, 18328, 18330, 18331, 18332, 18333, 18334, 18335, 18336, 18337, 18340, 18341, 18342, 18344, 18346, 18347, 18348, 18349, 18350, 18352, 18353, 18354, 18355, 18356, 18357, 18360, 18370, 18371, 18372, 18403, 18405, 18407, 18410, 18411, 18413, 18414, 18415, 18416, 18417, 18419, 18420, 18421, 18424, 18425, 18426, 18427, 18428, 18430, 18431, 18433, 18434, 18435, 18436, 18437, 18438, 18439, 18440, 18441, 18443, 18444, 18445, 18446, 18447, 18448, 18449, 18451, 18452, 18453, 18454, 18455, 18456, 18457, 18458, 18459, 18460, 18461, 18462, 18463, 18464, 18465, 18466, 18469, 18470, 18471, 18472, 18473, 18501, 18502, 18503, 18504, 18505, 18507, 18508, 18509, 18510, 18512, 18515, 18517, 18518, 18519, 18540, 18577, 18601, 18602, 18603, 18610, 18611, 18612, 18614, 18615, 18616, 18617, 18618, 18619, 18621, 18622, 18623, 18624, 18625, 18626, 18627, 18628, 18629, 18630, 18631, 18632, 18634, 18635, 18636, 18640, 18641, 18642, 18643, 18644, 18651, 18653, 18654, 18655, 18656, 18657, 18660, 18661, 18690, 18701, 18702, 18703, 18704, 18705, 18706, 18707, 18708, 18709, 18710, 18711, 18762, 18764, 18765, 18766, 18767, 18769, 18773, 18801, 18810, 18812, 18813, 18814, 18815, 18816, 18817, 18818, 18820, 18821, 18822, 18823, 18824, 18825, 18826, 18827, 18828, 18829, 18830, 18831, 18832, 18833, 18834, 18837, 18840, 18842, 18843, 18844, 18845, 18846, 18847, 18848, 18850, 18851, 18853, 18854, 18901, 18902, 18910, 18911, 18912, 18913, 18914, 18915, 18916, 18917, 18918, 18920, 18921, 18922, 18923, 18925, 18927, 18928, 18929, 18930, 18931, 18932, 18933, 18934, 18935, 18936, 18938, 18940, 18942, 18943, 18944, 18946, 18947, 18949, 18950, 18951, 18953, 18954, 18955, 18956, 18957, 18958, 18960, 18962, 18963, 18964, 18966, 18968, 18969, 18970, 18971, 18972, 18974, 18976, 18977, 18979, 18980, 18981, 18991, 19001, 19002, 19003, 19004, 19006, 19007, 19008, 19009, 19010, 19012, 19013, 19014, 19015, 19016, 19017, 19018, 19019, 19020, 19021, 19022, 19023, 19025, 19026, 19027, 19028, 19029, 19030, 19031, 19032, 19033, 19034, 19035, 19036, 19037, 19038, 19039, 19040, 19041, 19043, 19044, 19046, 19047, 19048, 19049, 19050, 19052, 19053, 19054, 19055, 19056, 19057, 19058, 19060, 19061, 19063, 19064, 19065, 19066, 19067, 19070, 19072, 19073, 19074, 19075, 19076, 19078, 19079, 19081, 19082, 19083, 19085, 19086, 19087, 19090, 19091, 19092, 19093, 19094, 19095, 19096, 19098, 19099, 19101, 19102, 19103, 19104, 19105, 19106, 19107, 19108, 19109, 19110, 19111, 19112, 19113, 19114, 19115, 19116, 19118, 19119, 19120, 19121, 19122, 19123, 19124, 19125, 19126, 19127, 19128, 19129, 19130, 19131, 19132, 19133, 19134, 19135, 19136, 19137, 19138, 19139, 19140, 19141, 19142, 19143, 19144, 19145, 19146, 19147, 19148, 19149, 19150, 19151, 19152, 19153, 19154, 19155, 19160, 19161, 19162, 19170, 19171, 19172, 19173, 19175, 19176, 19177, 19178, 19179, 19181, 19182, 19183, 19184, 19185, 19187, 19188, 19190, 19191, 19192, 19193, 19194, 19195, 19196, 19197, 19244, 19255))
        then la.amount end) as members_1st,
sum(case when 
        l.decisioning_primary_fico_score >= 680
        and la.amount <= 50000
        and l.apr <= .36
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and l.term in (24,36,48,60,66,72,84)
        and l.segment in ('PRIME_PLUS','PRIME')
        and (br.state NOT in ('CALIFORNIA','CONNECTICUT','DELAWARE','DISTRICT_OF_COLUMBIA','FLORIDA','MAINE','NEW_JERSEY','NORTH_CAROLINA','GEORGIA','MARYLAND','WASHINGTON','MASSACHUSETTS','NEW_HAMPSHIRE','NEW_YORK','SOUTH_CAROLINA','OREGON','RHODE_ISLAND'))
        then la.amount end) as CBPH,
sum(case when 
        l.decisioning_primary_fico_score >= 680
        and la.amount <= 25000
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and l.term in (24,36,48)
        and l.segment in ('PRIME_PLUS','PRIME')
        and br.state <> 'MAINE'
        then la.amount end) as woodlands_national_bank,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 660 
        and la.amount <= 35000 
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40 
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'NORTH_CAROLINA' then la.amount end) as carolinas_telco,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 720
        and la.amount <= 50000 
        and l.apr <= .33
        and primary_details.pre_loan_dti_stated <= .45
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36)
        and decisioning.s207a not in (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84)
        and (decisioning.at20s >= 48 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as harbor_bank,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 50000 
        and l.apr <= .36
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36,48,60,66,72,84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (12401, 12550, 12603, 12477, 10950, 12601, 12561, 10940, 12590, 12589, 12553, 12533, 12528, 10990, 12508, 12566, 12589, 12524, 12428, 10941, 12538, 12542, 12549, 12571, 12446, 12771, 12569, 12758, 10924, 12572, 12498, 10918, 12540, 12487, 10930, 12564, 12443, 12566, 12582, 12525, 12586, 12570, 12404, 10992, 12545, 12449, 12721, 12522, 12547, 12518, 12531, 12466, 10963, 12594, 12458, 10916, 12580, 12484, 10928, 12501, 12789, 10921, 12546, 12455, 10998, 12581, 12440, 10925, 12583, 12461, 10958, 12514, 12548, 12575, 12567, 12491, 12577, 12578, 12740, 10987, 12592, 12486, 10926, 12585, 12409, 12520, 12507, 12494, 12780, 12604, 12515, 10996, 12504, 12472, 10917, 12506, 12481, 10973, 12510, 12406, 12746, 12511, 12464, 12729, 12512, 12480, 12543, 12527, 12456, 10969, 12537, 12433, 10922, 12574, 12457, 10919, 12602, 12410, 10975, 12725, 10914, 12495, 10953, 12411, 12785, 12419, 10933, 12435, 10911, 12416, 10988, 12432, 10979, 12448, 12551, 12490, 12552, 12412, 12555, 12493, 12584, 12465, 10910, 12453, 10912, 12475, 10915, 12441, 10932, 12402, 10943, 12417, 10949, 12429, 10959, 12471, 10981, 12483, 10985, 12489, 10997, 12568, 12588, 12782, 12420)
        then la.amount end) as ulster_savings,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 680
        and la.amount <= 25000 
        and l.apr <= .1899
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36,48,60)
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (90701, 90702, 90706, 90707, 90723, 90623, 90701, 90703, 90630, 90716, 90631, 91745, 91748, 90604, 90637, 90638, 90639, 90703, 90711, 90712, 90713, 90714, 90715, 90805, 90807, 90713, 90731, 90740, 90801, 90802, 90803, 90804, 90805, 90806, 90807, 90808, 90809, 90810, 90813, 90814, 90815, 90822, 90831, 90832, 90833, 90834, 90835, 90840, 90842, 90844, 90845, 90846, 90847, 90848, 90853, 90888, 90899, 90022, 90640, 91770, 90650, 90651, 90652, 90659, 90670, 90703, 90601, 90606, 90640, 90660, 90661, 90662, 91733, 90241, 90605, 90606, 90650, 90670, 90671, 90703, 90755, 90804, 90806, 90601, 90602, 90603, 90604, 90605, 90606, 90607, 90608, 90609, 90610, 90612, 90631, 90670, 91733, 91745)
        then la.amount end) as american_first,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 660
        and la.amount <= 50000 
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36,48,60,66,72,84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (68726,68756,68873,68636,68761,68764,68720,68627,68660,68655,68652,68620,68667,68001,68632,68014,68624,68036,68626,68658,68669,68635,68661,68629,68643,68641,68659,68601,68716,68791,68004,68788,68044,68031,68621,68063,68025,68026,68633,68664,68057,68072,68649,68818,68843,68846,68854,68865,68841,68748,68701,68702,68715,68752,68628,68663,68816,68826,68864,68827,68623,68638,68640,68767,68738,68747,68769,68765,68644,68642,68601,68653,68631,68647,68634,68602,68666,68651,68654,68662,68066,68065,68003,68042,68050,68017,68648,68041,68064,68070,68073,68033,68015,68018,68456,68423,68330,68314,68434,68313,68405,68439,68360,68364,68768,68779,68701,68034,68008,68002,68044,68023,68740,68787,68723,68790,68771,68460,68371,68316,68401,68319,68467,68367
)
        then la.amount end) as one_united,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME') 
        and l.decisioning_primary_fico_score >= 700
        and la.amount <= 15000 
        and l.apr <= .18
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36,48,60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'TEXAS'
        then la.amount end) as texas_national,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 30000 
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (19007, 19047, 19056, 18938, 18974, 19020, 19053, 19057, 18954, 18977, 19021, 19054, 19067, 18966, 19006, 19030, 19055, 18940, 18969) then la.amount end) as access_cu,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60,66,72,84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state = 'NORTH_CAROLINA' then la.amount end) as first_flight,
sum(case when 
        l.decisioning_primary_fico_score >= 680
        and l.apr <=.18
        and la.amount <= 30000
        and primary_details.pre_loan_dti_stated <= .43
        and lap.auto_secured_type in ('UNCOLLATERALIZED','AUTO','CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48,60)
        and (til.borrower_zip_code in (00501,00544,06390,10301,10302,10303,10304,10305,10306,10307,10308,10309,10310,10311,10312,10313,10314,10451,10452,10453,10454,10455,10456,10457,10458,10459,10460,10461,10462,10463,10464,10465,10466,10467,10468,10469,10470,10471,10472,10473,10474,10475,10501,10502,10503,10504,10505,10506,10507,10509,10510,10511,10512,10514,10516,10517,10518,10519,10520,10521,10522,10523,10524,10526,10527,10528,10530,10532,10533,10535,10536,10537,10538,10540,10541,10542,10543,10545,10546,10547,10548,10549,10550,10551,10552,10553,10560,10562,10566,10567,10570,10573,10576,10577,10578,10579,10580,10583,10587,10588,10589,10590,10591,10594,10595,10596,10597,10598,10601,10602,10603,10604,10605,10606,10607,10610,10701,10702,10703,10704,10705,10706,10707,10708,10709,10710,10801,10802,10803,10804,10805,10901,10910,10911,10912,10913,10914,10915,10916,10917,10918,10919,10920,10921,10922,10923,10924,10925,10926,10927,10928,10930,10931,10932,10933,10940,10941,10949,10950,10952,10953,10954,10956,10958,10959,10960,10962,10963,10964,10965,10968,10969,10970,10973,10974,10975,10976,10977,10979,10980,10981,10982,10983,10984,10985,10986,10987,10988,10989,10990,10992,10993,10994,10996,10997,10998,11001,11002,11003,11004,11005,11010,11020,11021,11022,11023,11024,11026,11027,11030,11040,11042,11050,11051,11052,11053,11054,11055,11096,11101,11102,11103,11104,11105,11106,11109,11120,11201,11202,11203,11204,11205,11206,11207,11208,11209,11210,11211,11212,11213,11214,11215,11216,11217,11218,11219,11220,11221,11222,11223,11224,11225,11226,11228,11229,11230,11231,11232,11233,11234,11235,11236,11237,11238,11239,11241,11242,11243,11245,11247,11249,11251,11252,11256,11351,11352,11354,11355,11356,11357,11358,11359,11360,11361,11362,11363,11364,11365,11366,11367,11368,11369,11370,11371,11372,11373,11374,11375,11377,11378,11379,11380,11381,11385,11386,11405,11411,11412,11413,11414,11415,11416,11417,11418,11419,11420,11421,11422,11423,11424,11425,11426,11427,11428,11429,11430,11431,11432,11433,11434,11435,11436,11437,11439,11451,11499,11501,11507,11509,11510,11514,11516,11518,11520,11530,11531,11542,11545,11547,11548,11549,11550,11551,11552,11553,11554,11555,11556,11557,11558,11559,11560,11561,11563,11565,11566,11568,11569,11570,11571,11572,11575,11576,11577,11579,11580,11581,11582,11590,11596,11598,11599,11690,11691,11692,11693,11694,11695,11697,11701,11702,11703,11704,11705,11706,11707,11709,11710,11713,11714,11715,11716,11717,11718,11719,11720,11721,11722,11724,11725,11726,11727,11729,11730,11731,11732,11733,11735,11737,11738,11739,11740,11741,11742,11743,11746,11747,11749,11751,11752,11753,11754,11755,11756,11757,11758,11760,11762,11763,11764,11765,11766,11767,11768,11769,11770,11771,11772,11773,11775,11776,11777,11778,11779,11780,11782,11783,11784,11786,11787,11788,11789,11790,11791,11792,11793,11794,11795,11796,11797,11798,11801,11802,11803,11804,11815,11853,11901,11930,11931,11932,11933,11934,11935,11937,11939,11940,11941,11942,11944,11946,11947,11948,11949,11950,11951,11952,11953,11954,11955,11956,11957,11958,11959,11960,11961,11962,11963,11964,11965,11967,11968,11969,11970,11971,11972,11973,11975,11976,11977,11978,11980,12007,12008,12009,12010,12015,12016,12017,12018,12019,12020,12022,12023,12024,12025,12027,12028,12029,12031,12032,12033,12035,12036,12037,12040,12041,12042,12043,12045,12046,12047,12050,12051,12052,12053,12054,12055,12056,12057,12058,12059,12060,12061,12062,12063,12064,12065,12066,12067,12068,12069,12070,12071,12072,12073,12074,12075,12076,12077,12078,12082,12083,12084,12085,12086,12087,12089,12090,12092,12093,12094,12095,12106,12107,12108,12110,12115,12116,12117,12118,12120,12121,12122,12123,12124,12125,12128,12130,12131,12132,12133,12134,12136,12137,12138,12139,12140,12141,12143,12144,12147,12148,12149,12150,12151,12153,12154,12155,12156,12157,12158,12159,12160,12161,12164,12165,12166,12167,12168,12169,12170,12172,12173,12174,12175,12176,12177,12180,12181,12182,12183,12184,12185,12186,12187,12188,12189,12190,12192,12193,12194,12195,12196,12197,12198,12201,12202,12203,12204,12205,12206,12207,12208,12209,12210,12211,12212,12214,12220,12222,12223,12224,12225,12226,12227,12228,12229,12230,12231,12232,12233,12234,12235,12236,12237,12238,12239,12240,12241,12242,12243,12244,12245,12246,12247,12248,12249,12250,12255,12257,12260,12261,12288,12301,12302,12303,12304,12305,12306,12307,12308,12309,12325,12345,12401,12402,12404,12405,12406,12407,12409,12410,12411,12412,12413,12414,12416,12417,12418,12419,12420,12421,12422,12423,12424,12427,12428,12429,12430,12431,12432,12433,12434,12435,12436,12438,12439,12440,12441,12442,12443,12444,12446,12448,12449,12450,12451,12452,12453,12454,12455,12456,12457,12458,12459,12460,12461,12463,12464,12465,12466,12468,12469,12470,12471,12472,12473,12474,12475,12477,12480,12481,12482,12483,12484,12485,12486,12487,12489,12490,12491,12492,12493,12494,12495,12496,12498,12501,12502,12503,12504,12506,12507,12508,12510,12511,12512,12513,12514,12515,12516,12517,12518,12520,12521,12522,12523,12524,12525,12526,12527,12528,12529,12530,12531,12533,12534,12537,12538,12540,12541,12542,12543,12544,12545,12546,12547,12548,12549,12550,12551,12552,12553,12555,12561,12563,12564,12565,12566,12567,12568,12569,12570,12571,12572,12574,12575,12577,12578,12580,12581,12582,12583,12584,12585,12586,12588,12589,12590,12592,12594,12601,12602,12603,12604,12701,12719,12720,12721,12722,12723,12724,12725,12726,12727,12729,12732,12733,12734,12736,12737,12738,12740,12741,12742,12743,12745,12746,12747,12748,12749,12750,12751,12752,12754,12758,12759,12760,12762,12763,12764,12765,12766,12767,12768,12769,12770,12771,12775,12776,12777,12778,12779,12780,12781,12783,12784,12785,12786,12787,12788,12789,12790,12791,12792,12801,12803,12804,12808,12809,12810,12811,12812,12814,12815,12816,12817,12819,12820,12821,12822,12823,12824,12827,12828,12831,12832,12833,12834,12835,12836,12837,12838,12839,12841,12842,12843,12844,12845,12846,12847,12848,12849,12850,12851,12852,12853,12854,12855,12856,12857,12858,12859,12860,12861,12862,12863,12864,12865,12866,12870,12871,12872,12873,12874,12878,12879,12883,12884,12885,12886,12887,12901,12903,12910,12911,12912,12913,12914,12915,12916,12917,12918,12919,12920,12921,12922,12923,12924,12926,12927,12928,12929,12930,12932,12933,12934,12935,12936,12937,12939,12941,12942,12943,12944,12945,12946,12949,12950,12952,12953,12955,12956,12957,12958,12959,12960,12961,12962,12964,12965,12966,12967,12969,12970,12972,12973,12974,12975,12976,12977,12978,12979,12980,12981,12983,12985,12986,12987,12989,12992,12993,12995,12996,12997,12998,13020,13021,13022,13024,13026,13027,13028,13029,13030,13031,13032,13033,13034,13035,13036,13037,13039,13040,13041,13042,13043,13044,13045,13051,13052,13053,13054,13056,13057,13060,13061,13062,13063,13064,13065,13066,13068,13069,13071,13072,13073,13074,13076,13077,13078,13080,13081,13082,13083,13084,13087,13088,13089,13090,13092,13093,13101,13102,13103,13104,13107,13108,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13120,13121,13122,13123,13124,13126,13131,13132,13134,13135,13136,13137,13138,13139,13140,13141,13142,13143,13144,13145,13146,13147,13148,13152,13153,13154,13155,13156,13157,13158,13159,13160,13162,13163,13164,13165,13166,13167,13201,13202,13203,13204,13205,13206,13207,13208,13209,13210,13211,13212,13214,13215,13217,13218,13219,13220,13221,13224,13225,13235,13244,13250,13251,13252,13261,13290,13301,13302,13303,13304,13305,13308,13309,13310,13312,13313,13314,13315,13316,13317,13318,13319,13320,13321,13322,13323,13324,13325,13326,13327,13328,13329,13331,13332,13333,13334,13335,13337,13338,13339,13340,13341,13342,13343,13345,13346,13348,13350,13352,13353,13354,13355,13357,13360,13361,13362,13363,13364,13365,13367,13368,13401,13402,13403,13404,13406,13407,13408,13409,13410,13411,13413,13415,13416,13417,13418,13420,13421,13424,13425,13426,13428,13431,13433,13435,13436,13437,13438,13439,13440,13441,13442,13449,13450,13452,13454,13455,13456,13457,13459,13460,13461,13464,13465,13468,13469,13470,13471,13472,13473,13475,13476,13477,13478,13479,13480,13482,13483,13484,13485,13486,13488,13489,13490,13491,13492,13493,13494,13495,13501,13502,13503,13504,13505,13599,13601,13602,13603,13605,13606,13607,13608,13611,13612,13613,13614,13615,13616,13617,13618,13619,13620,13621,13622,13623,13624,13625,13626,13627,13628,13630,13631,13632,13633,13634,13635,13636,13637,13638,13639,13640,13641,13642,13643,13645,13646,13647,13648,13649,13650,13651,13652,13654,13655,13656,13657,13658,13659,13660,13661,13662,13664,13665,13666,13667,13668,13669,13670,13671,13672,13673,13674,13675,13676,13677,13678,13679,13680,13681,13682,13683,13684,13685,13687,13690,13691,13692,13693,13694,13695,13696,13697,13699,13730,13731,13732,13733,13734,13736,13737,13738,13739,13740,13743,13744,13745,13746,13747,13748,13749,13750,13751,13752,13753,13754,13755,13756,13757,13758,13760,13761,13762,13763,13774,13775,13776,13777,13778,13780,13782,13783,13784,13786,13787,13788,13790,13794,13795,13796,13797,13801,13802,13803,13804,13806,13807,13808,13809,13810,13811,13812,13813,13814,13815,13820,13825,13826,13827,13830,13832,13833,13834,13835,13838,13839,13840,13841,13842,13843,13844,13845,13846,13847,13848,13849,13850,13851,13856,13859,13860,13861,13862,13863,13864,13865,13901,13902,13903,13904,13905,14001,14004,14005,14006,14008,14009,14010,14011,14012,14013,14020,14021,14024,14025,14026,14027,14028,14029,14030,14031,14032,14033,14034,14035,14036,14037,14038,14039,14040,14041,14042,14043,14047,14048,14051,14052,14054,14055,14056,14057,14058,14059,14060,14061,14062,14063,14065,14066,14067,14068,14069,14070,14072,14075,14080,14081,14082,14083,14085,14086,14091,14092,14094,14095,14098,14101,14102,14103,14105,14107,14108,14109,14110,14111,14112,14113,14120,14125,14126,14127,14129,14130,14131,14132,14133,14134,14135,14136,14138,14139,14140,14141,14143,14144,14145,14150,14151,14166,14167,14168,14169,14170,14171,14172,14173,14174,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14227,14228,14231,14233,14240,14241,14260,14261,14263,14264,14265,14267,14269,14270,14272,14273,14276,14280,14301,14302,14303,14304,14305,14410,14411,14413,14414,14415,14416,14418,14420,14422,14423,14424,14425,14427,14428,14429,14430,14432,14433,14435,14437,14441,14443,14445,14449,14450,14452,14453,14454,14456,14461,14462,14463,14464,14466,14467,14468,14469,14470,14471,14472,14475,14476,14477,14478,14479,14480,14481,14482,14485,14486,14487,14488,14489,14502,14504,14505,14506,14507,14508,14510,14511,14512,14513,14514,14515,14516,14517,14518,14519,14520,14521,14522,14525,14526,14527,14529,14530,14532,14533,14534,14536,14537,14538,14539,14541,14542,14543,14544,14545,14546,14547,14548,14549,14550,14551,14555,14556,14557,14558,14559,14560,14561,14563,14564,14568,14569,14571,14572,14580,14585,14586,14588,14589,14590,14591,14592,14602,14603,14604,14605,14606,14607,14608,14609,14610,14611,14612,14613,14614,14615,14616,14617,14618,14619,14620,14621,14622,14623,14624,14625,14626,14627,14638,14639,14642,14643,14644,14646,14647,14649,14650,14651,14652,14653,14692,14694,14701,14702,14706,14707,14708,14709,14710,14711,14712,14714,14715,14716,14717,14718,14719,14720,14721,14722,14723,14724,14726,14727,14728,14729,14730,14731,14732,14733,14735,14736,14737,14738,14739,14740,14741,14742,14743,14744,14745,14747,14748,14750,14751,14752,14753,14754,14755,14756,14757,14758,14760,14766,14767,14769,14770,14772,14774,14775,14777,14778,14779,14781,14782,14783,14784,14785,14786,14787,14788,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14812,14813,14814,14815,14816,14817,14818,14819,14820,14821,14822,14823,14824,14825,14826,14827,14830,14831,14836,14837,14838,14839,14840,14841,14842,14843,14845,14846,14847,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14863,14864,14865,14867,14869,14870,14871,14872,14873,14874,14876,14877,14878,14879,14880,14881,14882,14883,14884,14885,14886,14887,14889,14891,14892,14893,14894,14895,14897,14898,14901,14902,14903,14904,14905)
        or br.state in ('ILLINOIS', 'INDIANA', 'MICHIGAN', 'OHIO', 'WISCONSIN', 'CONNECTICUT', 'MAINE', 'MASSACHUSETTS', 'NEW_HAMPSHIRE', 'RHODE_ISLAND', 'VERMONT', 'IOWA', 'KANSAS', 'MINNESOTA', 'MISSOURI', 'NEBRASKA', 'NORTH_DAKOTA', 'SOUTH_DAKOTA', 'ARIZONA', 'COLORADO', 'IDAHO', 'MONTANA', 'NEVADA', 'NEW_MEXICO', 'UTAH', 'WYOMING', 'ARKANSAS', 'LOUISIANA', 'OKLAHOMA', 'TEXAS','PENNSYLVANIA'))
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and decisioning.s207a not in (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36)
        then la.amount end) as tompkins,
sum(case when 
        l.segment in ('NEAR_PRIME')
        and l.decisioning_primary_fico_score >= 600 
        and l.apr <= .36
        and la.amount <= 50000 
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60,66,72,84)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state <> 'MAINE' then la.amount end) as capital_community_bank,
sum(case when 
        l.segment in ('PRIME_PLUS','PRIME')
        and l.decisioning_primary_fico_score >= 680 
        and l.apr <= .18
        and la.amount <= 35000 
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60)
        and secondary_details.loan_app_id is null
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and br.state in ('MARYLAND','DISTRICT_OF_COLUMBIA','VIRGINIA','WEST_VIRGINIA','PENNSYLVANIA','DELAWARE') then la.amount end) as SECU,
sum(case when 
        l.segment in ('PRIME_PLUS', 'PRIME')
        and l.decisioning_primary_fico_score >= 660 
        and l.apr <= .18
        and la.amount <= 25000 
        and primary_details.pre_loan_dti_stated <= .40
        and lap.auto_secured_type in ('UNCOLLATERALIZED', 'AUTO', 'CASH_OUT_AUTO_REFINANCE') 
        and l.term in (24, 36, 48, 60,66,72)
        and (decisioning.at20s >= 36 or decisioning.at20s <0 or decisioning.at20s is null) --min credit history
        and til.borrower_zip_code in (86401,86402,86403,86404,86405,86406,86409,86411,86412,86413,86426,86427,86429,86430,86431,86433,86434,86436,86437,86438,86439,86440,86441,86442,86445,86446,91701,91708,91709,91710,91729,91730,91737,91739,91743,91752,91758,91761,91762,91763,91764,91766,91784,91785,91786,91792,92028,92201,92202,92203,92210,92211,92220,92223,92225,92226,92230,92234,92235,92236,92239,92240,92241,92242,92247,92248,92252,92253,92254,92255,92256,92258,92260,92261,92262,92263,92264,92267,92268,92270,92274,92276,92277,92278,92280,92282,92284,92285,92286,92301,92304,92305,92307,92308,92309,92310,92311,92312,92313,92314,92315,92316,92317,92318,92320,92321,92322,92323,92324,92325,92327,92329,92331,92332,92333,92334,92335,92336,92337,92338,92339,92340,92341,92342,92344,92345,92346,92347,92350,92352,92354,92356,92357,92358,92359,92363,92364,92365,92366,92368,92369,92371,92372,92373,92374,92375,92376,92377,92378,92382,92385,92386,92391,92392,92393,92394,92395,92397,92398,92399,92401,92402,92403,92404,92405,92406,92407,92408,92410,92411,92413,92415,92418,92423,92427,92501,92502,92503,92504,92505,92506,92507,92508,92509,92513,92514,92516,92517,92518,92519,92521,92522,92530,92531,92532,92536,92539,92543,92544,92545,92546,92548,92549,92551,92552,92553,92554,92555,92556,92557,92561,92562,92563,92564,92567,92570,92571,92572,92581,92582,92583,92584,92585,92586,92587,92589,92590,92591,92592,92593,92595,92596,92599,92860,92877,92878,92879,92880,92881,92882,92883,93516,93558,93562,93592,89002,89005,89006,89011,89012,89014,89015,89019,89028,89029,89039,89046,89052,89074,90245,90254,90260,90261,90266,90267,90274,90275,90277,90278,90501,90502,90503,90504,90505,90506,90507,90508,90509,90510,90710,90717,90731,90732,90733,90734,90744,90745,90746,90747,90748,90749,90755,90801,90802,90803,90804,90805,90806,90807,90808,90809,90810,90813,90814,90815,90822,90831,90832,90833,90840,90842,90844,90846,90847,90848,90853,90895,90899
) then la.amount end) as arrowhead_cu,
sum(la.amount)
from invmgt.loan_allocation la
join loanreview.loan_in_review lir on lir.id = la.loan_id
left join invmgt.loan l on l.loan_id = la.loan_id
left join core.loan_application lap on lap.loan_id = l.loan_id
left join core.applicant_credit_char primary_details on primary_details.loan_app_id = la.loan_id and primary_details.applicant_type = 'PRIMARY'
left join core.applicant_credit_char secondary_details on secondary_details.loan_app_id = la.loan_id and secondary_details.applicant_type = 'SECONDARY'
left join loanreview.borrower br on br.id = lir.borrower_id
left join core.loan_credit_char locc on locc.loan_app_id = la.loan_id
left join 
        (select 
        la.id as loan_id,
        tu.s_g082, --accts currently dq
        tu.s207a, --mos since bk
        tu.s_at13, --open accts (18mos)
        tu.at20s, --min credit history
        tu.g061s, --accts dq (24mos)
        tu.co03s, --charged off (24mos)
        tu.g238s, --credit inquiries (12mos)
        tu.co02s, --charged off (12mos)
        tu.c_s061, --mos since 60 dpd
        tu.vantage3 --vantage3
        from funnel.loan_application la
        left join decisioning.application app on app.loan_app_id = la.id
        join decisioning.credit_decision cd on app.first_valid_credit_decision_id = cd.id
        left join decisioning.transunion_attributes tu on cd.primary_cr_id = tu.credit_report_id) decisioning on decisioning.loan_id = la.loan_id
left join 
        (select loan_id, borrower_zip_code::integer, borrower_state, type
        from loanreview.truth_in_lending_input
        where borrower_zip_code::varchar not in ('07456-1957', '11208-2515', '18013-2219', '33544-7419', '46219-4411', '62301-6256', '90720-4736', '92342-0817')) til on til.loan_id = la.loan_id and til.type = 'FINAL_TIL'
left join (select lr.id, cr.military_lending_account_search_status
        from funnel.loan_application l 
        left join funnel.borrower b on l.borrower_id = b.id 
        left join funnel.employment e on b.employment_id = e.id
        left join loanreview.loan_in_review lr on l.id = lr.id
        left join decisioning.application da on l.id = da.loan_app_id
        left join decisioning.credit_decision d on da.last_credit_decision_id = d.id 
        left join decisioning.applicant dap on d.id = dap.credit_decision_id and dap.is_primary = 'true'
        left join decisioning.credit_report cr on dap.credit_report_id = cr.id
        where lr.id is not null) MLA on MLA.id = la.loan_id
where la.create_date::date between '2022-10-01' and '2022-10-31'
and la.allocation_policy = 'CREDIT_UNION_1'
and la.loan_product_type = 'PERSONAL_LOAN'
group by extract(month from la.create_date);
