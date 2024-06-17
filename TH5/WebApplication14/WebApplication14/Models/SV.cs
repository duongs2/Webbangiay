namespace WebApplication14.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SV")]
    public partial class SV
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SV()
        {
            khoasvs = new HashSet<khoasv>();
        }

        [StringLength(10)]
        public string id { get; set; }

        [StringLength(50)]
        public string ten { get; set; }

        [StringLength(10)]
        public string tuoi { get; set; }

        [StringLength(50)]
        public string diachi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<khoasv> khoasvs { get; set; }
    }
}
