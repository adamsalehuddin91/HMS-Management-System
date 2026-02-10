-- ============================================
-- HMS Salon - Points Backfill (Option B)
-- Period: Aug 2025 - Jan 2026 (6 months)
-- Generated: 2026-02-09
-- Formula: 1 point per RM1 spent = floor(total)
-- ============================================

-- IMPORTANT: Run AFTER import-zobaze-data.sql
-- This updates existing customer points_balance
-- and creates points_transaction records

-- ============================================
-- STEP 1: UPDATE CUSTOMER POINTS BALANCE
-- ============================================

-- Batch 1/5
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60134836936';
UPDATE customers SET points_balance = 1431, total_spent = 1431.00 WHERE phone = '+60127554550';
UPDATE customers SET points_balance = 354, total_spent = 354.00 WHERE phone = '+60167113514';
UPDATE customers SET points_balance = 1168, total_spent = 1168.00 WHERE phone = '+60169070637';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60197808086';
UPDATE customers SET points_balance = 155, total_spent = 155.00 WHERE phone = '+60197764340';
UPDATE customers SET points_balance = 130, total_spent = 130.00 WHERE phone = '+60177650040';
UPDATE customers SET points_balance = 315, total_spent = 315.00 WHERE phone = '+60197013269';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+601117684710';
UPDATE customers SET points_balance = 230, total_spent = 230.00 WHERE phone = '+60197555251';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60128010987';
UPDATE customers SET points_balance = 260, total_spent = 260.00 WHERE phone = '+60189435194';
UPDATE customers SET points_balance = 499, total_spent = 499.00 WHERE phone = '+60122773814';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601125800868';
UPDATE customers SET points_balance = 520, total_spent = 520.00 WHERE phone = '+60145437894';
UPDATE customers SET points_balance = 478, total_spent = 478.00 WHERE phone = '+60197328842';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60189889237';
UPDATE customers SET points_balance = 160, total_spent = 160.00 WHERE phone = '+60177023923';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60148264533';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60133094266';
UPDATE customers SET points_balance = 360, total_spent = 360.00 WHERE phone = '+60133407282';
UPDATE customers SET points_balance = 500, total_spent = 500.00 WHERE phone = '+60127373741';
UPDATE customers SET points_balance = 389, total_spent = 389.00 WHERE phone = '+60197116467';
UPDATE customers SET points_balance = 63, total_spent = 63.00 WHERE phone = '+60145070918';
UPDATE customers SET points_balance = 1060, total_spent = 1060.00 WHERE phone = '+60197851618';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60172690846';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60127006912';
UPDATE customers SET points_balance = 155, total_spent = 155.00 WHERE phone = '+601114967875';
UPDATE customers SET points_balance = 144, total_spent = 144.00 WHERE phone = '+60197574741';
UPDATE customers SET points_balance = 275, total_spent = 275.00 WHERE phone = '+60197917133';
UPDATE customers SET points_balance = 105, total_spent = 105.00 WHERE phone = '+60127611790';
UPDATE customers SET points_balance = 279, total_spent = 279.00 WHERE phone = '+60197518795';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60197776876';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60149292327';
UPDATE customers SET points_balance = 105, total_spent = 105.00 WHERE phone = '+601115336848';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60192316934';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60184631735';
UPDATE customers SET points_balance = 40, total_spent = 40.00 WHERE phone = '+60166447698';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60127259774';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60127824907';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60193148948';
UPDATE customers SET points_balance = 175, total_spent = 175.00 WHERE phone = '+601119442560';
UPDATE customers SET points_balance = 659, total_spent = 659.00 WHERE phone = '+60197734585';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60127051252';
UPDATE customers SET points_balance = 300, total_spent = 300.00 WHERE phone = '+60196660721';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60182301280';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60136245351';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+60137754579';
UPDATE customers SET points_balance = 291, total_spent = 291.00 WHERE phone = '+60137618785';
UPDATE customers SET points_balance = 50, total_spent = 50.00 WHERE phone = '+60127179915';
UPDATE customers SET points_balance = 175, total_spent = 175.00 WHERE phone = '+60197665322';
UPDATE customers SET points_balance = 120, total_spent = 120.00 WHERE phone = '+60139893740';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60136603961';
UPDATE customers SET points_balance = 130, total_spent = 130.00 WHERE phone = '+60127978372';
UPDATE customers SET points_balance = 284, total_spent = 284.00 WHERE phone = '+60167353026';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60145135123';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60192993227';
UPDATE customers SET points_balance = 252, total_spent = 252.00 WHERE phone = '+60194775542';
UPDATE customers SET points_balance = 470, total_spent = 470.00 WHERE phone = '+60132399940';
UPDATE customers SET points_balance = 113, total_spent = 113.00 WHERE phone = '+60167722583';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+601112879159';
UPDATE customers SET points_balance = 320, total_spent = 320.00 WHERE phone = '+601164965496';
UPDATE customers SET points_balance = 650, total_spent = 650.00 WHERE phone = '+60111114374';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60187839294';
UPDATE customers SET points_balance = 160, total_spent = 160.00 WHERE phone = '+60137787910';
UPDATE customers SET points_balance = 210, total_spent = 210.00 WHERE phone = '+601110807082';
UPDATE customers SET points_balance = 135, total_spent = 135.00 WHERE phone = '+60127429600';
UPDATE customers SET points_balance = 110, total_spent = 110.00 WHERE phone = '+60127127837';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60132298902';
UPDATE customers SET points_balance = 360, total_spent = 360.00 WHERE phone = '+60127662874';
UPDATE customers SET points_balance = 153, total_spent = 153.00 WHERE phone = '+60197247212';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60198386139';
UPDATE customers SET points_balance = 230, total_spent = 230.00 WHERE phone = '+60136014678';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197367539';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60197785466';
UPDATE customers SET points_balance = 425, total_spent = 425.00 WHERE phone = '+60197060642';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+601110993505';
UPDATE customers SET points_balance = 100, total_spent = 100.00 WHERE phone = '+601139131505';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60192900944';
UPDATE customers SET points_balance = 40, total_spent = 40.00 WHERE phone = '+60197200502';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60147761611';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60192927094';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197549188';
UPDATE customers SET points_balance = 120, total_spent = 120.00 WHERE phone = '+60197273961';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60183206978';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60193113244';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+6090033695';
UPDATE customers SET points_balance = 319, total_spent = 319.00 WHERE phone = '+60108290682';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60123302842';
UPDATE customers SET points_balance = 540, total_spent = 540.00 WHERE phone = '+60197861958';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60132784903';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60194443583';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+6014444975242';
UPDATE customers SET points_balance = 130, total_spent = 130.00 WHERE phone = '+60127743591';
UPDATE customers SET points_balance = 470, total_spent = 470.00 WHERE phone = '+60109273907';
UPDATE customers SET points_balance = 113, total_spent = 113.00 WHERE phone = '+60197902721';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177627172';
UPDATE customers SET points_balance = 1020, total_spent = 1020.00 WHERE phone = '+6097669904';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601136202004';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601111401214';
UPDATE customers SET points_balance = 799, total_spent = 799.00 WHERE phone = '+60197903005';
UPDATE customers SET points_balance = 560, total_spent = 560.00 WHERE phone = '+60197513179';
UPDATE customers SET points_balance = 260, total_spent = 260.00 WHERE phone = '+60136993006';
UPDATE customers SET points_balance = 202, total_spent = 202.00 WHERE phone = '+60177600012';
UPDATE customers SET points_balance = 495, total_spent = 495.00 WHERE phone = '+60166630337';
UPDATE customers SET points_balance = 779, total_spent = 779.00 WHERE phone = '+60187828685';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60199419434';
UPDATE customers SET points_balance = 420, total_spent = 420.00 WHERE phone = '+601164142077';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60137562121';
UPDATE customers SET points_balance = 550, total_spent = 550.00 WHERE phone = '+60197464735';
UPDATE customers SET points_balance = 125, total_spent = 125.00 WHERE phone = '+60137976408';
UPDATE customers SET points_balance = 788, total_spent = 788.00 WHERE phone = '+60197797275';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60143105920';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60194226021';
UPDATE customers SET points_balance = 230, total_spent = 230.00 WHERE phone = '+60197746302';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60197212103';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197527494';
UPDATE customers SET points_balance = 171, total_spent = 171.00 WHERE phone = '+60124994010';
UPDATE customers SET points_balance = 162, total_spent = 162.00 WHERE phone = '+601131794246';
UPDATE customers SET points_balance = 216, total_spent = 216.00 WHERE phone = '+601161703246';
UPDATE customers SET points_balance = 386, total_spent = 386.00 WHERE phone = '+60167714245';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137355692';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137142712';
UPDATE customers SET points_balance = 68, total_spent = 68.00 WHERE phone = '+60137556865';
UPDATE customers SET points_balance = 68, total_spent = 68.00 WHERE phone = '+601117647047';
UPDATE customers SET points_balance = 320, total_spent = 320.00 WHERE phone = '+60136090929';
UPDATE customers SET points_balance = 486, total_spent = 486.00 WHERE phone = '+60193912911';
UPDATE customers SET points_balance = 298, total_spent = 298.00 WHERE phone = '+60137111206';
UPDATE customers SET points_balance = 68, total_spent = 68.00 WHERE phone = '+60165722521';
UPDATE customers SET points_balance = 200, total_spent = 200.00 WHERE phone = '+601111246973';
UPDATE customers SET points_balance = 184, total_spent = 184.00 WHERE phone = '+60169266057';
UPDATE customers SET points_balance = 865, total_spent = 865.00 WHERE phone = '+60177080508';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197503514';
UPDATE customers SET points_balance = 162, total_spent = 162.00 WHERE phone = '+6001128983536';
UPDATE customers SET points_balance = 116, total_spent = 116.00 WHERE phone = '+60127280957';
UPDATE customers SET points_balance = 212, total_spent = 212.00 WHERE phone = '+60126220543';
UPDATE customers SET points_balance = 112, total_spent = 112.00 WHERE phone = '+60139487328';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60192343309';
UPDATE customers SET points_balance = 793, total_spent = 793.00 WHERE phone = '+60137780451';
UPDATE customers SET points_balance = 48, total_spent = 48.00 WHERE phone = '+60149045463';
UPDATE customers SET points_balance = 285, total_spent = 285.00 WHERE phone = '+60134922038';
UPDATE customers SET points_balance = 719, total_spent = 719.00 WHERE phone = '+60126261553';
UPDATE customers SET points_balance = 301, total_spent = 301.00 WHERE phone = '+601115130805';
UPDATE customers SET points_balance = 68, total_spent = 68.00 WHERE phone = '+60197788979';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60132899196';
UPDATE customers SET points_balance = 560, total_spent = 560.00 WHERE phone = '+60168356554';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60167737068';
UPDATE customers SET points_balance = 261, total_spent = 261.00 WHERE phone = '+60137151913';
UPDATE customers SET points_balance = 135, total_spent = 135.00 WHERE phone = '+601136805228';
UPDATE customers SET points_balance = 142, total_spent = 142.00 WHERE phone = '+60174003899';
UPDATE customers SET points_balance = 315, total_spent = 315.00 WHERE phone = '+60127222343';
UPDATE customers SET points_balance = 167, total_spent = 167.00 WHERE phone = '+60177530078';
UPDATE customers SET points_balance = 68, total_spent = 68.00 WHERE phone = '+60168272152';
UPDATE customers SET points_balance = 40, total_spent = 40.00 WHERE phone = '+60193736067';
UPDATE customers SET points_balance = 176, total_spent = 176.00 WHERE phone = '+60192174574';
UPDATE customers SET points_balance = 319, total_spent = 319.00 WHERE phone = '+601121739850';
UPDATE customers SET points_balance = 239, total_spent = 239.00 WHERE phone = '+60164392240';
UPDATE customers SET points_balance = 221, total_spent = 221.00 WHERE phone = '+60197173940';
UPDATE customers SET points_balance = 492, total_spent = 492.00 WHERE phone = '+60136458287';
UPDATE customers SET points_balance = 498, total_spent = 498.00 WHERE phone = '+601139606991';
UPDATE customers SET points_balance = 188, total_spent = 188.00 WHERE phone = '+60126763191';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60137169005';
UPDATE customers SET points_balance = 90, total_spent = 90.00 WHERE phone = '+601140490442';
UPDATE customers SET points_balance = 68, total_spent = 68.00 WHERE phone = '+60137792594';
UPDATE customers SET points_balance = 369, total_spent = 369.00 WHERE phone = '+60139188958';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+601115420889';
UPDATE customers SET points_balance = 1221, total_spent = 1221.00 WHERE phone = '+60142756804';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601133104332';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60127131595';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137335993';
UPDATE customers SET points_balance = 135, total_spent = 135.00 WHERE phone = '+60184032876';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60134909749';
UPDATE customers SET points_balance = 123, total_spent = 123.00 WHERE phone = '+60197754155';
UPDATE customers SET points_balance = 450, total_spent = 450.00 WHERE phone = '+60189158232';
UPDATE customers SET points_balance = 162, total_spent = 162.00 WHERE phone = '+60187855927';
UPDATE customers SET points_balance = 68, total_spent = 68.00 WHERE phone = '+60195771323';
UPDATE customers SET points_balance = 225, total_spent = 225.00 WHERE phone = '+60193692809';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601123708239';
UPDATE customers SET points_balance = 153, total_spent = 153.00 WHERE phone = '+60197850095';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60134726952';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137759755';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60167036006';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60136289609';
UPDATE customers SET points_balance = 149, total_spent = 149.00 WHERE phone = '+60197503874';
UPDATE customers SET points_balance = 205, total_spent = 205.00 WHERE phone = '+60187811970';
UPDATE customers SET points_balance = 285, total_spent = 285.00 WHERE phone = '+60137574430';
UPDATE customers SET points_balance = 275, total_spent = 275.00 WHERE phone = '+601129547802';
UPDATE customers SET points_balance = 415, total_spent = 415.00 WHERE phone = '+60136341787';
UPDATE customers SET points_balance = 341, total_spent = 341.00 WHERE phone = '+60197726248';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60127008651';
UPDATE customers SET points_balance = 135, total_spent = 135.00 WHERE phone = '+60164858503';
UPDATE customers SET points_balance = 68, total_spent = 68.00 WHERE phone = '+60134826331';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60125868144';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60129723899';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60167221784';
UPDATE customers SET points_balance = 234, total_spent = 234.00 WHERE phone = '+601157459069';
UPDATE customers SET points_balance = 299, total_spent = 299.00 WHERE phone = '+60127467810';
UPDATE customers SET points_balance = 290, total_spent = 290.00 WHERE phone = '+60197333756';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+60138247711';
UPDATE customers SET points_balance = 135, total_spent = 135.00 WHERE phone = '+601137198937';

