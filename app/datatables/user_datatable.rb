class UserDatatable < AjaxDatatablesRails::Base

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= []
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= []
  end

  private

  def data
    records.map do |record|
      [
        record.email,
        record.created_at,
        record.last_sign_in_at
      ]
    end
  end

  def get_raw_records
    # insert query here
    User.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
