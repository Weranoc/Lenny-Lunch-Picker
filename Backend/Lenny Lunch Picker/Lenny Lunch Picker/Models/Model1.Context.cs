﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Lenny_Lunch_Picker.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class LennyLunchPickerEntities1 : DbContext
    {
        public LennyLunchPickerEntities1()
            : base("name=LennyLunchPickerEntities1")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<accessToken> accessTokens { get; set; }
        public virtual DbSet<favoriteRestaurant> favoriteRestaurants { get; set; }
        public virtual DbSet<googleMapsApi> googleMapsApis { get; set; }
        public virtual DbSet<user> users { get; set; }
    }
}