-- Batch 2/5
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60177590987';
UPDATE customers SET points_balance = 68, total_spent = 68.00 WHERE phone = '+60197706335';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60136792665';
UPDATE customers SET points_balance = 270, total_spent = 270.00 WHERE phone = '+60174495972';
UPDATE customers SET points_balance = 390, total_spent = 390.00 WHERE phone = '+60132301826';
UPDATE customers SET points_balance = 351, total_spent = 351.00 WHERE phone = '+601151233792';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+601161568896';
UPDATE customers SET points_balance = 369, total_spent = 369.00 WHERE phone = '+60173343613';
UPDATE customers SET points_balance = 374, total_spent = 374.00 WHERE phone = '+60172722861';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60127699807';
UPDATE customers SET points_balance = 197, total_spent = 197.00 WHERE phone = '+60137086527';
UPDATE customers SET points_balance = 203, total_spent = 203.00 WHERE phone = '+60189043562';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60167425696';
UPDATE customers SET points_balance = 351, total_spent = 351.00 WHERE phone = '+60197755563';
UPDATE customers SET points_balance = 68, total_spent = 68.00 WHERE phone = '+60127124966';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60164056402';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60197882035';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601117366836';
UPDATE customers SET points_balance = 162, total_spent = 162.00 WHERE phone = '+60137217376';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60187604619';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197727572';
UPDATE customers SET points_balance = 205, total_spent = 205.00 WHERE phone = '+60127479417';
UPDATE customers SET points_balance = 110, total_spent = 110.00 WHERE phone = '+60167181140';
UPDATE customers SET points_balance = 277, total_spent = 277.00 WHERE phone = '+60137009356';
UPDATE customers SET points_balance = 68, total_spent = 68.00 WHERE phone = '+60195588116';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60137143236';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60194512690';
UPDATE customers SET points_balance = 250, total_spent = 250.00 WHERE phone = '+60177614898';
UPDATE customers SET points_balance = 203, total_spent = 203.00 WHERE phone = '+60166670686';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60193176736';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60196632880';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60167337171';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60162573617';
UPDATE customers SET points_balance = 199, total_spent = 199.00 WHERE phone = '+60168562905';
UPDATE customers SET points_balance = 255, total_spent = 255.00 WHERE phone = '+60137183718';
UPDATE customers SET points_balance = 38, total_spent = 38.00 WHERE phone = '+6089044090';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197620103';
UPDATE customers SET points_balance = 145, total_spent = 145.00 WHERE phone = '+60127331724';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177951279';
UPDATE customers SET points_balance = 319, total_spent = 319.00 WHERE phone = '+60127175082';
UPDATE customers SET points_balance = 610, total_spent = 610.00 WHERE phone = '+601110754184';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60145422575';
UPDATE customers SET points_balance = 250, total_spent = 250.00 WHERE phone = '+60196186463';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+601169335207';
UPDATE customers SET points_balance = 154, total_spent = 154.00 WHERE phone = '+601111427604';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+601118866460';
UPDATE customers SET points_balance = 190, total_spent = 190.00 WHERE phone = '+60124653731';
UPDATE customers SET points_balance = 259, total_spent = 259.00 WHERE phone = '+601110996659';
UPDATE customers SET points_balance = 300, total_spent = 300.00 WHERE phone = '+60177995856';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60167370848';
UPDATE customers SET points_balance = 105, total_spent = 105.00 WHERE phone = '+60104377512';
UPDATE customers SET points_balance = 40, total_spent = 40.00 WHERE phone = '+60134951554';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60108277605';
UPDATE customers SET points_balance = 188, total_spent = 188.00 WHERE phone = '+60177522761';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60197000924';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60129046862';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197796841';
UPDATE customers SET points_balance = 88, total_spent = 88.00 WHERE phone = '+60192803763';
UPDATE customers SET points_balance = 456, total_spent = 456.00 WHERE phone = '+60137754242';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60123612532';
UPDATE customers SET points_balance = 190, total_spent = 190.00 WHERE phone = '+60197424989';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60108896591';
UPDATE customers SET points_balance = 255, total_spent = 255.00 WHERE phone = '+60193531231';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+60197074759';
UPDATE customers SET points_balance = 484, total_spent = 484.00 WHERE phone = '+60127220046';
UPDATE customers SET points_balance = 110, total_spent = 110.00 WHERE phone = '+60127910027';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60177779686';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60137311150';
UPDATE customers SET points_balance = 290, total_spent = 290.00 WHERE phone = '+6090664603';
UPDATE customers SET points_balance = 350, total_spent = 350.00 WHERE phone = '+60137297705';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60192333959';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60139221967';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197072661';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60127887245';
UPDATE customers SET points_balance = 382, total_spent = 382.00 WHERE phone = '+60137282882';
UPDATE customers SET points_balance = 155, total_spent = 155.00 WHERE phone = '+60185966400';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+601111922441';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60162629953';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177998428';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60182037086';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60167224651';
UPDATE customers SET points_balance = 195, total_spent = 195.00 WHERE phone = '+60195594694';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60197917916';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60177305076';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60197362796';
UPDATE customers SET points_balance = 225, total_spent = 225.00 WHERE phone = '+60132589487';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60177586976';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601151118416';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60169232242';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127334689';
UPDATE customers SET points_balance = 210, total_spent = 210.00 WHERE phone = '+6093678734';
UPDATE customers SET points_balance = 50, total_spent = 50.00 WHERE phone = '+60148412019';
UPDATE customers SET points_balance = 224, total_spent = 224.00 WHERE phone = '+60162057179';
UPDATE customers SET points_balance = 410, total_spent = 410.00 WHERE phone = '+60136630857';
UPDATE customers SET points_balance = 380, total_spent = 380.00 WHERE phone = '+60197521275';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60127945294';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137312003';
UPDATE customers SET points_balance = 750, total_spent = 750.00 WHERE phone = '+60134800662';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+601123323735';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60189044628';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60127176504';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+601117733029';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60187616904';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60122449310';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601140308370';
UPDATE customers SET points_balance = 108, total_spent = 108.00 WHERE phone = '+601116409368';
UPDATE customers SET points_balance = 130, total_spent = 130.00 WHERE phone = '+601111123198';
UPDATE customers SET points_balance = 40, total_spent = 40.00 WHERE phone = '+60127910371';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60137431577';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60147750874';
UPDATE customers SET points_balance = 40, total_spent = 40.00 WHERE phone = '+60127337081';
UPDATE customers SET points_balance = 235, total_spent = 235.00 WHERE phone = '+60104509353';
UPDATE customers SET points_balance = 145, total_spent = 145.00 WHERE phone = '+60197719834';
UPDATE customers SET points_balance = 239, total_spent = 239.00 WHERE phone = '+601161144692';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60146693800';
UPDATE customers SET points_balance = 130, total_spent = 130.00 WHERE phone = '+60127870977';
UPDATE customers SET points_balance = 350, total_spent = 350.00 WHERE phone = '+60133431354';
UPDATE customers SET points_balance = 90, total_spent = 90.00 WHERE phone = '+60197103019';
UPDATE customers SET points_balance = 520, total_spent = 520.00 WHERE phone = '+60197717602';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+601110766449';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60123069095';
UPDATE customers SET points_balance = 229, total_spent = 229.00 WHERE phone = '+60139504530';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60166635809';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60137103005';
UPDATE customers SET points_balance = 680, total_spent = 680.00 WHERE phone = '+60179709261';
UPDATE customers SET points_balance = 130, total_spent = 130.00 WHERE phone = '+60177047707';
UPDATE customers SET points_balance = 184, total_spent = 184.00 WHERE phone = '+60199195130';
UPDATE customers SET points_balance = 310, total_spent = 310.00 WHERE phone = '+601113077231';
UPDATE customers SET points_balance = 520, total_spent = 520.00 WHERE phone = '+60105689689';
UPDATE customers SET points_balance = 1059, total_spent = 1059.00 WHERE phone = '+6096680489';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+601137449459';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60124102093';
UPDATE customers SET points_balance = 218, total_spent = 218.00 WHERE phone = '+60182316531';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127249108';
UPDATE customers SET points_balance = 400, total_spent = 400.00 WHERE phone = '+60197908089';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60179768644';
UPDATE customers SET points_balance = 140, total_spent = 140.00 WHERE phone = '+601171102708';
UPDATE customers SET points_balance = 430, total_spent = 430.00 WHERE phone = '+60187626484';
UPDATE customers SET points_balance = 650, total_spent = 650.00 WHERE phone = '+60187868518';
UPDATE customers SET points_balance = 50, total_spent = 50.00 WHERE phone = '+60129183306';
UPDATE customers SET points_balance = 48, total_spent = 48.00 WHERE phone = '+601165561008';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60127511519';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60135385375';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60167323204';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60197842461';
UPDATE customers SET points_balance = 299, total_spent = 299.00 WHERE phone = '+60137213761';
UPDATE customers SET points_balance = 378, total_spent = 378.00 WHERE phone = '+60142325526';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60197256568';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60189785174';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60193635762';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60102422627';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60193264444';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60133545813';
UPDATE customers SET points_balance = 330, total_spent = 330.00 WHERE phone = '+60192477339';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60127763436';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60126265850';
UPDATE customers SET points_balance = 90, total_spent = 90.00 WHERE phone = '+601115420502';
UPDATE customers SET points_balance = 350, total_spent = 350.00 WHERE phone = '+60172509663';
UPDATE customers SET points_balance = 140, total_spent = 140.00 WHERE phone = '+60196669103';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60146382010';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+601126739269';
UPDATE customers SET points_balance = 655, total_spent = 655.00 WHERE phone = '+601117507266';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197140610';
UPDATE customers SET points_balance = 290, total_spent = 290.00 WHERE phone = '+60164610150';
UPDATE customers SET points_balance = 225, total_spent = 225.00 WHERE phone = '+601169919391';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60126504954';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+601123097505';
UPDATE customers SET points_balance = 38, total_spent = 38.00 WHERE phone = '+60123719065';
UPDATE customers SET points_balance = 229, total_spent = 229.00 WHERE phone = '+60177725157';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60179611587';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601116202301';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601137720241';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60125973261';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137534357';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60196164421';
UPDATE customers SET points_balance = 155, total_spent = 155.00 WHERE phone = '+60107050464';
UPDATE customers SET points_balance = 250, total_spent = 250.00 WHERE phone = '+60133677335';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60149848979';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60132380290';
UPDATE customers SET points_balance = 185, total_spent = 185.00 WHERE phone = '+60193450422';
UPDATE customers SET points_balance = 370, total_spent = 370.00 WHERE phone = '+60167060913';
UPDATE customers SET points_balance = 135, total_spent = 135.00 WHERE phone = '+60137764551';
UPDATE customers SET points_balance = 550, total_spent = 550.00 WHERE phone = '+60145618263';
UPDATE customers SET points_balance = 90, total_spent = 90.00 WHERE phone = '+60137992332';
UPDATE customers SET points_balance = 639, total_spent = 639.00 WHERE phone = '+60194880249';
UPDATE customers SET points_balance = 145, total_spent = 145.00 WHERE phone = '+60133076930';
UPDATE customers SET points_balance = 530, total_spent = 530.00 WHERE phone = '+60146637506';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197884720';
UPDATE customers SET points_balance = 18, total_spent = 18.00 WHERE phone = '+60196174458';
UPDATE customers SET points_balance = 429, total_spent = 429.00 WHERE phone = '+60137629994';
UPDATE customers SET points_balance = 779, total_spent = 779.00 WHERE phone = '+601114419155';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60137868070';
UPDATE customers SET points_balance = 350, total_spent = 350.00 WHERE phone = '+60127032427';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60199387079';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60127763616';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601117528806';
UPDATE customers SET points_balance = 950, total_spent = 950.00 WHERE phone = '+60167828624';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60135333686';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137679698';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+60172636719';

-- Batch 3/5
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60187776417';
UPDATE customers SET points_balance = 375, total_spent = 375.00 WHERE phone = '+60128007668';
UPDATE customers SET points_balance = 102, total_spent = 102.00 WHERE phone = '+60166661912';
UPDATE customers SET points_balance = 358, total_spent = 358.00 WHERE phone = '+60127383546';
UPDATE customers SET points_balance = 120, total_spent = 120.00 WHERE phone = '+60172203251';
UPDATE customers SET points_balance = 400, total_spent = 400.00 WHERE phone = '+60145187013';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60137447180';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60137022169';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+601111991362';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60189594076';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137868838';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60197700521';
UPDATE customers SET points_balance = 198, total_spent = 198.00 WHERE phone = '+60127495501';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+601155418022';
UPDATE customers SET points_balance = 359, total_spent = 359.00 WHERE phone = '+60166415446';
UPDATE customers SET points_balance = 120, total_spent = 120.00 WHERE phone = '+60137787083';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60173284346';
UPDATE customers SET points_balance = 168, total_spent = 168.00 WHERE phone = '+60123783286';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60137302166';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+601111022566';
UPDATE customers SET points_balance = 209, total_spent = 209.00 WHERE phone = '+60197595957';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+601114792399';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601111786188';
UPDATE customers SET points_balance = 305, total_spent = 305.00 WHERE phone = '+60122550080';
UPDATE customers SET points_balance = 335, total_spent = 335.00 WHERE phone = '+60125225423';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60133631974';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60147734080';
UPDATE customers SET points_balance = 105, total_spent = 105.00 WHERE phone = '+60126240025';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60189797616';
UPDATE customers SET points_balance = 270, total_spent = 270.00 WHERE phone = '+60127309578';
UPDATE customers SET points_balance = 130, total_spent = 130.00 WHERE phone = '+60176006879';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60137087695';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601111739653';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60136544395';
UPDATE customers SET points_balance = 200, total_spent = 200.00 WHERE phone = '+60123678078';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137593142';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+601127395400';
UPDATE customers SET points_balance = 300, total_spent = 300.00 WHERE phone = '+60137764129';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177466374';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60137779770';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60147744352';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60143087879';
UPDATE customers SET points_balance = 59, total_spent = 59.00 WHERE phone = '+60166885001';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197065744';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137783205';
UPDATE customers SET points_balance = 210, total_spent = 210.00 WHERE phone = '+60109080998';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177608081';
UPDATE customers SET points_balance = 789, total_spent = 789.00 WHERE phone = '+60127718393';
UPDATE customers SET points_balance = 355, total_spent = 355.00 WHERE phone = '+60193657945';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60137815760';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60125392785';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60197385454';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60177281464';
UPDATE customers SET points_balance = 59, total_spent = 59.00 WHERE phone = '+601171100701';
UPDATE customers SET points_balance = 250, total_spent = 250.00 WHERE phone = '+60174838483';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177437847';
UPDATE customers SET points_balance = 95, total_spent = 95.00 WHERE phone = '+60102900904';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60199686527';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60177752048';
UPDATE customers SET points_balance = 169, total_spent = 169.00 WHERE phone = '+60199373828';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60125406260';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60187623834';
UPDATE customers SET points_balance = 640, total_spent = 640.00 WHERE phone = '+60197106969';
UPDATE customers SET points_balance = 540, total_spent = 540.00 WHERE phone = '+60122979798';
UPDATE customers SET points_balance = 455, total_spent = 455.00 WHERE phone = '+60197956265';
UPDATE customers SET points_balance = 178, total_spent = 178.00 WHERE phone = '+60127496175';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+601111463964';
UPDATE customers SET points_balance = 540, total_spent = 540.00 WHERE phone = '+60127916578';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197330328';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+601112749532';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60109465172';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+601139565153';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60134354835';
UPDATE customers SET points_balance = 410, total_spent = 410.00 WHERE phone = '+60177993818';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60133583593';
UPDATE customers SET points_balance = 95, total_spent = 95.00 WHERE phone = '+60177407798';
UPDATE customers SET points_balance = 540, total_spent = 540.00 WHERE phone = '+60177863238';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137004183';
UPDATE customers SET points_balance = 1094, total_spent = 1094.00 WHERE phone = '+60127902255';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197577560';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60167257017';
UPDATE customers SET points_balance = 440, total_spent = 440.00 WHERE phone = '+60197114168';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60187721382';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60167174743';
UPDATE customers SET points_balance = 480, total_spent = 480.00 WHERE phone = '+60162215756';
UPDATE customers SET points_balance = 229, total_spent = 229.00 WHERE phone = '+601137313186';
UPDATE customers SET points_balance = 155, total_spent = 155.00 WHERE phone = '+60176001497';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177174456';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60127347172';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60165555700';
UPDATE customers SET points_balance = 25, total_spent = 25.00 WHERE phone = '+60192018305';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60176552014';
UPDATE customers SET points_balance = 35, total_spent = 35.00 WHERE phone = '+60177233183';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60193130907';
UPDATE customers SET points_balance = 220, total_spent = 220.00 WHERE phone = '+60196356086';
UPDATE customers SET points_balance = 105, total_spent = 105.00 WHERE phone = '+60172785429';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601110905081';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60182387905';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+601110746709';
UPDATE customers SET points_balance = 67, total_spent = 67.00 WHERE phone = '+60182246477';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60172498354';
UPDATE customers SET points_balance = 370, total_spent = 370.00 WHERE phone = '+60177228720';
UPDATE customers SET points_balance = 155, total_spent = 155.00 WHERE phone = '+60137138195';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60177243391';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177571692';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127367571';
UPDATE customers SET points_balance = 130, total_spent = 130.00 WHERE phone = '+60177104396';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60123084262';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601111114808';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601117775006';
UPDATE customers SET points_balance = 234, total_spent = 234.00 WHERE phone = '+60177440769';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60193663272';
UPDATE customers SET points_balance = 230, total_spent = 230.00 WHERE phone = '+60134209209';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127080315';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60198449420';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+601126306543';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60127319918';
UPDATE customers SET points_balance = 359, total_spent = 359.00 WHERE phone = '+601137396434';
UPDATE customers SET points_balance = 519, total_spent = 519.00 WHERE phone = '+60197771385';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60179898181';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60145904553';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601111400840';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601160969274';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60142216464';
UPDATE customers SET points_balance = 483, total_spent = 483.00 WHERE phone = '+60102887027';
UPDATE customers SET points_balance = 135, total_spent = 135.00 WHERE phone = '+60145623035';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+601161719441';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60197508584';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601125683140';
UPDATE customers SET points_balance = 50, total_spent = 50.00 WHERE phone = '+601126940017';
UPDATE customers SET points_balance = 120, total_spent = 120.00 WHERE phone = '+60177917396';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60184696692';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+601110887815';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601154169716';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60136715153';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60124897793';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60129658472';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+601111315464';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60132180147';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60132116202';
UPDATE customers SET points_balance = 40, total_spent = 40.00 WHERE phone = '+60182705411';
UPDATE customers SET points_balance = 390, total_spent = 390.00 WHERE phone = '+60197205804';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60139662307';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197883937';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601110055706';
UPDATE customers SET points_balance = 349, total_spent = 349.00 WHERE phone = '+60189730364';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60197781175';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60183868085';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60177114764';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601111779796';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60103531616';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60127159328';
UPDATE customers SET points_balance = 295, total_spent = 295.00 WHERE phone = '+60177168695';
UPDATE customers SET points_balance = 549, total_spent = 549.00 WHERE phone = '+60178412808';
UPDATE customers SET points_balance = 510, total_spent = 510.00 WHERE phone = '+60197323775';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+601111428805';
UPDATE customers SET points_balance = 599, total_spent = 599.00 WHERE phone = '+60182196366';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127531483';
UPDATE customers SET points_balance = 100, total_spent = 100.00 WHERE phone = '+60137279335';
UPDATE customers SET points_balance = 530, total_spent = 530.00 WHERE phone = '+60122493850';
UPDATE customers SET points_balance = 360, total_spent = 360.00 WHERE phone = '+60132224052';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60137215212';
UPDATE customers SET points_balance = 450, total_spent = 450.00 WHERE phone = '+60174330407';
UPDATE customers SET points_balance = 105, total_spent = 105.00 WHERE phone = '+60197020240';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+601158304785';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+601161160939';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+601112719416';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+60123175415';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+601128425658';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60145457970';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60197777830';
UPDATE customers SET points_balance = 330, total_spent = 330.00 WHERE phone = '+60127790035';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+601133251152';
UPDATE customers SET points_balance = 309, total_spent = 309.00 WHERE phone = '+60197978940';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60175099859';
UPDATE customers SET points_balance = 115, total_spent = 115.00 WHERE phone = '+60177013943';
UPDATE customers SET points_balance = 185, total_spent = 185.00 WHERE phone = '+60194702603';
UPDATE customers SET points_balance = 77, total_spent = 77.00 WHERE phone = '+60122733340';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60199936481';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60137280951';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+6098608703';
UPDATE customers SET points_balance = 109, total_spent = 109.00 WHERE phone = '+60137732882';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60176010457';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+601137693107';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60193759947';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60127878452';
UPDATE customers SET points_balance = 173, total_spent = 173.00 WHERE phone = '+60184733650';
UPDATE customers SET points_balance = 125, total_spent = 125.00 WHERE phone = '+60197352773';
UPDATE customers SET points_balance = 105, total_spent = 105.00 WHERE phone = '+60197720350';
UPDATE customers SET points_balance = 190, total_spent = 190.00 WHERE phone = '+60124194984';
UPDATE customers SET points_balance = 65, total_spent = 65.00 WHERE phone = '+60182667716';
UPDATE customers SET points_balance = 360, total_spent = 360.00 WHERE phone = '+6091897225';
UPDATE customers SET points_balance = 640, total_spent = 640.00 WHERE phone = '+60132197187';
UPDATE customers SET points_balance = 199, total_spent = 199.00 WHERE phone = '+601115072601';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127295520';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601160515730';
UPDATE customers SET points_balance = 22, total_spent = 22.00 WHERE phone = '+60174755534';
UPDATE customers SET points_balance = 325, total_spent = 325.00 WHERE phone = '+60162278814';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60123294535';
UPDATE customers SET points_balance = 50, total_spent = 50.00 WHERE phone = '+60182776099';

