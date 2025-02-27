class JsonApiResponse
  def self.render(success: true, data: [], status:, errors: [])
    {
      success: success,
      errors: errors,
      data: data,
      status: status
    }
  end
end
