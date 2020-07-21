/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_3(char*, char *);
extern void execute_4(char*, char *);
extern void execute_5(char*, char *);
extern void execute_1229(char*, char *);
extern void execute_1230(char*, char *);
extern void execute_1231(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_64(char*, char *);
extern void execute_65(char*, char *);
extern void execute_69(char*, char *);
extern void execute_70(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg(char*, char*, char*);
extern void execute_1416(char*, char *);
extern void execute_1417(char*, char *);
extern void execute_1418(char*, char *);
extern void execute_1419(char*, char *);
extern void execute_1420(char*, char *);
extern void execute_1421(char*, char *);
extern void execute_1422(char*, char *);
extern void execute_1423(char*, char *);
extern void execute_1424(char*, char *);
extern void execute_1425(char*, char *);
extern void execute_1426(char*, char *);
extern void execute_1427(char*, char *);
extern void execute_206(char*, char *);
extern void execute_1359(char*, char *);
extern void execute_1360(char*, char *);
extern void execute_1361(char*, char *);
extern void execute_1362(char*, char *);
extern void execute_1363(char*, char *);
extern void execute_1364(char*, char *);
extern void execute_1365(char*, char *);
extern void execute_1366(char*, char *);
extern void execute_1358(char*, char *);
extern void execute_239(char*, char *);
extern void execute_240(char*, char *);
extern void execute_241(char*, char *);
extern void execute_1385(char*, char *);
extern void execute_1386(char*, char *);
extern void execute_1388(char*, char *);
extern void execute_1389(char*, char *);
extern void execute_1390(char*, char *);
extern void execute_1391(char*, char *);
extern void execute_1392(char*, char *);
extern void execute_1393(char*, char *);
extern void execute_1394(char*, char *);
extern void execute_1395(char*, char *);
extern void execute_2585(char*, char *);
extern void execute_1436(char*, char *);
extern void execute_1437(char*, char *);
extern void execute_1438(char*, char *);
extern void execute_1441(char*, char *);
extern void execute_1442(char*, char *);
extern void execute_1443(char*, char *);
extern void execute_1444(char*, char *);
extern void execute_2468(char*, char *);
extern void execute_309(char*, char *);
extern void execute_318(char*, char *);
extern void execute_561(char*, char *);
extern void execute_1537(char*, char *);
extern void execute_1538(char*, char *);
extern void execute_1536(char*, char *);
extern void execute_568(char*, char *);
extern void execute_1541(char*, char *);
extern void execute_1542(char*, char *);
extern void execute_1543(char*, char *);
extern void execute_1544(char*, char *);
extern void execute_1540(char*, char *);
extern void execute_812(char*, char *);
extern void execute_813(char*, char *);
extern void execute_1715(char*, char *);
extern void execute_1716(char*, char *);
extern void execute_1718(char*, char *);
extern void execute_1719(char*, char *);
extern void execute_1720(char*, char *);
extern void execute_1721(char*, char *);
extern void execute_827(char*, char *);
extern void execute_828(char*, char *);
extern void execute_1737(char*, char *);
extern void execute_1739(char*, char *);
extern void execute_1740(char*, char *);
extern void execute_1741(char*, char *);
extern void execute_1742(char*, char *);
extern void execute_1743(char*, char *);
extern void execute_1226(char*, char *);
extern void execute_1227(char*, char *);
extern void execute_1228(char*, char *);
extern void execute_2666(char*, char *);
extern void execute_2667(char*, char *);
extern void execute_2668(char*, char *);
extern void execute_2669(char*, char *);
extern void execute_2670(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_508(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_509(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_510(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_511(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_512(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_513(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_514(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_515(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_516(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_530(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_635(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_636(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_637(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_638(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_639(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_807(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_116(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_120(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_124(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_128(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_132(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_136(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_140(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_144(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_148(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_152(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_156(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_160(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_164(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_168(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_229(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_233(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_237(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_241(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_245(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_249(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_253(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_257(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_261(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_265(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_269(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_273(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_277(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_281(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_285(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_289(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_293(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_297(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_301(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_305(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_309(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_313(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_317(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_321(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_325(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_329(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_382(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_394(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_406(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1355(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1359(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1363(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1367(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1371(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1375(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1379(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1383(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1387(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1391(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1395(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1506(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1510(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1514(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1518(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1522(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1526(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1530(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1534(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1538(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1542(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1546(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1558(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2487(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2491(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2495(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2499(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2503(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2507(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2511(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2515(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2519(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2523(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2527(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[189] = {(funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_3, (funcp)execute_4, (funcp)execute_5, (funcp)execute_1229, (funcp)execute_1230, (funcp)execute_1231, (funcp)execute_60, (funcp)execute_61, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_64, (funcp)execute_65, (funcp)execute_69, (funcp)execute_70, (funcp)vlog_simple_process_execute_0_fast_no_reg, (funcp)execute_1416, (funcp)execute_1417, (funcp)execute_1418, (funcp)execute_1419, (funcp)execute_1420, (funcp)execute_1421, (funcp)execute_1422, (funcp)execute_1423, (funcp)execute_1424, (funcp)execute_1425, (funcp)execute_1426, (funcp)execute_1427, (funcp)execute_206, (funcp)execute_1359, (funcp)execute_1360, (funcp)execute_1361, (funcp)execute_1362, (funcp)execute_1363, (funcp)execute_1364, (funcp)execute_1365, (funcp)execute_1366, (funcp)execute_1358, (funcp)execute_239, (funcp)execute_240, (funcp)execute_241, (funcp)execute_1385, (funcp)execute_1386, (funcp)execute_1388, (funcp)execute_1389, (funcp)execute_1390, (funcp)execute_1391, (funcp)execute_1392, (funcp)execute_1393, (funcp)execute_1394, (funcp)execute_1395, (funcp)execute_2585, (funcp)execute_1436, (funcp)execute_1437, (funcp)execute_1438, (funcp)execute_1441, (funcp)execute_1442, (funcp)execute_1443, (funcp)execute_1444, (funcp)execute_2468, (funcp)execute_309, (funcp)execute_318, (funcp)execute_561, (funcp)execute_1537, (funcp)execute_1538, (funcp)execute_1536, (funcp)execute_568, (funcp)execute_1541, (funcp)execute_1542, (funcp)execute_1543, (funcp)execute_1544, (funcp)execute_1540, (funcp)execute_812, (funcp)execute_813, (funcp)execute_1715, (funcp)execute_1716, (funcp)execute_1718, (funcp)execute_1719, (funcp)execute_1720, (funcp)execute_1721, (funcp)execute_827, (funcp)execute_828, (funcp)execute_1737, (funcp)execute_1739, (funcp)execute_1740, (funcp)execute_1741, (funcp)execute_1742, (funcp)execute_1743, (funcp)execute_1226, (funcp)execute_1227, (funcp)execute_1228, (funcp)execute_2666, (funcp)execute_2667, (funcp)execute_2668, (funcp)execute_2669, (funcp)execute_2670, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_508, (funcp)transaction_509, (funcp)transaction_510, (funcp)transaction_511, (funcp)transaction_512, (funcp)transaction_513, (funcp)transaction_514, (funcp)transaction_515, (funcp)transaction_516, (funcp)transaction_530, (funcp)transaction_635, (funcp)transaction_636, (funcp)transaction_637, (funcp)transaction_638, (funcp)transaction_639, (funcp)transaction_807, (funcp)transaction_116, (funcp)transaction_120, (funcp)transaction_124, (funcp)transaction_128, (funcp)transaction_132, (funcp)transaction_136, (funcp)transaction_140, (funcp)transaction_144, (funcp)transaction_148, (funcp)transaction_152, (funcp)transaction_156, (funcp)transaction_160, (funcp)transaction_164, (funcp)transaction_168, (funcp)transaction_229, (funcp)transaction_233, (funcp)transaction_237, (funcp)transaction_241, (funcp)transaction_245, (funcp)transaction_249, (funcp)transaction_253, (funcp)transaction_257, (funcp)transaction_261, (funcp)transaction_265, (funcp)transaction_269, (funcp)transaction_273, (funcp)transaction_277, (funcp)transaction_281, (funcp)transaction_285, (funcp)transaction_289, (funcp)transaction_293, (funcp)transaction_297, (funcp)transaction_301, (funcp)transaction_305, (funcp)transaction_309, (funcp)transaction_313, (funcp)transaction_317, (funcp)transaction_321, (funcp)transaction_325, (funcp)transaction_329, (funcp)transaction_382, (funcp)transaction_394, (funcp)transaction_406, (funcp)transaction_1355, (funcp)transaction_1359, (funcp)transaction_1363, (funcp)transaction_1367, (funcp)transaction_1371, (funcp)transaction_1375, (funcp)transaction_1379, (funcp)transaction_1383, (funcp)transaction_1387, (funcp)transaction_1391, (funcp)transaction_1395, (funcp)transaction_1506, (funcp)transaction_1510, (funcp)transaction_1514, (funcp)transaction_1518, (funcp)transaction_1522, (funcp)transaction_1526, (funcp)transaction_1530, (funcp)transaction_1534, (funcp)transaction_1538, (funcp)transaction_1542, (funcp)transaction_1546, (funcp)transaction_1558, (funcp)transaction_2487, (funcp)transaction_2491, (funcp)transaction_2495, (funcp)transaction_2499, (funcp)transaction_2503, (funcp)transaction_2507, (funcp)transaction_2511, (funcp)transaction_2515, (funcp)transaction_2519, (funcp)transaction_2523, (funcp)transaction_2527};
const int NumRelocateId= 189;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/deaf_encoder_func_impl/xsim.reloc",  (void **)funcTab, 189);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/deaf_encoder_func_impl/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/deaf_encoder_func_impl/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/deaf_encoder_func_impl/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/deaf_encoder_func_impl/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/deaf_encoder_func_impl/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
