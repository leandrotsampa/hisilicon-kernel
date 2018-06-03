/******************************************************************************
 *  Copyright (C) 2015 Hisilicon Technologies CO.,LTD.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Create By Cai Zhiyong 2015.5.27
 *
******************************************************************************/

#include <linux/kernel.h>
#include <linux/hisilicon/cputable.h>
#include <linux/of_address.h>
#include <linux/of_platform.h>

#define REG_SC_SYSID0                                   0x0EE0
#define REG_PERI_SOC_FUSE                               0x840

u64 cpu_chipid = 0ULL;

/******************************************************************************/

u64 get_chipid(u64 mask)
{
	u64 val = 0ULL;

	if (cpu_chipid == 0ULL) {
	   struct device_node *node;

	   node = of_find_compatible_node(NULL, NULL, "hisilicon,sysctrl");
	   if (node) {
	      void __iomem *ctrl_base = of_iomap(node, 0);
	      if (ctrl_base) {
	         cpu_chipid = (u64)readl_relaxed(ctrl_base + REG_SC_SYSID0);
	         iounmap(ctrl_base);
	      }
	   }

      node = of_find_compatible_node(NULL, NULL, "hisilicon,perictrl");
      if (node) {
         void __iomem *ctrl_base = of_iomap(node, 0);
         if (ctrl_base) {
            val = (u64)readl_relaxed(ctrl_base + REG_PERI_SOC_FUSE);
            iounmap(ctrl_base);
         }
      }

		cpu_chipid = ((val & (0x1F << 16)) << 16) | (cpu_chipid & 0xFFFFFFFF);
	}

	return (mask == 0ULL) ? cpu_chipid : (cpu_chipid & mask);
}
EXPORT_SYMBOL(get_chipid);
