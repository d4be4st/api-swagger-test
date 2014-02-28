module API

  class Root_v1 < Grape::API

    prefix 'api'
    version 'v1'
    format :json

    mount API_v1::Users

    add_swagger_documentation api_version: 'v1', hide_documentation_path: true, hide_format: true, markdown: true
  end

end
