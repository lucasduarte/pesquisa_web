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

  config.model 'Rate' do
    label "Avaliação"
    label_plural "Avaliações"

    field :rater do
      label "Avaliador"
    end
    field :stars do
      label "Quantidade de Estrelas"
    end
  end

  config.model 'RatingCache' do
    label "Cache de Avaliação"
    label_plural "Cache de Avaliações"

    field :qty do
      label "Quantidade de Votos"
    end
    field :avg do
      label "Média"
    end
  end

  config.model 'User' do
    label "Usuário"
    label_plural "Usuários"

    field :password do
      label "Senha"
    end
    field :password_confirmation do
      label "Confirmação de Senha"
    end
    field :reset_password_sent_at do
      label "Alteração de Senha enviado em"
    end
    field :remember_created_at do
      label "Lembrar Senha criado em"
    end
    field :sign_in_count do
      label "Quantidade de Logins"
    end
    field :current_sign_in_at do
      label "Logado atualmente em"
    end
    field :last_sign_in_at do
      label "Último login em"
    end
    field :current_sign_in_ip do
      label "IP Atual"
    end
    field :last_sign_in_ip do
      label "Último IP"
    end
    field :confirmation_token do
      label "Token de Confirmação"
    end
    field :confirmed_at do
      label "Confirmado em"
    end
    field :admin do
      label "Administrador"
    end
    field :name do
      label "Nome"
    end
    field :alert do
      label "Alertas cadastrados"
    end
  end

  config.model 'Category' do

    label "Categoria"
    label_plural "Categorias"

    field :name do
      label "Nome"
    end

    configure :site do
      hide
      # for list view
      filterable false
      searchable false
    end
  end

  #config.model 'Site' do
  #  list do
    #  exclude_fields :product, :product_id, :product_ids
  #  end

#  end

  config.model 'Alert' do
    label "Alerta"
    label_plural "Alertas"

    field :user do |member|
      label "Usuário"
    end
    field :search_word do |member|
      label "Palavra Buscada"
    end
    field :category do |member|
      label "Categoria"
    end
    field :price do |member|
      label "Preço"
    end
    field :email_sent do |member|
      label "Email Enviado?"
    end
  end

  config.model 'Search' do
    label "Busca Realizada"
    label_plural "Buscas Realizadas"

    field :search_word do |member|
      label "Produto Buscado"
    end

    field :count do |member|
      label "Buscas Realizadas"
    end
  end

  config.model 'Product' do
    label "Produto"
    label_plural "Produtos"

    field :search_word do |member|
      label "Produto Buscado"
    end

    field :status do |member|
      label "Status"
    end

    field :price do
      label "Preço"
    end

    field :image_link do |member|
      label "Imagem"
    end

    field :description do |member|
      label "Descrição"
    end

    field :category do |member|
      label "Categoria"
    end

    field :link do |member|
      label "Link"
    end

    field :site do |member|
      label "Site"
    end
  end


  config.model 'Site' do
    label "Site"
    label_plural "Sites"
    field :name do
      label "Nome"
    end

    field :link do
      label "Link"
    end

    field :description do
      label "Descrição"
    end

    field :category do |member|
      label "Categoria"
    end

    field :product_link_tag do |member|
      label "Link do Produto"
    end

    field :price_tag do |member|
      label "Preço do Produto"
    end

    field :image_tag do |member|
      label "Imagem do Produto"
    end

    field :description_tag do |member|
      label "Descrição do Produto"
    end

    field :category_tag do |member|
      label "Categoria do Produto"
    end

    field :status do |member|
      label "Status"
    end

    field :logo do |member|
      label "Logo do Site"
    end
    exclude_fields :product, :product_id, :product_ids


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
