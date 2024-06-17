namespace WebApplication15.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ABC5
    {
        [StringLength(10)]
        public string ID { get; set; }

        [StringLength(10)]
        public string NAME { get; set; }

        [StringLength(10)]
        public string PHONE { get; set; }
    }
}
