/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/ECOP/CPU_design/NextState.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {56U, 0U};
static unsigned int ng4[] = {58U, 0U};
static unsigned int ng5[] = {57U, 0U};
static unsigned int ng6[] = {63U, 0U};
static unsigned int ng7[] = {52U, 0U};
static unsigned int ng8[] = {5U, 0U};
static unsigned int ng9[] = {48U, 0U};
static unsigned int ng10[] = {2U, 0U};
static unsigned int ng11[] = {49U, 0U};
static unsigned int ng12[] = {6U, 0U};
static unsigned int ng13[] = {7U, 0U};
static unsigned int ng14[] = {3U, 0U};
static unsigned int ng15[] = {4U, 0U};



static void Always_36_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    int t11;
    char *t12;
    char *t13;

LAB0:    t1 = (t0 + 3616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 3936);
    *((int *)t2) = 1;
    t3 = (t0 + 3648);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(36, ng0);

LAB5:    xsi_set_current_line(37, ng0);
    t4 = (t0 + 2136U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:
LAB18:
LAB17:    xsi_set_current_line(59, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB19:    goto LAB2;

LAB7:    xsi_set_current_line(38, ng0);
    t7 = ((char*)((ng2)));
    t8 = (t0 + 2696);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 3);
    goto LAB19;

LAB9:    xsi_set_current_line(39, ng0);

LAB20:    xsi_set_current_line(40, ng0);
    t3 = (t0 + 2296U);
    t4 = *((char **)t3);

LAB21:    t3 = ((char*)((ng3)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 6, t3, 6);
    if (t9 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB24;

LAB25:    t3 = ((char*)((ng5)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 6, t3, 6);
    if (t9 == 1)
        goto LAB26;

LAB27:    t7 = ((char*)((ng6)));
    t10 = xsi_vlog_unsigned_case_compare(t4, 6, t7, 6);
    if (t10 == 1)
        goto LAB28;

LAB29:    t8 = ((char*)((ng7)));
    t11 = xsi_vlog_unsigned_case_compare(t4, 6, t8, 6);
    if (t11 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB34;

LAB35:
LAB37:
LAB36:    xsi_set_current_line(48, ng0);
    t3 = ((char*)((ng12)));
    t7 = (t0 + 2696);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 3);

LAB38:    goto LAB19;

LAB11:    xsi_set_current_line(51, ng0);
    t3 = ((char*)((ng13)));
    t7 = (t0 + 2696);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 3);
    goto LAB19;

LAB13:    xsi_set_current_line(52, ng0);
    t3 = ((char*)((ng14)));
    t7 = (t0 + 2696);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 3);
    goto LAB19;

LAB15:    xsi_set_current_line(53, ng0);

LAB39:    xsi_set_current_line(54, ng0);
    t3 = (t0 + 2296U);
    t7 = *((char **)t3);

LAB40:    t3 = ((char*)((ng11)));
    t9 = xsi_vlog_unsigned_case_compare(t7, 6, t3, 6);
    if (t9 == 1)
        goto LAB41;

LAB42:
LAB44:
LAB43:    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB45:    goto LAB19;

LAB22:    xsi_set_current_line(42, ng0);
    t7 = ((char*)((ng1)));
    t8 = (t0 + 2696);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 3);
    goto LAB38;

LAB24:    goto LAB22;

LAB26:    goto LAB22;

LAB28:    goto LAB22;

LAB30:    xsi_set_current_line(44, ng0);
    t12 = ((char*)((ng8)));
    t13 = (t0 + 2696);
    xsi_vlogvar_assign_value(t13, t12, 0, 0, 3);
    goto LAB38;

LAB32:    xsi_set_current_line(46, ng0);
    t3 = ((char*)((ng10)));
    t7 = (t0 + 2696);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 3);
    goto LAB38;

LAB34:    goto LAB32;

LAB41:    xsi_set_current_line(55, ng0);
    t8 = ((char*)((ng15)));
    t12 = (t0 + 2696);
    xsi_vlogvar_assign_value(t12, t8, 0, 0, 3);
    goto LAB45;

}


extern void work_m_00000000002250763327_3384548200_init()
{
	static char *pe[] = {(void *)Always_36_0};
	xsi_register_didat("work_m_00000000002250763327_3384548200", "isim/Test_isim_beh.exe.sim/work/m_00000000002250763327_3384548200.didat");
	xsi_register_executes(pe);
}
