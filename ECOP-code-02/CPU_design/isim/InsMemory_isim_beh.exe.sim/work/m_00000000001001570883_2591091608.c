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
static const char *ng0 = "E:/ECOP/CPU_design/InsMemory.v";
static const char *ng1 = "instructionData.txt";
static unsigned int ng2[] = {256U, 0U};
static unsigned int ng3[] = {4U, 0U};



static void Initial_29_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1608);
    t2 = ((char*)((ng2)));
    xsi_vlogfile_readmemb(ng1, 0, t1, 1, *((unsigned int *)t2), 0, 0);

LAB1:    return;
}

static void Always_31_1(char *t0)
{
    char t7[8];
    char t17[8];
    char t19[8];
    char t20[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t21;

LAB0:    t1 = (t0 + 2776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 3096);
    *((int *)t2) = 1;
    t3 = (t0 + 2808);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(31, ng0);

LAB5:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 1608);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t0 + 1608);
    t9 = (t8 + 72U);
    t10 = *((char **)t9);
    t11 = (t0 + 1608);
    t12 = (t11 + 64U);
    t13 = *((char **)t12);
    t14 = ((char*)((ng2)));
    t15 = (t0 + 1048U);
    t16 = *((char **)t15);
    t15 = ((char*)((ng2)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_minus(t17, 32, t16, 32, t15, 32);
    t18 = ((char*)((ng3)));
    memset(t19, 0, 8);
    xsi_vlog_unsigned_divide(t19, 32, t17, 32, t18, 32);
    memset(t20, 0, 8);
    xsi_vlog_unsigned_add(t20, 32, t14, 32, t19, 32);
    xsi_vlog_generic_get_array_select_value(t7, 32, t6, t10, t13, 2, 1, t20, 32, 2);
    t21 = (t0 + 1448);
    xsi_vlogvar_assign_value(t21, t7, 0, 0, 32);
    goto LAB2;

}


extern void work_m_00000000001001570883_2591091608_init()
{
	static char *pe[] = {(void *)Initial_29_0,(void *)Always_31_1};
	xsi_register_didat("work_m_00000000001001570883_2591091608", "isim/InsMemory_isim_beh.exe.sim/work/m_00000000001001570883_2591091608.didat");
	xsi_register_executes(pe);
}