-- Batch 4/5
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60143428292';
UPDATE customers SET points_balance = 50, total_spent = 50.00 WHERE phone = '+60173563087';
UPDATE customers SET points_balance = 135, total_spent = 135.00 WHERE phone = '+601127802557';
UPDATE customers SET points_balance = 105, total_spent = 105.00 WHERE phone = '+60127989191';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60179876985';
UPDATE customers SET points_balance = 185, total_spent = 185.00 WHERE phone = '+60165269363';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60128207319';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137462473';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601117777596';
UPDATE customers SET points_balance = 65, total_spent = 65.00 WHERE phone = '+601110656854';
UPDATE customers SET points_balance = 185, total_spent = 185.00 WHERE phone = '+60182844642';
UPDATE customers SET points_balance = 145, total_spent = 145.00 WHERE phone = '+60133735785';
UPDATE customers SET points_balance = 429, total_spent = 429.00 WHERE phone = '+60127682040';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60122916712';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197812198';
UPDATE customers SET points_balance = 160, total_spent = 160.00 WHERE phone = '+60175710871';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60146196433';
UPDATE customers SET points_balance = 382, total_spent = 382.00 WHERE phone = '+60192715322';
UPDATE customers SET points_balance = 110, total_spent = 110.00 WHERE phone = '+60192683246';
UPDATE customers SET points_balance = 320, total_spent = 320.00 WHERE phone = '+60137792974';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60167642644';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177437107';
UPDATE customers SET points_balance = 185, total_spent = 185.00 WHERE phone = '+60137746735';
UPDATE customers SET points_balance = 229, total_spent = 229.00 WHERE phone = '+60162383801';
UPDATE customers SET points_balance = 305, total_spent = 305.00 WHERE phone = '+60127302608';
UPDATE customers SET points_balance = 280, total_spent = 280.00 WHERE phone = '+601129335317';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60165125641';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60199732611';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60177633507';
UPDATE customers SET points_balance = 405, total_spent = 405.00 WHERE phone = '+60137564383';
UPDATE customers SET points_balance = 175, total_spent = 175.00 WHERE phone = '+60137770078';
UPDATE customers SET points_balance = 898, total_spent = 898.00 WHERE phone = '+60126307819';
UPDATE customers SET points_balance = 155, total_spent = 155.00 WHERE phone = '+60129151969';
UPDATE customers SET points_balance = 465, total_spent = 465.00 WHERE phone = '+601114129210';
UPDATE customers SET points_balance = 409, total_spent = 409.00 WHERE phone = '+60177509272';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60125895277';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60122840517';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601110977805';
UPDATE customers SET points_balance = 57, total_spent = 57.00 WHERE phone = '+601137778556';
UPDATE customers SET points_balance = 558, total_spent = 558.00 WHERE phone = '+601136562751';
UPDATE customers SET points_balance = 115, total_spent = 115.00 WHERE phone = '+60127394005';
UPDATE customers SET points_balance = 155, total_spent = 155.00 WHERE phone = '+60139131706';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60136612366';
UPDATE customers SET points_balance = 279, total_spent = 279.00 WHERE phone = '+60128270872';
UPDATE customers SET points_balance = 400, total_spent = 400.00 WHERE phone = '+60148051831';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60167130849';
UPDATE customers SET points_balance = 1060, total_spent = 1060.00 WHERE phone = '+60137001753';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197496746';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+601121786088';
UPDATE customers SET points_balance = 300, total_spent = 300.00 WHERE phone = '+601137318248';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60127442128';
UPDATE customers SET points_balance = 450, total_spent = 450.00 WHERE phone = '+60177912305';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+601127664136';
UPDATE customers SET points_balance = 290, total_spent = 290.00 WHERE phone = '+60197106971';
UPDATE customers SET points_balance = 430, total_spent = 430.00 WHERE phone = '+60197702865';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60142525732';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+609277655116';
UPDATE customers SET points_balance = 38, total_spent = 38.00 WHERE phone = '+60139121045';
UPDATE customers SET points_balance = 229, total_spent = 229.00 WHERE phone = '+60182445650';
UPDATE customers SET points_balance = 195, total_spent = 195.00 WHERE phone = '+60167955951';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60199102383';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60125509491';
UPDATE customers SET points_balance = 50, total_spent = 50.00 WHERE phone = '+60173732162';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60149321546';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60173675643';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60193148978';
UPDATE customers SET points_balance = 69, total_spent = 69.00 WHERE phone = '+601165511017';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177043603';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60177941628';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197788829';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60104022726';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60186631630';
UPDATE customers SET points_balance = 100, total_spent = 100.00 WHERE phone = '+60197288264';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+601132015740';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137575014';
UPDATE customers SET points_balance = 130, total_spent = 130.00 WHERE phone = '+601139224098';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60133341998';
UPDATE customers SET points_balance = 90, total_spent = 90.00 WHERE phone = '+60129454205';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60104071906';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60132914149';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60177467994';
UPDATE customers SET points_balance = 245, total_spent = 245.00 WHERE phone = '+601115726986';
UPDATE customers SET points_balance = 334, total_spent = 334.00 WHERE phone = '+60183644329';
UPDATE customers SET points_balance = 185, total_spent = 185.00 WHERE phone = '+60193148617';
UPDATE customers SET points_balance = 345, total_spent = 345.00 WHERE phone = '+6097909273';
UPDATE customers SET points_balance = 90, total_spent = 90.00 WHERE phone = '+60197557923';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177823486';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60167659872';
UPDATE customers SET points_balance = 339, total_spent = 339.00 WHERE phone = '+60129607593';
UPDATE customers SET points_balance = 138, total_spent = 138.00 WHERE phone = '+60177338337';
UPDATE customers SET points_balance = 469, total_spent = 469.00 WHERE phone = '+60177629297';
UPDATE customers SET points_balance = 400, total_spent = 400.00 WHERE phone = '+6082010463';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60125601095';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197230507';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60189546673';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601161247428';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60182917665';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+601161306998';
UPDATE customers SET points_balance = 38, total_spent = 38.00 WHERE phone = '+60137124212';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60167167878';
UPDATE customers SET points_balance = 245, total_spent = 245.00 WHERE phone = '+60177635586';
UPDATE customers SET points_balance = 190, total_spent = 190.00 WHERE phone = '+60127913299';
UPDATE customers SET points_balance = 140, total_spent = 140.00 WHERE phone = '+601137328902';
UPDATE customers SET points_balance = 358, total_spent = 358.00 WHERE phone = '+60116210016';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60111127471';
UPDATE customers SET points_balance = 184, total_spent = 184.00 WHERE phone = '+60178340479';
UPDATE customers SET points_balance = 500, total_spent = 500.00 WHERE phone = '+60177611645';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601113275473';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60177990029';
UPDATE customers SET points_balance = 50, total_spent = 50.00 WHERE phone = '+601165115501';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60197610768';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+601121543451';
UPDATE customers SET points_balance = 135, total_spent = 135.00 WHERE phone = '+60183614165';
UPDATE customers SET points_balance = 385, total_spent = 385.00 WHERE phone = '+60176575878';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60167089011';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137922017';
UPDATE customers SET points_balance = 190, total_spent = 190.00 WHERE phone = '+60102183775';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60172329586';
UPDATE customers SET points_balance = 65, total_spent = 65.00 WHERE phone = '+601128672527';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+601163908089';
UPDATE customers SET points_balance = 280, total_spent = 280.00 WHERE phone = '+60177079700';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137792784';
UPDATE customers SET points_balance = 120, total_spent = 120.00 WHERE phone = '+60173283752';
UPDATE customers SET points_balance = 173, total_spent = 173.00 WHERE phone = '+60127979576';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197562396';
UPDATE customers SET points_balance = 340, total_spent = 340.00 WHERE phone = '+601119862746';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60137955990';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197615011';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60137811116';
UPDATE customers SET points_balance = 662, total_spent = 662.00 WHERE phone = '+601110302776';
UPDATE customers SET points_balance = 100, total_spent = 100.00 WHERE phone = '+60137143812';
UPDATE customers SET points_balance = 310, total_spent = 310.00 WHERE phone = '+601127391844';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+601111486287';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60197409880';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60127565955';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60165962440';
UPDATE customers SET points_balance = 159, total_spent = 159.00 WHERE phone = '+601113350953';
UPDATE customers SET points_balance = 120, total_spent = 120.00 WHERE phone = '+60195300712';
UPDATE customers SET points_balance = 400, total_spent = 400.00 WHERE phone = '+60137780030';
UPDATE customers SET points_balance = 830, total_spent = 830.00 WHERE phone = '+6097238285';
UPDATE customers SET points_balance = 65, total_spent = 65.00 WHERE phone = '+601161199370';
UPDATE customers SET points_balance = 320, total_spent = 320.00 WHERE phone = '+60197617017';
UPDATE customers SET points_balance = 155, total_spent = 155.00 WHERE phone = '+60196879462';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+601110402459';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197769196';
UPDATE customers SET points_balance = 230, total_spent = 230.00 WHERE phone = '+601111428673';
UPDATE customers SET points_balance = 428, total_spent = 428.00 WHERE phone = '+601131791240';
UPDATE customers SET points_balance = 120, total_spent = 120.00 WHERE phone = '+60177247559';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601156663045';
UPDATE customers SET points_balance = 350, total_spent = 350.00 WHERE phone = '+601118505386';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+601112105933';
UPDATE customers SET points_balance = 90, total_spent = 90.00 WHERE phone = '+60123171960';
UPDATE customers SET points_balance = 245, total_spent = 245.00 WHERE phone = '+60129018253';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60177456169';
UPDATE customers SET points_balance = 620, total_spent = 620.00 WHERE phone = '+60138535321';
UPDATE customers SET points_balance = 320, total_spent = 320.00 WHERE phone = '+601120563914';
UPDATE customers SET points_balance = 819, total_spent = 819.00 WHERE phone = '+60127201517';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+6081319761';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+601156812663';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60175845512';
UPDATE customers SET points_balance = 240, total_spent = 240.00 WHERE phone = '+60129070601';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60177449342';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+601132571188';
UPDATE customers SET points_balance = 414, total_spent = 414.00 WHERE phone = '+60172302414';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601139164054';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60196497956';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197542303';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60127767871';
UPDATE customers SET points_balance = 284, total_spent = 284.00 WHERE phone = '+60137821883';
UPDATE customers SET points_balance = 115, total_spent = 115.00 WHERE phone = '+60125135772';
UPDATE customers SET points_balance = 90, total_spent = 90.00 WHERE phone = '+60175385612';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127682690';
UPDATE customers SET points_balance = 610, total_spent = 610.00 WHERE phone = '+60177021874';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+601136734105';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127065584';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60177879005';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60192417796';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+601110290105';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137991938';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60139735876';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601112883715';
UPDATE customers SET points_balance = 309, total_spent = 309.00 WHERE phone = '+601112949972';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60177261800';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+60134547777';
UPDATE customers SET points_balance = 368, total_spent = 368.00 WHERE phone = '+60197750949';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601127346536';
UPDATE customers SET points_balance = 7, total_spent = 7.00 WHERE phone = '+60146154864';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60187837410';
UPDATE customers SET points_balance = 299, total_spent = 299.00 WHERE phone = '+60196669673';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60172828852';
UPDATE customers SET points_balance = 65, total_spent = 65.00 WHERE phone = '+60174541161';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60132886912';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+601140336084';
UPDATE customers SET points_balance = 380, total_spent = 380.00 WHERE phone = '+60137715722';
UPDATE customers SET points_balance = 428, total_spent = 428.00 WHERE phone = '+60196496204';
UPDATE customers SET points_balance = 100, total_spent = 100.00 WHERE phone = '+60182894085';
UPDATE customers SET points_balance = 90, total_spent = 90.00 WHERE phone = '+60177191145';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60199529716';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+601121965807';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60137500214';

