namespace WebApplication13.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("khoasv")]
    public partial class khoasv
    {
        [Key]
        [StringLength(50)]
        public string khoa { get; set; }

        [StringLength(10)]
        public string lop { get; set; }

        [StringLength(10)]
        public string id { get; set; }

        public  SV SV { get; set; }
    }
}
