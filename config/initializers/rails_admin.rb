RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ActiveRecord::Base.descendants.each do |imodel|
    config.model "#{imodel.name}" do
      list do
        exclude_fields :created_at, :updated_at
      end
    end
  end

  config.model 'Category' do
    configure :site do
      hide
      # for list view
      filterable false
      searchable false
    end
  end

  config.model 'Site' do
    list do
      exclude_fields :product, :product_id, :product_ids #:site_rates_without_dimension_ids, :site_raters_without_dimension_ids, :site_id_rate_ids, :site_id_average_id
    end
  end

  config.model 'Site' do
    configure :rates_without_dimension  do
      hide
      # for list view
      filterable false
      searchable false
    end

    configure :raters_without_dimension  do
      hide
      # for list view
      filterable false
      searchable false
    end

    configure :rate_average_without_dimension  do
      hide
      # for list view
      filterable false
      searchable false
    end

    configure :id_rates  do
      hide
      # for list view
      filterable false
      searchable false
    end

    configure :id_raters  do
      hide
      # for list view
      filterable false
      searchable false
    end

    configure :id_average  do
      hide
      # for list view
      filterable false
      searchable false
    end

    configure :product  do
      hide
      # for list view
      filterable false
      searchable false
    end

  end

  config.excluded_models << AverageCache
  config.excluded_models << OverallAverage

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.try(:admin?)
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
