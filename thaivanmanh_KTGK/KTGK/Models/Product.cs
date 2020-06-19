namespace KTGK.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public int id { get; set; }

        [StringLength(100)]
        public string code { get; set; }

        [StringLength(100)]
        public string name { get; set; }

        [StringLength(100)]
        public string sort_name { get; set; }

        [StringLength(100)]
        public string note { get; set; }

        public int? category_id { get; set; }

        public virtual Category Category { get; set; }
    }

    public class viewProduct
    {
        public Product products { get; set; }
        public List<Category> categories { get; set; }
    }
}
