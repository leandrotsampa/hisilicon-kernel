
#include <linux/module.h>
#include <linux/of.h>
#include <linux/platform_device.h>
#include <linux/regmap.h>
#include <linux/reset-controller.h>
#include <linux/of_mdio.h>


#define MAX_INDEX 2

struct hi3798cv100_gmacphyrst_control {
   void __iomem *base;
   u32 gpio_bit;
};

struct hi3798cv100_gmacphyrst_data {
   struct reset_controller_dev rcdev;
   struct hi3798cv100_gmacphyrst_control controls[MAX_INDEX];
   unsigned int nr_controls;
};

#define to_reset_data(x) container_of(x, struct hi3798cv100_gmacphyrst_data, rcdev)

static int hi3798cv100_gmacphyrst_assert(struct reset_controller_dev *rcdev,
              unsigned long id)
{
   struct hi3798cv100_gmacphyrst_data *data = to_reset_data(rcdev);
   void __iomem *base;
   u32 gpio_bit;

   if (id >= data->nr_controls)
      return -EINVAL;

   base = data->controls[id].base;
   gpio_bit = data->controls[id].gpio_bit;

   writeb(0 << gpio_bit, base + (4 << gpio_bit));

   return 0;
}

static int hi3798cv100_gmacphyrst_deassert(struct reset_controller_dev *rcdev,
                unsigned long id)
{
   struct hi3798cv100_gmacphyrst_data *data = to_reset_data(rcdev);
   void __iomem *base;
   u32 gpio_bit;

   if (id >= data->nr_controls)
      return -EINVAL;

   base = data->controls[id].base;
   gpio_bit = data->controls[id].gpio_bit;

   writeb(1 << gpio_bit, base + (4 << gpio_bit));

   return 0;
}

static const struct reset_control_ops hi3798cv100_gmacphyrst_ops = {
   .assert = hi3798cv100_gmacphyrst_assert,
   .deassert = hi3798cv100_gmacphyrst_deassert,
};

static int hi3798cv100_gmacphyrst_probe(struct platform_device *pdev)
{
   struct device *dev = &pdev->dev;
   struct device_node *np = dev->of_node;
   struct hi3798cv100_gmacphyrst_data *data;
   int i;
   u32 v;

   data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   if (!data)
      return -ENOMEM;

   for (i = 0; i < MAX_INDEX; i++)
   {
      struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, i);
      void __iomem *base = devm_ioremap_resource(dev, res);
      if (IS_ERR(base)) {
         return PTR_ERR(base);
      }

      data->controls[i].base = base;
      data->controls[i].gpio_bit = 0;

      /* config gpio[x] dir to output */
      v = readb_relaxed(base + 0x400);
      v |= (1 << data->controls[i].gpio_bit);
      writeb_relaxed(v, base + 0x400);
   }

   data->nr_controls = MAX_INDEX;
   data->rcdev.ops = &hi3798cv100_gmacphyrst_ops;
   data->rcdev.owner = THIS_MODULE;
   data->rcdev.of_node = np;
   data->rcdev.nr_resets = MAX_INDEX;

   platform_set_drvdata(pdev, data);

   return devm_reset_controller_register(dev, &data->rcdev);
}

static const struct of_device_id hi3798cv100_gmacphyrst_match[] = {
   { .compatible = "hisilicon,hi3798cv100-gmacphyrst", },
   { /* sentinel */ },
};
MODULE_DEVICE_TABLE(of, hi3798cv100_gmacphyrst_match);

static struct platform_driver hi3798cv100_gmacphyrst_driver = {
   .probe = hi3798cv100_gmacphyrst_probe,
   .driver = {
      .name = "hi3798cv100-gmacphyrst",
      .of_match_table = hi3798cv100_gmacphyrst_match,
   },
};
module_platform_driver(hi3798cv100_gmacphyrst_driver);
