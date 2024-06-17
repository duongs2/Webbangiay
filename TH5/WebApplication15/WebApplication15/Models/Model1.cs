using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace WebApplication15.Models
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<ABC5> ABC5 { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ABC5>()
                .Property(e => e.ID)
                .IsFixedLength();

            modelBuilder.Entity<ABC5>()
                .Property(e => e.NAME)
                .IsFixedLength();

            modelBuilder.Entity<ABC5>()
                .Property(e => e.PHONE)
                .IsFixedLength();
        }
    }
}
