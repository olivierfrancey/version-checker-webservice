json.extract! document, :id, :title, :sub_title, :type, :size, :version_format, :created_at, :updated_at
json.url document_url(document, format: :json)
