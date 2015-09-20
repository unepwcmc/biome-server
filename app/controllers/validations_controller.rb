class ValidationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    HTTParty.post(
      "https://#{Rails.application.secrets.carto_db.account}.cartodb.com/api/v2/sql",
      query: {
        sql: """
          INSERT INTO #{Rails.application.secrets.carto_db.table}
          (the_geom, description, field_id, layer_id, project_id, user_id)
          VALUES
          (#{the_geom}, '', #{params[:field_id]}, #{params[:layer_id]}, #{params[:project_id]}, #{params[:user_id]})
        """,
        api_key: Rails.application.secrets.carto_db.api_key
      }
    )
  end

  def the_geom
    "ST_SetSRID(ST_Point(#{params[:lat]}, #{params[:lng]}), 4326)"
  end
end
