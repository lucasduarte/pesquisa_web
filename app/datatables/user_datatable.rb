class UserDatatable < AjaxDatatablesRails::Base

  def_delegator :@view, :link_to
  def_delegator :@view, :destroy_user_path

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(User.name User.email User.created_at User.last_sign_in_at)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(User.name User.email)
  end

  private

  def data
    records.map do |record|
      [
        record.name,  
        record.email,
        record.created_at.strftime('%A, %d %b %Y'),
        record.last_sign_in_at.strftime('%A, %d %b %Y'),
        link_to("Deletar", destroy_user_path(record), method: :delete, data: { confirm: 'Tem certeza?' }) 
      ]
    end
  end

  def get_raw_records
    # insert query here
    User.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
