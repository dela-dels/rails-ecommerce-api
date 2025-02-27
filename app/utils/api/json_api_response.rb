class JsonApiResponse
  def self.render(success:, data:, status:, errors: [])
    {
      success: success,
      errors: errors,
      data: data,
      status: status
      # location: location
    }
  end
end