-- Batch 5/5
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+601111145078';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60137875720';
UPDATE customers SET points_balance = 50, total_spent = 50.00 WHERE phone = '+60145140816';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60173453025';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60197178118';
UPDATE customers SET points_balance = 210, total_spent = 210.00 WHERE phone = '+60196637090';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60126729227';
UPDATE customers SET points_balance = 160, total_spent = 160.00 WHERE phone = '+60169935487';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60189766130';
UPDATE customers SET points_balance = 280, total_spent = 280.00 WHERE phone = '+60137491707';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127148281';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60424610996';
UPDATE customers SET points_balance = 100, total_spent = 100.00 WHERE phone = '+60197511506';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60127611359';
UPDATE customers SET points_balance = 350, total_spent = 350.00 WHERE phone = '+60123961423';
UPDATE customers SET points_balance = 155, total_spent = 155.00 WHERE phone = '+60197915206';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60177217758';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127705605';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60145377092';
UPDATE customers SET points_balance = 250, total_spent = 250.00 WHERE phone = '+60137672509';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60127801610';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137066540';
UPDATE customers SET points_balance = 339, total_spent = 339.00 WHERE phone = '+60193745093';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60142138132';
UPDATE customers SET points_balance = 220, total_spent = 220.00 WHERE phone = '+60187721356';
UPDATE customers SET points_balance = 280, total_spent = 280.00 WHERE phone = '+60192685654';
UPDATE customers SET points_balance = 210, total_spent = 210.00 WHERE phone = '+60127314668';
UPDATE customers SET points_balance = 239, total_spent = 239.00 WHERE phone = '+60168066831';
UPDATE customers SET points_balance = 118, total_spent = 118.00 WHERE phone = '+60197782839';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60137777031';
UPDATE customers SET points_balance = 339, total_spent = 339.00 WHERE phone = '+60177331814';
UPDATE customers SET points_balance = 200, total_spent = 200.00 WHERE phone = '+601117563460';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60143542429';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601131405233';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177743933';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601127888479';
UPDATE customers SET points_balance = 80, total_spent = 80.00 WHERE phone = '+60196008891';
UPDATE customers SET points_balance = 53, total_spent = 53.00 WHERE phone = '+60177493606';
UPDATE customers SET points_balance = 368, total_spent = 368.00 WHERE phone = '+601133452481';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+60125821357';
UPDATE customers SET points_balance = 120, total_spent = 120.00 WHERE phone = '+60135859464';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60197822330';
UPDATE customers SET points_balance = 235, total_spent = 235.00 WHERE phone = '+60197189157';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60108679233';
UPDATE customers SET points_balance = 210, total_spent = 210.00 WHERE phone = '+60127077300';
UPDATE customers SET points_balance = 105, total_spent = 105.00 WHERE phone = '+60129780835';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60176940076';
UPDATE customers SET points_balance = 48, total_spent = 48.00 WHERE phone = '+60184087345';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+601117779194';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197456303';
UPDATE customers SET points_balance = 76, total_spent = 76.00 WHERE phone = '+601156369125';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60197444032';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197127986';
UPDATE customers SET points_balance = 280, total_spent = 280.00 WHERE phone = '+60137526609';
UPDATE customers SET points_balance = 600, total_spent = 600.00 WHERE phone = '+60137707315';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60143304618';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601121709010';
UPDATE customers SET points_balance = 350, total_spent = 350.00 WHERE phone = '+60148261607';
UPDATE customers SET points_balance = 200, total_spent = 200.00 WHERE phone = '+60139856101';
UPDATE customers SET points_balance = 900, total_spent = 900.00 WHERE phone = '+60127005316';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601112736041';
UPDATE customers SET points_balance = 229, total_spent = 229.00 WHERE phone = '+60127410120';
UPDATE customers SET points_balance = 200, total_spent = 200.00 WHERE phone = '+60137728875';
UPDATE customers SET points_balance = 190, total_spent = 190.00 WHERE phone = '+60164006752';
UPDATE customers SET points_balance = 428, total_spent = 428.00 WHERE phone = '+601137770867';
UPDATE customers SET points_balance = 269, total_spent = 269.00 WHERE phone = '+601124301107';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+60177122154';
UPDATE customers SET points_balance = 50, total_spent = 50.00 WHERE phone = '+601114439943';
UPDATE customers SET points_balance = 589, total_spent = 589.00 WHERE phone = '+60108947280';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60137300430';
UPDATE customers SET points_balance = 378, total_spent = 378.00 WHERE phone = '+60127683406';
UPDATE customers SET points_balance = 85, total_spent = 85.00 WHERE phone = '+60177010776';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177056533';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60142828265';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177408626';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60194137470';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60134601302';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60137081632';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127780853';
UPDATE customers SET points_balance = 1158, total_spent = 1158.00 WHERE phone = '+60102261084';
UPDATE customers SET points_balance = 315, total_spent = 315.00 WHERE phone = '+60195474035';
UPDATE customers SET points_balance = 200, total_spent = 200.00 WHERE phone = '+60102424239';
UPDATE customers SET points_balance = 105, total_spent = 105.00 WHERE phone = '+60176582848';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127145120';
UPDATE customers SET points_balance = 270, total_spent = 270.00 WHERE phone = '+60172347874';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60104115980';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60127951156';
UPDATE customers SET points_balance = 395, total_spent = 395.00 WHERE phone = '+601117625453';
UPDATE customers SET points_balance = 380, total_spent = 380.00 WHERE phone = '+60133046630';
UPDATE customers SET points_balance = 239, total_spent = 239.00 WHERE phone = '+60104291255';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60167278628';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60187849429';
UPDATE customers SET points_balance = 310, total_spent = 310.00 WHERE phone = '+60127060047';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60135909160';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60137621537';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+601137462102';
UPDATE customers SET points_balance = 269, total_spent = 269.00 WHERE phone = '+60177077025';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+60126262202';
UPDATE customers SET points_balance = 355, total_spent = 355.00 WHERE phone = '+60137005284';
UPDATE customers SET points_balance = 318, total_spent = 318.00 WHERE phone = '+601128880369';
UPDATE customers SET points_balance = 144, total_spent = 144.00 WHERE phone = '+60137272713';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60197111719';
UPDATE customers SET points_balance = 115, total_spent = 115.00 WHERE phone = '+601111022655';
UPDATE customers SET points_balance = 130, total_spent = 130.00 WHERE phone = '+60177001600';
UPDATE customers SET points_balance = 240, total_spent = 240.00 WHERE phone = '+60187831741';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60137972745';
UPDATE customers SET points_balance = 135, total_spent = 135.00 WHERE phone = '+60166136799';
UPDATE customers SET points_balance = 18, total_spent = 18.00 WHERE phone = '+60127578837';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177915459';
UPDATE customers SET points_balance = 350, total_spent = 350.00 WHERE phone = '+60178737324';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177445960';
UPDATE customers SET points_balance = 345, total_spent = 345.00 WHERE phone = '+60149642284';
UPDATE customers SET points_balance = 45, total_spent = 45.00 WHERE phone = '+60177124503';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60104190734';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60177227164';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60194774953';
UPDATE customers SET points_balance = 660, total_spent = 660.00 WHERE phone = '+60127375823';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60177127604';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601137942310';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60107826713';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60172358073';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60126364908';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60187733564';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+601115230355';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60192664900';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60137661064';
UPDATE customers SET points_balance = 15, total_spent = 15.00 WHERE phone = '+601156489837';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60197780358';
UPDATE customers SET points_balance = 75, total_spent = 75.00 WHERE phone = '+60194816587';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60164145651';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60199148491';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60194292379';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+60105690952';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60197313361';
UPDATE customers SET points_balance = 450, total_spent = 450.00 WHERE phone = '+601153792001';
UPDATE customers SET points_balance = 150, total_spent = 150.00 WHERE phone = '+60189864337';
UPDATE customers SET points_balance = 180, total_spent = 180.00 WHERE phone = '+60162669013';
UPDATE customers SET points_balance = 50, total_spent = 50.00 WHERE phone = '+60196562804';
UPDATE customers SET points_balance = 30, total_spent = 30.00 WHERE phone = '+60134955645';
UPDATE customers SET points_balance = 55, total_spent = 55.00 WHERE phone = '+60187937294';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60197249017';
UPDATE customers SET points_balance = 70, total_spent = 70.00 WHERE phone = '+60137787768';
UPDATE customers SET points_balance = 383, total_spent = 383.00 WHERE phone = '+60189797390';
UPDATE customers SET points_balance = 155, total_spent = 155.00 WHERE phone = '+60167196202';
UPDATE customers SET points_balance = 60, total_spent = 60.00 WHERE phone = '+60194604672';
UPDATE customers SET points_balance = 1029, total_spent = 1029.00 WHERE phone = '+6090108242';

-- ============================================
-- STEP 2: INSERT POINTS TRANSACTIONS (audit trail)
-- One "migration" entry per customer
-- ============================================

