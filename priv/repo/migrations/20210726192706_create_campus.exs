defmodule Fuschia.Repo.Migrations.CreateCampus do
  use Ecto.Migration

  def change do
    create table(:campus, primary_key: false) do
      add :sigla, :string, primary_key: true, null: false
      add :nome, :string

      add :cidade_municipio,
          references(:cidade, column: :municipio, type: :string, on_delete: :delete_all),
          null: false

      timestamps()
    end

    create unique_index(:campus, [:sigla, :cidade_municipio], name: :campus_sigla_municipio_index)
  end
end
