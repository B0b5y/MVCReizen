using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Reflection.Metadata;
using Microsoft.EntityFrameworkCore;
using MVCReizen.Models;

namespace MVCReizen.Repositories;

public partial class ReizenContext : DbContext
{
   
    public ReizenContext()
    {
    }

    public ReizenContext(DbContextOptions<ReizenContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Bestemming> Bestemmingen { get; set; }

    public virtual DbSet<Boeking> Boekingen { get; set; }

    public virtual DbSet<Klant> Klanten { get; set; }

    public virtual DbSet<Land> Landen { get; set; }

    public virtual DbSet<Reis> Reizen { get; set; }

    public virtual DbSet<Werelddeel> Werelddelen { get; set; }

    public virtual DbSet<Woonplaats> Woonplaatsen { get; set; }




   


    

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    
}
    