-- Points transactions batch 1/5
INSERT INTO points_transactions (customer_id, type, points, balance_after, reason, created_at)
SELECT c.id, 'earned', v.points, v.points, v.reason, v.created_at
FROM (VALUES
  ('+60134836936', 60, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-15T08:21:00.000Z'::timestamptz),
  ('+60127554550', 1431, 'Migration from Zobaze (6 transactions, Aug 2025-Jan 2026)', '2026-01-15T05:26:00.000Z'::timestamptz),
  ('+60167113514', 354, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-06T10:02:00.000Z'::timestamptz),
  ('+60169070637', 1168, 'Migration from Zobaze (8 transactions, Aug 2025-Jan 2026)', '2025-10-14T08:24:00.000Z'::timestamptz),
  ('+60197808086', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-01T06:23:00.000Z'::timestamptz),
  ('+60197764340', 155, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-08-22T06:15:00.000Z'::timestamptz),
  ('+60177650040', 130, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-08T09:11:00.000Z'::timestamptz),
  ('+60197013269', 315, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2025-11-16T08:36:00.000Z'::timestamptz),
  ('+601117684710', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-01T08:45:00.000Z'::timestamptz),
  ('+60197555251', 230, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-01T09:32:00.000Z'::timestamptz),
  ('+60128010987', 60, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-17T03:27:00.000Z'::timestamptz),
  ('+60189435194', 260, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2026-01-24T09:51:00.000Z'::timestamptz),
  ('+60122773814', 499, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-02T09:36:00.000Z'::timestamptz),
  ('+601125800868', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-02T09:40:00.000Z'::timestamptz),
  ('+60145437894', 520, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-02T09:41:00.000Z'::timestamptz),
  ('+60197328842', 478, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-09-28T03:48:00.000Z'::timestamptz),
  ('+60189889237', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-03T04:07:00.000Z'::timestamptz),
  ('+60177023923', 160, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-03T05:19:00.000Z'::timestamptz),
  ('+60148264533', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-03T05:23:00.000Z'::timestamptz),
  ('+60133094266', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-03T06:15:00.000Z'::timestamptz),
  ('+60133407282', 360, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-03T07:17:00.000Z'::timestamptz),
  ('+60127373741', 500, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-08-03T07:24:00.000Z'::timestamptz),
  ('+60197116467', 389, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2025-12-22T09:38:00.000Z'::timestamptz),
  ('+60145070918', 63, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-03T09:24:00.000Z'::timestamptz),
  ('+60197851618', 1060, 'Migration from Zobaze (13 transactions, Aug 2025-Jan 2026)', '2026-01-31T04:31:00.000Z'::timestamptz),
  ('+60172690846', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-04T07:54:00.000Z'::timestamptz),
  ('+60127006912', 60, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-05T07:38:00.000Z'::timestamptz),
  ('+601114967875', 155, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-04T09:57:00.000Z'::timestamptz),
  ('+60197574741', 144, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-08-07T02:41:00.000Z'::timestamptz),
  ('+60197917133', 275, 'Migration from Zobaze (4 transactions, Aug 2025-Jan 2026)', '2026-01-08T03:33:00.000Z'::timestamptz),
  ('+60127611790', 105, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-05T09:06:00.000Z'::timestamptz),
  ('+60197518795', 279, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-06T10:06:00.000Z'::timestamptz),
  ('+60197776876', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-07T04:19:00.000Z'::timestamptz),
  ('+60149292327', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-07T06:57:00.000Z'::timestamptz),
  ('+601115336848', 105, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-24T08:15:00.000Z'::timestamptz),
  ('+60192316934', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-08T04:06:00.000Z'::timestamptz),
  ('+60184631735', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-08T05:34:00.000Z'::timestamptz),
  ('+60166447698', 40, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-08T06:55:00.000Z'::timestamptz),
  ('+60127259774', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-08T07:03:00.000Z'::timestamptz),
  ('+60127824907', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-08T07:43:00.000Z'::timestamptz),
  ('+60193148948', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-08T08:34:00.000Z'::timestamptz),
  ('+601119442560', 175, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-17T07:52:00.000Z'::timestamptz),
  ('+60197734585', 659, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-08T10:04:00.000Z'::timestamptz),
  ('+60127051252', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-09T04:09:00.000Z'::timestamptz),
  ('+60196660721', 300, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-08T03:59:00.000Z'::timestamptz),
  ('+60182301280', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-09T06:40:00.000Z'::timestamptz),
  ('+60136245351', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-09T06:55:00.000Z'::timestamptz),
  ('+60137754579', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-09T06:58:00.000Z'::timestamptz),
  ('+60137618785', 291, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-09T06:59:00.000Z'::timestamptz),
  ('+60127179915', 50, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-09T08:49:00.000Z'::timestamptz),
  ('+60197665322', 175, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-09T09:38:00.000Z'::timestamptz),
  ('+60139893740', 120, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-10T03:49:00.000Z'::timestamptz),
  ('+60136603961', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-10T04:29:00.000Z'::timestamptz),
  ('+60127978372', 130, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-10T09:37:00.000Z'::timestamptz),
  ('+60167353026', 284, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-10T09:53:00.000Z'::timestamptz),
  ('+60145135123', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-11T02:03:00.000Z'::timestamptz),
  ('+60192993227', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-11T07:37:00.000Z'::timestamptz),
  ('+60194775542', 252, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-11T09:11:00.000Z'::timestamptz),
  ('+60132399940', 470, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-12T07:39:00.000Z'::timestamptz),
  ('+60167722583', 113, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-10-05T05:34:00.000Z'::timestamptz),
  ('+601112879159', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-12T08:59:00.000Z'::timestamptz),
  ('+601164965496', 320, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-14T03:43:00.000Z'::timestamptz),
  ('+60111114374', 650, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2026-01-20T08:25:00.000Z'::timestamptz),
  ('+60187839294', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-15T03:30:00.000Z'::timestamptz),
  ('+60137787910', 160, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-15T04:49:00.000Z'::timestamptz),
  ('+601110807082', 210, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-09-18T07:38:00.000Z'::timestamptz),
  ('+60127429600', 135, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-16T05:10:00.000Z'::timestamptz),
  ('+60127127837', 110, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-16T05:24:00.000Z'::timestamptz),
  ('+60132298902', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-16T06:02:00.000Z'::timestamptz),
  ('+60127662874', 360, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-16T08:14:00.000Z'::timestamptz),
  ('+60197247212', 153, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-16T08:36:00.000Z'::timestamptz),
  ('+60198386139', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-16T08:56:00.000Z'::timestamptz),
  ('+60136014678', 230, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-16T09:02:00.000Z'::timestamptz),
  ('+60197367539', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-16T09:24:00.000Z'::timestamptz),
  ('+60197785466', 85, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-08-31T09:21:00.000Z'::timestamptz),
  ('+60197060642', 425, 'Migration from Zobaze (4 transactions, Aug 2025-Jan 2026)', '2026-01-25T05:08:00.000Z'::timestamptz),
  ('+601110993505', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-17T04:53:00.000Z'::timestamptz),
  ('+601139131505', 100, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-17T08:40:00.000Z'::timestamptz),
  ('+60192900944', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-17T09:18:00.000Z'::timestamptz),
  ('+60197200502', 40, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-18T07:03:00.000Z'::timestamptz),
  ('+60147761611', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-19T09:42:00.000Z'::timestamptz),
  ('+60192927094', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-21T03:05:00.000Z'::timestamptz),
  ('+60197549188', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-21T04:33:00.000Z'::timestamptz),
  ('+60197273961', 120, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-23T04:21:00.000Z'::timestamptz),
  ('+60183206978', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-21T09:49:00.000Z'::timestamptz),
  ('+60193113244', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-22T03:03:00.000Z'::timestamptz),
  ('+6090033695', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-22T03:11:00.000Z'::timestamptz),
  ('+60108290682', 319, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-22T05:25:00.000Z'::timestamptz),
  ('+60123302842', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-22T06:08:00.000Z'::timestamptz),
  ('+60197861958', 540, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-31T09:54:00.000Z'::timestamptz),
  ('+60132784903', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-23T03:54:00.000Z'::timestamptz),
  ('+60194443583', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-23T03:57:00.000Z'::timestamptz),
  ('+6014444975242', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-23T05:05:00.000Z'::timestamptz),
  ('+60127743591', 130, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-23T05:27:00.000Z'::timestamptz),
  ('+60109273907', 470, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-23T05:52:00.000Z'::timestamptz),
  ('+60197902721', 113, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-23T07:11:00.000Z'::timestamptz),
  ('+60177627172', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-23T07:57:00.000Z'::timestamptz),
  ('+6097669904', 1020, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2025-08-23T10:33:00.000Z'::timestamptz),
  ('+601136202004', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-23T08:45:00.000Z'::timestamptz),
  ('+601111401214', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-23T09:21:00.000Z'::timestamptz),
  ('+60197903005', 799, 'Migration from Zobaze (4 transactions, Aug 2025-Jan 2026)', '2026-01-30T09:43:00.000Z'::timestamptz),
  ('+60197513179', 560, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-31T07:34:00.000Z'::timestamptz),
  ('+60136993006', 260, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-27T03:24:00.000Z'::timestamptz),
  ('+60177600012', 202, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-24T07:44:00.000Z'::timestamptz),
  ('+60166630337', 495, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-24T08:14:00.000Z'::timestamptz),
  ('+60187828685', 779, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-24T09:16:00.000Z'::timestamptz),
  ('+60199419434', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-24T09:26:00.000Z'::timestamptz),
  ('+601164142077', 420, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-24T09:29:00.000Z'::timestamptz),
  ('+60137562121', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-25T06:31:00.000Z'::timestamptz),
  ('+60197464735', 550, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-25T06:37:00.000Z'::timestamptz),
  ('+60137976408', 125, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-09-25T08:09:00.000Z'::timestamptz),
  ('+60197797275', 788, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-07T03:40:00.000Z'::timestamptz),
  ('+60143105920', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-26T08:19:00.000Z'::timestamptz),
  ('+60194226021', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-28T07:21:00.000Z'::timestamptz),
  ('+60197746302', 230, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-09-20T05:46:00.000Z'::timestamptz),
  ('+60197212103', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-28T09:28:00.000Z'::timestamptz),
  ('+60197527494', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-29T02:46:00.000Z'::timestamptz),
  ('+60124994010', 171, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-29T04:00:00.000Z'::timestamptz),
  ('+601131794246', 162, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-29T08:05:00.000Z'::timestamptz),
  ('+601161703246', 216, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-29T08:24:00.000Z'::timestamptz),
  ('+60167714245', 386, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-29T10:21:00.000Z'::timestamptz),
  ('+60137355692', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-30T04:06:00.000Z'::timestamptz),
  ('+60137142712', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-30T04:37:00.000Z'::timestamptz),
  ('+60137556865', 68, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-30T05:57:00.000Z'::timestamptz),
  ('+601117647047', 68, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-30T06:49:00.000Z'::timestamptz),
  ('+60136090929', 320, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-21T09:58:00.000Z'::timestamptz),
  ('+60193912911', 486, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-30T09:22:00.000Z'::timestamptz),
  ('+60137111206', 298, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-10-04T09:29:00.000Z'::timestamptz),
  ('+60165722521', 68, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-30T09:59:00.000Z'::timestamptz),
  ('+601111246973', 200, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-31T04:03:00.000Z'::timestamptz),
  ('+60169266057', 184, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-08-31T05:04:00.000Z'::timestamptz),
  ('+60177080508', 865, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-02T09:24:00.000Z'::timestamptz),
  ('+60197503514', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-01T04:32:00.000Z'::timestamptz),
  ('+6001128983536', 162, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-01T05:32:00.000Z'::timestamptz),
  ('+60127280957', 116, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-01T05:45:00.000Z'::timestamptz),
  ('+60126220543', 212, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-01T06:24:00.000Z'::timestamptz),
  ('+60139487328', 112, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2025-09-01T07:07:00.000Z'::timestamptz),
  ('+60192343309', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-01T07:14:00.000Z'::timestamptz),
  ('+60137780451', 793, 'Migration from Zobaze (5 transactions, Aug 2025-Jan 2026)', '2026-01-02T06:51:00.000Z'::timestamptz),
  ('+60149045463', 48, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-01T09:32:00.000Z'::timestamptz),
  ('+60134922038', 285, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-02T04:27:00.000Z'::timestamptz),
  ('+60126261553', 719, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-01T09:09:00.000Z'::timestamptz),
  ('+601115130805', 301, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-02T10:21:00.000Z'::timestamptz),
  ('+60197788979', 68, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-04T03:44:00.000Z'::timestamptz),
  ('+60132899196', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-04T04:09:00.000Z'::timestamptz),
  ('+60168356554', 560, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-04T07:19:00.000Z'::timestamptz),
  ('+60167737068', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-04T07:44:00.000Z'::timestamptz),
  ('+60137151913', 261, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-05T04:18:00.000Z'::timestamptz),
  ('+601136805228', 135, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-05T04:20:00.000Z'::timestamptz),
  ('+60174003899', 142, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-05T04:22:00.000Z'::timestamptz),
  ('+60127222343', 315, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-05T04:23:00.000Z'::timestamptz),
  ('+60177530078', 167, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-05T06:13:00.000Z'::timestamptz),
  ('+60168272152', 68, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-05T07:21:00.000Z'::timestamptz),
  ('+60193736067', 40, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-05T07:53:00.000Z'::timestamptz),
  ('+60192174574', 176, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-05T08:42:00.000Z'::timestamptz),
  ('+601121739850', 319, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-10-25T03:33:00.000Z'::timestamptz),
  ('+60164392240', 239, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-06T05:40:00.000Z'::timestamptz),
  ('+60197173940', 221, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-06T05:42:00.000Z'::timestamptz),
  ('+60136458287', 492, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-06T06:09:00.000Z'::timestamptz),
  ('+601139606991', 498, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-10-23T05:15:00.000Z'::timestamptz),
  ('+60126763191', 188, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-09-18T10:08:00.000Z'::timestamptz),
  ('+60137169005', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-06T07:13:00.000Z'::timestamptz),
  ('+601140490442', 90, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-06T08:32:00.000Z'::timestamptz),
  ('+60137792594', 68, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-06T08:32:00.000Z'::timestamptz),
  ('+60139188958', 369, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-06T09:58:00.000Z'::timestamptz),
  ('+601115420889', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-07T03:30:00.000Z'::timestamptz),
  ('+60142756804', 1221, 'Migration from Zobaze (4 transactions, Aug 2025-Jan 2026)', '2025-12-28T04:45:00.000Z'::timestamptz),
  ('+601133104332', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-07T04:17:00.000Z'::timestamptz),
  ('+60127131595', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-07T05:47:00.000Z'::timestamptz),
  ('+60137335993', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-07T06:19:00.000Z'::timestamptz),
  ('+60184032876', 135, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-07T08:26:00.000Z'::timestamptz),
  ('+60134909749', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-07T09:04:00.000Z'::timestamptz),
  ('+60197754155', 123, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-07T09:26:00.000Z'::timestamptz),
  ('+60189158232', 450, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-07T10:32:00.000Z'::timestamptz),
  ('+60187855927', 162, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-08T03:42:00.000Z'::timestamptz),
  ('+60195771323', 68, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-08T07:18:00.000Z'::timestamptz),
  ('+60193692809', 225, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-08T07:52:00.000Z'::timestamptz),
  ('+601123708239', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-08T08:08:00.000Z'::timestamptz),
  ('+60197850095', 153, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-09T03:37:00.000Z'::timestamptz),
  ('+60134726952', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-09T06:38:00.000Z'::timestamptz),
  ('+60137759755', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-11T04:11:00.000Z'::timestamptz),
  ('+60167036006', 60, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-15T07:01:00.000Z'::timestamptz),
  ('+60136289609', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-11T05:03:00.000Z'::timestamptz),
  ('+60197503874', 149, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-11T05:48:00.000Z'::timestamptz),
  ('+60187811970', 205, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-11T08:32:00.000Z'::timestamptz),
  ('+60137574430', 285, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-11T09:13:00.000Z'::timestamptz),
  ('+601129547802', 275, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-11T09:18:00.000Z'::timestamptz),
  ('+60136341787', 415, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-22T06:19:00.000Z'::timestamptz),
  ('+60197726248', 341, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-12T05:56:00.000Z'::timestamptz),
  ('+60127008651', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-12T07:24:00.000Z'::timestamptz),
  ('+60164858503', 135, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-12T07:45:00.000Z'::timestamptz),
  ('+60134826331', 68, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-12T09:18:00.000Z'::timestamptz),
  ('+60125868144', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-13T03:06:00.000Z'::timestamptz),
  ('+60129723899', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-13T03:09:00.000Z'::timestamptz),
  ('+60167221784', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-13T04:48:00.000Z'::timestamptz),
  ('+601157459069', 234, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-13T05:37:00.000Z'::timestamptz),
  ('+60127467810', 299, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-09-13T08:29:00.000Z'::timestamptz),
  ('+60197333756', 290, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-13T06:27:00.000Z'::timestamptz),
  ('+60138247711', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-13T07:38:00.000Z'::timestamptz),
  ('+601137198937', 135, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-13T08:38:00.000Z'::timestamptz)
) AS v(phone, points, reason, created_at)
JOIN customers c ON c.phone = v.phone;

-- Points transactions batch 2/5
INSERT INTO points_transactions (customer_id, type, points, balance_after, reason, created_at)
SELECT c.id, 'earned', v.points, v.points, v.reason, v.created_at
FROM (VALUES
  ('+60177590987', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-13T09:21:00.000Z'::timestamptz),
  ('+60197706335', 68, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-14T04:42:00.000Z'::timestamptz),
  ('+60136792665', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-14T04:43:00.000Z'::timestamptz),
  ('+60174495972', 270, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-09-19T07:49:00.000Z'::timestamptz),
  ('+60132301826', 390, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-14T05:53:00.000Z'::timestamptz),
  ('+601151233792', 351, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-14T06:19:00.000Z'::timestamptz),
  ('+601161568896', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-14T07:23:00.000Z'::timestamptz),
  ('+60173343613', 369, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-14T09:46:00.000Z'::timestamptz),
  ('+60172722861', 374, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-09-15T10:21:00.000Z'::timestamptz),
  ('+60127699807', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-15T03:14:00.000Z'::timestamptz),
  ('+60137086527', 197, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-15T03:49:00.000Z'::timestamptz),
  ('+60189043562', 203, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-29T03:06:00.000Z'::timestamptz),
  ('+60167425696', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-15T05:11:00.000Z'::timestamptz),
  ('+60197755563', 351, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-05T04:46:00.000Z'::timestamptz),
  ('+60127124966', 68, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-15T06:30:00.000Z'::timestamptz),
  ('+60164056402', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-15T07:25:00.000Z'::timestamptz),
  ('+60197882035', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-15T08:00:00.000Z'::timestamptz),
  ('+601117366836', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-16T06:30:00.000Z'::timestamptz),
  ('+60137217376', 162, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-16T06:33:00.000Z'::timestamptz),
  ('+60187604619', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-16T07:41:00.000Z'::timestamptz),
  ('+60197727572', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-16T08:03:00.000Z'::timestamptz),
  ('+60127479417', 205, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-16T08:10:00.000Z'::timestamptz),
  ('+60167181140', 110, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-16T09:25:00.000Z'::timestamptz),
  ('+60137009356', 277, 'Migration from Zobaze (4 transactions, Aug 2025-Jan 2026)', '2026-01-15T09:31:00.000Z'::timestamptz),
  ('+60195588116', 68, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-16T10:06:00.000Z'::timestamptz),
  ('+60137143236', 60, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-13T04:29:00.000Z'::timestamptz),
  ('+60194512690', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-18T05:29:00.000Z'::timestamptz),
  ('+60177614898', 250, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-27T04:19:00.000Z'::timestamptz),
  ('+60166670686', 203, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-18T07:15:00.000Z'::timestamptz),
  ('+60193176736', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-18T07:23:00.000Z'::timestamptz),
  ('+60196632880', 60, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-08T08:27:00.000Z'::timestamptz),
  ('+60167337171', 60, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-05T09:18:00.000Z'::timestamptz),
  ('+60162573617', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-18T09:54:00.000Z'::timestamptz),
  ('+60168562905', 199, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-19T06:43:00.000Z'::timestamptz),
  ('+60137183718', 255, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-19T09:00:00.000Z'::timestamptz),
  ('+6089044090', 38, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-20T03:33:00.000Z'::timestamptz),
  ('+60197620103', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-20T03:34:00.000Z'::timestamptz),
  ('+60127331724', 145, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-20T04:33:00.000Z'::timestamptz),
  ('+60177951279', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-20T04:37:00.000Z'::timestamptz),
  ('+60127175082', 319, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-20T04:40:00.000Z'::timestamptz),
  ('+601110754184', 610, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2026-01-05T08:54:00.000Z'::timestamptz),
  ('+60145422575', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-20T06:49:00.000Z'::timestamptz),
  ('+60196186463', 250, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-20T08:48:00.000Z'::timestamptz),
  ('+601169335207', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-20T09:02:00.000Z'::timestamptz),
  ('+601111427604', 154, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-20T09:53:00.000Z'::timestamptz),
  ('+601118866460', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-20T09:54:00.000Z'::timestamptz),
  ('+60124653731', 190, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-21T05:09:00.000Z'::timestamptz),
  ('+601110996659', 259, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-21T06:04:00.000Z'::timestamptz),
  ('+60177995856', 300, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-21T06:23:00.000Z'::timestamptz),
  ('+60167370848', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-21T07:33:00.000Z'::timestamptz),
  ('+60104377512', 105, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-21T07:35:00.000Z'::timestamptz),
  ('+60134951554', 40, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-21T08:11:00.000Z'::timestamptz),
  ('+60108277605', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-21T08:37:00.000Z'::timestamptz),
  ('+60177522761', 188, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-21T08:42:00.000Z'::timestamptz),
  ('+60197000924', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-21T10:07:00.000Z'::timestamptz),
  ('+60129046862', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-22T04:30:00.000Z'::timestamptz),
  ('+60197796841', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-22T04:51:00.000Z'::timestamptz),
  ('+60192803763', 88, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-22T10:01:00.000Z'::timestamptz),
  ('+60137754242', 456, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-28T07:44:00.000Z'::timestamptz),
  ('+60123612532', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-23T06:54:00.000Z'::timestamptz),
  ('+60197424989', 190, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-23T08:43:00.000Z'::timestamptz),
  ('+60108896591', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-25T02:40:00.000Z'::timestamptz),
  ('+60193531231', 255, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-12T06:50:00.000Z'::timestamptz),
  ('+60197074759', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-25T07:49:00.000Z'::timestamptz),
  ('+60127220046', 484, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-09-27T06:00:00.000Z'::timestamptz),
  ('+60127910027', 110, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-26T02:48:00.000Z'::timestamptz),
  ('+60177779686', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-26T05:24:00.000Z'::timestamptz),
  ('+60137311150', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-26T06:17:00.000Z'::timestamptz),
  ('+6090664603', 290, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-26T06:28:00.000Z'::timestamptz),
  ('+60137297705', 350, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-26T07:01:00.000Z'::timestamptz),
  ('+60192333959', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-26T07:11:00.000Z'::timestamptz),
  ('+60139221967', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-26T08:57:00.000Z'::timestamptz),
  ('+60197072661', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-26T09:10:00.000Z'::timestamptz),
  ('+60127887245', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-26T09:30:00.000Z'::timestamptz),
  ('+60137282882', 382, 'Migration from Zobaze (4 transactions, Aug 2025-Jan 2026)', '2025-11-07T11:30:00.000Z'::timestamptz),
  ('+60185966400', 155, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T03:52:00.000Z'::timestamptz),
  ('+601111922441', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T04:37:00.000Z'::timestamptz),
  ('+60162629953', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T05:08:00.000Z'::timestamptz),
  ('+60177998428', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T05:54:00.000Z'::timestamptz),
  ('+60182037086', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T05:55:00.000Z'::timestamptz),
  ('+60167224651', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T06:18:00.000Z'::timestamptz),
  ('+60195594694', 195, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-25T07:01:00.000Z'::timestamptz),
  ('+60197917916', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T07:01:00.000Z'::timestamptz),
  ('+60177305076', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T07:49:00.000Z'::timestamptz),
  ('+60197362796', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T08:22:00.000Z'::timestamptz),
  ('+60132589487', 225, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T09:33:00.000Z'::timestamptz),
  ('+60177586976', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T09:38:00.000Z'::timestamptz),
  ('+601151118416', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T10:11:00.000Z'::timestamptz),
  ('+60169232242', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-27T10:12:00.000Z'::timestamptz),
  ('+60127334689', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-28T02:32:00.000Z'::timestamptz),
  ('+6093678734', 210, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2025-12-21T08:31:00.000Z'::timestamptz),
  ('+60148412019', 50, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-28T07:22:00.000Z'::timestamptz),
  ('+60162057179', 224, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-28T08:48:00.000Z'::timestamptz),
  ('+60136630857', 410, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-28T10:31:00.000Z'::timestamptz),
  ('+60197521275', 380, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-28T10:40:00.000Z'::timestamptz),
  ('+60127945294', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-29T02:38:00.000Z'::timestamptz),
  ('+60137312003', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-29T03:07:00.000Z'::timestamptz),
  ('+60134800662', 750, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-16T06:37:00.000Z'::timestamptz),
  ('+601123323735', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-29T08:30:00.000Z'::timestamptz),
  ('+60189044628', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-29T08:39:00.000Z'::timestamptz),
  ('+60127176504', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-30T03:18:00.000Z'::timestamptz),
  ('+601117733029', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-30T05:16:00.000Z'::timestamptz),
  ('+60187616904', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-30T06:40:00.000Z'::timestamptz),
  ('+60122449310', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-30T07:44:00.000Z'::timestamptz),
  ('+601140308370', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-09-30T08:59:00.000Z'::timestamptz),
  ('+601116409368', 108, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-06T10:01:00.000Z'::timestamptz),
  ('+601111123198', 130, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-02T04:37:00.000Z'::timestamptz),
  ('+60127910371', 40, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-02T04:54:00.000Z'::timestamptz),
  ('+60137431577', 60, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-29T06:11:00.000Z'::timestamptz),
  ('+60147750874', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-02T09:36:00.000Z'::timestamptz),
  ('+60127337081', 40, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-03T05:13:00.000Z'::timestamptz),
  ('+60104509353', 235, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-03T06:31:00.000Z'::timestamptz),
  ('+60197719834', 145, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-03T07:51:00.000Z'::timestamptz),
  ('+601161144692', 239, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-03T10:19:00.000Z'::timestamptz),
  ('+60146693800', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-04T03:17:00.000Z'::timestamptz),
  ('+60127870977', 130, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-04T05:04:00.000Z'::timestamptz),
  ('+60133431354', 350, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-04T05:19:00.000Z'::timestamptz),
  ('+60197103019', 90, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-04T05:22:00.000Z'::timestamptz),
  ('+60197717602', 520, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-04T05:24:00.000Z'::timestamptz),
  ('+601110766449', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-04T06:59:00.000Z'::timestamptz),
  ('+60123069095', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-04T08:43:00.000Z'::timestamptz),
  ('+60139504530', 229, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-04T09:23:00.000Z'::timestamptz),
  ('+60166635809', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-04T09:24:00.000Z'::timestamptz),
  ('+60137103005', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-04T10:08:00.000Z'::timestamptz),
  ('+60179709261', 680, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-04T10:44:00.000Z'::timestamptz),
  ('+60177047707', 130, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-05T04:02:00.000Z'::timestamptz),
  ('+60199195130', 184, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-05T05:33:00.000Z'::timestamptz),
  ('+601113077231', 310, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-05T06:23:00.000Z'::timestamptz),
  ('+60105689689', 520, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-04T08:06:00.000Z'::timestamptz),
  ('+6096680489', 1059, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-05T07:28:00.000Z'::timestamptz),
  ('+601137449459', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-05T07:50:00.000Z'::timestamptz),
  ('+60124102093', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-05T10:00:00.000Z'::timestamptz),
  ('+60182316531', 218, 'Migration from Zobaze (4 transactions, Aug 2025-Jan 2026)', '2026-01-13T04:08:00.000Z'::timestamptz),
  ('+60127249108', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-06T08:12:00.000Z'::timestamptz),
  ('+60197908089', 400, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-06T09:20:00.000Z'::timestamptz),
  ('+60179768644', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-06T09:22:00.000Z'::timestamptz),
  ('+601171102708', 140, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-06T06:07:00.000Z'::timestamptz),
  ('+60187626484', 430, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-07T09:05:00.000Z'::timestamptz),
  ('+60187868518', 650, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-07T09:18:00.000Z'::timestamptz),
  ('+60129183306', 50, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-09T03:14:00.000Z'::timestamptz),
  ('+601165561008', 48, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-09T07:35:00.000Z'::timestamptz),
  ('+60127511519', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-09T07:43:00.000Z'::timestamptz),
  ('+60135385375', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-09T09:13:00.000Z'::timestamptz),
  ('+60167323204', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-10T06:55:00.000Z'::timestamptz),
  ('+60197842461', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-10T09:36:00.000Z'::timestamptz),
  ('+60137213761', 299, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-11T04:01:00.000Z'::timestamptz),
  ('+60142325526', 378, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-11T04:04:00.000Z'::timestamptz),
  ('+60197256568', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-11T04:24:00.000Z'::timestamptz),
  ('+60189785174', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-11T04:57:00.000Z'::timestamptz),
  ('+60193635762', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-11T08:12:00.000Z'::timestamptz),
  ('+60102422627', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-12T02:56:00.000Z'::timestamptz),
  ('+60193264444', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-12T04:23:00.000Z'::timestamptz),
  ('+60133545813', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-12T04:50:00.000Z'::timestamptz),
  ('+60192477339', 330, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-12T05:30:00.000Z'::timestamptz),
  ('+60127763436', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-12T05:56:00.000Z'::timestamptz),
  ('+60126265850', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-12T07:09:00.000Z'::timestamptz),
  ('+601115420502', 90, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-11T08:51:00.000Z'::timestamptz),
  ('+60172509663', 350, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-12T08:37:00.000Z'::timestamptz),
  ('+60196669103', 140, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-12T09:00:00.000Z'::timestamptz),
  ('+60146382010', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-12T09:22:00.000Z'::timestamptz),
  ('+601126739269', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-12T09:46:00.000Z'::timestamptz),
  ('+601117507266', 655, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-10-18T03:20:00.000Z'::timestamptz),
  ('+60197140610', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-13T03:15:00.000Z'::timestamptz),
  ('+60164610150', 290, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-13T09:19:00.000Z'::timestamptz),
  ('+601169919391', 225, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-10-14T05:17:00.000Z'::timestamptz),
  ('+60126504954', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-14T06:43:00.000Z'::timestamptz),
  ('+601123097505', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-16T04:15:00.000Z'::timestamptz),
  ('+60123719065', 38, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-16T04:42:00.000Z'::timestamptz),
  ('+60177725157', 229, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-16T04:52:00.000Z'::timestamptz),
  ('+60179611587', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-16T05:44:00.000Z'::timestamptz),
  ('+601116202301', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-16T06:44:00.000Z'::timestamptz),
  ('+601137720241', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-16T09:04:00.000Z'::timestamptz),
  ('+60125973261', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-17T02:10:00.000Z'::timestamptz),
  ('+60137534357', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-17T06:31:00.000Z'::timestamptz),
  ('+60196164421', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-17T07:04:00.000Z'::timestamptz),
  ('+60107050464', 155, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-17T07:18:00.000Z'::timestamptz),
  ('+60133677335', 250, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-17T08:53:00.000Z'::timestamptz),
  ('+60149848979', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-17T09:52:00.000Z'::timestamptz),
  ('+60132380290', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-18T02:43:00.000Z'::timestamptz),
  ('+60193450422', 185, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2025-12-26T08:46:00.000Z'::timestamptz),
  ('+60167060913', 370, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-18T10:01:00.000Z'::timestamptz),
  ('+60137764551', 135, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-25T05:51:00.000Z'::timestamptz),
  ('+60145618263', 550, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-18T10:31:00.000Z'::timestamptz),
  ('+60137992332', 90, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-19T03:04:00.000Z'::timestamptz),
  ('+60194880249', 639, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-19T06:40:00.000Z'::timestamptz),
  ('+60133076930', 145, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-10-26T07:16:00.000Z'::timestamptz),
  ('+60146637506', 530, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-10-25T08:16:00.000Z'::timestamptz),
  ('+60197884720', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-19T08:58:00.000Z'::timestamptz),
  ('+60196174458', 18, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-19T09:15:00.000Z'::timestamptz),
  ('+60137629994', 429, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-19T09:55:00.000Z'::timestamptz),
  ('+601114419155', 779, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-19T10:34:00.000Z'::timestamptz),
  ('+60137868070', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-20T04:56:00.000Z'::timestamptz),
  ('+60127032427', 350, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-20T05:16:00.000Z'::timestamptz),
  ('+60199387079', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-20T05:44:00.000Z'::timestamptz),
  ('+60127763616', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-20T07:50:00.000Z'::timestamptz),
  ('+601117528806', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-20T09:46:00.000Z'::timestamptz),
  ('+60167828624', 950, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-20T09:52:00.000Z'::timestamptz),
  ('+60135333686', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-20T10:19:00.000Z'::timestamptz),
  ('+60137679698', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-21T02:02:00.000Z'::timestamptz),
  ('+60172636719', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-21T03:59:00.000Z'::timestamptz)
) AS v(phone, points, reason, created_at)
JOIN customers c ON c.phone = v.phone;

-- Points transactions batch 3/5
INSERT INTO points_transactions (customer_id, type, points, balance_after, reason, created_at)
SELECT c.id, 'earned', v.points, v.points, v.reason, v.created_at
FROM (VALUES
  ('+60187776417', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-21T05:25:00.000Z'::timestamptz),
  ('+60128007668', 375, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-21T08:37:00.000Z'::timestamptz),
  ('+60166661912', 102, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-21T08:46:00.000Z'::timestamptz),
  ('+60127383546', 358, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-21T09:04:00.000Z'::timestamptz),
  ('+60172203251', 120, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-19T07:41:00.000Z'::timestamptz),
  ('+60145187013', 400, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-21T10:16:00.000Z'::timestamptz),
  ('+60137447180', 60, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-29T04:11:00.000Z'::timestamptz),
  ('+60137022169', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-23T08:29:00.000Z'::timestamptz),
  ('+601111991362', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-24T04:11:00.000Z'::timestamptz),
  ('+60189594076', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-24T05:05:00.000Z'::timestamptz),
  ('+60137868838', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-24T05:10:00.000Z'::timestamptz),
  ('+60197700521', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-24T05:35:00.000Z'::timestamptz),
  ('+60127495501', 198, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-24T09:06:00.000Z'::timestamptz),
  ('+601155418022', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-25T02:27:00.000Z'::timestamptz),
  ('+60166415446', 359, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-22T06:21:00.000Z'::timestamptz),
  ('+60137787083', 120, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-25T04:23:00.000Z'::timestamptz),
  ('+60173284346', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-25T04:31:00.000Z'::timestamptz),
  ('+60123783286', 168, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-25T07:05:00.000Z'::timestamptz),
  ('+60137302166', 60, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-02T02:14:00.000Z'::timestamptz),
  ('+601111022566', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-25T07:49:00.000Z'::timestamptz),
  ('+60197595957', 209, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-25T09:27:00.000Z'::timestamptz),
  ('+601114792399', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-25T09:54:00.000Z'::timestamptz),
  ('+601111786188', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-26T03:54:00.000Z'::timestamptz),
  ('+60122550080', 305, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-26T04:44:00.000Z'::timestamptz),
  ('+60125225423', 335, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-08T04:01:00.000Z'::timestamptz),
  ('+60133631974', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-26T09:13:00.000Z'::timestamptz),
  ('+60147734080', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-26T09:49:00.000Z'::timestamptz),
  ('+60126240025', 105, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-26T10:07:00.000Z'::timestamptz),
  ('+60189797616', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-26T10:17:00.000Z'::timestamptz),
  ('+60127309578', 270, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-10-31T03:16:00.000Z'::timestamptz),
  ('+60176006879', 130, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-27T07:05:00.000Z'::timestamptz),
  ('+60137087695', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-27T08:10:00.000Z'::timestamptz),
  ('+601111739653', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-27T09:11:00.000Z'::timestamptz),
  ('+60136544395', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-27T09:39:00.000Z'::timestamptz),
  ('+60123678078', 200, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-28T03:52:00.000Z'::timestamptz),
  ('+60137593142', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-28T08:45:00.000Z'::timestamptz),
  ('+601127395400', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-28T09:12:00.000Z'::timestamptz),
  ('+60137764129', 300, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-30T04:36:00.000Z'::timestamptz),
  ('+60177466374', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-30T06:10:00.000Z'::timestamptz),
  ('+60137779770', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-30T06:11:00.000Z'::timestamptz),
  ('+60147744352', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-30T07:21:00.000Z'::timestamptz),
  ('+60143087879', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-30T07:34:00.000Z'::timestamptz),
  ('+60166885001', 59, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-31T04:18:00.000Z'::timestamptz),
  ('+60197065744', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-31T05:24:00.000Z'::timestamptz),
  ('+60137783205', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-31T05:34:00.000Z'::timestamptz),
  ('+60109080998', 210, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-28T09:50:00.000Z'::timestamptz),
  ('+60177608081', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-10-31T06:54:00.000Z'::timestamptz),
  ('+60127718393', 789, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-27T04:57:00.000Z'::timestamptz),
  ('+60193657945', 355, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2025-12-23T09:55:00.000Z'::timestamptz),
  ('+60137815760', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-01T03:44:00.000Z'::timestamptz),
  ('+60125392785', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-01T06:03:00.000Z'::timestamptz),
  ('+60197385454', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-01T06:08:00.000Z'::timestamptz),
  ('+60177281464', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-01T06:45:00.000Z'::timestamptz),
  ('+601171100701', 59, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-01T07:16:00.000Z'::timestamptz),
  ('+60174838483', 250, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-01T08:23:00.000Z'::timestamptz),
  ('+60177437847', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-01T08:55:00.000Z'::timestamptz),
  ('+60102900904', 95, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-01T09:04:00.000Z'::timestamptz),
  ('+60199686527', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-01T09:25:00.000Z'::timestamptz),
  ('+60177752048', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-01T09:28:00.000Z'::timestamptz),
  ('+60199373828', 169, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-02T03:18:00.000Z'::timestamptz),
  ('+60125406260', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-02T06:33:00.000Z'::timestamptz),
  ('+60187623834', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-02T07:32:00.000Z'::timestamptz),
  ('+60197106969', 640, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-02T07:34:00.000Z'::timestamptz),
  ('+60122979798', 540, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-02T08:14:00.000Z'::timestamptz),
  ('+60197956265', 455, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-02T08:40:00.000Z'::timestamptz),
  ('+60127496175', 178, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-02T08:43:00.000Z'::timestamptz),
  ('+601111463964', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-02T09:23:00.000Z'::timestamptz),
  ('+60127916578', 540, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-02T09:28:00.000Z'::timestamptz),
  ('+60197330328', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-02T09:47:00.000Z'::timestamptz),
  ('+601112749532', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-02T09:55:00.000Z'::timestamptz),
  ('+60109465172', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-03T05:58:00.000Z'::timestamptz),
  ('+601139565153', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-03T08:01:00.000Z'::timestamptz),
  ('+60134354835', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-03T08:03:00.000Z'::timestamptz),
  ('+60177993818', 410, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-03T10:06:00.000Z'::timestamptz),
  ('+60133583593', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-04T03:40:00.000Z'::timestamptz),
  ('+60177407798', 95, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-04T09:01:00.000Z'::timestamptz),
  ('+60177863238', 540, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-04T09:45:00.000Z'::timestamptz),
  ('+60137004183', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-04T10:05:00.000Z'::timestamptz),
  ('+60127902255', 1094, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2025-12-29T11:05:00.000Z'::timestamptz),
  ('+60197577560', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-05T09:38:00.000Z'::timestamptz),
  ('+60167257017', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-06T03:15:00.000Z'::timestamptz),
  ('+60197114168', 440, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-06T06:02:00.000Z'::timestamptz),
  ('+60187721382', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-06T09:08:00.000Z'::timestamptz),
  ('+60167174743', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-06T09:28:00.000Z'::timestamptz),
  ('+60162215756', 480, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-20T03:37:00.000Z'::timestamptz),
  ('+601137313186', 229, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-07T06:19:00.000Z'::timestamptz),
  ('+60176001497', 155, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-30T04:37:00.000Z'::timestamptz),
  ('+60177174456', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-07T07:06:00.000Z'::timestamptz),
  ('+60127347172', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-07T07:37:00.000Z'::timestamptz),
  ('+60165555700', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-07T09:26:00.000Z'::timestamptz),
  ('+60192018305', 25, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-08T02:15:00.000Z'::timestamptz),
  ('+60176552014', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-08T03:20:00.000Z'::timestamptz),
  ('+60177233183', 35, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-08T04:50:00.000Z'::timestamptz),
  ('+60193130907', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-08T05:14:00.000Z'::timestamptz),
  ('+60196356086', 220, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-08T05:44:00.000Z'::timestamptz),
  ('+60172785429', 105, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-08T06:26:00.000Z'::timestamptz),
  ('+601110905081', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-08T07:33:00.000Z'::timestamptz),
  ('+60182387905', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-08T07:37:00.000Z'::timestamptz),
  ('+601110746709', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-08T08:17:00.000Z'::timestamptz),
  ('+60182246477', 67, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-08T08:31:00.000Z'::timestamptz),
  ('+60172498354', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-08T08:50:00.000Z'::timestamptz),
  ('+60177228720', 370, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-09T05:12:00.000Z'::timestamptz),
  ('+60137138195', 155, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-09T05:13:00.000Z'::timestamptz),
  ('+60177243391', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-09T05:57:00.000Z'::timestamptz),
  ('+60177571692', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-09T07:03:00.000Z'::timestamptz),
  ('+60127367571', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-09T07:23:00.000Z'::timestamptz),
  ('+60177104396', 130, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-09T09:09:00.000Z'::timestamptz),
  ('+60123084262', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-09T09:10:00.000Z'::timestamptz),
  ('+601111114808', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-09T09:31:00.000Z'::timestamptz),
  ('+601117775006', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-10T05:43:00.000Z'::timestamptz),
  ('+60177440769', 234, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-10T10:29:00.000Z'::timestamptz),
  ('+60193663272', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-11T04:28:00.000Z'::timestamptz),
  ('+60134209209', 230, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-11T07:52:00.000Z'::timestamptz),
  ('+60127080315', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-11T08:17:00.000Z'::timestamptz),
  ('+60198449420', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-13T04:01:00.000Z'::timestamptz),
  ('+601126306543', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-13T05:35:00.000Z'::timestamptz),
  ('+60127319918', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-13T09:34:00.000Z'::timestamptz),
  ('+601137396434', 359, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-07T10:15:00.000Z'::timestamptz),
  ('+60197771385', 519, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-14T04:07:00.000Z'::timestamptz),
  ('+60179898181', 45, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-10T05:18:00.000Z'::timestamptz),
  ('+60145904553', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-15T02:21:00.000Z'::timestamptz),
  ('+601111400840', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-15T03:50:00.000Z'::timestamptz),
  ('+601160969274', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-15T03:50:00.000Z'::timestamptz),
  ('+60142216464', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-15T04:56:00.000Z'::timestamptz),
  ('+60102887027', 483, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-15T05:50:00.000Z'::timestamptz),
  ('+60145623035', 135, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-23T09:17:00.000Z'::timestamptz),
  ('+601161719441', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-15T09:30:00.000Z'::timestamptz),
  ('+60197508584', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-16T03:45:00.000Z'::timestamptz),
  ('+601125683140', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-16T04:15:00.000Z'::timestamptz),
  ('+601126940017', 50, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-16T04:18:00.000Z'::timestamptz),
  ('+60177917396', 120, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-14T08:41:00.000Z'::timestamptz),
  ('+60184696692', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-16T05:26:00.000Z'::timestamptz),
  ('+601110887815', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-16T06:19:00.000Z'::timestamptz),
  ('+601154169716', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-16T06:47:00.000Z'::timestamptz),
  ('+60136715153', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-16T07:37:00.000Z'::timestamptz),
  ('+60124897793', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-16T07:56:00.000Z'::timestamptz),
  ('+60129658472', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-16T08:58:00.000Z'::timestamptz),
  ('+601111315464', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-16T09:43:00.000Z'::timestamptz),
  ('+60132180147', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-17T02:49:00.000Z'::timestamptz),
  ('+60132116202', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-17T04:24:00.000Z'::timestamptz),
  ('+60182705411', 40, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-17T04:26:00.000Z'::timestamptz),
  ('+60197205804', 390, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-17T04:37:00.000Z'::timestamptz),
  ('+60139662307', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-17T04:45:00.000Z'::timestamptz),
  ('+60197883937', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-17T07:12:00.000Z'::timestamptz),
  ('+601110055706', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-17T07:51:00.000Z'::timestamptz),
  ('+60189730364', 349, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-17T10:53:00.000Z'::timestamptz),
  ('+60197781175', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-18T08:12:00.000Z'::timestamptz),
  ('+60183868085', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-18T08:37:00.000Z'::timestamptz),
  ('+60177114764', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-18T09:25:00.000Z'::timestamptz),
  ('+601111779796', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-20T03:09:00.000Z'::timestamptz),
  ('+60103531616', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-20T03:54:00.000Z'::timestamptz),
  ('+60127159328', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-20T04:57:00.000Z'::timestamptz),
  ('+60177168695', 295, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-20T08:15:00.000Z'::timestamptz),
  ('+60178412808', 549, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-20T09:01:00.000Z'::timestamptz),
  ('+60197323775', 510, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-20T09:09:00.000Z'::timestamptz),
  ('+601111428805', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-20T09:49:00.000Z'::timestamptz),
  ('+60182196366', 599, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-26T07:37:00.000Z'::timestamptz),
  ('+60127531483', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-21T05:13:00.000Z'::timestamptz),
  ('+60137279335', 100, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-21T05:24:00.000Z'::timestamptz),
  ('+60122493850', 530, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-21T05:52:00.000Z'::timestamptz),
  ('+60132224052', 360, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-21T07:11:00.000Z'::timestamptz),
  ('+60137215212', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-21T07:13:00.000Z'::timestamptz),
  ('+60174330407', 450, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-21T09:13:00.000Z'::timestamptz),
  ('+60197020240', 105, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-22T07:19:00.000Z'::timestamptz),
  ('+601158304785', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-22T07:52:00.000Z'::timestamptz),
  ('+601161160939', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-23T03:51:00.000Z'::timestamptz),
  ('+601112719416', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-23T04:34:00.000Z'::timestamptz),
  ('+60123175415', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-23T05:26:00.000Z'::timestamptz),
  ('+601128425658', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-23T06:38:00.000Z'::timestamptz),
  ('+60145457970', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-23T07:02:00.000Z'::timestamptz),
  ('+60197777830', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-23T07:44:00.000Z'::timestamptz),
  ('+60127790035', 330, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-11-27T04:17:00.000Z'::timestamptz),
  ('+601133251152', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-24T05:54:00.000Z'::timestamptz),
  ('+60197978940', 309, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-24T05:56:00.000Z'::timestamptz),
  ('+60175099859', 45, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-31T03:13:00.000Z'::timestamptz),
  ('+60177013943', 115, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-24T07:02:00.000Z'::timestamptz),
  ('+60194702603', 185, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-24T07:50:00.000Z'::timestamptz),
  ('+60122733340', 77, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-24T09:12:00.000Z'::timestamptz),
  ('+60199936481', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-25T02:19:00.000Z'::timestamptz),
  ('+60137280951', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-25T03:39:00.000Z'::timestamptz),
  ('+6098608703', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-25T04:25:00.000Z'::timestamptz),
  ('+60137732882', 109, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-25T05:43:00.000Z'::timestamptz),
  ('+60176010457', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-25T05:45:00.000Z'::timestamptz),
  ('+601137693107', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-27T04:22:00.000Z'::timestamptz),
  ('+60193759947', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-27T05:01:00.000Z'::timestamptz),
  ('+60127878452', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-27T07:36:00.000Z'::timestamptz),
  ('+60184733650', 173, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-27T08:35:00.000Z'::timestamptz),
  ('+60197352773', 125, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-27T09:05:00.000Z'::timestamptz),
  ('+60197720350', 105, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-27T10:11:00.000Z'::timestamptz),
  ('+60124194984', 190, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-28T08:00:00.000Z'::timestamptz),
  ('+60182667716', 65, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-28T08:27:00.000Z'::timestamptz),
  ('+6091897225', 360, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-28T08:48:00.000Z'::timestamptz),
  ('+60132197187', 640, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-28T08:53:00.000Z'::timestamptz),
  ('+601115072601', 199, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-28T08:58:00.000Z'::timestamptz),
  ('+60127295520', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-28T09:30:00.000Z'::timestamptz),
  ('+601160515730', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-28T09:34:00.000Z'::timestamptz),
  ('+60174755534', 22, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-29T02:24:00.000Z'::timestamptz),
  ('+60162278814', 325, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-29T06:23:00.000Z'::timestamptz),
  ('+60123294535', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-29T06:50:00.000Z'::timestamptz),
  ('+60182776099', 50, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-29T07:33:00.000Z'::timestamptz)
) AS v(phone, points, reason, created_at)
JOIN customers c ON c.phone = v.phone;

-- Points transactions batch 4/5
INSERT INTO points_transactions (customer_id, type, points, balance_after, reason, created_at)
SELECT c.id, 'earned', v.points, v.points, v.reason, v.created_at
FROM (VALUES
  ('+60143428292', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-29T08:25:00.000Z'::timestamptz),
  ('+60173563087', 50, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-29T08:39:00.000Z'::timestamptz),
  ('+601127802557', 135, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-30T03:05:00.000Z'::timestamptz),
  ('+60127989191', 105, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-30T04:55:00.000Z'::timestamptz),
  ('+60179876985', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-30T07:03:00.000Z'::timestamptz),
  ('+60165269363', 185, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-30T07:12:00.000Z'::timestamptz),
  ('+60128207319', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-30T08:38:00.000Z'::timestamptz),
  ('+60137462473', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-30T08:42:00.000Z'::timestamptz),
  ('+601117777596', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-30T10:32:00.000Z'::timestamptz),
  ('+601110656854', 65, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-11-30T10:35:00.000Z'::timestamptz),
  ('+60182844642', 185, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-01T04:55:00.000Z'::timestamptz),
  ('+60133735785', 145, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-01T06:40:00.000Z'::timestamptz),
  ('+60127682040', 429, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-01T07:21:00.000Z'::timestamptz),
  ('+60122916712', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-01T07:34:00.000Z'::timestamptz),
  ('+60197812198', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-01T08:38:00.000Z'::timestamptz),
  ('+60175710871', 160, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-02T09:49:00.000Z'::timestamptz),
  ('+60146196433', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-04T02:50:00.000Z'::timestamptz),
  ('+60192715322', 382, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-04T05:25:00.000Z'::timestamptz),
  ('+60192683246', 110, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-04T08:16:00.000Z'::timestamptz),
  ('+60137792974', 320, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-04T08:34:00.000Z'::timestamptz),
  ('+60167642644', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-04T08:53:00.000Z'::timestamptz),
  ('+60177437107', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-04T09:14:00.000Z'::timestamptz),
  ('+60137746735', 185, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-30T06:17:00.000Z'::timestamptz),
  ('+60162383801', 229, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-05T04:49:00.000Z'::timestamptz),
  ('+60127302608', 305, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-05T06:31:00.000Z'::timestamptz),
  ('+601129335317', 280, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-05T07:10:00.000Z'::timestamptz),
  ('+60165125641', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-05T09:18:00.000Z'::timestamptz),
  ('+60199732611', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-05T09:34:00.000Z'::timestamptz),
  ('+60177633507', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-05T09:55:00.000Z'::timestamptz),
  ('+60137564383', 405, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-06T04:50:00.000Z'::timestamptz),
  ('+60137770078', 175, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-06T05:11:00.000Z'::timestamptz),
  ('+60126307819', 898, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-06T06:31:00.000Z'::timestamptz),
  ('+60129151969', 155, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-06T06:53:00.000Z'::timestamptz),
  ('+601114129210', 465, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-06T08:47:00.000Z'::timestamptz),
  ('+60177509272', 409, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-06T08:51:00.000Z'::timestamptz),
  ('+60125895277', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-06T09:43:00.000Z'::timestamptz),
  ('+60122840517', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-06T09:59:00.000Z'::timestamptz),
  ('+601110977805', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-07T04:18:00.000Z'::timestamptz),
  ('+601137778556', 57, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-07T04:19:00.000Z'::timestamptz),
  ('+601136562751', 558, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-07T05:59:00.000Z'::timestamptz),
  ('+60127394005', 115, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-07T07:14:00.000Z'::timestamptz),
  ('+60139131706', 155, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-07T08:44:00.000Z'::timestamptz),
  ('+60136612366', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-07T09:57:00.000Z'::timestamptz),
  ('+60128270872', 279, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-07T10:01:00.000Z'::timestamptz),
  ('+60148051831', 400, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-07T10:55:00.000Z'::timestamptz),
  ('+60167130849', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-08T03:37:00.000Z'::timestamptz),
  ('+60137001753', 1060, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-08T11:10:00.000Z'::timestamptz),
  ('+60197496746', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-09T02:25:00.000Z'::timestamptz),
  ('+601121786088', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-09T07:10:00.000Z'::timestamptz),
  ('+601137318248', 300, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-09T11:26:00.000Z'::timestamptz),
  ('+60127442128', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-11T04:56:00.000Z'::timestamptz),
  ('+60177912305', 450, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-11T07:21:00.000Z'::timestamptz),
  ('+601127664136', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-11T08:29:00.000Z'::timestamptz),
  ('+60197106971', 290, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-11T10:20:00.000Z'::timestamptz),
  ('+60197702865', 430, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-18T08:50:00.000Z'::timestamptz),
  ('+60142525732', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-13T02:52:00.000Z'::timestamptz),
  ('+609277655116', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-13T03:52:00.000Z'::timestamptz),
  ('+60139121045', 38, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-13T04:29:00.000Z'::timestamptz),
  ('+60182445650', 229, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-13T06:53:00.000Z'::timestamptz),
  ('+60167955951', 195, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-14T08:53:00.000Z'::timestamptz),
  ('+60199102383', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-13T07:38:00.000Z'::timestamptz),
  ('+60125509491', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-13T07:39:00.000Z'::timestamptz),
  ('+60173732162', 50, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-14T03:02:00.000Z'::timestamptz),
  ('+60149321546', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-14T03:05:00.000Z'::timestamptz),
  ('+60173675643', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-14T07:27:00.000Z'::timestamptz),
  ('+60193148978', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-14T10:02:00.000Z'::timestamptz),
  ('+601165511017', 69, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-15T02:41:00.000Z'::timestamptz),
  ('+60177043603', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-15T03:00:00.000Z'::timestamptz),
  ('+60177941628', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-15T03:33:00.000Z'::timestamptz),
  ('+60197788829', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-15T04:42:00.000Z'::timestamptz),
  ('+60104022726', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-15T05:06:00.000Z'::timestamptz),
  ('+60186631630', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-15T06:27:00.000Z'::timestamptz),
  ('+60197288264', 100, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-15T06:57:00.000Z'::timestamptz),
  ('+601132015740', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-15T10:25:00.000Z'::timestamptz),
  ('+60137575014', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-16T02:11:00.000Z'::timestamptz),
  ('+601139224098', 130, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-16T06:10:00.000Z'::timestamptz),
  ('+60133341998', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-16T07:07:00.000Z'::timestamptz),
  ('+60129454205', 90, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-16T07:31:00.000Z'::timestamptz),
  ('+60104071906', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-16T09:06:00.000Z'::timestamptz),
  ('+60132914149', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-16T09:37:00.000Z'::timestamptz),
  ('+60177467994', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-18T06:28:00.000Z'::timestamptz),
  ('+601115726986', 245, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-18T07:08:00.000Z'::timestamptz),
  ('+60183644329', 334, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-18T10:01:00.000Z'::timestamptz),
  ('+60193148617', 185, 'Migration from Zobaze (3 transactions, Aug 2025-Jan 2026)', '2026-01-09T02:52:00.000Z'::timestamptz),
  ('+6097909273', 345, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-19T07:36:00.000Z'::timestamptz),
  ('+60197557923', 90, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-19T08:49:00.000Z'::timestamptz),
  ('+60177823486', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-19T08:57:00.000Z'::timestamptz),
  ('+60167659872', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-19T09:23:00.000Z'::timestamptz),
  ('+60129607593', 339, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-20T04:17:00.000Z'::timestamptz),
  ('+60177338337', 138, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-20T04:56:00.000Z'::timestamptz),
  ('+60177629297', 469, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-20T08:23:00.000Z'::timestamptz),
  ('+6082010463', 400, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-20T10:22:00.000Z'::timestamptz),
  ('+60125601095', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-21T04:46:00.000Z'::timestamptz),
  ('+60197230507', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-21T04:46:00.000Z'::timestamptz),
  ('+60189546673', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-21T05:18:00.000Z'::timestamptz),
  ('+601161247428', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-21T06:48:00.000Z'::timestamptz),
  ('+60182917665', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-21T08:01:00.000Z'::timestamptz),
  ('+601161306998', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-21T08:20:00.000Z'::timestamptz),
  ('+60137124212', 38, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-22T03:11:00.000Z'::timestamptz),
  ('+60167167878', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-22T05:18:00.000Z'::timestamptz),
  ('+60177635586', 245, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-22T06:15:00.000Z'::timestamptz),
  ('+60127913299', 190, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-22T06:16:00.000Z'::timestamptz),
  ('+601137328902', 140, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-22T07:50:00.000Z'::timestamptz),
  ('+60116210016', 358, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-22T07:53:00.000Z'::timestamptz),
  ('+60111127471', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-22T07:59:00.000Z'::timestamptz),
  ('+60178340479', 184, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-22T08:14:00.000Z'::timestamptz),
  ('+60177611645', 500, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-22T08:47:00.000Z'::timestamptz),
  ('+601113275473', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-23T04:49:00.000Z'::timestamptz),
  ('+60177990029', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-23T06:12:00.000Z'::timestamptz),
  ('+601165115501', 50, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-23T06:14:00.000Z'::timestamptz),
  ('+60197610768', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-23T08:05:00.000Z'::timestamptz),
  ('+601121543451', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-23T08:53:00.000Z'::timestamptz),
  ('+60183614165', 135, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-25T06:55:00.000Z'::timestamptz),
  ('+60176575878', 385, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-25T06:58:00.000Z'::timestamptz),
  ('+60167089011', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-25T06:59:00.000Z'::timestamptz),
  ('+60137922017', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-25T07:00:00.000Z'::timestamptz),
  ('+60102183775', 190, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-25T07:05:00.000Z'::timestamptz),
  ('+60172329586', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-25T07:25:00.000Z'::timestamptz),
  ('+601128672527', 65, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-25T07:46:00.000Z'::timestamptz),
  ('+601163908089', 150, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-25T09:42:00.000Z'::timestamptz),
  ('+60177079700', 280, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-25T10:24:00.000Z'::timestamptz),
  ('+60137792784', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-26T03:11:00.000Z'::timestamptz),
  ('+60173283752', 120, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-26T05:38:00.000Z'::timestamptz),
  ('+60127979576', 173, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-26T07:15:00.000Z'::timestamptz),
  ('+60197562396', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-26T08:03:00.000Z'::timestamptz),
  ('+601119862746', 340, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-26T08:26:00.000Z'::timestamptz),
  ('+60137955990', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-26T09:37:00.000Z'::timestamptz),
  ('+60197615011', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-27T02:57:00.000Z'::timestamptz),
  ('+60137811116', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-27T03:44:00.000Z'::timestamptz),
  ('+601110302776', 662, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-11T04:30:00.000Z'::timestamptz),
  ('+60137143812', 100, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-27T05:47:00.000Z'::timestamptz),
  ('+601127391844', 310, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-27T07:09:00.000Z'::timestamptz),
  ('+601111486287', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-27T07:11:00.000Z'::timestamptz),
  ('+60197409880', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-27T08:20:00.000Z'::timestamptz),
  ('+60127565955', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-27T09:23:00.000Z'::timestamptz),
  ('+60165962440', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-27T09:33:00.000Z'::timestamptz),
  ('+601113350953', 159, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-28T02:06:00.000Z'::timestamptz),
  ('+60195300712', 120, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-28T03:18:00.000Z'::timestamptz),
  ('+60137780030', 400, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-28T04:41:00.000Z'::timestamptz),
  ('+6097238285', 830, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-28T07:54:00.000Z'::timestamptz),
  ('+601161199370', 65, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-28T08:27:00.000Z'::timestamptz),
  ('+60197617017', 320, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-28T09:16:00.000Z'::timestamptz),
  ('+60196879462', 155, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-28T09:20:00.000Z'::timestamptz),
  ('+601110402459', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-28T09:48:00.000Z'::timestamptz),
  ('+60197769196', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-29T02:52:00.000Z'::timestamptz),
  ('+601111428673', 230, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-29T03:56:00.000Z'::timestamptz),
  ('+601131791240', 428, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-29T04:11:00.000Z'::timestamptz),
  ('+60177247559', 120, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-29T05:41:00.000Z'::timestamptz),
  ('+601156663045', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-29T06:53:00.000Z'::timestamptz),
  ('+601118505386', 350, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-29T06:57:00.000Z'::timestamptz),
  ('+601112105933', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-29T07:21:00.000Z'::timestamptz),
  ('+60123171960', 90, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-29T08:08:00.000Z'::timestamptz),
  ('+60129018253', 245, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-29T09:48:00.000Z'::timestamptz),
  ('+60177456169', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-29T10:03:00.000Z'::timestamptz),
  ('+60138535321', 620, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-29T11:34:00.000Z'::timestamptz),
  ('+601120563914', 320, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2025-12-30T07:10:00.000Z'::timestamptz),
  ('+60127201517', 819, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-30T07:09:00.000Z'::timestamptz),
  ('+6081319761', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-30T08:28:00.000Z'::timestamptz),
  ('+601156812663', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-30T09:06:00.000Z'::timestamptz),
  ('+60175845512', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-30T09:36:00.000Z'::timestamptz),
  ('+60129070601', 240, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2025-12-30T10:29:00.000Z'::timestamptz),
  ('+60177449342', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-01T03:16:00.000Z'::timestamptz),
  ('+601132571188', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-01T06:12:00.000Z'::timestamptz),
  ('+60172302414', 414, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-01T06:51:00.000Z'::timestamptz),
  ('+601139164054', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-01T07:04:00.000Z'::timestamptz),
  ('+60196497956', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-01T07:20:00.000Z'::timestamptz),
  ('+60197542303', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-01T08:44:00.000Z'::timestamptz),
  ('+60127767871', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-01T09:13:00.000Z'::timestamptz),
  ('+60137821883', 284, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-01T10:13:00.000Z'::timestamptz),
  ('+60125135772', 115, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-01T10:24:00.000Z'::timestamptz),
  ('+60175385612', 90, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-02T03:55:00.000Z'::timestamptz),
  ('+60127682690', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-02T04:18:00.000Z'::timestamptz),
  ('+60177021874', 610, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-02T05:55:00.000Z'::timestamptz),
  ('+601136734105', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-02T06:18:00.000Z'::timestamptz),
  ('+60127065584', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-02T06:19:00.000Z'::timestamptz),
  ('+60177879005', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-02T06:27:00.000Z'::timestamptz),
  ('+60192417796', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-02T06:30:00.000Z'::timestamptz),
  ('+601110290105', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-02T08:15:00.000Z'::timestamptz),
  ('+60137991938', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-02T09:43:00.000Z'::timestamptz),
  ('+60139735876', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-03T04:51:00.000Z'::timestamptz),
  ('+601112883715', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-03T05:12:00.000Z'::timestamptz),
  ('+601112949972', 309, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-03T05:12:00.000Z'::timestamptz),
  ('+60177261800', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-03T05:15:00.000Z'::timestamptz),
  ('+60134547777', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-03T06:33:00.000Z'::timestamptz),
  ('+60197750949', 368, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-03T06:47:00.000Z'::timestamptz),
  ('+601127346536', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-03T08:27:00.000Z'::timestamptz),
  ('+60146154864', 7, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-03T08:43:00.000Z'::timestamptz),
  ('+60187837410', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-03T09:09:00.000Z'::timestamptz),
  ('+60196669673', 299, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-03T09:22:00.000Z'::timestamptz),
  ('+60172828852', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-03T09:27:00.000Z'::timestamptz),
  ('+60174541161', 65, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-04T03:27:00.000Z'::timestamptz),
  ('+60132886912', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-04T04:30:00.000Z'::timestamptz),
  ('+601140336084', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-04T06:05:00.000Z'::timestamptz),
  ('+60137715722', 380, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-04T06:17:00.000Z'::timestamptz),
  ('+60196496204', 428, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-04T06:32:00.000Z'::timestamptz),
  ('+60182894085', 100, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-04T08:04:00.000Z'::timestamptz),
  ('+60177191145', 90, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-04T08:48:00.000Z'::timestamptz),
  ('+60199529716', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-04T09:13:00.000Z'::timestamptz),
  ('+601121965807', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-04T09:37:00.000Z'::timestamptz),
  ('+60137500214', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-05T04:01:00.000Z'::timestamptz)
) AS v(phone, points, reason, created_at)
JOIN customers c ON c.phone = v.phone;

-- Points transactions batch 5/5
INSERT INTO points_transactions (customer_id, type, points, balance_after, reason, created_at)
SELECT c.id, 'earned', v.points, v.points, v.reason, v.created_at
FROM (VALUES
  ('+601111145078', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-05T06:34:00.000Z'::timestamptz),
  ('+60137875720', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-05T06:57:00.000Z'::timestamptz),
  ('+60145140816', 50, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-05T08:39:00.000Z'::timestamptz),
  ('+60173453025', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-05T09:06:00.000Z'::timestamptz),
  ('+60197178118', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-06T04:44:00.000Z'::timestamptz),
  ('+60196637090', 210, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-06T05:01:00.000Z'::timestamptz),
  ('+60126729227', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-06T05:37:00.000Z'::timestamptz),
  ('+60169935487', 160, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-06T05:56:00.000Z'::timestamptz),
  ('+60189766130', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-06T08:19:00.000Z'::timestamptz),
  ('+60137491707', 280, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-06T09:07:00.000Z'::timestamptz),
  ('+60127148281', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-06T09:59:00.000Z'::timestamptz),
  ('+60424610996', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-06T10:17:00.000Z'::timestamptz),
  ('+60197511506', 100, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-06T10:21:00.000Z'::timestamptz),
  ('+60127611359', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-08T04:38:00.000Z'::timestamptz),
  ('+60123961423', 350, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-08T04:59:00.000Z'::timestamptz),
  ('+60197915206', 155, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-08T05:37:00.000Z'::timestamptz),
  ('+60177217758', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-08T05:48:00.000Z'::timestamptz),
  ('+60127705605', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-08T06:30:00.000Z'::timestamptz),
  ('+60145377092', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-08T07:33:00.000Z'::timestamptz),
  ('+60137672509', 250, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-08T08:08:00.000Z'::timestamptz),
  ('+60127801610', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-08T08:46:00.000Z'::timestamptz),
  ('+60137066540', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-08T09:34:00.000Z'::timestamptz),
  ('+60193745093', 339, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-08T10:06:00.000Z'::timestamptz),
  ('+60142138132', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-09T04:20:00.000Z'::timestamptz),
  ('+60187721356', 220, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-09T04:48:00.000Z'::timestamptz),
  ('+60192685654', 280, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-09T08:24:00.000Z'::timestamptz),
  ('+60127314668', 210, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-09T09:42:00.000Z'::timestamptz),
  ('+60168066831', 239, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-09T10:41:00.000Z'::timestamptz),
  ('+60197782839', 118, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-09T11:19:00.000Z'::timestamptz),
  ('+60137777031', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-10T03:14:00.000Z'::timestamptz),
  ('+60177331814', 339, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-10T04:44:00.000Z'::timestamptz),
  ('+601117563460', 200, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-10T06:32:00.000Z'::timestamptz),
  ('+60143542429', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-10T08:42:00.000Z'::timestamptz),
  ('+601131405233', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-10T09:21:00.000Z'::timestamptz),
  ('+60177743933', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-10T09:45:00.000Z'::timestamptz),
  ('+601127888479', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-10T09:50:00.000Z'::timestamptz),
  ('+60196008891', 80, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-10T09:55:00.000Z'::timestamptz),
  ('+60177493606', 53, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-10T10:22:00.000Z'::timestamptz),
  ('+601133452481', 368, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-10T10:41:00.000Z'::timestamptz),
  ('+60125821357', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T02:56:00.000Z'::timestamptz),
  ('+60135859464', 120, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T04:22:00.000Z'::timestamptz),
  ('+60197822330', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T05:02:00.000Z'::timestamptz),
  ('+60197189157', 235, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T05:09:00.000Z'::timestamptz),
  ('+60108679233', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T05:24:00.000Z'::timestamptz),
  ('+60127077300', 210, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T06:41:00.000Z'::timestamptz),
  ('+60129780835', 105, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T07:20:00.000Z'::timestamptz),
  ('+60176940076', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T07:35:00.000Z'::timestamptz),
  ('+60184087345', 48, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T08:19:00.000Z'::timestamptz),
  ('+601117779194', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T09:21:00.000Z'::timestamptz),
  ('+60197456303', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T09:24:00.000Z'::timestamptz),
  ('+601156369125', 76, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T09:39:00.000Z'::timestamptz),
  ('+60197444032', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-11T09:59:00.000Z'::timestamptz),
  ('+60197127986', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-12T03:22:00.000Z'::timestamptz),
  ('+60137526609', 280, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-12T06:51:00.000Z'::timestamptz),
  ('+60137707315', 600, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-12T15:35:00.000Z'::timestamptz),
  ('+60143304618', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-13T06:52:00.000Z'::timestamptz),
  ('+601121709010', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-13T07:53:00.000Z'::timestamptz),
  ('+60148261607', 350, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-22T10:02:00.000Z'::timestamptz),
  ('+60139856101', 200, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-15T10:17:00.000Z'::timestamptz),
  ('+60127005316', 900, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-15T10:43:00.000Z'::timestamptz),
  ('+601112736041', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-16T03:25:00.000Z'::timestamptz),
  ('+60127410120', 229, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-16T04:54:00.000Z'::timestamptz),
  ('+60137728875', 200, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-16T05:15:00.000Z'::timestamptz),
  ('+60164006752', 190, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-16T05:22:00.000Z'::timestamptz),
  ('+601137770867', 428, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-16T08:58:00.000Z'::timestamptz),
  ('+601124301107', 269, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-16T09:17:00.000Z'::timestamptz),
  ('+60177122154', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-17T04:22:00.000Z'::timestamptz),
  ('+601114439943', 50, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-17T05:30:00.000Z'::timestamptz),
  ('+60108947280', 589, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-17T06:08:00.000Z'::timestamptz),
  ('+60137300430', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-17T06:49:00.000Z'::timestamptz),
  ('+60127683406', 378, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-17T08:20:00.000Z'::timestamptz),
  ('+60177010776', 85, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-17T08:54:00.000Z'::timestamptz),
  ('+60177056533', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-18T01:56:00.000Z'::timestamptz),
  ('+60142828265', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-18T03:00:00.000Z'::timestamptz),
  ('+60177408626', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-18T03:33:00.000Z'::timestamptz),
  ('+60194137470', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-18T03:53:00.000Z'::timestamptz),
  ('+60134601302', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-18T04:21:00.000Z'::timestamptz),
  ('+60137081632', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-18T05:08:00.000Z'::timestamptz),
  ('+60127780853', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-18T05:29:00.000Z'::timestamptz),
  ('+60102261084', 1158, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-18T06:39:00.000Z'::timestamptz),
  ('+60195474035', 315, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-18T06:45:00.000Z'::timestamptz),
  ('+60102424239', 200, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-18T06:46:00.000Z'::timestamptz),
  ('+60176582848', 105, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-19T05:46:00.000Z'::timestamptz),
  ('+60127145120', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-20T02:18:00.000Z'::timestamptz),
  ('+60172347874', 270, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-20T05:22:00.000Z'::timestamptz),
  ('+60104115980', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-20T05:46:00.000Z'::timestamptz),
  ('+60127951156', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-20T09:10:00.000Z'::timestamptz),
  ('+601117625453', 395, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-20T10:03:00.000Z'::timestamptz),
  ('+60133046630', 380, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-22T07:08:00.000Z'::timestamptz),
  ('+60104291255', 239, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-22T08:50:00.000Z'::timestamptz),
  ('+60167278628', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-22T08:51:00.000Z'::timestamptz),
  ('+60187849429', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-22T10:47:00.000Z'::timestamptz),
  ('+60127060047', 310, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-22T12:28:00.000Z'::timestamptz),
  ('+60135909160', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-23T03:33:00.000Z'::timestamptz),
  ('+60137621537', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-23T08:12:00.000Z'::timestamptz),
  ('+601137462102', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-23T08:33:00.000Z'::timestamptz),
  ('+60177077025', 269, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-23T08:43:00.000Z'::timestamptz),
  ('+60126262202', 150, 'Migration from Zobaze (2 transactions, Aug 2025-Jan 2026)', '2026-01-24T04:58:00.000Z'::timestamptz),
  ('+60137005284', 355, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-24T04:35:00.000Z'::timestamptz),
  ('+601128880369', 318, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-24T05:29:00.000Z'::timestamptz),
  ('+60137272713', 144, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-24T06:28:00.000Z'::timestamptz),
  ('+60197111719', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-24T06:35:00.000Z'::timestamptz),
  ('+601111022655', 115, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-24T07:55:00.000Z'::timestamptz),
  ('+60177001600', 130, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-24T09:13:00.000Z'::timestamptz),
  ('+60187831741', 240, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-24T09:30:00.000Z'::timestamptz),
  ('+60137972745', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-24T09:48:00.000Z'::timestamptz),
  ('+60166136799', 135, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-24T10:10:00.000Z'::timestamptz),
  ('+60127578837', 18, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-25T02:31:00.000Z'::timestamptz),
  ('+60177915459', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-25T04:29:00.000Z'::timestamptz),
  ('+60178737324', 350, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-25T06:34:00.000Z'::timestamptz),
  ('+60177445960', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-25T08:19:00.000Z'::timestamptz),
  ('+60149642284', 345, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-25T08:24:00.000Z'::timestamptz),
  ('+60177124503', 45, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-25T08:55:00.000Z'::timestamptz),
  ('+60104190734', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-25T10:36:00.000Z'::timestamptz),
  ('+60177227164', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-26T04:27:00.000Z'::timestamptz),
  ('+60194774953', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-26T09:30:00.000Z'::timestamptz),
  ('+60127375823', 660, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-26T10:15:00.000Z'::timestamptz),
  ('+60177127604', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-27T03:52:00.000Z'::timestamptz),
  ('+601137942310', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-27T06:29:00.000Z'::timestamptz),
  ('+60107826713', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-27T08:58:00.000Z'::timestamptz),
  ('+60172358073', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-27T09:54:00.000Z'::timestamptz),
  ('+60126364908', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-27T10:10:00.000Z'::timestamptz),
  ('+60187733564', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-29T03:43:00.000Z'::timestamptz),
  ('+601115230355', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-29T07:21:00.000Z'::timestamptz),
  ('+60192664900', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-29T08:50:00.000Z'::timestamptz),
  ('+60137661064', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-29T08:51:00.000Z'::timestamptz),
  ('+601156489837', 15, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-29T09:09:00.000Z'::timestamptz),
  ('+60197780358', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-29T09:34:00.000Z'::timestamptz),
  ('+60194816587', 75, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-29T10:06:00.000Z'::timestamptz),
  ('+60164145651', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-29T10:09:00.000Z'::timestamptz),
  ('+60199148491', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-30T03:43:00.000Z'::timestamptz),
  ('+60194292379', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-30T06:17:00.000Z'::timestamptz),
  ('+60105690952', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-30T09:29:00.000Z'::timestamptz),
  ('+60197313361', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-30T10:02:00.000Z'::timestamptz),
  ('+601153792001', 450, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-30T10:32:00.000Z'::timestamptz),
  ('+60189864337', 150, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-31T04:00:00.000Z'::timestamptz),
  ('+60162669013', 180, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-31T04:07:00.000Z'::timestamptz),
  ('+60196562804', 50, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-31T04:28:00.000Z'::timestamptz),
  ('+60134955645', 30, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-31T05:13:00.000Z'::timestamptz),
  ('+60187937294', 55, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-31T05:14:00.000Z'::timestamptz),
  ('+60197249017', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-31T05:20:00.000Z'::timestamptz),
  ('+60137787768', 70, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-31T05:43:00.000Z'::timestamptz),
  ('+60189797390', 383, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-31T06:39:00.000Z'::timestamptz),
  ('+60167196202', 155, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-31T07:36:00.000Z'::timestamptz),
  ('+60194604672', 60, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-31T09:49:00.000Z'::timestamptz),
  ('+6090108242', 1029, 'Migration from Zobaze (1 transactions, Aug 2025-Jan 2026)', '2026-01-31T10:04:00.000Z'::timestamptz)
) AS v(phone, points, reason, created_at)
JOIN customers c ON c.phone = v.phone;

-- ============================================
-- STEP 3: VERIFY POINTS IMPORT
-- ============================================

-- Check total points distributed
SELECT
  COUNT(*) FILTER (WHERE points_balance > 0) AS customers_with_points,
  SUM(points_balance) AS total_points_distributed,
  ROUND(AVG(points_balance) FILTER (WHERE points_balance > 0)) AS avg_points,
  MAX(points_balance) AS max_points
FROM customers;

-- Top 10 by points
SELECT name, phone, points_balance, total_spent, tier
FROM customers
ORDER BY points_balance DESC
LIMIT 10;