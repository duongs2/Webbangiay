using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace WebApplication13.Models
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=qlsv")
        {
        }

        public virtual DbSet<khoasv> khoasvs { get; set; }
        public virtual DbSet<SV> SVs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<khoasv>()
                .Property(e => e.lop)
                .IsFixedLength();

            modelBuilder.Entity<khoasv>()
                .Property(e => e.id)
                .IsFixedLength();

            modelBuilder.Entity<SV>()
                .Property(e => e.id)
                .IsFixedLength();

            modelBuilder.Entity<SV>()
                .Property(e => e.tuoi)
                .IsFixedLength();
        }
    }
}
