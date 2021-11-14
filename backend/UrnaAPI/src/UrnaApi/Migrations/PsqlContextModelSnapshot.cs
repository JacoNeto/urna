﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;
using UrnaApi;

namespace UrnaApi.Migrations
{
    [DbContext(typeof(PsqlContext))]
    partial class PsqlContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 63)
                .HasAnnotation("ProductVersion", "5.0.11")
                .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

            modelBuilder.Entity("UrnaApi.Models.Candidato", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<int>("Cargo")
                        .HasColumnType("integer");

                    b.Property<string>("Nome")
                        .HasColumnType("text");

                    b.Property<int>("Numero")
                        .HasColumnType("integer");

                    b.Property<string>("Partido")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Candidatos");
                });

            modelBuilder.Entity("UrnaApi.Models.Voto", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<Guid?>("CandidatoId")
                        .HasColumnType("uuid");

                    b.Property<DateTime>("Created_at")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("TItuloEleitor")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("CandidatoId");

                    b.ToTable("Votos");
                });

            modelBuilder.Entity("UrnaApi.Models.Voto", b =>
                {
                    b.HasOne("UrnaApi.Models.Candidato", "Candidato")
                        .WithMany("Votos")
                        .HasForeignKey("CandidatoId");

                    b.Navigation("Candidato");
                });

            modelBuilder.Entity("UrnaApi.Models.Candidato", b =>
                {
                    b.Navigation("Votos");
                });
#pragma warning restore 612, 618
        }
    }
}
