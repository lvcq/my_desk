defmodule Model.Repo.Migrations.CreateWeather do
  use Ecto.Migration

  def change do
    create table(:current_weather) do
      add :cityid, :string
      add :date, :string
      add :week, :string
      add :observatory_update_time, :string
      add :city, :string
      add :cityEn, :string
      add :country, :string
      add :countryEn, :string
      add :wea, :string
      add :wea_img, :string
      add :tem, :string
      add :tem1, :string
      add :tem2, :string
      add :win, :string
      add :win_speed, :string
      add :win_meter, :string
      add :humidity, :string
      add :visibility, :string
      add :pressure, :string
      add :air, :string
      add :air_level, :string
      add :air_tips, :string
      timestamps([:autogenerate])
    end
  end
end
